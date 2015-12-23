package server;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;

import DB.DBHelper;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SimpleServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException 
	{ 
			// 
			res.setContentType("text/html");
			req.setCharacterEncoding("utf-8");			
			res.setContentType("text/html;charset=UTF-8");

			//得到响应的 PrintWriter以返回文本给客户端. 
			//PrintWriter toClient = res.getWriter(); 
			DBHelper mDbHelper = new DBHelper();
			
			String turn = "30";
			String min = "1000";
			String max = "12000";
			String target = "9000";
			String threshold = "5000";
			
			String paraString = mDbHelper.DBgetParam();
			String[] para = paraString.split(",");
			
			if(para.length > 3){
				turn = para[0];
				min = para[1];
				max = para[2];
				target = para[3];
				threshold = para[4];
			}
			
			String typeString = req.getParameter("to");
			
			String ip = getRemortIP(req);
			
			System.out.println("IP:"+ip);
			
			//获取标签
			String flag = req.getParameter("flag");
			
			if(typeString.equals("log"))
			{
				String name = req.getParameter("username");
				String pw = req.getParameter("p");
				String flagString = mDbHelper.DBQueryLogin(name, pw);
				
				if(flagString.equals("sucess"))
					req.setAttribute("authority",mDbHelper.DBQuerygetAuthority(name));
				
				req.setAttribute("loginmessage",flagString);
				req.setAttribute("name", name);
				req.setAttribute("minOut", min);
				req.setAttribute("maxOut", max);
				req.setAttribute("turn", turn);
				req.setAttribute("target", target);
				req.setAttribute("threshold", threshold);
				if(flag.equals("cn"))
					req.getRequestDispatcher("/Login_cn.jsp").forward(req,
							res);
				else
					req.getRequestDispatcher("/Login.jsp").forward(req,
							res);
				
				System.out.println(name+" "+pw);
			}else if(typeString.equals("reg")){
				String sex = req.getParameter("sex");
				String age = req.getParameter("age");
				String edu = req.getParameter("Education");
				
				if(sex.equals("FEMALE"))
					sex = "Female";
				else 
					sex = "Male";
				
				
				age = getAgeOrEdu(Integer.parseInt(age),0);
				edu = getAgeOrEdu(Integer.parseInt(edu),1);
				
				
				
				String name = req.getParameter("user");
				String pw = req.getParameter("passwd");	
				
				//String pathString = req.getSession().getServletContext().getRealPath("/")+"/data/"+name+".csv";
				//String content = name+","+pw+","+sex+","+age+","+edu+",\n";
				//storeFile(pathString, content);
				
				req.setAttribute("regmessage",mDbHelper.DBUpdateRegister(name, pw, sex, age, edu));
				req.setAttribute("name", name);
				req.setAttribute("minOut", min);
				req.setAttribute("maxOut", max);
				req.setAttribute("turn", turn);
				req.setAttribute("target", target);
				req.setAttribute("threshold", threshold);
				
				if(flag.equals("cn"))
					req.getRequestDispatcher("/Register_cn.jsp").forward(req,
							res);
				else 
					req.getRequestDispatcher("/Register.jsp").forward(req,
							res);
				
				
				
			}
			
			
			
			mDbHelper.close();

/*			try { 
				
			//打开一个文件写入Survey的结果. 
//			String surveyName = req.getParameterValues("survey")[0]; 
//			FileWriter resultsFile = new FileWriter( System.getProperty("file.separator") 
//			+ surveyName + ".txt", true); 
//			PrintWriter toFile = new PrintWriter(resultsFile); 
//
//			// 从客户端得到表单数据 & 存贮在这个文件中 
//			toFile.println(""); 
			Enumeration values = req.getParameterNames(); 
			while(values.hasMoreElements()) { 
			String name = (String)values.nextElement(); 
			String value = req.getParameterValues(name)[0];
			
			JSONObject jb = JSONObject.fromObject(value);
			System.out.println(jb);
	        //取查询参数params,是个json数组
	        JSONArray jsons = jb.getJSONArray("users");
	        int jsonLength = jsons.size();
	             //对json数组进行循环

	        for (int i = 0; i < jsonLength; i++) {
	            JSONObject tempJson = JSONObject.fromObject(jsons.get(i));
	            System.out.println("user:" + tempJson);
	            String field = StringEscapeUtils.escapeSql(tempJson.getString("name" ));
	                      String operateFlag = StringEscapeUtils.escapeSql(tempJson.getString("age"));
	                System.out.println(field+"----"+operateFlag);     
	             }
			
				if(name.compareTo("submit") != 0) { 
				  toClient.println(name + ": " + value); 
				} 
			} 
//			toFile.println(""); 
//
//			//关闭文件. 
//			resultsFile.close(); 
			String tString = this.getStream(req);
			// 用一个thank you返回客户端 
			
			toClient.println(""); 
			toClient.println("Thank you for participating"); 
			//toClient.println("{\"classes\":[\"english\","chinese","math"],"users":[{"age":"30","name":"jony"},{"age":"29","name":"cindy"},{"age":"1","name":"xixi"}]}"); 
			System.out.println(tString+"sdfsd");

			} catch(Exception e) { 
			e.printStackTrace(); 
			toClient.println( 
			"A problem occured while recording your answers. " 
			+ "Please try again."); 
			} 

			// 关闭writer; 响应完成. 
			toClient.close(); */
	}
	
	  public String getStream(HttpServletRequest request) throws IOException{
	        BufferedReader br=new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8"));
	        StringBuffer ReString=new StringBuffer();
	        String tmp="";
	        while(true){
	            tmp=br.readLine();
	            if(tmp==null)
	                break;
	            else
	                ReString.append(tmp);
	        }
	        return ReString.toString();
	    }
	  
	  public String getAgeOrEdu(int order, int f){
		 
		  if(f == 0){
			  if(order == 1)
				  return "Under 12 years old";
			  if(order == 2)
				  return "12-17 years old";
			  if(order == 3)
				  return "18-24 years old";
			  if(order == 4)
				  return "25-34 years old";
			  if(order == 5)
				  return "35-44 years old";
			  if(order == 6)
				  return "45-54 years old";
			  if(order == 7)
				  return "55-64 years old";
			  if(order == 8)
				  return "65-74 years old";
			  if(order == 9)
				  return "75 years or older";
			  
			  return "age error";
		  }
		  else{
			  if(order == 1)
				  return "Some high school, no diploma";
			  if(order == 2)
				  return "High school graduate";
			  if(order == 3)
				  return "Some college credit (no degree)";
			  if(order == 4)
				  return "Trade/technical/vocational training";
			  if(order == 5)
				  return "Associate degree";
			  if(order == 6)
				  return "Bachelor’s degree";
			  if(order == 7)
				  return "Master’s degree";
			  if(order == 8)
				  return "Professional degree (Law, Medicine)";
			  if(order == 9)
				  return "Doctorate degree";
			  
			  return "edu error";
		  }
		  
	  }
	  
	  public boolean storeFile(String path,String content){
			
			  BufferedWriter out = null;  
			  File file;
			 
			  try {

			   file = new File(path);		  
			   out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, true))); 

			   //
			   if (file.exists()) {
				    file.delete();
				   }
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
	  
	  public String getRemortIP(HttpServletRequest request) {  
		  if (request.getHeader("x-forwarded-for") == null) {  
		   return request.getRemoteAddr();
		  }  
		   return request.getHeader("x-forwarded-for");  
		 }  

}
