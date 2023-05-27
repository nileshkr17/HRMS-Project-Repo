<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>hello</title>
</head>
<body>
<%
		String email = (String)session.getAttribute("useremail");
		String ID = (String)session.getAttribute("ID");
    	out.println(email);
    	out.println(ID);
    	
    %>
    
    
</body>
</html>