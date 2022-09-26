<%@page import="com.simplilearn.entity.Classes"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .center {
		width: 350px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 3 3 350px;  
        padding: 30px;  
        border-radius: 5px ; 
		}
		div { text-align: center; }
    </style>
</head>
<body bgcolor="skyblue">
<div>
<h1>Choose a Class for Report Page</h1>
</div>
<%
	SessionFactory sf  = HibernateUtil.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Classes> classes = hibernateSession.createQuery("from Classes").list();
%>
<div>
<form action="ClassReport.jsp" method="post">
<table class="center">
<tr>
<th>Class Name </th>

</tr>

<tr>
<td>
<select name="class">
<%
	for (Classes clas : classes){
	out.print("<option>" + clas.getName());
	out.print("</option>");
	}
%>
</select>
</td>
</tr>

</table>
	<input type="submit" value="Submit">
</form>
<br><br><a href="index.html">Back to Main Menu</a><br>
</div>
</body>
</html>