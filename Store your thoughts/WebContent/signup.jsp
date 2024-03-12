<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<link rel="stylesheet" href="signupjsp.css">
</head>
<body>
<img class="background" src="2wad.png" alt="bg">
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");
String cpassword=request.getParameter("cpassword");
%>

<br><br><br>

<h4 align="center">
<% 
try
{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/storemythoughts","root","Dream8");
           Statement st=conn.createStatement();
           if(password.equals(cpassword)){
           int i=st.executeUpdate("insert into table1 values('"+name+"','"+email+"','"+password+"','')");
           
           %><h1 align="center"><%="Welcome "+name %></h1>
           <p class="p1"><button onclick="location.href='index1.html'"><font face="Cursive" color="brown" >Login</font></button></p>
           <%
           }
           else{
        	   out.print("Both the passwords must be equal...Retry!!");
           }
        
        }
        catch(Exception e)
        {
        out.print(e);
        e.printStackTrace();
        }
%>

</h4>
</body>
</html>