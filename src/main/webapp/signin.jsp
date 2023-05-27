<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

    
    <%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    

try
{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","nilesh","nilesh");
 Statement st=conn.createStatement();
 ResultSet rs = st.executeQuery("SELECT * from empdb WHERE EMAIL='" + email + "' and PASSWORD='" +password+ "'");
	rs.next(); 
	
	  if(password.equals("admin@hrms")&& email.equals("admin@hrms"))
		 {
			
			session.setAttribute("useremail","admin@hrms");
			session.setAttribute("ID",rs.getString("ID")); 
			session.setAttribute("username",rs.getString("NAME")); 
			response.sendRedirect("admin.jsp"); 
		 }
		
		else if(rs.getString("PASSWORD").equals(password) && rs.getString("EMAIL").equals(email)) {
			 	session.setAttribute("useremail",rs.getString("EMAIL"));
			  	session.setAttribute("ID",rs.getString("ID"));
			  	session.setAttribute("username",rs.getString("NAME"));
				response.sendRedirect("index.jsp");
		 } 
			 else {
				 response.sendRedirect("signin.html");
			 }
 
 }
 catch(Exception e)
 {
	 
 System.out.print(e);
 session.setAttribute("status",e);
 }
%>
    
    