<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="/apiTool/js/jquery.1.9.1.min.js"></script>
<script type="text/javascript" src="/apiTool/layui/layui.js"></script>
<script type="text/javascript" src="/apiTool/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="/apiTool/layui/css/layui.css">
<script type="text/javascript">
	$(function(){
		//一般直接写在一个js文件中
		layui.use(['layer', 'form'], function(){
		  var layer = layui.layer
		  ,form = layui.form;
		  
		  var layerLoad = layer.load();
			$.ajax({
		        type:'get',
		        url:'/apiTool/getprovincejson/GetProvinceList.do',
		        dataType: 'json',
		        success: function(data) {
		                var provinceList=data.result;
		                for (i=0;i<provinceList.length;i++){
		                    $("#province").append("<option value='"+provinceList[i].id+"'>"+provinceList[i].province+"</option>");
		        		}
		                layer.close(layerLoad); 
		        },
		        error: function(xhrequest, ErrorText, thrownError) {
		            alert("Original: " + thrownError + " : " + ErrorText);
		        }
		    });
		  
		});
	});
	
	function getCity(){
		var cityList;
		var layerLoad = layer.load();
		var provinceId=$("#province option:selected").val();
		$.ajax({
	        type:'get',
	        url:'/apiTool/getcityjson/GetCityListByProvinceId.do',
	        dataType: 'json',
	        data: {"provinceId":provinceId},
	        success: function(data) {
	        		$("#defaultOption").remove();
	        		var obj=document.getElementById('city');
	        	    obj.options.length=0;
	                cityList=data.result;
	                for (i=0;i<cityList.length;i++){
	                    $("#city").append("<option value='"+cityList[i].id+"'>"+cityList[i].city_name+"</option>");
	        		}
	                layer.close(layerLoad);
	        },
	        error: function(xhrequest, ErrorText, thrownError) {
	            alert("Original: " + thrownError + " : " + ErrorText);
	        }
	    });
	}	
	function search(){
		var layerLoad = layer.load();
		var province=$("#province").val();
		var city=$("#city").val();
		var date=$("#date").val();
		var html_resultinfo;
		$.ajax({
	        type:'post',
	        url:'/apiTool/weatherservlet/HistoryWeatherReportByCity.do',
	        data: {"province":province,
	        		"city":city,
	        		"date":date},
	        dataType: 'json',
	        success: function(data) {
	                console.log(data)
	                html_resultinfo ='<table border="8">';
	                html_resultinfo += '<tr><td>城市名</td><td>' + data.city_name + '</td></tr>' +
	                '<tr><td>白天温度</td><td>' + data.day_temp + '</td></tr>' +
	                '<tr><td>白天天气</td><td>' + data.day_weather + '</td></tr>' +
	                '<tr><td>白天风向</td><td>' + data.day_wind + '</td></tr>' +
	                '<tr><td>白天风速</td><td>' + data.day_wind_comp + '</td></tr>' +
	                '<tr><td>晚间温度</td><td>' + data.night_temp + '</td></tr>' +
	                '<tr><td>晚间天气</td><td>' + data.night_weather + '</td></tr>' +
	                '<tr><td>晚间风向</td><td>' + data.night_wind + '</td></tr>' +
	                '<tr><td>晚间风速</td><td>' + data.night_wind_comp + '</td></tr>' +
	                '<tr><td>日期</td><td>' + data.weather_date + '</td></tr>';
	                html_resultinfo+='</table>';
	                $("#historyInfo").after(html_resultinfo);
	                layer.close(layerLoad);
	        },
	        error: function(xhrequest, ErrorText, thrownError) {
	            alert("Original: " + thrownError + " : " + ErrorText);
	        }
	    });
	}
</script>
</head>
<body>
	省份：<div class="layui-inline">
	<select id="province" onchange="getCity()">
  			<option value="">请选择一个城市</option>
		</select>
	</div>
	城市：<select id="city">
			<option id="defaultOption">请选择省份</option>
		</select>
	日期：<input type="text" id="date"/>
	<img onclick="WdatePicker({el:'date'})" src="/apiTool/js/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">
	<br>
	<button id="btn" onclick="search()" class="layui-btn layui-btn-radius layui-btn-normal">搜索</button>
	
	<div id="historyInfo"></div>
</body>
</html>