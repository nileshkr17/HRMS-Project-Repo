<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>


<%
String name = request.getParameter("name");
String dob = request.getParameter("dob");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String gender = request.getParameter("gender");
String designation = request.getParameter("designation");
String id = request.getParameter("id");
String address = request.getParameter("address");
String hiredate = request.getParameter("hiredate");
String salary = request.getParameter("salary");
String bonus = request.getParameter("bonus");
String workingday = request.getParameter("workingday");
String department = request.getParameter("department");
String subordinate = request.getParameter("subordinate");
String superior = request.getParameter("superior");
String project = request.getParameter("project");
String password=request.getParameter("password");


 
/* System.out.print(name+"--"+dob+"--"+email+"--"+phone+"--"+gender+"--"+designation+"--"+id+"--"+address+"--"+hiredate+"--"
+salary+"--"+bonus+"--"+workingday+"--"+department+"--"+subordinate+"--"+superior+"--"+project+"--"+password); 
 */
 try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","nilesh","nilesh");
Statement st=conn.createStatement();
String command = "INSERT into empdb values('" + id + "','" + name + "','" + gender + "','" + email + "',TO_DATE('" + dob + "','YYYY-MM-DD'),'" + password + "','" + phone + "','" + address + "','" + department + "',TO_DATE('" + hiredate + "','YYYY-MM-DD'),'" + salary + "','" + designation + "','" + bonus + "','" + workingday + "','" + subordinate + "','" + superior + "','" + project + "')";
System.out.println(command);
ResultSet rst = st.executeQuery(command);
 response.sendRedirect("signin.html");
 }
 catch(Exception e)
 {
 System.out.print(e);
 e.printStackTrace();
 } 
 
 
%>