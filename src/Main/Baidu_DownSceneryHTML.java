package Main;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import Base.BaseCrawler;
import Model.WebPage;
import Util.DbUtil;
import Util.PageUtil;

public class Baidu_DownSceneryHTML extends BaseCrawler {

	/**
	 * ���surl �� �����ļ�����ӳ��
	 */
	private HashMap<String, String> saveMap;

	public Baidu_DownSceneryHTML() {
		super();
		this.setDomain("http://lvyou.baidu.com");
		this.saveMap = new HashMap<>();
		initFile("web/baidu/scenery", true);
	}
	
	
	/**
	 * ͬ��������������ݵ�map
	 * @param surl
	 * @param saveName
	 */
	public synchronized void addMapItem(String surl, String saveName) {
		this.saveMap.put(surl, saveName);
	}

	/**
	 * �����ȡhtml��url
	 * @param surl
	 * @return
	 */
	public String generateUrl(String surl) {
		String url = "http://lvyou.baidu.com";
		url += "/" + surl;
		return url;
	}

	/**
	 * ����ȡ������д�뵽�ļ���
	 * ����ҳ�棬�����ʽΪutf-8
	 * �����޸����±�����룬����û��ֱ��ʹ��PageUtil.exportFile
	 * 
	 * @param dirPath
	 * @param pageContent
	 */
	public void exportFile(String dirPath, String pageContent) {
		try {
			PrintWriter writer = new PrintWriter(new OutputStreamWriter(
					new FileOutputStream(new File(dirPath)), "UTF-8"));
			writer.write(pageContent);
			writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * ��ʼ������html�ļ����ļ���
	 * @param filepathStr
	 * @param needChild
	 */
	private void initFile (String filepathStr, boolean needChild) {
		File filepath = new File(filepathStr);
		if (!filepath.exists() && !filepath.isDirectory()) {
			filepath.mkdirs();
		}
		if (needChild) {
			// ����scenery����ļ���
			for (int i = 3; i<= 6; i++) {
				initFile(filepathStr + "/" + i, false);
			}
		}
	}
	
	/**
	 * ���أ�����ȡ����ҳ�����ݱ��浽�ļ���
	 */
	@Override
	public void exactor(WebPage page) {
		if (page == null) {
			System.out.println("exactor��ȡ����Ϊ��");
			return;
		}
		String url = page.getUrl().toString();
		url = url.substring(23,
				url.lastIndexOf("/") == url.length() - 1 ? url.length() - 1
						: url.length());
		String filename = saveMap.get(url);
		String fileParent = filename.split("_")[2];
		exportFile("web/baidu/scenery/" + fileParent + "/" + filename
				+ ".htm", page.getPageContent());

	}

	/**
	 * ���أ���ȡ����������
	 * 
	 */
	@Override
	public void loadWaitList() {
		ResultSet resultSet = DbUtil.executeQuery(
				"SELECT surl, sname, scene_layer FROM t_secnery",
				new String[] {});
		try {
			while (resultSet.next()) {
				String surl = resultSet.getString("surl");
				String sname = resultSet.getString("sname");
				String scene_layer = resultSet.getString("scene_layer");
				if (!surl.isEmpty()) {
					addMapItem(surl, sname + "_" + surl + "_" + scene_layer);
					addWaitList(generateUrl(surl));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		Baidu_DownSceneryHTML baiduDown = new Baidu_DownSceneryHTML();
		baiduDown.begin();
	}

}
