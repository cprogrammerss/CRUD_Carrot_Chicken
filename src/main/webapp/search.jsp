<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>查询用户</title>
      <link rel="stylesheet" href="css/insert.css">
  </head>
  
  <body>
  <h1>根据id搜索用户</h1>
    <form action="showUser.jsp" method="post">
    	请输入id：<input type="text" name="id">
    	<input type="submit" value="提交">
    </form>
  </body>
</html>
