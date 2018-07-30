package com.ylwl.utils.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcConnection {
	
		private static final String DRIVER="com.mysql.jdbc.Driver";
		private static final String URL="jdbc:mysql://localhost:3306/apiTool?useUnicode=true&characterEncoding=utf-8";
		private static final String USER="root";
		private static final String PASS="123456";
		
		static{
			try {
				Class.forName(DRIVER);
			} catch (ClassNotFoundException e) {
				System.out.println("数据库加载失败！！");
				e.printStackTrace();
			}
		}
		public static Connection getConnection(){
			try {
				return DriverManager.getConnection(URL, USER, PASS);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		public static void close(Connection conn,Statement st,ResultSet rs){
			try{
				if(rs!=null){
					rs.close();
				}
				if(st!=null){
					st.close();
				}
				if(conn!=null){
					conn.close();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			
		}

	}
	