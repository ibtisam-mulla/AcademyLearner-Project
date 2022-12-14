<%@page import="com.simplilearn.entity.Student"%>
<%@page import="com.simplilearn.entity.Teacher"%>
<%@page import="com.simplilearn.entity.Subject"%>
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

<%String clas = request.getParameter("class");%>
<div>
<h1>Class Report for <%=clas%></h1></div>

<%
	SessionFactory sf  = HibernateUtil.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Classes> classes = hibernateSession.createQuery("from Classes cl where cl.name='" + clas + "'").list();
	Classes clasForReport = classes.get(0);
%>
<table class="center">
<tr>
<th>Subject Name </th>
<th>Teacher Name </th>
</tr>
<%	
	for(Subject subject: clasForReport.getSubjects()){
		out.print("<tr>");	
		out.print("<td>" + subject.getName() + "</td>");
		out.print("<td>" + getTeacherName(subject) + "</td>");
		out.print("</tr>");
	}
%>
</table>
<%!
	public String getTeacherName(Subject subject){
		Teacher teacher = subject.getTeacher();
		String name;
		String lname;
	
		if(teacher != null){
			name=teacher.getName();
			lname = teacher.getLname();
			
			return name + " " + lname;
		}else{
			return "No Teacher assigned";
		}
}
%>
<table class="center">
<br>
<tr>
<th>Listed Students</th>
</tr>
<%
	for(Student student : clasForReport.getStudents()){
		out.print("<tr>");
		out.print("<td>" + student.getName() + " " + student.getFname() + "</td>");
		out.print("</tr>");
	}
%>
</table>
<div><br><br><a href="index.html">Back to Main Menu</a><br></div>
</body>
</html>
