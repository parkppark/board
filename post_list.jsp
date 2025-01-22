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
<title>게시글 목록</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f4f4f9;
        color: #333;
    }

    h1 {
        font-size: 2.5em;
        color: #424242;
        text-align: center;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    table th, table td {
        padding: 12px 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    table th {
        background-color: #424242;
        color: #fff;
    }

    table tr:hover {
        background-color: #f1f1f1;
    }

    table a {
        text-decoration: none;
        color: #424242;
        font-weight: bold;
        transition: color 0.3s;
    }

    table a:hover {
        color: #4CAF50;
    }

    .button-container {
        text-align: center;
        margin-bottom: 20px;
    }

    button {
        font-size: 1em;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #424242;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    button:hover {
        background-color: #424242;
        transform: scale(1.05);
    }

    footer {
        text-align: center;
        margin-top: 20px;
        font-size: 0.9em;
        color: #aaa;
    }
</style>
</head>
<body>
    <h1>게시글 목록</h1>
    <div class="button-container">
        <button type="button" onclick="if (confirm('게시글을 작성하시겠습니까?')) location.href='post_new.jsp';">
            신규 게시글 작성
        </button>
    </div>
    <% 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/board";
        String user = "root";
        String password = "12345";
        Connection conn = DriverManager.getConnection(url, user, password);
        String sql = "SELECT * FROM board.post ORDER BY no DESC";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
    %>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>작성일</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getInt("no") %></td>
                <td><%= rs.getString("writer") %></td>
                <td><a href="post_read.jsp?no=<%= rs.getInt("no") %>"><%= rs.getString("title") %></a></td>
                <td><%= rs.getTimestamp("reg_date") %></td>
                <td>
                    <button onclick="if (confirm('게시글을 수정하시겠습니까?')) location.href='post_modify.jsp?no=<%= rs.getInt("no") %>';">수정</button>
                    <button onclick="if (confirm('게시글을 삭제하시겠습니까?')) location.href='post_delete_send.jsp?no=<%= rs.getInt("no") %>';">삭제</button>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% 
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception ex) {
        out.println("오류가 발생했습니다. 오류 메시지: " + ex.getMessage());
    }
    %>
    <footer>
        © 2025 모두의 게시판. All rights reserved.
    </footer>
</body>
</html>














