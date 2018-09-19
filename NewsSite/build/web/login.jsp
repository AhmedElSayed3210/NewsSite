
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/css.css" rel="stylesheet" />
        <script src="js/jquery-3.1.1.js"/>
        <script src="js/bootstrap.min.js"></script>
        <%!
            String name = "";
            String msg = null;
        %>
        <%
            msg = (String) request.getAttribute("msg");
            if (msg != null) {

                name = request.getParameter("name");
            } else {
                msg = "";

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

                            <li role="presentation" ><a href="index.jsp">Home</a></li>
                            <li role="presentation" class="active"><a href="#">Login</a></li>
                            <li role="presentation"><a href="register.jsp">Register </a></li>

                        </ul>
                    </div>
                </div></nav>


        </div>

        <div class="col-md-12">
            <div class="col-md-4"></div>
            <div class="col-md-3 form">
                <h2>Login</h2>

                <form method="POST" action="loginservlet" >

                    <input type="text" name="name" class="form-control" id="un" placeholder="User Name" value="<%=name%>">
                    <input type="password" name="pass" class="form-control" id="un" placeholder="Password">
                    <input type="submit" class="btn btn-primary form-control" value="Submit">
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