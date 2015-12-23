package server;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import DB.DBHelper;


public class ChangePara extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException 
	{ 
			// 首先设置响应的 "content type" 头部 
			res.setContentType("text/html");
			req.setCharacterEncoding("utf-8");			
			res.setContentType("text/html;charset=UTF-8");

			//得到响应的 PrintWriter以返回文本给客户端. 
			//PrintWriter toClient = res.getWriter(); 
			DBHelper mDbHelper = new DBHelper();
			
			String turn = req.getParameter("turn");			
			String min = req.getParameter("minOut");
			String max = req.getParameter("maxOut");
			String target = req.getParameter("target");
			String instructionString = req.getParameter("instructions");
			String threshold = req.getParameter("threshold");
			String flag = req.getParameter("flag");
			
			
			if(turn == "")
				turn = "30";
			if(min == "")
				min = "1000";
			if(max == "")
				max = "12000";
			if(target == "")
				target = "9000";
			if(threshold == "")
				threshold = "5000";
			if(instructionString == "")
				instructionString = "1)You are in charge of running a sugar production factory in an underdeveloped country. "
						+ "You control the rate of production by simply changing the size of the work force, ignoring all other factors. "
						+ "You start with 600 workers that produced 6000 tones of sugar in the previous month\n"
						+"2)Your task is to reach and maintain a target output of 9,000 tons per month. "
						+ "To help with the task, the maximum output of the factory has been set at 12,000 and the minimum to 1,000.\n"
						+"3)You will have to run the factory for  months. Each month you will assign a number between 1-12 representing the number of workers that would work in the factory that month. "
						+ "The computer will multiply your number by 100 to get the actual number of workers. Example: 6 is 600 workers.";
			
			System.out.println(turn+" "+min+" "+max+" "+target);
			System.out.println(instructionString);
			
			
			/*if(flagString.equals("sucess"))
				req.setAttribute("authority",mDbHelper.DBQuerygetAuthority(name));
			
			req.setAttribute("loginmessage",flagString);
			req.setAttribute("name", name);
			
			
			System.out.println(name+" "+pw);*/
			mDbHelper.DBUpdatePara(Integer.parseInt(turn), Integer.parseInt(min), Integer.parseInt(max), Integer.parseInt(target),Integer.parseInt(threshold),instructionString);
					
			
			mDbHelper.close();
			if(flag.equals("cn"))
				req.getRequestDispatcher("/Admin_cn.jsp").forward(req,
						res);
			else
				req.getRequestDispatcher("/Admin.jsp").forward(req,
						res);
			

	}
	

}
