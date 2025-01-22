<%@page import="java.sql.ResultSet"%>
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
    		
    		String writer = request.getParameter("writer");
    		String title = request.getParameter("title");
    		String content = request.getParameter("content");
    		
    		String no = request.getParameter("no");
    		
    		String sql = "select * from board.post where no =" + no;
    		
    		PreparedStatement pstmt = conn.prepareStatement(sql);
    		
    		ResultSet rs = pstmt.executeQuery();
    		
    		while(rs.next()){
    			
    			sql = "update board.post set title = ?, writer=?, content=? where no="+no;
    			pstmt = conn.prepareStatement(sql);
    			
    			pstmt.setString(1, title);
    			pstmt.setString(2, writer);
    			pstmt.setString(3, content);
    			
    			pstmt.executeUpdate();
    			
    			response.sendRedirect("post_list.jsp");
    			
    		}
    				
    		
    	}
    	
    	catch(Exception ex){
    		out.println("오류가 발생했습니다." + ex.getMessage());
    	}
    %>