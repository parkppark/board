<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
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
	
	Timestamp today = new Timestamp(System.currentTimeMillis());
	
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	int no = 0;
	
	String sql = "select MAX(no) from board.post";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
		no = rs.getInt("MAX(no)")+1;
		
		sql = "insert into board.post(no, title, writer, content, reg_date) values(?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		pstmt.setString(2, title);
		pstmt.setString(3, writer);
		pstmt.setString(4, content);
		pstmt.setTimestamp(5, today);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("post_list.jsp");
	}
	
}
	catch(Exception ex){
		out.println("오류가 발생했습니다." + ex.getMessage());
	}
			
%>













