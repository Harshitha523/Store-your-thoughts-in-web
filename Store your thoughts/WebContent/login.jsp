<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<style>
img.background{
	position: fixed;
      left: 0px;
      top: 0px;
      z-index: -1;
      width: 100%;
      height: 100%;
      -webkit-filter: blur(6px); /* Safari 6.0 - 9.0 */
      filter: blur(6px);
}
body{
	font-family:cursive;
	color:brown;
}
input[type=submit] {
        font-family: cursive;
    height:40px;
    width:90px;
    font-size: 20px;
    color:brown;
    background-color: rgb(236, 177, 155);
    border-radius: 6px;
    cursor:pointer;
    width:250px;
      }
</style>
</head>
<body>
<img class="background" src="2wad.png" alt="bg">
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");
session.setAttribute("name",name);
session.setAttribute("email",email);
session.setAttribute("password",password);
%>
<h4 align="center">
<% 
try
{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/storemythoughts","root","Dream8");
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from table1 where email='"+email+"' and password='"+password+"'");
           int count=0;
        while(rs.next()){
        	count++;
        }
        if(count!=0){
        	%>
        	<h1 align="center"><%="Welcome "+session.getAttribute("name") %></h1><br><br>
        	<form action="write.jsp" method="get" align="center">
        	<textarea name="thought" id="thought" cols="100" rows="5" placeholder="My thought right now is...." required></textarea><br>
        	
        	<input type="submit" value="Add"></form><br>
        	<form action="view.jsp" method="get" align="center"><input type="submit" value="View my thoughts"></form>
        	
        	<%
        	
        }
        else{
        	response.sendRedirect("index1.html");
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