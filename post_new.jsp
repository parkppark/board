<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신규 게시글 작성</title>
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
            background-color: #424242;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            margin: 0 10px;
        }

        button:hover {
            background-color: #E0E0E0;
            transform: scale(1.05);
        }

        button[type="reset"] {
            background-color: #424242;
        }

        button[type="reset"]:hover {
            background-color: #E0E0E0;
        }

        button[type="button"] {
            background-color: #424242;
        }

        button[type="button"]:hover {
            background-color: #E0E0E0;
        }
    </style>
</head>
<body>
    <h1>신규 게시글 작성</h1>
    
    <form action="post_new_send.jsp" method="post">
        <table>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="writer" required></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" required></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea rows="10" cols="20" name="content" required></textarea></td>
            </tr>
        </table>
        <div class="button-container">
            <button type="submit" onclick="return confirm('저장하시겠습니까?')">저장</button>
            <button type="button" onclick="if (confirm('목록으로 돌아가시겠습니까?')) location.href='post_list.jsp';">목록으로</button>
            <button type="reset" onclick="return confirm('초기화 하시겠습니까?')">초기화</button>
        </div>
    </form>
</body>
</html>
