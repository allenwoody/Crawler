package Base;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.Socket;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.security.auth.Subject;

import Model.WebPage;
import Util.AppUtil;
import Util.HttpUtil;
import Util.PageUtil;

/**
 * ��ȡͨ��htmlҳ��Ļ���
 * @author yinchuandong
 *
 */
public abstract class BaseCrawler {

	private final static int TASK_NUM = 10;
	/**
	 * ����������Url����ȣ�key��url��md5ֵ��value�����ֵ
	 */
	private ConcurrentHashMap<String, Integer> urlDeeps;
	/**
	 * �ȴ��Ķ���
	 */
	private LinkedList<String> waitList;
	/**
	 * �̳߳�
	 */
	private ExecutorService taskPool;
	/**
	 * ��ҳ���ַ�����
	 */
	private String charset = "utf-8";
	/**
	 * ��ҳ���������磺http://lvyou.baidu.com
	 */
	private String domain = "";
	/**
	 * �����������
	 */
	private int crawlerDeeps = 2;
	/**
	 * ��ʱʱ��
	 */
	private int delay = 500;
	
	/**
	 * �ж������Ƿ���������
	 */
	private boolean isRunning = false;
	
	public BaseCrawler(){
		urlDeeps = new ConcurrentHashMap<String, Integer>();
		waitList =  new LinkedList<String>();
		taskPool = Executors.newCachedThreadPool();
	}
	
	/**
	 * ��ʼ��ȡ�����ⲿ����
	 */
	public void begin(){
		if (isRunning) {
			return;
		}
		new Thread(){
			@Override
			public void run(){
				isRunning = true;
				while(!waitList.isEmpty()){
					String url = popWaitList();
					taskPool.execute(new ProcessThread(url));
					try {
						Thread.sleep(delay);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				isRunning = false;
			}
		}.start();
	}
	
	/**
	 * ��waitList��ͷ��㵯��
	 * @return
	 */
	public synchronized String popWaitList(){
		String temp = waitList.poll();
		return temp;
	}
	
	/**
	 * ���һ��url��waitList
	 * @param url
	 * @param deeps
	 */
	public synchronized void addWaitList(String url, int deeps){
		waitList.offer(url);
		String key = AppUtil.md5(url);
		urlDeeps.put(key, deeps);
	}
	
	
	/**
	 * ����Ѿ���ȡ����url����б�key��url��md5ֵ��value�����ֵ
	 * @return
	 */
	public ConcurrentHashMap<String, Integer> getUrlDeeps(){
		return this.urlDeeps;
	}
	
	/**
	 * ���������ʼ����
	 * @param path
	 */
	protected void loadSeedsFromFile(String path){
		try {
			File file = new File(path);
			FileInputStream inputStream = new FileInputStream(file);
			BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
			String msg = null;
			while((msg = reader.readLine()) != null){
				waitList.add(msg);
				urlDeeps.put(AppUtil.md5(msg), 1);//���ӵ����Ϊ1
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * ִ��������֮��Ļص�����
	 * @param webPage
	 */
	public abstract void exactor(WebPage webPage);
	
	/**
	 * �����ַ���
	 * @param charset
	 */
	public void setCharset(String charset){
		this.charset = charset;
	}
	
	/**
	 * ��������, �����Ե�ַ����
	 * @param domain
	 */
	public void setDomain(String domain){
		this.domain = domain;
	}
	
	/**
	 * �����������ȣ�Ĭ��Ϊ2
	 * @param deeps
	 */
	public void setCrawlerDeeps(int deeps){
		if(deeps >= 0){
			this.crawlerDeeps = deeps;
		}
	}
	
	/**
	
	
	/**
	 * ��inputstreamתΪstring����
	 * @param inputStream
	 * @return
	 * @throws IOException
	 */
	private String parse(InputStream inputStream) throws IOException {
		StringBuffer buffer = new StringBuffer();
		String result = "";
		String msg = null;
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream,charset));
		while((msg = reader.readLine()) != null ){
			buffer.append(msg + "\r\n");
		}
		result = buffer.toString();
		return result;
	}
	
	
	/**
	 * ������ȡ���߳�
	 * @author yinchuandong
	 *
	 */
	public class ProcessThread implements Runnable{

		private String url;
		public ProcessThread(String url){
			this.url = url;
		}
		
		@Override
		public void run() {
			System.out.println("������ȡ��" + urlDeeps.size() +"����" + url);
			HttpUtil httpUtil = new HttpUtil();
			httpUtil.setCharset(charset);
			String pageContent = httpUtil.get(url);
			WebPage webPage;
			try {
				webPage = new WebPage(pageContent, new URL(url), urlDeeps.get(AppUtil.md5(url)));
				exactor(webPage);
			} catch (MalformedURLException e) {
				exactor(null);
				e.printStackTrace();
			}
			//�ٴε������棬�����������ʱ���࣬���µȴ�����Ϊ�գ�����ֹͣ�����
			begin();
		}
	}
	
}
