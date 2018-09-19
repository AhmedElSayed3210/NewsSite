<%-- 
    Document   : addnews2
    Created on : Apr 28, 2017, 11:13:29 AM
    Author     : ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>




<!DOCTYPE html>
<html>

    <head>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/css.css" rel="stylesheet" />
        <script src="js/jquery-3.1.1.js"/>
        <script src="js/bootstrap.min.js"></script>
        <%!
            String title = "";
            String details = "";
            String msg = "";
            
        %>
        <%
        msg=(String)request.getAttribute("msg");
        if(msg!=null){
        
        title=(String)request.getAttribute("title");
        details=(String)request.getAttribute("details");
        }else{
        msg="";
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
                            <li role="presentation" class="active"><a href="addnews2.jsp">Add news</a></li>
                            <li role="presentation" ><a href="index.jsp">Edit</a></li>
                            <li role="presentation" ><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div></nav>


        </div>

        <div class="col-md-12 content">
            <div class="col-md-4"></div>
            <div class="col-md-3 form">
                <h2>ADD News</h2>
                <form method="post" action="addnewsservlet" enctype="multipart/form-data">
                    <input type="text" name="title" value="<%=title%>" class="form-control" id="un" placeholder="News Title">
                    <textarea class="form-control"  name ="details" rows="8" id="un" placeholder="News Details"><%= details %></textarea>
                    <input type="file" name="fname"  class="form-control" id="un" placeholder="News Image"/>
                    <input type="submit" class="btn btn-primary form-control" value="ADD">
                </form>

                <div class="col-md-12"><%=msg%></div>
            </div>   

        </div>


        <div class="col-md-12 fo">
            <div class="col-md-5">  </div>
            <div class="col-md-4 so">  
                <img src="img/f.png" class="im" /> <img src="img/i.png" class="im" /> <img src="img/t.png" class="im" />
            </div>

        </div>
    </body>
</html>

