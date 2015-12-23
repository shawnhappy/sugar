package server;

import javax.servlet.http.HttpServlet;

import DB.DBHelper;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DownloadServlet extends HttpServlet {
	
    public void doGet(HttpServletRequest request, HttpServletResponse response)
           throws IOException, ServletException {

       SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String date = df.format(new Date());
    	
       String op = request.getParameter("op").toString();
       if(op.equals("download")){  
    	   deleteFile(request.getSession().getServletContext().getRealPath("/")+"/data",request.getSession().getServletContext().getRealPath("/"));
    	   String pathString = request.getSession().getServletContext().getRealPath("/")+"/data/"+"data"+".csv";
    	   DBHelper mDbHelper = new DBHelper();
    	   if(mDbHelper.DBCreateFile(pathString)){
    	   // the file to download.
		       String flag = fileToZip(request.getSession().getServletContext().getRealPath("/")+"/data",request.getSession().getServletContext().getRealPath("/"),"userdata");
		       
		       if(flag.equals("sucess")){
			       OutputStream o = response.getOutputStream();
			       byte b[] = new byte[1024];
			       File fileLoad = new File(request.getSession().getServletContext().getRealPath("/"),"userdata.zip");       
			       if(!fileLoad.exists()){
			    	   try {
			    	   fileLoad.createNewFile();
			    	   } catch (IOException e) {
			    	   // TODO Auto-generated catch block
			    	   e.printStackTrace();
			    	   }
			    	   }
			       // the dialogbox of download file.
			       response.setHeader("Content-disposition", "attachment;filename="
			              + "userdata.zip");
			       // set the MIME type.
			       response.setContentType("application/x-tar");
			       // get the file length.
			       long fileLength = fileLoad.length();
			       String length = String.valueOf(fileLength);
			       response.setHeader("Content_Length", length);
			       // download the file.
			       FileInputStream in = new FileInputStream(fileLoad);
			       int n = 0;
			       while ((n = in.read(b)) != -1) {
			           o.write(b, 0, n);
			       }
			       
			       o.close();
			       in.close();
		       }
	       }else{
	    	   response.setContentType("text/html");						
			   response.setContentType("text/html;charset=UTF-8");
			   request.getRequestDispatcher("/Admin.jsp").forward(request,
						response);
	       }
       }else if(op.equals("delete")){
    	   	   
    	   deleteFile(request.getSession().getServletContext().getRealPath("/")+"/data",request.getSession().getServletContext().getRealPath("/"));
    	   DBHelper mHelper = new DBHelper();
    	   mHelper.DBTruncate("data");
    	   mHelper.close();
    	 //�õ���Ӧ�� PrintWriter�Է����ı����ͻ���. 
    	   response.setContentType("text/html");						
		   response.setContentType("text/html;charset=UTF-8");
		   request.getRequestDispatcher("/Admin.jsp").forward(request,
					response);    	   
       }
      
       
    }
 
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
       doGet(request, response);
    }
    
    public static String fileToZip(String sourceFilePath,String zipFilePath,String fileName){  
        
        File sourceFile = new File(sourceFilePath);  
        FileInputStream fis = null;  
        BufferedInputStream bis = null;  
        FileOutputStream fos = null;  
        ZipOutputStream zos = null;  
          
        File tempfile = new File(zipFilePath);//���������ض�Ŀ¼
        File tempFilename = null;
        File[] filelist= tempfile.listFiles();
        for(int i=0;i<filelist.length;i++)
        {
        	tempFilename=filelist[i];
	        if(tempFilename.getName().endsWith("zip"))//����ļ����������׺Ϊ������������Լ�д����ɾ���ļ�
	        {
	        	tempFilename.delete();//ɾ���ļ�}
	        }

        }        
        
        if(sourceFile.exists() == false){  
            System.out.println("��ѹ�����ļ�Ŀ¼��"+sourceFilePath+"������.");
            
            return "nopath";
        }else{  
            try {  
                File zipFile = new File(zipFilePath + "/" + fileName +".zip");  
                if(zipFile.exists()){
                	
                    System.out.println(zipFilePath + "Ŀ¼�´�������Ϊ:" + fileName +".zip" +"����ļ�.");  
                }else{  
                    File[] sourceFiles = sourceFile.listFiles();  
                    if(null == sourceFiles || sourceFiles.length<1){  
                        System.out.println("��ѹ�����ļ�Ŀ¼��" + sourceFilePath + "���治�����ļ�������ѹ��.");
                        
                        return "nofile";
                    }else{  
                        fos = new FileOutputStream(zipFile);  
                        zos = new ZipOutputStream(new BufferedOutputStream(fos));  
                        byte[] bufs = new byte[1024*10];  
                        for(int i=0;i<sourceFiles.length;i++){  
                            //����ZIPʵ�壬����ӽ�ѹ����  
                            ZipEntry zipEntry = new ZipEntry(sourceFiles[i].getName());  
                            zos.putNextEntry(zipEntry);  
                            //��ȡ��ѹ�����ļ���д��ѹ������  
                            fis = new FileInputStream(sourceFiles[i]);  
                            bis = new BufferedInputStream(fis, 1024*10);  
                            int read = 0;  
                            while((read=bis.read(bufs, 0, 1024*10)) != -1){  
                                zos.write(bufs,0,read);  
                            }
                            
                            if(null != bis)                        
                            	bis.close();
                            if(null != fis)
                            	fis.close();                            
                        }
                        
                        if(null != bis)                        
                        	bis.close();
                        if(null != fis)
                        	fis.close();
                        if(null != zos)
                        	zos.close();
                        if(null != fos)
                        	fos.close();
                        
                        return "sucess";
                    }  
                }  
            } catch (FileNotFoundException e) {  
                e.printStackTrace();  
                throw new RuntimeException(e);  
            } catch (IOException e) {  
                e.printStackTrace();  
                throw new RuntimeException(e);  
            } finally{  
                //�ر���  
                try {  
                    if(null != bis) bis.close();  
                    if(null != zos) zos.close();  
                } catch (IOException e) {  
                    e.printStackTrace();  
                    throw new RuntimeException(e);  
                }  
            }  
        }
        
        return "fail";  
    } 
    
    public static void deleteFile(String sourceFilePath,String zipFilePath){ 
    	
    	//ɾ��zip�ļ�
    	File tempfile = new File(zipFilePath);
        File tempFilename = null;
        File[] filelist= tempfile.listFiles();
        for(int i=0;i<filelist.length;i++)
        {
        	tempFilename=filelist[i];
	        if(tempFilename.getName().endsWith("zip"))
	        {
	        	tempFilename.delete();
	        }

        } 
        
        //ɾ��csv�ļ�
        File csvfile = new File(sourceFilePath);//���������ض�Ŀ¼
        File csvFilename = null;
        File[] csvfilelist= csvfile.listFiles();
        for(int i=0;i<csvfilelist.length;i++)
        {
        	csvFilename=csvfilelist[i];
        	System.out.println(csvFilename.getName());
	        
	        boolean result = csvFilename.delete();//�ж��Ƿ�ɾ�����
	        /*if(!result)
	         {

	          System.gc();//ϵͳ������Դǿ�ƻ���

	          csvFilename.delete();

	         }*/
	        
        } 
    	
    }
    
    public boolean storeFile(String path, String content){
		 
		  BufferedWriter out = null;  
		  File file;
		 
		  try {

		   file = new File(path);		  
		   out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, true))); 

		   // if file doesnt exists, then create it
		   if (!file.exists()) {
		    file.createNewFile();
		   }
		   
		   out.write(content);
		   if (out != null)
			   out.close();
		       return true;
		  } catch (IOException e) {
		   e.printStackTrace();
		  } finally {
		   try {
		    if (out != null) {
		     out.close();
		    }
		   } catch (IOException e) {
		    e.printStackTrace();
		   }
		  }
		return false;
	}
	
}
