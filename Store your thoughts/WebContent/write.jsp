<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pen down my thought</title>
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
button {
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
String thought=request.getParameter("thought"); 
try
{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/storemythoughts","root","Dream8");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into table1 values('"+session.getAttribute("name")+"','"+session.getAttribute("email")+"','"+session.getAttribute("password")+"','"+thought+"')");
         %><h1 align="center">Thought added!!</h1>
         <p align="center">
         <button onclick="history.back()">Write another thought</button>
         <button onclick="location.href='home.html'">Logout</button>
         </p>
         <%   
}
        catch(Exception e)
        {
        out.print(e);
        e.printStackTrace();
        }

%>
</body>
</html>