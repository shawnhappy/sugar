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
    	 //得到响应的 PrintWriter以返回文本给客户端. 
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
          
        File tempfile = new File(zipFilePath);//里面输入特定目录
        File tempFilename = null;
        File[] filelist= tempfile.listFiles();
        for(int i=0;i<filelist.length;i++)
        {
        	tempFilename=filelist[i];
	        if(tempFilename.getName().endsWith("zip"))//获得文件名，如果后缀为“”，这个你自己写，就删除文件
	        {
	        	tempFilename.delete();//删除文件}
	        }

        }        
        
        if(sourceFile.exists() == false){  
            System.out.println("待压缩的文件目录："+sourceFilePath+"不存在.");
            
            return "nopath";
        }else{  
            try {  
                File zipFile = new File(zipFilePath + "/" + fileName +".zip");  
                if(zipFile.exists()){
                	
                    System.out.println(zipFilePath + "目录下存在名字为:" + fileName +".zip" +"打包文件.");  
                }else{  
                    File[] sourceFiles = sourceFile.listFiles();  
                    if(null == sourceFiles || sourceFiles.length<1){  
                        System.out.println("待压缩的文件目录：" + sourceFilePath + "里面不存在文件，无需压缩.");
                        
                        return "nofile";
                    }else{  
                        fos = new FileOutputStream(zipFile);  
                        zos = new ZipOutputStream(new BufferedOutputStream(fos));  
                        byte[] bufs = new byte[1024*10];  
                        for(int i=0;i<sourceFiles.length;i++){  
                            //创建ZIP实体，并添加进压缩包  
                            ZipEntry zipEntry = new ZipEntry(sourceFiles[i].getName());  
                            zos.putNextEntry(zipEntry);  
                            //读取待压缩的文件并写进压缩包里  
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
                //关闭流  
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
    	
    	//删除zip文件
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
        
        //删除csv文件
        File csvfile = new File(sourceFilePath);//里面输入特定目录
        File csvFilename = null;
        File[] csvfilelist= csvfile.listFiles();
        for(int i=0;i<csvfilelist.length;i++)
        {
        	csvFilename=csvfilelist[i];
        	System.out.println(csvFilename.getName());
	        
	        boolean result = csvFilename.delete();//判断是否删除完毕
	        /*if(!result)
	         {

	          System.gc();//系统进行资源强制回收

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
