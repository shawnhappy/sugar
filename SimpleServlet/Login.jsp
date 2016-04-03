<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<!DOCTYPE html>
<html ><head>
<title>Sugar Factory</title> 
<meta name="keywords" content="Sugar Factory Demo" />
<meta name="description" content="Sugar Factory" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="moban/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="moban/images/login.js"></script>
<link href="moban/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--  
<div class="changelanguage">
    <button class="button_blue" onClick="location.href='Login_cn.jsp'">Chinese</button>
</div>-->
<h1>Sugar Factory<sup>V2015</sup></h1>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">Login</a>
			<!--  <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>-->
        </div>
    </div>    
    
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
               
               <div class="login-box">
    
            
			<div class="login_form">
				<form action="index_1" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post"><input type="hidden" name="did" value="0"/>
               <input type="hidden" name="to" value="log"/>
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">Username:</label>
                <div class="inputOuter" id="uArea">
                    
                    <input type="text" id="u" name="username" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">Password:</label> 
               <div class="inputOuter" id="pArea">
                    
                    <input type="password" id="p" name="p" class="inputstyle"/>
                </div>
                </div>
                <input type="hidden" id="flag" name="flag" value="en"/>
                <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="Login" style="width:130px;" class="button_blue"/><a href="Register.jsp" class="zcxy" target="_blank">Registration</a></div> 
              </form>
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
  </div>

 </div>
<div class="jianyi">*Recommend using Chrome browser to access the site</div>
 
</body>

<script type="text/javascript">
	if("${loginmessage}" != ""){
		if("${loginmessage}" == "success" ){
			if("${authority}" == "admin"){
				var url = "Admin.jsp";
				location.href=url;
			}else{
				//alert("&turn="+"${turn}"+"&minOut="+"${minOut}"+"&maxOut="+"${maxOut}"+"&target="+"${target}");
				var url = "index.jsp?name="+"${name}"+"&turn="+"${turn}"+"&minOut="+"${minOut}"+"&maxOut="+"${maxOut}"+"&target="+"${target}"+"&threshold="+"${threshold}"+"&regflag="+"log";	
				location.href=url;
			}
			
		}else if("${loginmessage}" == "unknow"){
			alert("User name error!");
		}else if("${loginmessage}" == "fail"){
			alert("Password error!");
		}else
			alert("Unknown login error!");
	}
	
	if("${regmessage}" != ""){
		if("${regmessage}" == "success" ){
			var url = "index.jsp?name="+"${name}"+"&turn="+"${turn}"+"&minOut="+"${minOut}"+"&maxOut="+"${maxOut}"+"&target="+"${target}"+"&threshold="+"${threshold}";	
			location.href=url;
		}else if("${regmessage}" == "fail" ){
			alert("User name already exists!");
		}else
			alert("Unknown registration error!");
	}
	

	
</script>

</html>