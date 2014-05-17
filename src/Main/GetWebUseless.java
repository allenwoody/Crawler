package Main;

import java.io.File;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Hashtable;
public class GetWebUseless {
private int webDepth = 2;//�������
private int intThreadNum = 10;//�߳���
private String strHomePage = "";//��ҳ��ַ
private String myDomain;//����
private String fPath = "web";//������ҳ�ļ���Ŀ¼��
private ArrayList<String> arrUrls = new ArrayList<String>();//�洢δ����URL
private ArrayList<String> arrUrl = new ArrayList<String>();//�洢����URL����������
private Hashtable<String,Integer> allUrls = new Hashtable<String,Integer>();//�洢����URL����ҳ��
private Hashtable<String,Integer> deepUrls = new Hashtable<String,Integer>();//�洢����URL���
private int intWebIndex = 0;//��ҳ��Ӧ�ļ��±꣬��0��ʼ
private String charset = "GB2312";
private String report = "";
private long startTime;
private int webSuccessed = 0;
private int webFailed = 0;

/**
 * ����һ���������ϵ��࣬��ʱûʲô��
 * @param s
 */
public GetWebUseless(String s)
{
   this.strHomePage = s;
}
/**
 * ������Ⱥ���ҳ
 * @param s
 * @param i
 */
public GetWebUseless(String s,int i)
{
   this.strHomePage = s;
   this.webDepth = i;
}

public synchronized void addWebSuccessed()
{
   webSuccessed++;
}
public synchronized void addWebFailed()
{
   webFailed++;
}
/**
 * �������¼��d://reprot.txt
 * @param s
 */
public synchronized void addReport(String s)
{
   try
   {
    report += s;
    PrintWriter pwReport = new PrintWriter(new FileOutputStream("d://report.txt"));
    pwReport.println(report);
    pwReport.close();
   }
   catch(Exception e)
   {
    System.out.println("���ɱ����ļ�ʧ��!");
   }
}
//����ȡ��list�е�Ԫ�أ��̰߳�ȫ
public synchronized String getAUrl()
{
   String tmpAUrl = arrUrls.get(0);
   arrUrls.remove(0);
   return tmpAUrl;
}
//����ȡ��list�е�Ԫ�أ��̰߳�ȫ
public synchronized String getUrl()
{
   String tmpUrl = arrUrl.get(0);
   arrUrl.remove(0);
   return tmpUrl;
}
public synchronized Integer getIntWebIndex()
{
   intWebIndex++;
   return intWebIndex;
}
/**
* @param args
*/
public static void main(String[] args)
{
	GetWebUseless gw = new GetWebUseless("http://lvyou.baidu.com/shenzhen/jingdian/");
	gw.getWebByHomePage();
//	//����Ϊ��ʱ����ӡ��No input
//   if (args.length == 0 || args[0].equals(""))
//   {
//    System.out.println("No input!");
//    System.exit(1);
//   }
//   //���벻Ϊ����ֻ��һ��URLʱ�ж�������Ƿ�Ϊ��ȷ��URL
//   else if(args.length == 1)
//   {
//	   //�������URL����Ϊ��ҵ
//    GetWeb gw = new GetWeb(args[0]);
//    //�ж�URL�Ƿ���ȷ
//    gw.getWebByHomePage();
//   }
//   else
//    {
//    GetWeb gw = new GetWeb(args[0],Integer.parseInt(args[1]));
//    gw.getWebByHomePage();
//   }
}
public void getWebByHomePage()
{
   startTime = System.currentTimeMillis();
   this.myDomain = getDomain();
   if (myDomain == null)
   {
    System.out.println("Wrong input!");
    //System.exit(1);
   }
   //��ӡ����ҳ
   System.out.println("Homepage = " + strHomePage);
   addReport("Homepage = " + strHomePage + "!\n");
   System.out.println("Domain = " + myDomain);
   addReport("Domain = " + myDomain + "!\n");
   //��URL�洢��List��������
   arrUrls.add(strHomePage);
   arrUrl.add(strHomePage);
   allUrls.put(strHomePage,0);
   deepUrls.put(strHomePage,1);
   //�жϴ洢��ҳ��web�ļ��Ƿ���ڣ���������ھʹ���һ��webĿ¼
   File fDir = new File(fPath);
        if(!fDir.exists())
        {
        fDir.mkdir();
        }
   System.out.println("Start!");
   this.addReport("Start!\n");
   String tmp = getAUrl();
   //�����URL�������еõ�����ҳ��ַ
   this.getWebByUrl(tmp,charset,allUrls.get(tmp)+"");
   int i = 0;
   //ÿ��ִ�ж�Ϊ�õ�ǰ���󴴽�һ���߳�
   for (i=0;i<intThreadNum;i++)
   {
    new Thread(new Processer(this)).start();
   }
   //��report.txt�м�¼��Ϣ
   while (true)
   {
    if(arrUrls.isEmpty() && Thread.activeCount() == 1)
    {
     long finishTime = System.currentTimeMillis();
     long costTime = finishTime-startTime;
     System.out.println("\n\n\n\n\nFinished!");
     addReport("\n\n\n\n\nFinished!\n");
     System.out.println("Start time = " + startTime + "   " + "Finish time = " + finishTime + "   " + "Cost time = " + costTime + "ms");
     addReport("Start time = " + startTime + "   " + "Finish time = " + finishTime + "   " + "Cost time = " + costTime + "ms" + "\n");
     System.out.println("Total url number = " + (webSuccessed+webFailed) + "   Successed: " + webSuccessed + "   Failed: " + webFailed);
     addReport("Total url number = " + (webSuccessed+webFailed) + "   Successed: " + webSuccessed + "   Failed: " + webFailed + "\n");
    
     String strIndex = "";
     String tmpUrl = "";
     while (!arrUrl.isEmpty())
     {
      tmpUrl = getUrl();
      strIndex += "Web depth:" + deepUrls.get(tmpUrl) + "   Filepath: " + fPath + "/web" + allUrls.get(tmpUrl) + ".htm" + "   url:" + tmpUrl + "\n\n";
     }
     System.out.println(strIndex);
     try
     {
      PrintWriter pwIndex = new PrintWriter(new FileOutputStream("fileindex.txt"));
      pwIndex.println(strIndex);
      pwIndex.close();
     }
     catch(Exception e)
     {
      System.out.println("���������ļ�ʧ��!");
     }
     break;
    }
   }
}
/**
 * ��List�е�ÿ��URLĿ¼�� ����Ϣ��ӡ��
 * @param strUrl
 * @param charset
 * @param fileIndex
 */
public void getWebByUrl(String strUrl,String charset,String fileIndex)
{
   try
   {
	   //�ַ�ת��Ϊutf8
    if(charset==null||"".equals(charset))charset="utf-8";
    System.out.println("Getting web by url: " + strUrl);
    addReport("Getting web by url: " + strUrl + "\n");
    URL url = new URL(strUrl);
    //��URL��������
    URLConnection conn = url.openConnection();
    //��������Ϊ�����
    conn.setDoOutput(true);
    //�õ������ӵ�����
    InputStream is = null;
    is = url.openStream();
   
    String filePath = fPath + "/web" + fileIndex + ".htm";
   // System.out.println(filePath+"1111111111111111111111111");
    PrintWriter pw = null;
    FileOutputStream fos = new FileOutputStream(filePath);
    OutputStreamWriter writer = new OutputStreamWriter(fos);
    pw = new PrintWriter(writer);
    BufferedReader bReader = new BufferedReader(new InputStreamReader(is));
    StringBuffer sb = new StringBuffer();
    String rLine = null;
    String tmp_rLine = null;
    //���������������е���Ϣ�����������Ŀ¼��ȥ--��Ŀ¼�½�����Ϊweb/webn.html���ļ�
    while ( (rLine = bReader.readLine()) != null)
    {
     tmp_rLine = rLine;
     int str_len = tmp_rLine.length();
     if (str_len > 0)
     {
      sb.append("\n" + tmp_rLine);
      pw.println(tmp_rLine);
      pw.flush();
      //���������ȴ�����ҳ��ȣ�����ҳ���+1����ͬ��
      if (deepUrls.get(strUrl) < webDepth)getUrlByString(tmp_rLine,strUrl);
     }
     tmp_rLine = null;
    }
    is.close();
    pw.close();
    System.out.println("Get web successfully! " + strUrl);
    addReport("Get web successfully! " + strUrl + "\n");
    addWebSuccessed();
   }
   catch (Exception e)
   {
    System.out.println("Get web failed!       " + strUrl);
    addReport("Get web failed!       " + strUrl + "\n");
    addWebFailed();
   }
}
/**
 * �ж�URL�Ƿ�Ϸ�������Ϸ�����URL��������򷵻�null
 * @return
 */
public String getDomain()
{	
	//URL ��������ʽ
   String reg = "(?<=http\\://[a-zA-Z0-9]{0,100}[.]{0,1})[^.\\s]*?\\.(com|cn|net|org|biz|info|cc|tv)";
   Pattern p = Pattern.compile(reg,Pattern.CASE_INSENSITIVE);
   Matcher m = p.matcher(strHomePage);
   //�ж�������ַ����Ƿ���������������ʽ
   boolean blnp = m.find();
   if (blnp == true)
   {
	   //����ƥ��ԭ�ַ���
    return m.group(0);
   }
   return null;
}

public void getUrlByString(String inputArgs,String strUrl)
{
   String tmpStr = inputArgs;
   String regUrl = "(?<=(href=)[\"]?[\']?)[http://][^\\s\"\'\\?]*(" + myDomain + ")[^\\s\"\'>]*";
   Pattern p = Pattern.compile(regUrl,Pattern.CASE_INSENSITIVE);
   Matcher m = p.matcher(tmpStr);
   boolean blnp = m.find();
   //int i = 0;
   while (blnp == true)
   {
    if (!allUrls.containsKey(m.group(0)))
    {
     System.out.println("Find a new url,depth:" + (deepUrls.get(strUrl)+1) + " "+ m.group(0));
     addReport("Find a new url,depth:" + (deepUrls.get(strUrl)+1) + " "+ m.group(0) + "\n");
     arrUrls.add(m.group(0));
     arrUrl.add(m.group(0));
     allUrls.put(m.group(0),getIntWebIndex());
     deepUrls.put(m.group(0),(deepUrls.get(strUrl)+1));
    }
    tmpStr = tmpStr.substring(m.end(),tmpStr.length());
    m = p.matcher(tmpStr);
    blnp = m.find();
   }
}
/**
 * Ϊ��ǰ��URL�����߳�
 * @author xqh
 *
 */
class Processer implements Runnable
{
     GetWebUseless gw;
     public Processer(GetWebUseless g)
     {
         this.gw = g;
     }
     public void run()
     {
       //Thread.sleep(5000);
       while (!arrUrls.isEmpty())
       {
        String tmp = getAUrl();
        getWebByUrl(tmp,charset,allUrls.get(tmp)+"");
       }
     }
}
}