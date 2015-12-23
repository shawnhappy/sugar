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
<h1>Sugar Factory<sup>V2015</sup></h1>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">Login</a>
			<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
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

  <!--注册
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="index_1" method="post">
	      <input type="hidden" name="to" value="reg"/>
		      		       <input type="hidden" name="did" value="0"/>
        <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">Quick registration note format</div>
                <li>
                	
                    <label for="user"  class="input-tips2">Username:</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="user" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                
                <li>
                	
                    <label for="sex"  class="input-tips2">Gender:</label>
                    <div class="radio-reg">
                        <label><input name="sex" type="radio" value="Male" checked="checked"/>Male </label>
						<label><input name="sex" type="radio" value="Female" />Female</label>
                    </div>
                    
                </li>
                
                <li>
                <label for="age" class="input-tips2">Age:</label>
                    <div class="inputOuter2">
                        <select name="age" style="height:34px; border: 1px solid #D7D7D7;  width: 216px;border-radius: 2px;">  
						  <option value="1">Under 12 years old</option>  
						  <option value="2">12-17 years old</option>  
						  <option value="3" selected="selected">18-24 years old</option>  
						  <option value="4">25-34 years old</option>
						  <option value="5">25-34 years old</option>
						  <option value="6">35-44 years old</option>
						  <option value="7">45-54 years old</option>
						  <option value="8">55-64 years old</option>
						  <option value="9">65-74 years old</option>
						</select> 
                    </div>
                    
                </li>
                
                <li>
                <label for="Education" class="input-tips2">Education:</label>
                    <div class="inputOuter2">
                        <select name="Education" style="height:34px; border: 1px solid #D7D7D7; width:216px;border-radius: 2px;">  
						  <option value="1">Some high school, no diploma</option>  
						  <option value="2">High school graduate</option>  
						  <option value="3" selected="selected">Some college credit, no degree</option>  
						  <option value="4">Trade/technical/vocational training</option>
						  <option value="5">Associate degree</option>
						  <option value="6">Bachelor’s degree</option>
						  <option value="7">Master’s degree</option>
						  <option value="8">Professional degree (Law, Medicine)</option>
						  <option value="9">Doctorate degree</option>
						</select> 
                    </div>
                    
                </li>

                <li>
                <label for="passwd" class="input-tips2">Password:</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="passwd" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd2" class="input-tips2">Confirm:</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="passwd2" maxlength="16" class="inputstyle2" />
                    </div>
                    
                </li>
                                
                
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="Sign up now"/>
                    </div>
                    
                </li>
            </ul></form>
           
    
    </div>
   
    
    </div>
    注册end-->
</div>
<div class="jianyi">*Recommend using Chrome browser to access the site</div>
</body>

<script type="text/javascript">
	if("${loginmessage}" != ""){
		if("${loginmessage}" == "sucess" ){
			if("${authority}" == "admin"){
				var url = "Admin.jsp";
				location.href=url;
			}else{
				//alert("&turn="+"${turn}"+"&minOut="+"${minOut}"+"&maxOut="+"${maxOut}"+"&target="+"${target}");
				var url = "index.jsp?name="+"${name}"+"&turn="+"${turn}"+"&minOut="+"${minOut}"+"&maxOut="+"${maxOut}"+"&target="+"${target}"+"&threshold="+"${threshold}";	
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
		if("${regmessage}" == "sucess" ){
			var url = "index.jsp?name="+"${name}"+"&turn="+"${turn}"+"&minOut="+"${minOut}"+"&maxOut="+"${maxOut}"+"&target="+"${target}"+"&threshold="+"${threshold}";	
			location.href=url;
		}else if("${regmessage}" == "fail" ){
			alert("User name already exists!");
		}else
			alert("Unknown registration error!");
	}
	

	
</script>

</html>