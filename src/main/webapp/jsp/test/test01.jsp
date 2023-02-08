<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>

	<%
		int sum = 0;
		int[] scores = {80, 90, 100, 95, 80};
		for(int i = 0; i < scores.length; i++) {
			 sum += scores[i];
		}
		
		double average = sum / (double)scores.length;
	%>
	
	<h2>점수의 평균은 <%= average %> 입니다</h2>
	
	<%
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		int score = 0;
		for(String answer:scoreList) {
			if(answer.equals("O")) {
				//score += 10;
				score += 100 / scoreList.size();
			}
		}
	%>
	
	<h2>체점 결과는 <%= score %>점 입니다</h2>
	
	<%!
		int sumAll(int number) {
			int result = 0;
			for(int i = 1; i <= number; i++) {
				result += i;
			}
			
			return result;
		}
	%>
	
	<%-- int result = sumAll(50); --%>
	
	<h2>1부터 50까지의 합은 <%= sumAll(50) %> 입니다.</h2>
	
	<%
		String birthDay = "20010820";
		int year = Integer.parseInt(birthDay.substring(0, 4));
		
	%>
	
	<h2><%= birthDay %>의 나이는 <%= 2023 - year + 1 %>살입니다</h2>

</body>
</html>