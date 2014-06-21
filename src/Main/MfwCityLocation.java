package Main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import org.apache.http.Header;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.ProtocolException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.RedirectStrategy;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

/**
 * ͨ�����е����֣���ó��е�id
 * @author yinchuandong
 *
 */
public class MfwCityLocation {

	
	private LinkedList<String> cityList;
	
	public MfwCityLocation(){
		cityList = new LinkedList<String>();
	}
	
	public void loadData(String fileName) throws IOException{
		BufferedReader reader = new BufferedReader(new FileReader(new File(fileName)));
		String buff = "";
		while((buff = reader.readLine()) != null){
			cityList.add(buff);
		}
		reader.close();
	}
	
	public void runTask(final String fileName){
		new Thread(){
			@Override
			public void run(){
				try {
					PrintWriter writer = new PrintWriter(new File(fileName));
					while(cityList.size() != 0){
						String city = cityList.poll();
						String cityId = getCityId(city);
						if (cityId.equals("") || cityId.length() != 5) {
							System.out.println("����----" + city + " " + cityId);
							continue;
						}
						String buff = city + " " + cityId + "\r\n";
						System.out.print(buff);
						writer.write(buff);
						writer.flush();
						Thread.sleep(500);
					}
					writer.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}.start();
	}
	
	/**
	 * ����apache get������Url
	 * �����������
	 */
	@SuppressWarnings("deprecation")
	public String getCityId(String cityName){
		String url = "http://www.mafengwo.cn/hotel/s.php?sKeyWord="+cityName+"&sCheckIn=2014-07-28&sCheckOut=2014-07-29";
		String result = "";
		DefaultHttpClient client = new DefaultHttpClient();
		client.setRedirectStrategy(new RedirectStrategy() {
			@Override
			public HttpUriRequest getRedirect(HttpRequest arg0,
					HttpResponse arg1, HttpContext arg2)
					throws ProtocolException {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public boolean isRedirected(HttpRequest arg0, HttpResponse arg1,
					HttpContext arg2) throws ProtocolException {
				// TODO Auto-generated method stub
				return false;
			}
		});
		
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Host", "www.mafengwo.cn");
		httpGet.setHeader("Referer", "http://www.mafengwo.cn/hotel/");
		httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36"); 
		try {
			HttpResponse response = client.execute(httpGet);
			int status = response.getStatusLine().getStatusCode();
			if (status == HttpStatus.SC_OK) {
				System.out.println("û�иó���: --- " + cityName);
				return "";
//				String data = EntityUtils.toString(response.getEntity());
				//�����������
//				String test = new String(result.getBytes("ISO-8859-1"), 0, result.length(), "utf-8");
//				String test = new String(result.getBytes("gbk"), 0, result.length(), "utf-8");
			}else{
//				System.out.println("ҳ��û�з���");
				Header[] headers = response.getHeaders("Location");
				String location = headers[0].getValue();
				String cityId = location.replaceAll("(/\\w*?/)|(/)", "");
				result = cityId;
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			httpGet.releaseConnection();
		}
		return result;
	}
	
	
	public static void main(String[] args) throws IOException{
//		MfwCityLocation model = new MfwCityLocation();
//		model.loadData("./Seed/mfw-city.txt");
//		model.runTask("./Seed/mfw-city-id.txt");
		String location = "/hotel/10083.html";
		String cityId = location.replaceAll("(/\\w*?/)|(\\.(\\w)+)", "");
		System.out.println(cityId);
	}
}
