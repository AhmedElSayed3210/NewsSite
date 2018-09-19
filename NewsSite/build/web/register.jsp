
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/css.css" rel="stylesheet" />
        <script src="js/jquery-3.1.1.js"/>
        <script src="js/bootstrap.min.js"></script>
        <%!
            String username =null;
            String password = null;
            String name = null;
            String msg = " ";

        %>
        <%

            msg = (String) request.getAttribute("msg");
            username = (String) request.getAttribute("user");
            name = (String) request.getAttribute("name");
            if (msg == null) {
                msg = "";
                username = "";
                name = "";
                password = "";
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
                            <li role="presentation" ><a href="login.jsp">Login</a></li>
                            <li role="presentation" class="active"><a href="#">Register </a></li>
                        </ul>
                    </div>
                </div></nav>


        </div>

        <div class="col-md-12">
            <div class="col-md-4"></div>
            <div class="col-md-3 form">
                <h2>New Account</h2>

                <form method="post" action="register">
                    <input type="text" name="name" class="form-control" id="un" placeholder="Name" value="<%=name%>">
                    <input type="text" name="username" class="form-control" id="un" placeholder="User Name" value="<%=username%>">

                    <input type="password" name="password" class="form-control" id="un" placeholder="Password" value="<%=password%>">


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