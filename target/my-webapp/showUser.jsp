<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="dbutil.Dbconn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*,dbutil.*,entity.*,model.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>显示数据页面</title>
      <link rel="stylesheet" href="css/search.css">
  </head>
  <body>
<%--    <%--%>
<%--    int id=Integer.parseInt(request.getParameter("id"));--%>
<%--     Model model=new Model();--%>
<%-- 	 User user=model.load(id);--%>
<%--	%>--%>
<%--	<%=user.getId() %>--%>
<%--	<%=user.getName() %>--%>
<%--	<%=user.getPassword() %>--%>
<%--    <%--%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
     Model model=new Model();
 	 User user=model.load(id);
  %>
    <div class="user-info">
        <h1>User Information</h1>
        <p><span class="label">ID:</span> <span class="value"><%= user.getId() %></span></p>
        <p><span class="label">Name:</span> <span class="value"><%= user.getName() %></span></p>
        <p><span class="label">Password:</span> <span class="value"><%= user.getPassword() %></span></p>
    </div>

  </body>
</html>
