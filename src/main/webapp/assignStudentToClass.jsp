<%@page import="com.simplilearn.entity.Classes"%>
<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.simplilearn.entity.Student"%>
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

<h1>Assign a Student to a Class</h1>
</div>
<%
	SessionFactory sf  = HibernateUtil.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Student> students = hibernateSession.createQuery("from Student").list();
	List<Classes> classes = hibernateSession.createQuery("from Classes").list();
%>
<div>
<form action="assignStudent" method="post">
<table class="center">
<tr>
<th>Student Name </th>
<th>Class Name </th>
</tr>
<tr>
<td>
<select name="name">
<%
	for (Student student : students){
	out.print("<option>" + student.getName() + " " + student.getFname());
	out.print("</option>");
	}
%>
</select>
</td>

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
<br>
<br>
<a href="index.html">Back to Main Menu</a><br>
</div>

</body>
</html>