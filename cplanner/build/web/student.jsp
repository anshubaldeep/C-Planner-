<%-- 
    Document   : student
    Created on : 21 Nov, 2018, 3:14:25 PM
    Author     : anshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%
    try {
    Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\anshu\\Desktop\\cplanner.db");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Student Portal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
        <style>
            .tt-cell1{
                background-color: DarkBlue;
                color: White;
                text-decoration: none;
            }	
            .heading{
                font-family: "Oswald"; 
                text-align: center; 
                font-size: 80px;
            }

        </style>	
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand"><img src="logo.jpg" height=40 width=70><span style="color:white; margin-left: 5px">C-Planner</span></a>


            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="student.jsp">Student Portal</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="teacher.jsp">Teacher Portal</a>
                </li>
            </ul>
        </nav>

        <div align="center">
            <br/><br/>
            <h1 class="heading">Student Portal</h1>
            <div style="width: 50%; height: 10px; background-color: #ff7777;"></div>

            <br/><br/>
            <div class="btn-group">
                <button type="button" class="btn btn-primary">Branch</button>
                <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">IT</a>
                    <a class="dropdown-item" href="#">CSE</a>
                    <a class="dropdown-item" href="#">ECE</a>
                </div>
            </div>

            <div class="btn-group">
                <button type="button" class="btn btn-secondary">Section</button>
                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">1</a>
                    <a class="dropdown-item" href="#">2</a>
                </div>
            </div> 
        </div>
        <br/><br/><br/>
    <center>
        <table cellpadding="20" cellspacing="5" border=1>
            <thead class="black white-text">
                <tr align="center" class="table-primary">
                    <th scope="col">
                        <b>Day/Time</b>
                    </th>
                    <th scope="col">
                        <b>9:00 AM</b>
                    </th>
                    <th scope="col">
                        <b>10:00 AM</b>
                    </th>
                    <th scope="col">
                        <b>11:00 AM</b>
                    </th>
                    <th scope="col">
                        <b>12:00 PM</b>
                    </th>
                    <th scope="col">
                        <b>1:00 PM</b>
                    </th>
                    <th scope="col">
                        <b>2:00 PM</b>
                    </th>
                    <th scope="col">
                        <b>3:00 PM</b>
                    </th>
                    <th scope="col">
                        <b>4:00 PM</b>
                    </th>
                </tr>

                <tr align="center" class="tt-row">
                    <td class="tt-cell1">
                        <b> Monday </b>
                    </td>
                    <%
                        Statement stat = conn.createStatement();
                        ResultSet rs = stat.executeQuery("select * from lectures where day=1;");
                        while (rs.next()) {
                    %>
                        <td class="tt-cell">
                            <%= (rs.getString("subject") == null)? "-" : rs.getString("subject") %>
                        </td>
                    <%   
                        }
                        rs.close();
                    %>
                    
                </tr>

                <tr align="center" class="tt-row">
                    <td class="tt-cell1">
                        <b> Tuesday </b>
                    </td>
                    <%
                        stat = conn.createStatement();
                        rs = stat.executeQuery("select * from lectures where day=2;");
                        while (rs.next()) {
                    %>
                        <td class="tt-cell">
                            <%= (rs.getString("subject") == null)? "-" : rs.getString("subject") %>
                        </td>
                    <%   
                        }
                        rs.close();
                    %>
                </tr>

                <tr align="center" class="tt-row">
                    <td class="tt-cell1">
                        <b> Wednesday </b>
                    </td>
                    <%
                        stat = conn.createStatement();
                        rs = stat.executeQuery("select * from lectures where day=3;");
                        while (rs.next()) {
                    %>
                        <td class="tt-cell">
                            <%= (rs.getString("subject") == null)? "-" : rs.getString("subject") %>
                        </td>
                    <%   
                        }
                        rs.close();
                    %>
                </tr>

                <tr align="center" class="tt-row">
                    <td class="tt-cell1">
                        <b> Thursday </b>
                    </td>
                    <%
                        stat = conn.createStatement();
                        rs = stat.executeQuery("select * from lectures where day=4;");
                        while (rs.next()) {
                    %>
                        <td class="tt-cell">
                            <%= (rs.getString("subject") == null)? "-" : rs.getString("subject") %>
                        </td>
                    <%   
                        }
                        rs.close();
                    %>
                </tr>

                <tr align="center" class="tt-row">
                    <td class="tt-cell1">
                        <b> Friday </b>
                    </td>
                    <%
                        stat = conn.createStatement();
                        rs = stat.executeQuery("select * from lectures where day=5;");
                        while (rs.next()) {
                    %>
                        <td class="tt-cell">
                            <%= (rs.getString("subject") == null)? "-" : rs.getString("subject") %>
                        </td>
                    <%   
                        }
                        rs.close();
                        conn.close();
                    }
                    catch (Exception e) {

                    }
                    %>
                </tr>

                </center>

        </table>
                <br/><br/><br/><br/>
    </body>
</html>