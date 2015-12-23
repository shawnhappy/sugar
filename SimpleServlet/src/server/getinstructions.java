package server;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBHelper;

/*
 * ignore this class
 * 
 * */

public class getinstructions extends HttpServlet{
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
				//DBHelper mDbHelper = new DBHelper();				
				
				
				/*String instruction = "kdjflsdjflkjsdjflks lsjfklsdjl lsjkdf";	
					
				req.setAttribute("instruction", instruction);
				req.getRequestDispatcher("/index.jsp").forward(req,
							res);*/			
					
					
				
				//mDbHelper.close();
		}

}
