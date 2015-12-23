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
<h1>糖果工厂<sup>V2015</sup></h1>

<div id="black-background-1" class="tryagain-background" style="display:block">
		<div id="instructions-in-1" class="instructions-in" style="display:block">
			<textarea name="" cols="" rows="" class="textareastyle" readonly>
			心理科学系

			英国伦敦大学

网上信息表：糖果工厂online

在你决定参加这项研究之前，明白为什么要进行这次调查以及其所包含的内容对你来说非常重要。请花时间仔细阅读以下信息，可以与他人讨论相关内容，如有任何疑问请与研究小组成员联系。认真考虑是否参加。

研究目的:

这项研究旨在了解个人在游戏中的表现情况。

研究何时完成？

这项研究将在2016年5月30日之前完成.

如果参见我需要做些什么？

你需要在网上注册一个账户登录到模拟平台. 在模拟游戏中，你需要完成特定的目标，并尽量保持足够长的时间.

研究项目的结果将被如何处理？

研究结果只会用于学术目的, 可能会发布在学术会议或者在学术期刊中出版.

保密协议

不会收集存储任何私人信息. 你的信息将被单独存储，不会与在线账户关联，所有参与者都将匿名.
 
 

撤回权

你可以在任何时间点退出测试. 然而由于数据匿名化, 已经生成的数据需要花费一段时间才能去除.

该项目已获得伦敦大学伯克贝克分校心理科学研究伦理委员会的批准。

联系方式:

Ulrike Hahn (lead researcher) – h.hahn@bbk.ac.uk

Igor Volzhanin – ivolzh01@mail.bbk.ac.uk

Room 528, Malet Street
Tel: 020 7631 6379
			</textarea>
			<button onclick="instruction_step1()" class="instruction-btn" id="btn_next">继续</button>			 
		</div>
			
</div>

<div id="black-background-2" class="tryagain-background" style="display:none">
		<div id="instructions-in-2" class="instructions-in" style="display:block">
			<textarea name="" cols="" rows="" class="textareastyle" readonly>
			心理科学系
			
			英国伦敦大学

糖果工厂online用户协议:

我已经了解这项研究的细节，并愿意同意参加。我的问题得到了回答，我明白我可以随时提出问题。

我明白我的信息将保持匿名，所有的信息将用于这项研究。

我明白我可以随时撤回我的同意协议，不给予任何理由或拒绝回答特定的问题。

我明白我的行为信息将被记录在电脑上，所有信息都是匿名的。

我明白所有数据只会用于学术研究，不会用于其他目的.

我明白研究结果将被如何处理。结果将被分析或者提交到学术会议。

实验结果将被经常展示给其他团体，但是数据将是匿名的，没有任何涉及个人隐私的内容。

我确认已经年满16周岁。

研究人员联系方式

Ulrike Hahn – u.hahn@bbk.ac.co

Igor Volzhanin – ivolzh01@mail.bbk.ac.co
			</textarea>
			<form style="color:white;text-align: left">
				<label><input name="agreement" type="radio" value="" onclick="document.getElementById('btn_confirm').disabled='';"/>我已经仔细阅读协议同意并注册.</label><br>
				<label><input name="agreement" type="radio" value="" checked onclick="document.getElementById('btn_confirm').disabled='disabled';"/>我不同意协议.</label>
			</form>
			<button onclick="instruction_step2()" class="instruction-btn" id="btn_confirm" disabled="disabled">继续</button>
			<button onclick="Cancel_Register()" class="instruction-btn" id="btn_cancel">取消</button>			 
		</div>
			
</div>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch">
			<a class="switch_btn_focus" id="switch_login" href="javascript:void(0);" tabindex="8">注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 70px; left: 0px;"></div>
        </div>
    </div>  
      
  		
    
    <div class="web_qr_login" id="web_qr_login" style="display: none; height: 235px;">    

            <!--登录
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
               
                <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="Login" style="width:150px;" class="button_blue"/></div>
              </form>
           </div>
           
            	</div>
               
            </div>
            登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: block; ">
   
    <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="index_1" method="post">
	      <input type="hidden" name="to" value="reg"/>
		      		       <input type="hidden" name="did" value="0"/>
        <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册记录格式</div>
                <li>
                	
                    <label for="user"  class="input-tips2">用户名:</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="user" maxlength="16" class="inputstyle2" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
                    </div>
                    
                </li>
                
                <li>
                	
                    <label for="sex"  class="input-tips2">性别:</label>
                    <div class="radio-reg">
                        <label><input name="sex" type="radio" value="Male" checked="checked"/>男 </label>
						<label><input name="sex" type="radio" value="Female" />女</label>
                    </div>
                    
                </li>
                
                <li>
                <label for="age" class="input-tips2">年龄:</label>
                    <div class="inputOuter2">
                        <select name="age" style="height:34px; border: 1px solid #D7D7D7;  width: 216px;border-radius: 2px;">  
						  <option value="1">小于 12 岁</option>  
						  <option value="2">12 - 17 岁</option>  
						  <option value="3" selected="selected">18 - 24 岁</option>  
						  <option value="4">25 - 34 岁</option>
						  <option value="5">25 - 34 岁</option>
						  <option value="6">35 - 44 岁</option>
						  <option value="7">45 - 54 岁</option>
						  <option value="8">55 - 64 岁</option>
						  <option value="9">65 - 74 岁</option>
						</select> 
                    </div>
                    
                </li>
                
                <li>
                <label for="Education" class="input-tips2">Education:</label>
                    <div class="inputOuter2">
                        <select name="Education" style="height:34px; border: 1px solid #D7D7D7; width:216px;border-radius: 2px;">  
						  <option value="1">无文凭</option>  
						  <option value="2">高中毕业</option>  
						  <option value="3">专科毕业</option>  
						  <option value="4">职业培训</option>
						  <option value="5">肄业证书</option>
						  <option value="6" selected="selected">学士学位</option>
						  <option value="7">硕士学位</option>
						  <option value="8">专业学位(法律/医学)</option>
						  <option value="9">博士学位</option>
						</select> 
                    </div>
                    
                </li>

                <li>
                <label for="passwd" class="input-tips2">密码:</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="passwd" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd2" class="input-tips2">确认密码:</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="passwd2" maxlength="16" class="inputstyle2" />
                    </div>
                    
                </li>
                                
                
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="立即注册"/> <a href="#" class="zcxy" target="_blank">注册</a>
                    </div>
                    
                </li>
            </ul><input type="hidden" id="flag" name="flag" value="cn"/></form>
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>
<div class="jianyi">*建议使用chrome浏览器访问本站</div>
</body>

<script type="text/javascript">

	
	if("${regmessage}" != ""){
		if("${regmessage}" == "sucess" ){
			var url = "index.jsp?name="+"${name}"+"&turn="+"${turn}"+"&minOut="+"${minOut}"+"&maxOut="+"${maxOut}"+"&target="+"${target}"+"&threshold="+"${threshold}";	
			location.href=url;
		}else if("${regmessage}" == "fail" ){
			alert("User name already exists!");
		}else
			alert("Unknown registration error!");
	}
	
	function instruction_step1()
	{
		var obj_block_none = document.getElementById("black-background-1");
		
		if(obj_block_none)
		{
		    if(obj_block_none.style.display=="block")
		    {
		        obj_block_none.style.display="none";
		    }            
		}
		
		var obj_none_block = document.getElementById("black-background-2");
		
		if(obj_none_block)
		{
		    if(obj_none_block.style.display=="none")
		    {
		        obj_none_block.style.display="block";
		    }            
		}
	}
	
	function instruction_step2()
	{
	
		var obj_none_block = document.getElementById("black-background-2");
		
		if(obj_none_block)
		{
		    if(obj_none_block.style.display=="block")
		    {
		        obj_none_block.style.display="none";
		    }            
		}
	}
	
	function Cancel_Register(){
		var url = "Login.jsp";	
		location.href=url;
	}
		
	
</script>

</html>