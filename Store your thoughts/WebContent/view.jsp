<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view my thoughts</title>
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
.p1{
color:black;
}
</style>
</head>
<body>
<img class="background" src="2wad.png" alt="bg">
<h1 align="center"><%="Thoughts of "+session.getAttribute("name") %></h1>
<h4 align="center">
<% 
try
{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/storemythoughts","root","Dream8");
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from table1 where email='"+session.getAttribute("email")+"'");
           %><p class="p1"><%
        while(rs.next()){
        	out.print(rs.getString(4));
        	%><br><%
        }%></p><% 
        }
        catch(Exception e)
        {
        out.print(e);
        e.printStackTrace();
        }
%>
</body>
</html>