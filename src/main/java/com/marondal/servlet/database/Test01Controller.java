package com.marondal.servlet.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marondal.servlet.common.MysqlService;

@WebServlet("/database/test01")
public class Test01Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		// 접속
		mysqlService.connect();
		// 쿼리 작성
//		String insertQuery = "INSERT INTO `real_estate`\r\n"
//				+ "(`realtorId`, `address`, `area`, `type`, `price`, `createdAt`, `updatedAt`)\r\n"
//				+ "VALUE \r\n"
//				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000, now(), now());";
//		
//		int count = mysqlService.update(insertQuery);
//		
//		out.println("수행결과 : " + count);
		
		String selectQuery = "SELECT `address`, `area`, `type` FROM `real_estate`\r\n"
				+ "ORDER BY `id` DESC LIMIT 10;";
		ResultSet resultSet = mysqlService.select(selectQuery);
		
		try {
			while(resultSet.next()) {
				
				String address = resultSet.getString("address");
				int area = resultSet.getInt("area");
				String type = resultSet.getString("type");
				
				out.println("매물주소 : " + address + ", 면적 : " + area + ", 타입 : " + type);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		mysqlService.disconnect();
		
	}

}
