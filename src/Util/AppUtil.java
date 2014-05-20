package Util;

import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class AppUtil {

	/**
	 * md5�����㷨
	 * @param str
	 * @return
	 */
	static public String md5(String str) {
		MessageDigest algorithm = null;
		try {
			algorithm = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		if (algorithm != null) {
			algorithm.reset();
			algorithm.update(str.getBytes());
			byte[] bytes = algorithm.digest();
			StringBuilder hexString = new StringBuilder();
			for (byte b : bytes) {
				hexString.append(Integer.toHexString(0xFF & b));
			}
			return hexString.toString();
		}
		return "";

	}
	
	/**
	 * ��ʽ��json
	 * @param uglyJSONString
	 * @return
	 */
	public static String jsonFormatter(String uglyJSONString){
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		JsonParser jp = new JsonParser();
		JsonElement je = jp.parse(uglyJSONString);
		String prettyJsonString = gson.toJson(je);
		return prettyJsonString;
	}
	
	/**
	 * ����url����ò�ѯ�Ĳ�����
	 * �磺http://www.baidu.com?name=123&year=2014
	 * ��name��year��ֵװ��hashmap���棬ֱ��ͨ��get��������
	 * @param url
	 * @return
	 */
	public static HashMap<String, String> parseUrlQuey(URL url){
		HashMap<String, String> result = new HashMap<String, String>();
		String[] rowArr = url.getQuery().split("&");
		for (String param : rowArr) {
			String[] paramArr = param.split("=");
			if (paramArr.length == 2) {
				result.put(paramArr[0], paramArr[1]);
			}
		}
		return result;
	}
	

}
