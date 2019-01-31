<%-- 
    Document   : teacher
    Created on : 21 Nov, 2018, 3:47:25 PM
    Author     : anshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%
    String days[] = {"", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
    String slots[] = {"", "9:00 AM", "10:00 AM", "11:00 AM", "12:00 AM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM"};
    try {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\anshu\\Desktop\\cplanner.db");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Teacher Portal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">

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

            .nav-pills > li {
                float:none;
                display:inline-block;
                zoom:1;
            }

            .nav-pills {
                margin: 0 auto !important;
            }

            .tabContent {
                display:none;
            } 
        </style>
    </head>
    <body>

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
    <h1 class="heading">Teacher Portal</h1>
    <div style="width: 50%; height: 10px; background-color: #ff7777;"></div>

    <br/><br/>



    <script type="text/javascript">
        function showStuff(element) {
            var tabContents = document.getElementsByClassName('tabContent');
            for (var i = 0; i < tabContents.length; i++) {
                tabContents[i].style.display = 'none';
            }

            var tabContentIdToShow = element.id.replace(/(\d)/g, '-$1');
            document.getElementById(tabContentIdToShow).style.display = 'block';
        }
    </script>


    <ul class="nav nav-pills justify-content-center">
        <li class="nav-item" id="tabs1" onclick="showStuff(this)">
            <a class="nav-link active" data-toggle="pill" href="#exchange">Exchange</a>
        </li>
        <li class="nav-item" id="tabs2" onclick="showStuff(this)">
            <a class="nav-link" data-toggle="pill" href="#cancel">Cancel</a>
        </li>
        <li class="nav-item" id="tabs3" onclick="showStuff(this)">
            <a class="nav-link" data-toggle="pill" href="#add">Add</a>
        </li>
    </ul>
</div>


<center>
    <div class="tab-content" align="center">
        <div id="tabs-1" class="tabContent">
            <div class="container">
                <br/><br/>
                <form action="exchange.jsp" method="post">
                    <div class="form-group row">
                        <label for="originalTime" class="col-sm-2 col-form-label">Original Timings:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="sel1" name="class1">
                                <%
                                    int day, slot;
                                    Statement stat = conn.createStatement();
                                    ResultSet rs = stat.executeQuery("select * from lectures where subject='IWT';");
                                    while (rs.next()) {
                                        day = rs.getInt("day");
                                        slot = rs.getInt("slot");
                                %>
                                <option value="<%= day + "-" + slot%>"><%= days[day] + " - " + slots[slot]%></option>
                                <%
                                    }
                                    rs.close();
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="newTime" class="col-sm-2 col-form-label">New Timings:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="sel1" name="class2">
                                <%
                                    stat = conn.createStatement();
                                    rs = stat.executeQuery("select * from lectures where subject is NULL;");
                                    while (rs.next()) {
                                        day = rs.getInt("day");
                                        slot = rs.getInt("slot");
                                %>
                                <option value="<%= day + "-" + slot%>"><%= days[day] + " - " + slots[slot]%></option>
                                <%
                                    }
                                    rs.close();
                                %>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
                    
        <div class="tab-content" align="center">
            <div id="tabs-2" class="tabContent">
                <div class="container">
                    <br/><br/>
                    <form method="post" action="process.jsp">
                        <div class="form-group row">
                            <label for="originalTime" class="col-sm-2 col-form-label">Cancel class for:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="sel1" name="class">
                                    <%
                                        stat = conn.createStatement();
                                        rs = stat.executeQuery("select * from lectures where subject='IWT';");
                                        while (rs.next()) {
                                            day = rs.getInt("day");
                                            slot = rs.getInt("slot");
                                    %>
                                    <option value="<%= day + "-" + slot%>"><%= days[day] + " - " + slots[slot]%></option>
                                    <%
                                        }
                                        rs.close();
                                    %>
                                </select>
                                <br/> <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                           </div>
                </div>
                                
                        
                
                </form>
            </div>
         

            <div class="tab-content" align="center">
                <div id="tabs-3" class="tabContent">
                    <div class="container">
                        <br/><br/>
                        <form action="add.jsp" method="post">

                            <div class="form-group row">
                                <label for="addTime" class="col-sm-2 col-form-label">Add class at:</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="sel1" name="class3">
                                        <%
                                            stat = conn.createStatement();
                                            rs = stat.executeQuery("select * from lectures where subject is NULL;");
                                            while (rs.next()) {
                                                day = rs.getInt("day");
                                                slot = rs.getInt("slot");
                                        %>
                                        <option value="<%= day + "-" + slot%>"><%= days[day] + " - " + slots[slot]%></option>
                                        <%
                                            }
                                            rs.close();
                                        %>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>






            </form>
            </center>
            <br/>
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
                                stat = conn.createStatement();
                                rs = stat.executeQuery("select * from lectures where day=1;");
                                while (rs.next()) {
                            %>
                            <td class="tt-cell">
                                <%= (new String("IWT").equals(rs.getString("subject"))) ? "IWT" : ""%>
                                <%= (rs.getString("subject") == null) ? "*" : ""%>
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
                                <%= (new String("IWT").equals(rs.getString("subject"))) ? "IWT" : ""%>
                                <%= (rs.getString("subject") == null) ? "*" : ""%>
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
                                <%= (new String("IWT").equals(rs.getString("subject"))) ? "IWT" : ""%>
                                <%= (rs.getString("subject") == null) ? "*" : ""%>
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
                                <%= (new String("IWT").equals(rs.getString("subject"))) ? "IWT" : ""%>
                                <%= (rs.getString("subject") == null) ? "*" : ""%>
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
                                <%= (new String("IWT").equals(rs.getString("subject"))) ? "IWT" : ""%>
                                <%= (rs.getString("subject") == null) ? "*" : ""%>
                            </td>
                            <%
                                    }
                                    rs.close();
                                    conn.close();
                                } catch (Exception e) {

                                }
                            %>
                        </tr>

                        </center>

                </table>

                <br/><br/><br/><br/><br/><br/><br/>
                </body>
                </html>