<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
	<%
	System.out.println("home");

	session = request.getSession();
	int id = (int) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String mail = (String) session.getAttribute("mail");
	int age = (int) session.getAttribute("age");
	int flag = (int) session.getAttribute("flag");


	session.setAttribute("id", id);
	session.setAttribute("name", name);
	session.setAttribute("mail", mail);
	session.setAttribute("age", age);
	session.setAttribute("flag", flag);

	%>

	<div class='container'>
		<form action='verify.jsp' method='post'>
			<table border='0' height='400px' width='300px'>
				<thead>
					<td colspan='2'><h3>Voter</h3></td>
				</thead>
				<tr>
					<td><label for='name'>Name:</label></td>
					<td><input type='text' id='name' name='name' value='<%=name%>'
						disabled /></td>
				</tr>
				<tr>
					<td><label for='email'>mail:</label></td>
					<td><input type='text' id='email' name='email'
						value='<%=mail%>' disabled /></td>
				</tr>
				<tr>
					<td><label for='age'>Age:</label></td>
					<td><input type='text' id='age' name='age' value='<%=age%>'
						disabled /></td>
				</tr>
				<tr>
					<td colspan='2'>
						<button name='action' value='edit'>vote</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>