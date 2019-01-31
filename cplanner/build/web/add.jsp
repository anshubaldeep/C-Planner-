<%-- 
    Document   : process.jsp
    Created on : 21 Nov, 2018, 8:03:05 PM
    Author     : anshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%
    
    int slot = request.getParameter("class3").charAt(2) - '0';
    int day = request.getParameter("class3").charAt(0) - '0';
    try {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\anshu\\Desktop\\cplanner.db");
        Statement stat = conn.createStatement();
        stat.executeUpdate("update lectures set subject='IWT' where day="+day+" and slot="+slot+";");
        conn.close();
    }
    catch (Exception e) { 
        e.printStackTrace();
    }
    response.sendRedirect("teacher.jsp");
%>