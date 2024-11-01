
<%@page import="java.sql.SQLException"%>

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
	String fname = request.getParameter("fname");
	String mail = request.getParameter("email");
	int age = Integer.parseInt(request.getParameter("age"));
	String password = request.getParameter("password");

	
	System.out.println("sigup jsp");
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String qry = null;
	String msg = "";
	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?user=root&&password=root");
		qry = "select name from user where email = ?";
		ps = con.prepareStatement(qry);
		ps.setString(1, mail);
		rs = ps.executeQuery();

		if (!rs.next()) {
			System.out.println("data:");
			qry = "insert into user (name,email,age,password) values(?,?,?,?)";
			ps = con.prepareStatement(qry);
			ps.setString(1, fname);
			ps.setString(2, mail);
			ps.setInt(3, age);
			ps.setString(4, password);
			ps.executeUpdate();

			System.out.println("sucessfull");

			RequestDispatcher rd = request.getRequestDispatcher("signin.html");
			rd.forward(request, response);
		} else {
			System.out.println("not sucessfull");
			out.println("<h2>User already exist</h2>");

		}
	} finally {

		if (ps != null)
			ps.close();
		if (con != null)
			con.close();

	}
%>




</body>
</html>