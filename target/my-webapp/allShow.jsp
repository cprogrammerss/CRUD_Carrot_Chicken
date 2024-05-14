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
	  <link rel="stylesheet" href="css/show.css">

  </head>
  <body>
<%--    <%--%>
<%--     Model model=new Model();--%>
<%-- 	 ArrayList<User> arraylist=model.userSelect();--%>
<%--			%>--%>
<%--			数据库中所有用户--%>
<%--			<table border="1">--%>
<%--			<%for(int i=0;i<arraylist.size();i++){%>--%>
<%--				<tr>--%>
<%--				<td><%=arraylist.get(i).getId()%></td>--%>
<%--				<td><%=arraylist.get(i).getName() %></td>--%>
<%--				<td><%=arraylist.get(i).getPassword() %></td>--%>
<%--				</tr>--%>
<%--		<% 	--%>
<%--		}--%>
<%--     %>--%>
<%--     </table>--%>

<div class="container">
	<div class="navbar">
		<a href="allShow.jsp">展示当前用户</a>
		<a href="insert.jsp">增加用户</a>
		<a href="dele.jsp">删除用户</a>
		<a href="update.jsp">更新用户</a>
		<a href="search.jsp">搜索用户</a>
		<a href="updateFromExcel.jsp">从excel中更新用户</a>
	</div>

	<div class="title">
		<h1>信息列表展示</h1>
	</div>
	<div class="table">
		<table>
			<tr>
				<th>id</th>
				<th>姓名</th>
				<th>密码</th>
				<%--                    <th>操作</th>--%>
			</tr>
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {
					// 创建 Dbconn 类的实例，并获取数据库连接
					Dbconn dbconn = new Dbconn();
					conn = dbconn.getConnection();

					// 执行 SQL 查询
					String sql = "SELECT * FROM user";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					// 在表格中填充数据
					while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getString("id") %></td>
				<td><%= rs.getString("name") %></td>
				<td><%= rs.getString("password") %></td>
			</tr>
			<%
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					// 关闭数据库连接
					try {
						if (rs != null) rs.close();
						if (pstmt != null) pstmt.close();
						if (conn != null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			%>
		</table>
	</div>
</div>
  </body>
</html>
