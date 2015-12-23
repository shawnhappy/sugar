package server;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBHelper;



public class SugarServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
		}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException 
	{ 
			// ����������Ӧ�� "content type" ͷ�� 
			res.setContentType("text/html"); 

			//�õ���Ӧ�� PrintWriter�Է����ı����ͻ���. 
			PrintWriter toClient = res.getWriter();
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			
			Random random = new Random();
			int r = random.nextInt()%2;
			
			if(random.nextBoolean())
				r = -1*r;
			
			int turn = 30;
			int minOut = 1000;
			int maxOut = 12000;
			
			DBHelper mDbHelper = new DBHelper();
			
			String params = mDbHelper.DBgetParam();
			String[] p = params.split(",");
			if(p.length>3){
				turn = Integer.parseInt(p[0]);
				minOut = Integer.parseInt(p[1]);
				maxOut = Integer.parseInt(p[2]);
			}
			
			try { 
				String name = req.getParameter("name").toString();
				System.out.println(name);
				String worker = req.getParameter("worker").toString();
				System.out.println(worker);
				String production = req.getParameter("proc").toString();
				System.out.println(production);
				int stepnum = Integer.parseInt(req.getParameter("stepnum").toString())%turn;//30Ϊ��ǰ�趨��Ϸ����������ʱ����
				System.out.println(stepnum);
				int oldscore = Integer.parseInt(req.getParameter("oldscore").toString());
				System.out.println(stepnum);
				int flag = Integer.parseInt(req.getParameter("flag").toString());//��Ҫ��1
				int target = Integer.parseInt(req.getParameter("target").toString());
				
				int outputD = 2*Integer.parseInt(worker)-Integer.parseInt(production)/1000 +r;
				outputD = outputD*1000;
				int times = mDbHelper.DBQuerygetTimes(name);
				if(outputD<minOut)
					outputD = 1000;
				else if(outputD > maxOut)
					outputD = 12000;
				
				
				if(outputD == target){
            		flag++;
            		oldscore += 1000*flag;                		
            	}
            	else{
            	    flag = 0;
            	    if(Math.abs(outputD-target) <= 1000)
            	    	oldscore += 500;//ֻ�ܵõ�һ�����
            	    else if(Math.abs(outputD-target) <= 2000)
            	    	oldscore += 100;
            	}
				
				//����Ϊ���ʾ����һ���µ�ʵ��
				if(stepnum == 0){
					times++;
					mDbHelper.DBUpdatesetTimes(name, times);
				}
				
				//��ȡ��ǰʱ��
				String date = df.format(new Date());
				System.out.println(date);
				
				mDbHelper.DBUpdateData(name, Integer.parseInt(worker), outputD, times, stepnum,date,oldscore);
				//String userinfoString = mDbHelper.DBgetUserInfo(name);
				
				//String pathString = req.getSession().getServletContext().getRealPath("/")+"/data/"+name+".csv";
				//String content = name+","+userinfoString+","+times+","+stepnum+","+worker+","+outputD+","+date+","+oldscore+",\n";
				//storeFile(pathString, content);
				
				
				toClient.println(outputD);

			} catch(Exception e) {
				e.printStackTrace(); 
				toClient.println( 
				"A problem occured while recording your answers. " 
				+ "Please try again."); 
			} 

			// �ر�writer; ��Ӧ���. 
			toClient.close();
			mDbHelper.close();
	}
	
	

}
