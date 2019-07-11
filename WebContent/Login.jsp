<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<%@page import="java.io.*"%>     
<%@page import="java.sql.*"%>  

<%   
     if(request.getParameter("btnLogin")!=null) {
     String email=request.getParameter("email");
     String password=request.getParameter("password");
     session.setAttribute("login_auth", email);
     
              
               try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
			        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "DEEPAK93", "DEEPAK");
                    Statement s=con.createStatement();
                    ResultSet rs=s.executeQuery("SELECT * FROM LOGINREGISTERSERVLET WHERE email='"+email+"'");
            
               if(rs.next())
               {
                  if(rs.getString(5).equals(password))
                     {
                        response.sendRedirect("Main.jsp");
                     }
                     else
                     {
                        out.print("Oops! you are not valid user please try again.....");
                     }
                 }
              
               }catch(Exception e)
                    {
                       out.println(e);
                    }
}
%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col col-sm-12 col-md-6 col-lg-6">

				<div class="card card-body mt-5">
					<div
						class="text-center font-weight-boldr text-primary text-uppercase">
						<h2>Login Here</h2>
					</div>

					<form action="" method="post">
						<div class="form-group">
							<label for="email">Email address:</label> <input type="email"
								class="form-control" id="email" name="email">
						</div>
						<div class="form-group">
							<label for="pwd">Password:</label> <input type="password"
								class="form-control" id="pwd" name="password">
						</div>
						<div class="form-group form-check">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox"> Remember me
							</label>
						</div>
						<button type="submit" class="btn btn-primary" name="btnLogin">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>


<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>