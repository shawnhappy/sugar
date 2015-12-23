package DB;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DBHelper {
	public static final String url = "jdbc:mysql://127.0.0.1:3306/sugar";  
    public static final String jdbcname = "com.mysql.jdbc.Driver";  
    public static final String dbuser = "root";  
    public static final String dbpassword = "123456";  
  
    public Connection conn = null;  
    public PreparedStatement pst = null;  
  
    public DBHelper() {  
        try {  
            Class.forName(jdbcname);//指定连接类型  
            conn = DriverManager.getConnection(url, dbuser, dbpassword);//获取连接  
           
            //System.out.println("链接数据库成功！");
        } catch (Exception e) { 
        	//System.out.println("链接数据库失败！");
            e.printStackTrace();  
        }  
    } 
    
    //判断登录是否成功
    public String DBQueryLogin(String name,String passwd){
    	if(!DBQueryCheckName(name)){
	    	try{ 
	    		
	    		String sql = "select * from user where name = '"+name+"';";
		    	pst = conn.prepareStatement(sql);//准备执行语句  
		         
		         ResultSet res = pst.executeQuery();
		         
		         while(res.next()){
		         	String qname = res.getString("name");
		         	String qpw = res.getString("passwd");
	
		         	if(qname.equals(name) && qpw.equals(passwd))
		         		return "sucess";
		         }
		         
		         return "fail";
	    	}catch(Exception e){
	    		//System.out.println("查询失败！");
	    		e.printStackTrace();
	    	}
    	}
    	
    	return "unknow";
    }
    
    //查询用户权限
    public String DBQuerygetAuthority(String name){
    	if(!DBQueryCheckName(name)){
	    	try{ 
	    		
	    		String sql = "select authority from user where name = '"+name+"';";
		    	pst = conn.prepareStatement(sql);//准备执行语句  
		         
		         ResultSet res = pst.executeQuery();
		         
		         while(res.next()){
		         	String aty = res.getString("authority");
		         	return aty;		         	
		         }
		         
		         return "normal";
	    	}catch(Exception e){
	    		//System.out.println("查询失败！");
	    		e.printStackTrace();
	    	}
    	}
    	
    	return "unknow";
    }
    
    //获取当前用户已经进行的实验次数
    public int DBQuerygetTimes(String name){
    	try {
    		String sql = "select times from user where name='"+name+"';";
			pst = conn.prepareStatement(sql);
			
			ResultSet res = pst.executeQuery();
			
			while(res.next()){
				return res.getInt("times");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	return -1;
    }
    
    //更改用户实验次数
    public void DBUpdatesetTimes(String name,int time){
    	try {
			String sql = "update user set times = "+time+" where name = '"+name+"';";
			pst = conn.prepareStatement(sql);//准备执行语句  
	         
	        pst.executeUpdate();
	        
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    }
    
    //检查用户名是否存在
    public boolean DBQueryCheckName(String name){
    	try{ 
    		
    		String sql = "select name from user where name = '"+name+"';";
	    	pst = conn.prepareStatement(sql);//准备执行语句  
	         
	         ResultSet res = pst.executeQuery();
	         
	         while(res.next()){
	         	String qname = res.getString("name");
	         	if(qname.equals(name))
	         		return false;
	         }
    	}catch(Exception e){
    		System.out.println("查询名字失败！");
    		e.printStackTrace();
    	}
    	
    	return true;
    }
    
    //添加新用户
    public String DBUpdateRegister(String name,String passwd, String sex, String age, String edu){
    	
    	if(DBQueryCheckName(name)){
	    	try{ 
	    		
	    		String sql = "insert into user(name,passwd,gender,age,edu) values('"+name+"','"+passwd+"','"+sex+"','"+age+"','"+edu+"');";
		    	pst = conn.prepareStatement(sql);//准备执行语句  
		         
		         pst.executeUpdate();
		         
		         return "sucess";
	    	}catch(Exception e){
	    		System.out.println("注册失败！");
	    		e.printStackTrace();
	    	}
    	}
    	
    	return "fail";
    }
    
   //更新用户行为数据
   public String DBUpdateData(String name,int input,int output,int time,int step,String date,int score){
    	
    	if(!DBQueryCheckName(name)){
	    	try{ 
	    		
	    		String sql = "insert into data(name,times,step,inputD,outputD,date,score) values('"+name+"',"+time+","+step+","+input+","+output+",'"+date+"',"+score+");";
		    	pst = conn.prepareStatement(sql);//准备执行语句  
		         
		         pst.executeUpdate();
		         
		         return "sucess";
	    	}catch(Exception e){
	    		//System.out.println("注册失败！");
	    		e.printStackTrace();
	    	}
    	}
    	
    	return "fail";
    }
   
 //更新parameters
   public String DBUpdatePara(int turn,int min,int max,int target,int threshold,String inst){
    	
    	
    	try{ 
    		
    		String sql = "update param set turns = "+turn+",minOut = "+min+",maxOut = "+max+",target = "+target+",threshold="+threshold+",inst='"+inst+"';";
	    	pst = conn.prepareStatement(sql);//准备执行语句  
	         
	         pst.executeUpdate();
	         
	         return "sucess";
    	}catch(Exception e){
    		//System.out.println("注册失败！");
    		e.printStackTrace();
    	}
    	
    	
    	return "fail";
    }
   
   public String DBgetUserInfo(String name){
   	try{ 
   		
   		String sql = "select * from user where name = '"+name+"';";
	    	pst = conn.prepareStatement(sql);//准备执行语句  
	         
	         ResultSet res = pst.executeQuery();
	         
	         while(res.next()){
	         	String qpw = res.getString("passwd");
	         	String qsex = res.getString("gender");
	         	String qage = res.getString("age");
	         	String qedu = res.getString("edu");
	         	
	         	return qpw+","+qsex+","+qage+","+qedu;
	         }
   	}catch(Exception e){
   		System.out.println("查询用户信息失败！");
   		e.printStackTrace();
   	}
   	
   	return " ";
   }
   
   //获取参数
   public String DBgetParam(){
	   	try{ 
	   		
	   		String sql = "select * from param;";
		    	pst = conn.prepareStatement(sql);//准备执行语句  
		         
		         ResultSet res = pst.executeQuery();
		         
		         while(res.next()){
		         	String turn = res.getString("turns");
		         	String minOut = res.getString("minOut");
		         	String maxOut = res.getString("maxOut");
		         	String target = res.getString("target");
		         	String threshold = res.getString("threshold");
		         	
		         	return turn+","+minOut+","+maxOut+","+target+","+threshold;
		         }
	   	}catch(Exception e){
	   		System.out.println("查询参数失败！");
	   		e.printStackTrace();
	   	}
	   	
	   	return " ";
	   }

   
   //删除数据表
   public void DBTruncate(String tablename){
	   String sql = "truncate table "+tablename+";";
	   try {
		  pst = conn.prepareStatement(sql);
		  pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//准备执行语句  
       
      
   }
   
   //生成文件
   public boolean DBCreateFile(String path){
	   
	   try {
		    String sql = "select * from user,data where user.authority = 'normal' and user.times > 0 and user.name = data.name;";
	    	pst = conn.prepareStatement(sql);//准备执行语句  
	         
	         ResultSet res = pst.executeQuery();
	         
	         while(res.next()){
	        	String name = res.getString("name");
	        	String sex = res.getString("gender");
	        	String age = res.getString("age");
	        	String edu = res.getString("edu");
	        	int times = res.getInt("data.times");
	        	int step = res.getInt("data.step");
	        	int inputD = res.getInt("inputD");
	        	int outputD = res.getInt("outputD");
	        	String dateString = res.getString("date");
	        	int score = res.getInt("score");
	        	
	        	String logString = name+","+sex+","+age+","+edu+","+times+","+step+","+inputD+","+outputD+","+score+","+dateString+"\n";
	        	storeFile(path, logString);         	
	         	
	         }
	         
	         return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//准备执行语句  
       
      return false;
   }
  
    public void close() {  
        try {  
            this.conn.close();  
            this.pst.close();
            //System.out.println("数据库关闭!");
        } catch (SQLException e) {  
            e.printStackTrace();  
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
