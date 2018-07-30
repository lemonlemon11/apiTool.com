<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="/apiTool/js/jquery.js"></script>
<script type="text/javascript"> 
	function search(){
		$.ajax({
	        type:'post',
	        url:'/apiTool/weatherservlet/WeatherReprotByCity.do',
	        data: {"cityname":$("#cityname").val()},
	        dataType: 'json',
	        success: function(data) {
	                result=data.result.today;
	                $("#temperature").text(result.temperature);
	                $("#city").text(result.city);
	                $("#date_y").text(result.date_y);
	        },
	        error: function(xhrequest, ErrorText, thrownError) {
	            alert("Original: " + thrownError + " : " + ErrorText);
	        }
	    });
	}
</script>
</head>

<body>
		<input id="cityname" type="text" title="请输入需要查询的城市">
		<br>
		<button id="btn" onclick="search()">查询</button>
		<div id="info">
			<p id="city"></p>
			<p id="date_y"></p>
			<p id="temperature"></p>
		</div>
</body>
</html>