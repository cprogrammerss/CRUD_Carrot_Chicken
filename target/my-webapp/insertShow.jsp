<%@ page language="java" import="java.util.*,dbutil.*,entity.*,model.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>显示数据页面</title>
      <link rel="stylesheet" href="css/insert.css">
  </head>
  <body>
    <%
    request.setCharacterEncoding("gbk");
    int id=Integer.parseInt(request.getParameter("id"));
    String name=request.getParameter("name");
    String password=request.getParameter("password");
     Model model=new Model();
	%>
    <h1>插入完成，请查看插入后的结果</h1>
	<%=model.insert(id,name,password) %>
	<form action="allShow.jsp">
	<input type="submit" value="显示所有用户">
	</form>
  </body>
</html>
