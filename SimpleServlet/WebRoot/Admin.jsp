<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type= "text/css" href="css/admin.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.css">
    <link rel="stylesheet" href="css/style.css">
    
    <script type="text/javascript" src="moban/js/jquery-1.9.0.min.js"></script>

		

    <script type="text/javascript" src="js/jquery.flexslider.js"></script>

  </head>
  	<body>
       
        <div class="row_1">
            <div class="container">
                <h3 class="border">Sugar Factory Administrator</h3>
                <div class="row">
                    <div class="span4 box_1">
                        <div class="icon_bg"><img src="images/icon-1.png" alt=""></div>                       
                        <p>Delete all existing data.<br>When the amount of data is too large,you can empty the background data.</p>
                        <button class="btn btn_1" onclick="DeleteOrDownload('delete')">Delete</button>
                    </div>
                    <div class="span4 box_1">
                        <div class="icon_bg"><img src="images/icon-2.png" alt=""></div>                       
                        <p>Download all existing data.<br>All user data will be compressed to download.<br>zip file</p>
                        <button class="btn btn_1" onclick="DeleteOrDownload('download')">Download</button>
                    </div>
                    <div class="span4 box_1">
                        <div class="icon_bg"><img src="images/icon-3.png" alt=""></div>                        
                        <p>Change game parameters<br>You can re-set some of the parameters in this screen</p>
                        <button class="btn btn_1" id="CONTACT" onclick="Contactus()">RESET</button>
                    </div>
                </div>
                
            </div>
        </div>
        
        <div id="setparam-out" class="tryagain-background" style="display:none">
			<div id="setparam-in" class="tryagain" style="display:block">
				  <!--注册-->
			    <div class="qlogin" id="qlogin" style="display: block; ">
			   
			    <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="changepara" method="post">
				      <input type="hidden" name="to" value="reg"/>
					      		       <input type="hidden" name="did" value="0"/>
			        <ul class="reg_form" id="reg-ul">
			        		<div id="userCue" class="cue">Parameter Modification List</div>
			                <li>
			                	
			                    <label for="user"  class="input-tips2">Turns:</label>
			                    <div class="inputOuter2">
			                        <input type="text" onkeyup="if(!/^\d+$/.test(this.value)&&this.value != '') {alert('只能输入数字 !'); this.value=this.value.replace(/[^\d]+/g,'');}"id="Turn" name="turn" maxlength="16" class="inputstyle2"/>
			                    </div>
			                    
			                </li>
			                
							<li>
			                <label for="passwd" class="input-tips2">maxOut:</label>
			                    <div class="inputOuter2">
			                        <input type="text"onkeyup="if(!/^\d+$/.test(this.value)&&this.value != '') {alert('只能输入数字 !'); this.value=this.value.replace(/[^\d]+/g,'');}" id="maxOut"  name="maxOut" maxlength="16" class="inputstyle2"/>
			                    </div>
			                    
			                </li>
			                
			                <li>
			                <label for="passwd2" class="input-tips2">minOut:</label>
			                    <div class="inputOuter2">
			                        <input type="text" onkeyup="if(!/^\d+$/.test(this.value)&&this.value != '') {alert('只能输入数字 !'); this.value=this.value.replace(/[^\d]+/g,'');}"id="minOut" name="minOut" maxlength="16" class="inputstyle2" />
			                    </div>
			                    
			                </li>
			                
			                <li>
			                <label for="passwd2" class="input-tips2">Traget:</label>
			                    <div class="inputOuter2">
			                        <input type="text" onkeyup="if(!/^\d+$/.test(this.value)&&this.value != '') {alert('只能输入数字 !'); this.value=this.value.replace(/[^\d]+/g,'');}"  id="Target" name="target" maxlength="16" class="inputstyle2" />
			                    </div>
			                    
			                </li>
			                
			                <li>
			                <label for="passwd2" class="input-tips2">Threshold:</label>
			                    <div class="inputOuter2">
			                        <input type="text" onkeyup="if(!/^\d+$/.test(this.value)&&this.value != '') {alert('只能输入数字 !'); this.value=this.value.replace(/[^\d]+/g,'');}"  id="Threshold" name="threshold" maxlength="16" class="inputstyle2" />
			                    </div>
			                    
			                </li>
			                
			                <li>
			                <label for="passwd2" class="input-tips2">instruction:</label>
			                    <div class="inputOuter2">
			                        <textarea id="" name="instructions" class="inputstyle3" ></textarea>
			                    </div>
			                    
			                </li>
			                                
			                
			                <li>
			                    <div class="inputArea">
			                        <input type="submit" id="reg"  style="margin-top:10px;margin-left:65px;" class="button_blue" value="Submit now"/>
			                        <input type="button" onclick="cancelclick()" class="button_blue" id="btn_cansel"style="margin-top:10px;margin-left:5px;" value="Cancel"/>	 
			                    </div>
			                   
			                </li><div class="cl"></div>
			            </ul><input type="hidden" id="flag" name="flag" value="en"/></form>
			           
			    
			    </div>			   
			    
			    </div>
				
					 
			</div>
		</div>
</body>
<script type="text/javascript">
	function DeleteOrDownload(param){
		if(param == "delete")
			location.href="/SimpleServlet/download?op=delete";
		else if(param == "download")
			location.href="/SimpleServlet/download?op=download";
	}
	
	function Contactus(){
		var h = document.getElementById("setparam-out");
		var screen_height = document.body.scrollHeight;	
		var screen_width = document.body.scrollWidth;
		
		h.style.height = screen_height;
		h.style.width = screen_width;		
		
		if(h)
		{
		    if(h.style.display=="none")
		    {
		        h.style.display="block";
		    }            
		}
	}
	
	window.onload = function(){

		if(!document.referrer){
		    location.href = "Login.jsp";
		}
	};
	
	function cancelclick(){
		var h = document.getElementById("setparam-out");		
		
		if(h)
		{
		    if(h.style.display=="block")
		    {
		        h.style.display="none";
		    }            
		}
		
		
	}
</script>
</html>