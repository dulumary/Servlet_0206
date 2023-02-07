package com.marondal.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sevlet/test09")
public class Test09Controller extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 이름과 자기소개서를 전달 받고, html 화면 구성
		String name = request.getParameter("name");
		String introduce = request.getParameter("introduce");
		
		out.println("<html><head><title>지원결과</title></head><body>");
		
		
		out.println("<h1>" + name + "님 지원이 완료되었습니다.</h1>");
		out.println("<hr> 지원내용 <br> " + introduce);
		
		out.println("</body></html>");
		
		
	}

}
