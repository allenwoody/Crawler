package Parser;

import java.io.File;
import java.nio.file.Files;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DbUtil;
import Util.PageUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BaiduSceneryParser {

	/**
	 * ��������json ��scene_list����
	 * @param sceneList
	 */
	public void parseSceneList(File file){
		String result = PageUtil.readFile(file);
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
		String[] mapArr = mapInfo.split(",");
		String lng = "";
		String lat = "";
		if (mapArr.length == 2) {
			lng = mapArr[0];
			lat = mapArr[1];
		}
		String mapX = extObj.getString("map_x");
		String mapY = extObj.getString("map_y");
		
		String absDesc = extObj.getString("abs_desc");//���
		String moreDesc = extObj.getString("more_desc");//����
//		String fullUrl = extObj.getString("");
		
		String recommendVisitTime = "";
		String priceDesc = "0";
		String openTimeDesc = "";
		try {
			JSONObject contentObj = dataObj.getJSONObject("content");
			JSONObject besttimeObj = contentObj.getJSONObject("besttime");
			recommendVisitTime = besttimeObj.getString("recommend_visit_time");
			JSONObject ticketObj = contentObj.getJSONObject("ticket_info");
			if (ticketObj != null && !ticketObj.isNullObject()) {
				priceDesc = ticketObj.getString("price_desc");
				openTimeDesc = ticketObj.getString("open_time_desc");
			}
		} catch (Exception e) {
			System.err.println(sname + "-->" + surl + "--û�м۸�" );
			e.printStackTrace();
			System.out.println("--------------------------------------");
		}
		
		String sql = "insert into t_scenery (sid, surl, sname, ambiguity_sname, parent_sid, view_count, star, scene_layer, going_count, gone_count, rating, rating_count, abs_desc, more_desc, lng, lat, map_x, map_y, recommend_visit_time, price_desc, open_time_desc) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String[] params = {
				sid,
				surl,
				sname,
				ambiguitySname,
				parentSid,
				viewCount,
				star,
				sceneLayer,
				goingCount + "",
				goneCount + "",
				rating + "",
				ratingCount + "",
				absDesc,
				moreDesc,
				lng,
				lat,
				mapX,
				mapY,
				recommendVisitTime,
				priceDesc,
				openTimeDesc
		};
		
		DbUtil.executeUpdate(sql, params);
//		System.out.println();
	}
	
	
	public void runTask(File dir){
		File[] files = dir.listFiles();
		int i = 0;
		for (File file : files) {
			try {
				String fileName = file.getName();
				String[] arr = fileName.split("[-\\.]");
				String page = arr[1];
				if (page.equals("1")) {
					this.parseSceneList(file);
				}
				System.out.println("������ڣ�" + (i++) + "��");
			} catch (Exception e) {
				
			}
		}
	}
	
	public void reparse(){
		String sql = "select img.surl from t_scenery_img as img where img.surl not in (select s.surl from t_scenery as s)";
		ResultSet resultSet = DbUtil.executeQuery(sql, null);
		try {
			while(resultSet.next()){
				try {
					String surl = resultSet.getString("surl");
					String filename = surl + "-1.json";
					parseSceneList(new File("E:\\traveldata\\webAll\\" + filename));
					System.out.println(filename);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		BaiduSceneryParser parser = new BaiduSceneryParser();
//		parser.parseSceneList(new File("E:\\web\\guangzhourenmingongyuan-1.json"));
//		parser.parseSceneList(new File("E:\\web\\guangzhou-1.json"));
//		parser.parseSceneList(new File("E:\\traveldata\\webAll\\daixianyangjiacitang-1.json"));
		parser.runTask(new File("E:\\traveldata\\webAll"));
//		parser.reparse();
	}
}
