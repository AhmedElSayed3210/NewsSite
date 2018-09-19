

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
        
        ResultSet set=null;
        String name;
        String userid="";
        %>
        <%
        HttpSession ses=request.getSession(false);
        name=(String)ses.getAttribute("name");
        userid=(String)ses.getAttribute("userid");
       
        DBclass.DB db=new DBclass.DB();
        set=db.selectallnews();
                
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
                            <li role="presentation" class="active"><a href="#">Home</a></li>
                            <% if (name== null){%><li role="presentation"><a href="login.jsp">Login</a></li><%}%>
                            <% if (name== null){%><li role="presentation"><a href="register.jsp">Register</a></li><%}%>
                           
                            <% if (name!= null){%><li role="presentation"><a href="addnews2.jsp">Add News</a></li><%}%>
                            <% if (name!= null){%><li role="presentation"><a href="singup.jsp">User Account</a></li><%}%>
                             <% if (name!= null){%><li role="presentation"><a href="logout.jsp">Logout</a></li><%}%>
                        </ul>
                    </div>
                </div></nav>




        </div>

        <div class="col-md-12 content">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                
                
                <%while(set.next()){ %>
                <div class="col-md-12 news">
                    <div class="col-md-12">

                        <div class="col-md-10 title"><a href="details.jsp?id=<%=set.getString("id") %>"><%= set.getString("ntitle") %></a></div>
                        
                        <% if(name !=null){ %>
                        
                        <div class="col-md-1"><a href="editenews.jsp?id=<%=set.getString("id") %>"><img src="img/ed1.ico"></a></div>
                        <div class="col-md-1"><a href="deletenews.jsp?id=<%=set.getString("id") %>"><img src="img/d1.png"></a></div>

                        <%}%>
                    </div>
                    <div class="col-md-12 date"><%= set.getString("ndate") %></div>
                    <div class="col-md-12"><img src="image/<%= set.getString("nimage") %>" class="col-md-12 nimg" width="800" height="250"></div>

                </div>
                <%}%>


                


               


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
