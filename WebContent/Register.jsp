<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@page import="java.io.*"%>     
<%@page import="java.sql.*"%>    
<%
    if(request.getParameter("btnSubmit")!=null)
    {
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String mobile=request.getParameter("pnumber");
				String gender=request.getParameter("gender");
				String password=request.getParameter("password");

            try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "DEEPAK93", "DEEPAK");
            Statement s=con.createStatement();
            String str="insert into LOGINREGISTERSERVLET values('"+name+"','"+email+"','"+mobile+"','"+gender+"','"+password+"')";
			s.executeUpdate(str);
			
			out.print("alert('You Register successfully.....');");
			response.sendRedirect("Login.jsp");

		} catch (Exception e) {
			out.print(e);
		}
	}

 %>    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Form</title>
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
						<h2>Register Here</h2>
					</div>

					<form action="" method="post">
						<div class="form-group">
							<label for="email">Name:</label> <input type="text"
								class="form-control" id="name" name="name" required>
						</div>
						<div class="form-group">
							<label for="email">Email address:</label> <input type="email"
								class="form-control" id="email" name="email" required>
						</div>
						<div class="form-group">
							<label for="email">Phone Number:</label> <input type="number"
								class="form-control" id="pnumber" name="pnumber" required>
						</div>
						<div class="form-group">
							<label for="pwd">Select Gender:</label> <select name="gender"
								class="form-control" required>
								<option value="">Select Gender</option>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>
						<div class="form-group">
							<label for="pwd">Password:</label> <input type="password"
								class="form-control" id="pwd" name="password"required>
						</div>
						<div class="form-group">
							<label for="pwd">Confirm Password:</label> <input type="password"
								class="form-control" id="pwd" required>
						</div>

						<button type="submit" class="btn btn-primary" name="btnSubmit">Register</button>
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