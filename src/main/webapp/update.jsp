<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>
    
    <%
		String ID = request.getParameter("ID");
    	Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","nilesh","nilesh");
        Statement st=conn.createStatement();
        String command = "Select * from empdb WHERE ID='"+ID+"'";
        ResultSet rs= st.executeQuery(command);
    %>
     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <title>Update | Admin</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="signup-style.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
</head>
<body>
    <div class="container">
        <header><i class="fa fa-user"></i>  Admin Update System</header><br>
        <form action="update-process.jsp" method="post">
       <% if(rs.next())
   			{ %>
            <div class="form first">
                <div class="details personal">
                    <span class="title">Personal Details</span>

                    <div class="fields">
                        <div class="input-field">
                            <label>Full Name</label>
                            <input type="text"  value= <%=rs.getString("NAME")%> name="name" placeholder="Enter your name" required>
                        </div>

                        <div class="input-field">
                            <label>Date of Birth</label>
                            <input type="date" value= <%=rs.getString("DOB") %> name="dob" placeholder="Enter birth date" required>
                        </div>

                        <div class="input-field">
                            <label>Email</label>
                            <input type="text" name="email" value= <%=rs.getString("email") %> placeholder="Enter your email" required>
                        </div>

                        <div class="input-field">
                            <label>Mobile Number</label>
                            <input type="number" value=<%=rs.getString("PHONE") %> name="phone" placeholder="Enter mobile number" required>
                        </div>

                        <div class="input-field">
                            <label>Gender</label>
                            <select required name="gender" > 
                                <option disabled selected>Select gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Others</option>
                            </select>
                        </div>
                        <div class="input-field">
                            <label>Designation</label>
                            <input type="text" value=<%=rs.getString("designation") %> name="designation" placeholder="Designation" required>
                        </div>
                    </div>
                </div>

                <div class="details ID">
                    <span class="title">Identity Details</span>
                    <div class="fields">
                        <div class="input-field">
                            <label>ID Number</label>
                            <input type="number" value=<%=rs.getString("ID") %> name="id" placeholder="Enter ID number" required>
                        </div>
                        <div class="input-field">
                            <label>Address Type</label>
                            <input type="text" value=<%=rs.getString("ADDRESS") %> placeholder="Permanent or Temporary" name="address" required>
                        </div>
                        <div class="input-field">
                            <label>Hire Date</label>
                            <input type="date" value=<%=rs.getString("HIREDATE") %> name="hiredate" placeholder="Enter your issued date" required>
                        </div>
                         <div class="input-field">
                            <label>Salary</label>
                            <input type="number" name="salary" value=<%=rs.getString("SALARY") %> placeholder="in Rupess" required>
                        </div>
                        <div class="input-field">
                            <label>Bonus</label>
                            <input type="number" name="bonus" value="0" placeholder="optional" required >
                        </div>
                        <div class="input-field">
                            <label>Working Days</label>
                            <input type="number" name="workingday" value="0" placeholder="optional" required>
                        </div>
                    </div>
                    <button class="nextBtn">
                        <span class="btnText">Next</span>
                        <i class="uil uil-navigator"></i>
                    </button>
                </div> 
            </div>
            <div class="form second">
                <div class="details address">
                    <span class="title">Department Details</span>
                    <div class="fields">
                         <div class="input-field">
                            <label>Department</label>
                            <input type="text" value=<%=rs.getString("DEPT") %> name="department" placeholder="Department" required>
                        </div>
                        <div class="input-field">
                            <label>Subordinate</label>
                            <input type="text" value=<%=rs.getString("SUBORDINATE") %> name="subordinate" placeholder="Mr.Nilesh" required>
                        </div>
                        <div class="input-field">
                            <label>Superior</label>
                            <input type="text" name="superior" value=<%=rs.getString("SUPERIOR") %> placeholder="Mostly department head" required>
                        </div>
                         <div class="input-field">
                            <label>Project</label>
                            <select required name="project">
                                <option disabled selected>Select project</option>
                                <option value="Project1">Project 1</option>
                                <option value="Project2">Project 2</option>
                                <option value="Project3">Project 3</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="details family">
                    <span class="title">Login Details</span>
                    <div class="fields">
                        <div class="input-field">
                            <label>Password</label>
                            <input type="password" placeholder="Enter Password" name="password" required>
                        </div>
                    </div>
                    <div class="buttons">
                        <div class="backBtn">
                            <i class="uil uil-navigator"></i>
                            <span class="btnText">Back</span>
                        </div>
                        <button class="sumbit" type="submit">
                            <span class="btnText">Submit</span>
                            <i class="uil uil-navigator"></i>
                        </button>
                    </div>
                </div> 
            </div>
            <%} %>
        </form>
    </div>
    <script src="signup.js"></script>
</body>
</html>
