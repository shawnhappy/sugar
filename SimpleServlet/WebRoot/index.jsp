<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/simple.css">

  </head>
  
  
<body onkeydown="keyLogin();"> 
	
	<div class="home-container" style="text-align:center;">
		
		<div class="User_score" style="text-align:center;font-weight:bold">
			<div style="margin:auto;width:200px">			
			<div style="float:left">Score:</div>			
			<div id="div_score" style="float:left">0</div>
		   	</div>
		</div>
		<div class="User_grade_container">		
			<div class="User_ratings User_grade" id="div_fraction0">
			   	<div class="ratings_bars">
					<span id="title0">1</span>
					<span class="bars_10">1</span>
					<div class="scale" id="bar0">
						<div></div>
						<span id="btn0"></span>
					</div>
					<span class="bars_10">12</span>
				</div>
				<button onclick="nextstep()" class="next-btn" id="btn_next" disabled="disabled">Next Step</button>
				<div class="notestyle" >Number of Workers</div>
			</div>
		</div>
		
		<div class="echart-container" id="echartcontainer" style="text-algin:left;">
		</div>
		
		<div id="tryagain-out" class="tryagain-background" style="display:none;text-align:center">
			<div id="tryagain-in" class="tryagain" style="display:block">
				<p class="fontstyle">Try Again?</p>
				<button onclick="tryagain()" class="try-btn" id="btn_confirm">Confirm</button>
				<button onclick="nottryagain()" class="try-btn" id="btn_cansel">Cancel</button>		 
			</div>
			<div id="getreward-in" class="tryagain" style="display:none">
				<p class="fontstyle">Your score is over threshold. Ask the manager for a reward.</p>
				<button onclick="getReward()" class="try-btn" id="btn_confirm">Confirm</button>
				<button onclick="nottryagain()" class="try-btn" id="btn_cansel">Cancel</button>		 
			</div>
		</div>
		
		
	</div>
	<div id="instructions-out" class="tryagain-background" style="display:block" >
			<div id="instructions-in" class="instructions-in" style="display:block">
				<p class="fontstyle-2" id="inst_1">1)

You are in charge of running a sugar production factory in an underdeveloped country. You control the rate of production by simply changing the size of the work force, ignoring all other factors. You start with 600 workers that produced 6000 tones of sugar in the previous month.

				</p>
				<button onclick="instruction_step1()" class="instruction-btn" id="btn_confirm">next</button>			 
			</div>
			
		</div>	
		
		<div id="instructions-out-2" class="tryagain-background" style="display:none">
			<div id="instructions-in-2" class="instructions-in" style="display:block">
				<p class="fontstyle-2" id="inst_2">2)

Your task is to reach and maintain a target output of 9,000 tons per month. To help with the task, the maximum output of the factory has been set at 12,000 and the minimum to 1,000.

				</p>
				<button onclick="instruction_step2()" class="instruction-btn" id="btn_confirm">next</button>			 
			</div>
			
		</div>	
		
		<div id="instructions-out-3" class="tryagain-background" style="display:none">
			<div id="instructions-in-3" class="instructions-in" style="display:block">
				<p class="fontstyle-2" id="inst_3">3)

You will have to run the factory for 30 months. Each month you will assign a number between 1-12 representing the number of workers that would work in the factory that month. The computer will multiply your number by 100 to get the actual number of workers. Example: 6 is 600 workers.
				</p>
				<button onclick="instruction_step3()" class="instruction-btn" id="btn_confirm">next</button>
			</div>
			
		</div>
		
		<div id="instructions-out-4" class="tryagain-background" style="display:none">
			<div id="instructions-in-4" class="instructions-in" style="display:block">
				<p class="fontstyle-2" id="inst_4">4)

You will be able to see how well you are doing from the graph as well as your score, which depends on you hitting the target You will be given a running score (displayed in the top left corner). The closer you are to the target the more points you will get, and given that your goal is to stabilize the system, the more on-target responses in a row the higher your score will be.
				<br><br>
				If you reach [threshold] value. You will be eligible to claim your prize.
				</p>
				<button onclick="instruction_step4()" class="instruction-btn" id="btn_confirm">next</button>
			</div>
			
		</div>
	
	<!-- <form name="form2" id="regUser" accept-charset="utf-8"  action="instruction" method="post">
		<input type="submit" id="reg_inst"  style="margin-top:10px;margin-left:65px;"  value="Submit now"/>
	</form>	 -->
	
	
</body> 

<script src="http://echarts.baidu.com/build/dist/echarts.js"  charset="utf-8"></script>
<script type = "text/javascript">
	var work_n = 1;
	var proc_c = 6000;
	var data = new Array();
	var stepnum = 0;
	var steptotal = 20;
	var para = new Array();
	var minOut = 1000;
	var maxOut = 12000;
	var target = 9000;
	var score = 0;
	var flag = 0;
	var threshold = 50000;
	
	
	/*
	 * 从url中获取参数
	 */
	window.onload = function(){
		//document.write(document.referrer); http://localhost:8080/SimpleServlet/index_1
		if(!document.referrer){
		    location.href = "Login.jsp";
		}
		
		echart(1);
		var url = location.search;
	
		if(url.indexOf("?")!=-1)
		{
			var str = url.substr(1);
			var strs= str.split("&");
					
			for(var i=0;i<strs.length;i++)
			{
					
			//Request[strs[i].split("=")[0]]=unescape(strs[ i].split("=")[1]);
				para.push(strs[i].split("=")[1]);	//解析url获取用户参数
				//alert(v[i]);
			}
			
			steptotal = parseInt(para[1]);
			minOut = parseInt(para[2]);
			maxOut = parseInt(para[3]);
			target = parseInt(para[4]);
			threshold = parseInt(para[5]);
			
		}
		var ins_1 = "You are in charge of running a sugar production factory in an underdeveloped country. You control the rate of production by simply changing the size of the work force, ignoring all other factors. You start with 600 workers that produced 6000 tones of sugar in the previous month.";
	    var ins_2 = "Your task is to reach and maintain a target output of "+
	               target+" tons per month. To help with the task, the maximum output of the factory has been set at "+maxOut+" and the minimum to "+minOut+".";
	    var ins_3 = "You will have to run the factory for "+steptotal+" months. Each month you will assign a number between 1-12 representing the number of workers that would work in the factory that month. The computer will multiply your number by 100 to get the actual number of workers. Example: 6 is 600 workers.";
		var ins_4 = "You will be able to see how well you are doing from the graph as well as your score, which depends on you hitting the target You will be given a running score (displayed in the top left corner). The closer you are to the target the more points you will get, and given that your goal is to stabilize the system, the more on-target responses in a row the higher your score will be.\n"
					+"If you reach "+threshold+" value. You will be eligible to claim your prize.";
		var obj_p_1 = document.getElementById("inst_1");
		var obj_p_2 = document.getElementById("inst_2");
		var obj_p_3 = document.getElementById("inst_3");
		var obj_p_4 = document.getElementById("inst_4");
		
		obj_p_1.innerText = ins_1;
		obj_p_2.innerText = ins_2;
		obj_p_3.innerText = ins_3;
		obj_p_4.innerText = ins_4;
		
	};
	
	
	/*
	 * 实现滑动条获取分数
	 */
	scale = function (btn, bar, title) {
		this.btn = document.getElementById(btn);
		this.bar = document.getElementById(bar);
		this.title = document.getElementById(title);
		this.step = this.bar.getElementsByTagName("DIV")[0];
		this.init();
	};
	scale.prototype = {
		init: function () {
			var f = this, g = document, b = window, m = Math;
			f.btn.onmousedown = function (e) {
				var x = (e || b.event).clientX;
				var l = this.offsetLeft;
				var max = f.bar.offsetWidth - this.offsetWidth;
				g.onmousemove = function (e) {
					var thisX = (e || b.event).clientX;
					var to = m.min(max, m.max(-2, l + (thisX - x)));
					f.btn.style.left = to + 'px';
					f.ondrag(m.max(0, to / max) * 10, to);
					
					
					b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
				};
				g.onmouseup = new Function('this.onmousemove=null');
			};
		},
		ondrag: function (pos, x) {
			this.step.style.width = Math.max(0, x) + 'px';
			this.title.innerHTML = Math.round(11*pos/10) +1 + '';
			
			work_n=Math.round(document.getElementById("title0").innerHTML);				
		}
	};
	new scale('btn0', 'bar0', 'title0');

	/*
	 * 处理点击下一步按钮事件
	 */
	function nextstep(){
		var obj_btn = document.getElementById("btn_next");
		obj_btn.disabled = "disabled";
		/*var users =new Array();
		var user1={"name":"jony","age":"30"};
		users.push(user1);
		var user2={"name":"cindy","age":"29"};
		users.push(user2);
		var user3={"name":"xixi","age":"1"};
		users.push(user3);
		var classes=new Array();
		classes.push("english");
		classes.push("chinese");
		classes.push("math");
		var data={};
		data.users=users;
		data.classes= classes;*/
		if(stepnum % steptotal == 0){
			proc_c = 6000;
			flag = 0;
			score = 0;
		}
						
		
			
		var queryStr="name="+para[0]+"&worker="+work_n+"&proc="+proc_c+"&stepnum="+stepnum+"&oldscore="+score+"&flag="+flag+"&target="+target;
		//alert(queryStr);//115.28.33.155
		var url = "http://localhost:8080/SimpleServlet/servlet/sugar?"+queryStr;	
		if(window.XMLHttpRequest){
			req = new XMLHttpRequest();
	    }else if(window.ActiveXObject){
	        req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("POST",url,false);
		req.onreadystatechange = Callback;
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		req.send(null);
	}
	
	/*
	 * 用户决定进行下一次实验
	 */
	function tryagain(){
		var obj_tryagain_bg = document.getElementById("tryagain-out");
		var obj_tryagain = document.getElementById("tryagain-in");
		var stamp = document.getElementById("btn_next");
						
		stamp.disabled = false;
		
		if(obj_tryagain_bg)
		{
		    if(obj_tryagain_bg.style.display=="block")
		    {
		        obj_tryagain_bg.style.display="none";
		    }            
		}
		
		
	}
	
	/*
	 * 用户拒绝进行下一次实验
	 */
	function nottryagain(){
		location.href = "Login.jsp";
	}
	
	function instruction_step1(){
		var obj_tryagain_bg = document.getElementById("instructions-out");
		var obj_tryagain_bg_2 = document.getElementById("instructions-out-2");
			
		
		if(obj_tryagain_bg)
		{
		    if(obj_tryagain_bg.style.display=="block")
		    {
		        obj_tryagain_bg.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_2)
		{
		    if(obj_tryagain_bg_2.style.display=="none")
		    {
		        obj_tryagain_bg_2.style.display="block";
		    }            
		}

	}
	
	function instruction_step2(){
		var obj_tryagain_bg_2 = document.getElementById("instructions-out-2");
		var obj_tryagain_bg_3 = document.getElementById("instructions-out-3");							
		
		
		if(obj_tryagain_bg_2)
		{
		    if(obj_tryagain_bg_2.style.display=="block")
		    {
		        obj_tryagain_bg_2.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_3)
		{
		    if(obj_tryagain_bg_3.style.display=="none")
		    {
		        obj_tryagain_bg_3.style.display="block";
		    }            
		}

	}
	
	function instruction_step3(){
		var obj_tryagain_bg_3 = document.getElementById("instructions-out-3");
		var obj_tryagain_bg_4 = document.getElementById("instructions-out-4");							
		
		
		if(obj_tryagain_bg_3)
		{
		    if(obj_tryagain_bg_3.style.display=="block")
		    {
		        obj_tryagain_bg_3.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_4)
		{
		    if(obj_tryagain_bg_4.style.display=="none")
		    {
		        obj_tryagain_bg_4.style.display="block";
		    }            
		}

	}
	
	function instruction_step4(){
		var obj_tryagain_bg_4 = document.getElementById("instructions-out-4");
			
		
		if(obj_tryagain_bg_4)
		{
		    if(obj_tryagain_bg_4.style.display=="block")
		    {
		        obj_tryagain_bg_4.style.display="none";
		    }            
		}		
		
	}
	
	function Callback(){
        if(req.readyState == 4){
            if(req.status == 200){
             	            	            	
                var str = req.responseText;
                //alert(str);
                if(str != null && str.length < 10){//后台返回数据为有效数据
                	stepnum = stepnum % steptotal;
                	
                	if(stepnum ==0){
                		data = [];
                		score = 0;//数据初始化
                		flag = 0;
                	}
                	 
                	 
                	proc_c = str; 
                	data.push(proc_c);
                	echart(stepnum+1);
                	
                	if(proc_c == target){
                		flag++;
                		score += 1000*flag;                		
                	}
                	else{
                	    flag = 0;
                	    if(Math.abs(proc_c-target) <= 1000)
                	    	score += 500;//只能得到一半分数
                	    else if(Math.abs(proc_c-target) <= 2000)
                	    	score += 100;
                	}
                	var obj_div = document.getElementById("div_score");	
                	obj_div.innerHTML = score;               	
                	stepnum++;
                	if(stepnum == steptotal){
						var obj_tryagain_bg = document.getElementById("tryagain-out");
						var obj_tryagain = document.getElementById("getreward-in");
						var stamp = document.getElementById("btn_next");
						
						stamp.disabled = true;
						
						if(obj_tryagain_bg)
						{
						    if(obj_tryagain_bg.style.display=="none")
						    {
						        obj_tryagain_bg.style.display="block";
						    }            
						}
						
						if(score > threshold){
							if(obj_tryagain)
							{
							    if(obj_tryagain.style.display=="none")
							    {
							        obj_tryagain.style.display="block";
							    }            
							}
						}else{
							if(obj_tryagain)
							{
							    if(obj_tryagain.style.display=="block")
							    {
							        obj_tryagain.style.display="none";
							    }            
							}
						}
					}
                }
                	
            }else{
                          
				alert("Access Failure!"+req.status);
            }
        }else{
           //var str = req.responseText;
               
				//alert("3"+str);
        }
    }
    
    
    function echart(v){
		//var total = v1+v2+v3+v4+v5+v6;
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/bar'
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('echartcontainer')); 
                
               option = {
				    tooltip : {
				        trigger: 'axis'
				    },
				    /*legend: {
				        data:['Output']
				    },*/
				    
				    calculable : false,
				    /*dataZoom : {
				        show : true,
				        realtime : true,
				        start : 40,
				        end : 60
				    },*/
				    xAxis : [
				        {
				            axisLabel: {
                               rotate: 45,
                            },
				        	name:'Turn',
				        	splitLine:{show: false}, 
				            type : 'category',
				            boundaryGap : false,
				            data : function (){
				                var list = [];
				                
				                for (var i = 0; i <= steptotal; i++) {
				                    list.push(i);
				                }
				                return list;
				            }()
				        }
				    ],
				    yAxis : [
				        {
				        	name : 'Output',
				            type : 'value',
				            splitNumber:(maxOut-minOut)/1000
				        }
				    ],
				    series : [
				        {
				            name:'Output',
				            type:'line',
				            data:function (){
				                var list = [];
				                list.push(6000);
				                for (var i = 0; i < v; i++) {
				                    list.push(data[i]);
				                }
				                return list;
				            }(),
				             /*markLine : {
				                data : [[
				                    {name: '平均值', value:12, x:80,y:300},
				                    {name:'平均值', x:1000,y:300}
				                ]]
				            }*/
				        },
				        {
				            name:'Target',
				            type:'line',
				            data:function (){
				                var list = [];
				                for (var i = 0; i <= steptotal; i++) {
				                    list.push(target);
				                }
				                return list;
				            }(),
				            markLine : {
				                data : [
				                    {type : 'average', name : 'Target'}
				                ]
				            }
				        }
    
				    ]
				};
				option.yAxis[0].min=minOut;
       			option.yAxis[0].max= maxOut;
       			
				//var ecConfig = require('echarts/config');
				//function eConsole(param) {
				    /*var mes = '【' + param.type + '】';
				    if (typeof param.seriesIndex != 'undefined') {
				        mes += '  seriesIndex : ' + param.seriesIndex;
				        mes += '  dataIndex : ' + param.dataIndex;
				    }
				    if (param.type == 'hover') {
				        document.getElementById('hover-console').innerHTML = 'Event Console : ' + mes;
				    }
				    else {
				        document.getElementById('console').innerHTML = mes;
				    }
				    console.log(param);*/
				//}
				/*
				// -------全局通用
				REFRESH: 'refresh',
				RESTORE: 'restore',
				RESIZE: 'resize',
				CLICK: 'click',
				DBLCLICK: 'dblclick',
				HOVER: 'hover',
				MOUSEOUT: 'mouseout',
				// -------业务交互逻辑
				DATA_CHANGED: 'dataChanged',
				DATA_ZOOM: 'dataZoom',
				DATA_RANGE: 'dataRange',
				DATA_RANGE_HOVERLINK: 'dataRangeHoverLink',
				LEGEND_SELECTED: 'legendSelected',
				LEGEND_HOVERLINK: 'legendHoverLink',
				MAP_SELECTED: 'mapSelected',
				PIE_SELECTED: 'pieSelected',
				MAGIC_TYPE_CHANGED: 'magicTypeChanged',
				DATA_VIEW_CHANGED: 'dataViewChanged',
				TIMELINE_CHANGED: 'timelineChanged',
				MAP_ROAM: 'mapRoam',
				*/
				/*myChart.on(ecConfig.EVENT.CLICK, eConsole);
				myChart.on(ecConfig.EVENT.DBLCLICK, eConsole);
				//myChart.on(ecConfig.EVENT.HOVER, eConsole);
				myChart.on(ecConfig.EVENT.DATA_ZOOM, eConsole);
				myChart.on(ecConfig.EVENT.LEGEND_SELECTED, eConsole);
				myChart.on(ecConfig.EVENT.MAGIC_TYPE_CHANGED, eConsole);
				myChart.on(ecConfig.EVENT.DATA_VIEW_CHANGED, eConsole);*/
                    
        
            // 为echarts对象加载数据 
            myChart.setOption(option); 
        }
    );
  }

//绑定回车键
	function keyLogin(){
	 if (event.keyCode==13)  //回车键的键值为13
	   document.getElementById("btn_next").click(); //调用登录按钮的登录事件
	}

//等待echart重新绘制
	function enable_nextstep(){
		var obj_btn = document.getElementById("btn_next");
		if(obj_btn){			
				obj_btn.disabled = "";			
		}
		
		//setTimeout(enable_nextstep,800);
	}
	
	setInterval("enable_nextstep()","1600");
	
	function getReward(){
		alert("You are a genius.");
	}
</script>
<script type="text/javascript">
	function skip(){
		var url = "Login.jsp";	
		location.href=url;
	}
	document.onmousedown = function(event){
		clearInterval(t1);
		t1 = window.setInterval(skip,600000);
	};
	document.onkeydown = function(event){
		
		clearInterval(t1);
		t1 = window.setInterval(skip,600000);
	};
	
	var t1 = window.setInterval(skip,600000);
</script>

 
</html>
