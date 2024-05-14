<%@ page import="cn.hutool.crypto.Mode" %>
<%@ page import="model.Model" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 11597
  Date: 2024/5/13
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updateFromExcel</title>
    <link rel="stylesheet" href="css/insert.css">
</head>
<body>
    <h1>从excel中导入完成，请查看修改的结果</h1>
    <%
      Model model = new Model();
      ArrayList users = model.updateFromExcel();

    %>
    <form action="allShow.jsp">
      <input type="submit" value="显示所有用户">
    </form>
</body>
</html>
