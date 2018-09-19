<%-- 
    Document   : editenews
    Created on : May 3, 2017, 12:23:55 PM
    Author     : ahmed
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/css.css" rel="stylesheet" />
        <script src="js/jquery-3.1.1.js"/>
        <script src="js/bootstrap.min.js"></script>

        <%!
            ResultSet set = null;
            String title = "";
            String details = "";
            String id = "";
            String msg = "";
        %>
        <%
            msg = (String) request.getAttribute("msg");
            if (msg == null) {
                msg = "";
            }
            DBclass.DB db = new DBclass.DB();
            id = request.getParameter("id");
            set = db.selectnewsbyWhere(id);
            if (set.next()) {
                title = set.getString("ntitle");
                details = set.getString("ndetails");
            }
           

        %>
    </head>
    <body>


        <div class="col-md-12 header">


            <h1 class="col-md-10">News</h1>
            <img src="img/logo.png" class="" alt="Securaty" width="80px" height="80px" />

            <nav class="navbar navbar-default nav">
                <div class="container-fluid">
                    <div class="col-lg-12 nav">

                        <ul class="nav nav-tabs">

                            <li role="presentation"><a href="index.jsp">Home</a></li>
                            <li role="presentation" ><a href="addnews2.jsp">Add news</a></li>
                               <li role="presentation" class="active"><a href="#">Edit</a></li>
                            <li role="presentation" ><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div></nav>


        </div>

        <div class="col-md-12 content">
            <div class="col-md-4"></div>
            <div class="col-md-3 form">
                <h2>Edit News Detail</h2>

                <form action="editeservlet" method="post">
                    <input type="text" name="title" value="<%= title%>" class="form-control" id="un" placeholder="News Title">
                    <input type="text" name="id" value="<%= id%>"  hidden="hidden" >
                    <textarea class="form-control" name="details" rows="8" id="un" placeholder="News Details"><%= details%></textarea>

                    <input type="submit" class="btn btn-primary form-control" value="ADD">
                </form>


            </div>   

            <%=msg%>
        </div>


        <div class="col-md-12 fo">
            <div class="col-md-5">  </div>
            <div class="col-md-4 so">  
                <img src="img/f.png" class="im" /> <img src="img/i.png" class="im" /> <img src="img/t.png" class="im" />
            </div>

        </div>
    </body>
</html>
