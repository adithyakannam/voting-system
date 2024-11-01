<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="./style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Elections</title>
</head>
<body >
	<%
	String party = request.getParameter("vote");
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String qry = null;
	int totalVotes = 0;
	
	String mail = (String) session.getAttribute("mail");
	

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?user=root&&password=root");

		out.println("<h1> You have casted your  vote to '"+party+"'</h1><br>");
		out.println("<a href='./index.html'><button>Log out</button></a>");
		qry = "update user set vote = 1 where email =?";
		ps = con.prepareStatement(qry);
		ps.setString(1, mail);
		ps.executeUpdate();
		System.out.println(party);
		System.out.println("updated");

		qry = "select party,votes from candidate where party = ?";
		ps = con.prepareStatement(qry);
		ps.setString(1, party);

		rs = ps.executeQuery();
		rs.next();
		totalVotes = rs.getInt("votes");
		totalVotes++;
		
		qry = "update candidate set votes = ? where party =?";
		ps = con.prepareStatement(qry);
		ps.setInt(1, totalVotes);
		ps.setString(2, party);
		ps.executeUpdate();
		

	} finally {

		if (rs != null) rs.close();
		if (ps != null)
			ps.close();
		if (con != null)
			con.close();

	}
	%>
	
</body>
</html>
