<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            font-size: 2.5em;
            color: #424242;
            margin-bottom: 20px;
        }

        form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        td:first-child {
            text-align: right;
            font-weight: bold;
            color: #424242;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1em;
        }

        textarea {
            resize: none;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        button {
            font-size: 1em;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            margin: 0 10px;
        }

        button[type="submit"] {
            background-color: #424242;
            color: white;
        }

        button[type="submit"]:hover {
            background-color: #E0E0E0;
            transform: scale(1.05);
        }

        button[type="button"] {
            background-color: #424242;
            color: white;
        }

        button[type="button"]:hover {
            background-color: #E0E0E0;
            transform: scale(1.05);
        }

        button[type="reset"] {
            background-color: #424242;
            color: white;
        }

        button[type="reset"]:hover {
            background-color: #E0E0E0;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>글 수정</h1>
    <% 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/board";
        String user = "root";
        String password = "12345";
        Connection conn = DriverManager.getConnection(url, user, password);

        request.setCharacterEncoding("UTF-8");
        String no = request.getParameter("no");

        String sql = "SELECT * FROM board.post WHERE no=" + no;
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
    %>
    <form action="post_modify_send.jsp" method="post">
        <input type="hidden" name="no" value="<%= rs.getInt("no") %>">
        <table>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="writer" value="<%= rs.getString("writer") %>" required></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" value="<%= rs.getString("title") %>" required></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea rows="10" cols="20" name="content" required><%= rs.getString("content") %></textarea></td>
            </tr>
        </table>
        <div class="button-container">
            <button type="submit" onclick="return confirm('수정하시겠습니까?')">수정</button>
            <button type="button" onclick="if (confirm('목록으로 갈까요?')) location.href='post_list.jsp';">목록으로</button>
            <button type="reset" onclick="return confirm('원상 복구 하시겠습니까?')">원상복구</button>
        </div>
    </form>
    <% 
        }
    } catch (Exception ex) {
        out.println("오류가 발생했습니다: " + ex.getMessage());
    }
    %>
</body>
</html>
