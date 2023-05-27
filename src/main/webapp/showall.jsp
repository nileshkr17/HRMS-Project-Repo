<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>
<%
if (session.getAttribute("useremail") == null) {
   response.sendRedirect("404.html");
}
%>
    
    <%
    String email = (String)session.getAttribute("useremail");
    String username= (String)session.getAttribute("username");
    String id = (String)session.getAttribute("ID");
    String rss = "₹";
    
    int days = 365;
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","nilesh","nilesh");
    Statement st=conn.createStatement();
    
    String command = "Select * from empdb ";
    ResultSet rs= st.executeQuery(command);
   /*  ResultSet dt = st.executeQuery("Select * from NEWEMPDB"); */
   
    %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>HRMS</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
       
	<%
          		    if(rs.next())
         		 	{
          		    	
          		    	int wd = Integer.parseInt(rs.getString("WORKINGDAYS"));
         		     %>

        <!-- Sidebar Start -->
       <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="index.jsp" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary">HRMS</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0"><%=username %></h6>
                        <span><%=id %></span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="index.jsp?EMAIL=<%=email%>" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                     <a href="showall.jsp?EMAIL=<%=email%>" class="nav-item nav-link"><i class="fa fa-user me-2"></i>Employee</a>
                     <a href="salary-slip.jsp" class="nav-item nav-link"><i class="fa fa-chart-line me-2"></i>Salary Slip</a>
                     <a href="project.jsp?EMAIL=<%=email%>" class="nav-item nav-link"><i class="fa fa-chart-area me-2"></i>Projects</a>
                     <a href="update-profile.jsp?ID=<%=id%>" class="nav-item nav-link"><i class="fa fa-user me-2"></i>Update Profile</a>
                    </div> 
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
               
                <div class="navbar-nav align-items-center ms-auto">
                  
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex"><%=username %></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">My Profile</a>
                            <a href="logout.jsp" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- Sale & Revenue Start -->
          
            <!-- Sale & Revenue End -->

  <%} %>
            <!-- Sales Chart Start -->
           
            <!-- Sales Chart End -->


            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">All User</h6>
                       
                    </div>
                     <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col">ID</th>
                                    <th scope="col">Hire Date</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Salary</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr><% while(rs.next())
   { %>
                                    <td><%=rs.getString("ID") %></td>
                                    <td><%=rs.getString("HIREDATE") %></td>
                                    <td><%=rs.getString("DEPT") %></td>
                                    <td><%=rs.getString("NAME") %></td>
                                    <td><%=rs.getInt("SALARY") %></td>
                                    <td>Valid</td>
                                    <td>
                                    	<%String urlUpdate = "update.jsp?ID="+rs.getString("ID"); %>
                                    	<a class="btn btn-sm btn-primary" href="<%=urlUpdate %>">Update</a> 
                                    	
                                    	 <%String urlDel = "delete.jsp?ID="+rs.getString("ID"); %>
                                    	<a class="btn btn-sm btn-danger" href="<%=urlDel%>">Delete</a>
                                    </td>
                                   
                                </tr>
                                 <%} %>
                            </tbody>
                        </table>
                    </div> 
                    
                    
                </div>
            </div>
            <!-- Recent Sales End -->


            <!-- Widgets Start -->
            
            <!-- Widgets End -->


            <!-- Footer Start -->
           
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>