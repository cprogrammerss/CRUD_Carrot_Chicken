<%--
  Created by IntelliJ IDEA.
  User: 11597
  Date: 2024/5/10
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="dbutil.Dbconn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <div class="navbar">
        <a href="allShow.jsp">展示当前用户</a>
        <a href="insert.jsp">增加用户</a>
        <a href="dele.jsp">删除用户</a>
        <a href="update.jsp">更新用户</a>
        <a href="search.jsp">搜索用户</a>
        <a href="updateFromExcel.jsp">从excel中更新用户</a>
    </div>
</body>
</html>
