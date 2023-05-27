<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>
<%
String ID=request.getParameter("ID");
try
{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","nilesh","nilesh");
	Statement st=conn.createStatement();
	System.out.println(conn);
	System.out.println(st);
	
	int i=st.executeUpdate("DELETE from empdb WHERE ID='"+ID+"'");
	response.sendRedirect("showall.jsp");
	
	
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>