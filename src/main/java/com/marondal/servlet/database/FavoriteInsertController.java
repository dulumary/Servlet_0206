package com.marondal.servlet.database;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marondal.servlet.common.MysqlService;

@WebServlet("/database/favorite/insert")
public class FavoriteInsertController extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 이름과 주소를 전달 받고 favorite 테이블에 insert 한다. 
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "INSERT INTO `favorite` \r\n"
				+ "(`name`, `url`, `createdAt`, `updatedAt`) \r\n"
				+ "VALUES \r\n"
				+ "('" + name + "', '" + url + "', now(), now());";
		
		mysqlService.update(query);
		mysqlService.disconnect();
	
		response.sendRedirect("/database/favorite.jsp");
		
	}

}
