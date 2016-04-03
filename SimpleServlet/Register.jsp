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

<div id="black-background-1" class="tryagain-background" style="display:block">
		<div id="instructions-in-1" class="instructions-in" style="display:block">
			<textarea name="" cols="" rows="" class="textareastyle" readonly>
			DEPARTMENT OF PSYCHOLOGICAL SCIENCES

BIRKBECK UNIVERSITY OF LONDON

INFORMATION SHEET FOR: Sugar Factory Online

Before you decide to take part in this study, it is important for you to understand why the research is being done and what it will involve. Please take the time to read the following information carefully and discuss it with others if you wish. A member of the research team can be contacted if there is anything that is not clear or if you would like more information. Take time to decide whether or not you wish to take part.

Purpose of the study:

The purpose of this study is to better understand how well individuals are able to perform in games such as the one you are about to do.

When will the study be completed?

The study is expected to be completed by May 30, 2016.

What will happen to me if I take part?

You will be asked to register for an online account to access the simulation. During the game you will be asked to achieve a certain production target and to maintain for as long as possible.

What will happen to the results of the research project?

The results will be analysed for academic purposes only, and may be presented at conferences and published in an academic journal.

Arrangements for anonymity and confidentiality

No identifying information is collected or stored. Your consent will be stored separately and in no way linked to your online account. All participant answers will be made anonymous with no identification being possible.
 
 

Right to withdraw

You may withdraw your consent to participate at any point during the study. However, due to data anonymization, we will be unable to disaggregate and remove your answers once your session is completed.

The project has received ethical approval from the Department of Psychological Sciences Research Ethics Committee of Birkbeck, University of London

Contact details:

Ulrike Hahn (lead researcher) – h.hahn@bbk.ac.uk

Igor Volzhanin – ivolzh01@mail.bbk.ac.uk

Room 528, Malet Street
Tel: 020 7631 6379
			</textarea>
			<button onclick="instruction_step1()" class="instruction-btn" id="btn_next">next</button>			 
		</div>
			
</div>

<div id="black-background-2" class="tryagain-background" style="display:none">
		<div id="instructions-in-2" class="instructions-in" style="display:block">
			<textarea name="" cols="" rows="" class="textareastyle" readonly>
			DEPARTMENT OF PSYCHOLOGICAL SCIENCES
			
			BIRKBECK UNIVERSITY OF LONDON

CONSENT FORM FOR: Sugar Factory Online

I have had the details of the study explained to me and willingly consent to take part. My questions have been answered to my satisfaction and I understand that I may ask further questions at any time.

I understand that I will remain anonymous and that all the information given will be used for this study only.

I understand that I may withdraw my consent for the study at any time without giving any reason and to decline to answer particular questions.

I understand that my actions will be recorded on the computer and all data will be anonymised, as to make individual attribution impossible.

I understand that the data will not be used or made available for any purposes other than the research project.

I understand how the results of the study will be used. Results of this study will be analysed and submitted to an academic conference.

Results are normally presented in terms of groups of individuals. If any individual data are presented, the data will be totally anonymous, without any means of identifying the individuals involved.

I confirm that I am over 16 years of age

Name (participant):                                             Signature:                                    Date:        

Name (researcher):                                             Signature:                                    Date:        

Contact details of a named investigator for further information as well as the primary applicant

Lead researcher: Ulrike Hahn – u.hahn@bbk.ac.co

Igor Volzhanin – ivolzh01@mail.bbk.ac.co
			</textarea>
			<form style="color:white;text-align: left">
				<label><input name="agreement" type="radio" value="" onclick="document.getElementById('btn_confirm').disabled='';"/>I have read the relevant agreements and continue to register.</label><br>
				<label><input name="agreement" type="radio" value="" checked onclick="document.getElementById('btn_confirm').disabled='disabled';"/>I don't agree with the agreements.</label>
			</form>
			<button onclick="instruction_step2()" class="instruction-btn" id="btn_confirm" disabled="disabled">next</button>
			<button onclick="Cancel_Register()" class="instruction-btn" id="btn_cancel">cancel</button>			 
		</div>
			
</div>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch">
			<a class="switch_btn_focus" id="switch_login" href="javascript:void(0);" tabindex="8">Registration</a>
			<!--  <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 70px; left: 0px;"></div>-->
        </div>
    </div>  
      
  		
    
    <div class="web_qr_login" id="web_qr_login" style="display: none; height: 235px;">    


  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: block; ">
   
    <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="index_1" method="post">
	      <input type="hidden" name="to" value="reg"/>
		      		       <input type="hidden" name="did" value="0"/>
        <ul class="reg_form" id="reg-ul">
        		<!-- <div id="userCue" class="cue">Quick registration note format</div> -->
                <li>
                	
                    <label for="user"  class="input-tips2">Username:</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="user" maxlength="16" class="inputstyle2" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
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
						  <option value="5">35-44 years old</option>
						  <option value="6">45-54 years old</option>
						  <option value="7">55-64 years old</option>
						  <option value="8">65-74 years old</option>
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
            </ul><input type="hidden" id="flag" name="flag" value="en"/></form>
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>
<div class="jianyi">*Recommend using Chrome browser to access the site</div>
</body>

<script type="text/javascript">

	
	if("${regmessage}" != ""){
		var obj_black_background = document.getElementById("black-background-1");		
		
		if(obj_black_background)
		{
		    if(obj_black_background.style.display=="block")
		    {
		        obj_black_background.style.display="none";
		    }            
		}
		if("${regmessage}" == "success" ){
			var url = "index.jsp?name="+"${name}"+"&turn="+"${turn}"+"&minOut="+"${minOut}"+"&maxOut="+"${maxOut}"+"&target="+"${target}"+"&threshold="+"${threshold}"+"&regflag="+"reg";	
			location.href=url;
		}else if("${regmessage}" == "fail" ){
			alert("User name already exists!");
		}else
			alert("Unknown registration error!");
		
		if(obj_black_background)
		{
		    if(obj_black_background.style.display=="none")
		    {
		        obj_black_background.style.display="block";
		    }            
		}
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