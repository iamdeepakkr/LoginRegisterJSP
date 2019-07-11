<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@page import="java.io.*"%>     
<%@page import="java.sql.*"%>    
<%
Object login_auth = session.getAttribute("login_auth");
	if (login_auth == null) {
		response.sendRedirect("Login.jsp");
	}
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div><span>Welcome: </span>
<%
						try {
							Class.forName("oracle.jdbc.driver.OracleDriver");
			                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "DEEPAK93", "DEEPAK");
			                Statement s = con.createStatement();
							ResultSet rs = s.executeQuery("SELECT name FROM LOGINREGISTERSERVLET WHERE email='" + login_auth + "'");
							if (rs.next()) {
								out.println(rs.getString("name"));

							}

						} catch (Exception e) {
							out.print(e);
						}
					%>



</div>
</body>
</html>