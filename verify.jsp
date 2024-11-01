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
	int age = (int) session.getAttribute("age");
	int flag = (int) session.getAttribute("flag");
	System.out.println(age);
	

	if (age >= 18 && flag == 0) {
		RequestDispatcher rd = request.getRequestDispatcher("vote.html");
		rd.forward(request, response);
	} else if (flag == 1) {
		out.println("<h1>You have already casted your vote.</h1>");
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.include(request, response);
	} else {
		out.println("<h1>Not elgible for voting.</h1>");
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.include(request, response);
	}
	%>
</body>
</html>