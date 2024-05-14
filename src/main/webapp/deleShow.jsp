<%@ page language="java" import="java.util.*,dbutil.*,entity.*,model.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>显示数据页面</title>
      <link rel="stylesheet" href="css/insert.css">
  </head>
  <body>

    <%
    int id=Integer.parseInt(request.getParameter("id"));
     Model model=new Model();
	%>
	<h1>删除完成，请查看删除后的结果</h1>
	<%=model.delete(id) %>
	<form action="allShow.jsp">
	<input type="submit" value="显示所有用户">
	</form>
  </body>
</html>
