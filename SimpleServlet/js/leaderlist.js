$(function(){
	
	$('#switch_qleaderlist').click(function(){
		$('#switch_leaderlist').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qleaderlist').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qleaderlist').css('display','none');
		$('#web_qr_leaderlist').css('display','block');
		
		});
	$('#switch_leaderlist').click(function(){
		
		$('#switch_leaderlist').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qleaderlist').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'130px',width:'70px'});
		
		$('#qleaderlist').css('display','block');
		$('#web_qr_leaderlist').css('display','none');
		});
if(getParam("a")=='0')
{
	$('#switch_leaderlist').trigger('click');
}

	});


	
function leaderlisttab(){
	scrollTo(0);
	$('#switch_qleaderlist').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_leaderlist').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qleaderlist').css('display','none');
	$('#web_qr_leaderlist').css('display','block');
	
}



function getParam(pname) { 
    var params = location.search.substr(1); 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        
        return params.split('=')[1]; 
    } 
    else { 
         
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  

