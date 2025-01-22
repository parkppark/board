<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost/board";
		String user = "root";
		String password = "12345";
		
		Connection conn = DriverManager.getConnection(url, user, password);
		

		request.setCharacterEncoding("UTF-8");
		
		String no = request.getParameter("no");
		
		String sql = "delete from board.post where no=" + no;
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("post_list.jsp");
    	
    	
    	
    }
    catch(Exception ex){
    	out.println("오류가 발생했습니다." + ex.getMessage());
    }
    
    %>
    
    