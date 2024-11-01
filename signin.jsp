<%@page import="com.mysql.cj.jdbc.ha.BestResponseTimeBalanceStrategy"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String user = request.getParameter("user");
	String password = request.getParameter("password");

	Connection con = null;
	PreparedStatement ps = null;
	String qry = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?user=root&&password=root");

		qry = "select * from user where name=? and password=?";

		ps = con.prepareStatement(qry);
		ps.setString(1, user);
		ps.setString(2, password);

		rs = ps.executeQuery();

		System.out.println("signin");

		if (rs.next()) {
			System.out.println("done");

			int id = rs.getInt("id");
			String userName = rs.getString("name");
			String email = rs.getString("email");
			int age = rs.getInt("age");
			String password1 = rs.getString("password");
			int flag = rs.getInt("vote");
			String role = rs.getString("role");

			System.out.println(role + " role");

			session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("name", userName);
			session.setAttribute("mail", email);
			session.setAttribute("age", age);
			session.setAttribute("flag", flag);
			session.setAttribute("role", role);

			if (role.equals("voter")) {
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
			} else{
				RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
				rd.forward(request, response);
			}

		} else {

			System.out.println("not done");
			out.println("<h2>detail not matched</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("signin.html");
			rd.include(request, response);
		}

	} finally {

		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (con != null)
			con.close();

	}
	%>


</body>
</html>