<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이 변환</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

	<div class="container">
	
		<%
			// cm 길이와 단위들을 전달 받고, 
			// 대상의 단위 결과들을 보여준다 
			
			int length = Integer.parseInt(request.getParameter("length"));
		
			// 단위들 unit
			// inch, yard, feet, meter
			String[] unitArray = request.getParameterValues("unit");
			String result = "";
			for(int i = 0; i < unitArray.length; i++) {
				String unit = unitArray[i];
				
				if(unit.equals("inch")) {
					double inch = length * 0.39;
					result += inch + "in<br>";
				} else if(unit.equals("yard")) {
					double yard = length * 0.010936133;
					result += yard + "yd<br>";
				} else if(unit.equals("feet")) {
					double feet = length * 0.032808399;
					result += feet + "ft<br>";
				} else if(unit.equals("meter")) {
					double meter = length / 100.0;
					result += meter + "m<br>";
				}
			}
		
		%>
		
		<h1>변환 결과</h1>
		<h2><%= length %>cm</h2>
		<hr>
		<h2><%= result %></h2>
	
	
	</div>

</body>
</html>