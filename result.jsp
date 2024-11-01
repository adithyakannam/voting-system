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
<title>Result</title>
</head>
<body>
	<%
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String qry = null;
	int totalVotes = 0;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?user=root&&password=root");

		qry = "select * from candidate";
		ps = con.prepareStatement(qry);
		rs = ps.executeQuery();

		while (rs.next()) {
	%>
	<h1><%=rs.getString("party")%>
		:
		<%=rs.getInt("votes")%></h1>
	<%
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