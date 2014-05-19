package Main;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.concurrent.ConcurrentHashMap;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import Model.WebPage;
import Util.AppUtil;
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
	
	//-------------------------------------------
	public Baidu(){
		super();
		this.setDomain("http://lvyou.baidu.com");
//		this.loadSeedsFromFile("Seed/baidu.txt");
		this.init();
	}
	
	private void init(){
		String url = this.generateUrl("panyu", 1);
		String key = AppUtil.md5(url);
		super.getUrlDeeps().put(key, 1);
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
		url  += "surl=" + surl+ "&cid=1&pn=" + page +"&t=" + System.currentTimeMillis();
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
	public void exactor(WebPage page) {
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
			
			ConcurrentHashMap<String, Integer> urlDeeps = super.getUrlDeeps();
			//ȡ��ҳ��
			int pageNums = (int) Math.ceil((double)sceneTotal / listRows);
			for(int i=currentPage+1; i<=pageNums; i++){
				String tmpUrl = this.generateUrl(surl, i);
				//�����urlû�б����ʹ�������ӵ�δ�����б���
				if (!urlDeeps.containsKey(AppUtil.md5(tmpUrl))) {
					super.addWaitList(tmpUrl, Integer.parseInt(sceneLayer));
				}
			}
			
			//-------���������б�-----------
			JSONArray sceneList = dataObj.getJSONArray("scene_list");
			parseSceneList(sceneList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ���������б���json��scene_list����
	 * @param sceneList
	 */
	private void parseSceneList(JSONArray sceneList){
		ConcurrentHashMap<String, Integer> urlDeeps = super.getUrlDeeps();
		for(int i=0; i<sceneList.size(); i++){
			JSONObject sceneObj = sceneList.getJSONObject(i);
			String sid = sceneObj.getString("sid");
			String surl = sceneObj.getString("surl");
			String sname = sceneObj.getString("sname");
			String sceneLayer = sceneObj.getString("scene_layer");
			
			String crawlUrl = this.generateUrl(surl, 1);
			//�����urlû�б����ʹ�������ӵ�δ�����б���
			if (!urlDeeps.containsKey(AppUtil.md5(crawlUrl))) {
				super.addWaitList(crawlUrl, Integer.parseInt(sceneLayer));
			}
			System.out.println(sid);
			System.out.println(surl);
			System.out.println(sname);
			System.out.println(generateUrl(surl, 1, 1));
			System.out.println("------------------------------");
		}
		
	}
	
	

}
