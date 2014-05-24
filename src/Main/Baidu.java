package Main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.ConcurrentHashMap;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import Model.WebPage;
import Util.AppUtil;
import Util.DbUtil;
import Util.PageUtil;

import Base.BaseCrawler;

/**
 * ��ȡ�ٶ�����ͨ��ҳ���
 * @author yinchuandong
 *
 */
public class Baidu extends BaseCrawler{
	
	
	public static void main(String[] args){
		Baidu baidu = new Baidu();
		baidu.begin();
	}
	
	/**
	 * ÿһҳ���������
	 */
	private int listRows = 16;
	/**
	 * ��ǰ��ʱ���
	 */
	private long timestamp ;
	
	//-------------------------------------------
	public Baidu(){
		super();
		this.timestamp = System.currentTimeMillis();
		this.setDomain("http://lvyou.baidu.com");
		this.init();
	}
	
	private void init(){
		try {
			BufferedReader reader = new BufferedReader(new FileReader("./Seed/baidu-city.txt"));
			String tmpStr = null;
			while((tmpStr = reader.readLine()) != null){
				if (!tmpStr.startsWith("#")) {
					String url = this.generateUrl(tmpStr, 1);
					super.addWaitList(url);
					String uniqueKey = tmpStr + "-1";
					super.addUnVisitPath(uniqueKey);
				}
			}
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ������ȡ��Url
	 * @param surl city��surl;�緬خ panyu
	 * @param cid city��Id
	 * @param page
	 * @return
	 */
	public String generateUrl(String surl, int cid, int page){
		String url = "http://lvyou.baidu.com/destination/ajax/jingdian?format=ajax&";
		url  += "surl=" + surl+ "&cid=" + cid + "&pn=" + page + "&t=" + this.timestamp;
		return url;
	}
	
	/**
	 * ������ȡ��Url
	 * @param surl
	 * @param page
	 * @return
	 */
	public String generateUrl(String surl, int page){
		return this.generateUrl(surl, 1, page);
	}
	
	@Override
	public void loadWaitList() {
		ResultSet resultSet = DbUtil.executeQuery("select sname from t_crawled where isVisited=?", new String[]{"0"});
		try {
			while(resultSet.next()){
				String sname = resultSet.getString("sname");
				String[] arr =sname.split("-");
				if (arr.length >=2 ) {
					String surl = arr[0];
					int page = Integer.parseInt(arr[1]);
					String url = generateUrl(surl, page);
					addWaitList(url);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void exactor(WebPage page) {
		if (page == null) {
			System.err.println("exactor��ȡ��ϢΪ��");
			return;
		}
		String result = page.getPageContent();
		try {
			result = AppUtil.jsonFormatter(result);
			JSONObject jsonObj = JSONObject.fromObject(result); 
			JSONObject dataObj = jsonObj.getJSONObject("data");
			//----��Ҫ��������ݿ��ֶ�--------------------
			String sid = dataObj.getString("sid");
			String surl = dataObj.getString("surl");
			String sname = dataObj.getString("sname");
			String ambiguitySname = dataObj.getString("ambiguity_sname");
			String parentSid = dataObj.getString("parent_sid");
			String viewCount = dataObj.getString("view_count");
			String star = dataObj.getString("star");
			String sceneLayer = dataObj.getString("scene_layer");
			int goingCount = dataObj.getInt("going_count");
			int goneCount = dataObj.getInt("gone_count");
			double rating = dataObj.getDouble("rating");
			int ratingCount = dataObj.getInt("rating_count");
			JSONObject extObj = dataObj.getJSONObject("ext");
			String mapInfo = extObj.getString("map_info");//��þ�γ��
			
			//------�����жϷ�ҳ������url------------------
			int sceneTotal = dataObj.getInt("scene_total");
			int currentPage = dataObj.getInt("current_page");
			
			//--------------��url���Ϊ�Ѿ�����----------------------------
			super.visitUrl(surl + "-" + currentPage);
			
			//ȡ��ҳ��
			int pageNums = (int) Math.ceil((double)sceneTotal / listRows);
			for(int i=currentPage+1; i<=pageNums; i++){
				//�����urlû�б����ʹ�������ӵ�δ�����б���
				String uniqueKey = surl + "-" + i;
				String uniqueSid = AppUtil.md5(uniqueKey);
				int count = DbUtil.count("select count(*) from t_crawled where sid=?", new String[]{uniqueSid});
				if (count < 1) {
					//��ӵ��ȴ�����
					String tmpUrl = this.generateUrl(surl, i);
					addWaitList(tmpUrl);
					addUnVisitPath(uniqueKey);
				}
			}
			
			//-------���������б�-----------
			JSONArray sceneList = dataObj.getJSONArray("scene_list");
			this.parseSceneList(sceneList);
			
			//---------��json�ļ���������-------------------
			String filename = surl + "-" + currentPage + ".json";
			PageUtil.exportFile("E:\\web\\" + filename, AppUtil.jsonFormatter(result));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ���������б���json��scene_list����
	 * @param sceneList
	 */
	private void parseSceneList(JSONArray sceneList){
		for(int i=0; i<sceneList.size(); i++){
			JSONObject sceneObj = sceneList.getJSONObject(i);
			String sid = sceneObj.getString("sid");
			String surl = sceneObj.getString("surl");
			String sname = sceneObj.getString("sname");
			String sceneLayer = sceneObj.getString("scene_layer");
			
			//�����urlû�б����ʹ�������ӵ�δ�����б���
			String uniqueKey = surl + "-" + 1;
			String uniqueSid = AppUtil.md5(uniqueKey);
			int count = DbUtil.count("select count(*) from t_crawled where sid=?", new String[]{uniqueSid});
			if (count < 1) {
				//��ӵ��ȴ�����
				String tmpUrl = this.generateUrl(surl, 1);
				addWaitList(tmpUrl);
				addUnVisitPath(uniqueKey);
			}
			
			System.out.println(sid);
			System.out.println(surl);
			System.out.println(sname);
			System.out.println("------------------------------");
		}
		
	}

}
