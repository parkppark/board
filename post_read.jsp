<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 열람</title>
</head>
<body>
	<h1>게시글 상세 열람</h1>
	<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/board";
			String user = "root";
			String password = "12345";
			
			Connection conn = DriverManager.getConnection(url, user, password);
			

			request.setCharacterEncoding("UTF-8");
			
			String no = request.getParameter("no");
			
			String sql = "select * from board.post where no =" + no;
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
	%>
		<table border="1">
			<%
				while(rs.next()){
					
			%>
				<tr>
					<td>번호</td>
					<td><%=rs.getInt("no") %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=rs.getTimestamp("reg_Date") %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=rs.getString("writer") %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=rs.getString("title") %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><%=rs.getString("content") %></td>
				</tr>
				
				<tr>
					<td colspan = "2">
						<button type="button" onclick="location.href='post_list.jsp'">목록으로</button>
					</td>
				</tr>
				<% } %>
		</table>			
			<% } 
			catch(Exception ex) {
				out.println("오류 발생" + ex.getMessage());
			}%>					
			
	
</body>
</html>