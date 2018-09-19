

<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="DBclass.DB"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            String fn="";
        %>
        <%
            
       
        
         MultipartRequest mp=null;
         try {
             mp = new MultipartRequest(request, getServletContext().getRealPath("/image/"),200 *2048 * 2048,new FileRenamePolicy() {

                    @Override
                    public File rename(File file) {
                       System.out.println(file.getName()); 
                        fn=file.getName();
                        return file;
                    }
                });
         
        
          title = mp.getParameter("title");
          details = mp.getParameter("details");
         DBclass.DB db=new DB();
         boolean flag=db.insertnews(title, details, fn);
        
         if(flag==true){
         msg="news Add successfully";
         }else{
         msg="news not added";
         }
        } catch (IOException ex) {
             
             System.out.println(ex.getMessage());
         }
         catch(NullPointerException e){}
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
                            <li role="presentation" class="active"><a href="#">Login</a></li>
                            <li role="presentation"><a href="#">register</a></li>
                        </ul>
                    </div>
                </div></nav>


        </div>

        <div class="col-md-12 content">
            <div class="col-md-4"></div>
            <div class="col-md-3 form">
                <h2>ADD News</h2>
                <form method="post" action="addnews.jsp" enctype="multipart/form-data">
                    <input type="text" name="title" value="<%=title%>" class="form-control" id="un" placeholder="News Title">
                    <textarea class="form-control" value="<%= details%>" name ="details" rows="8" id="un" placeholder="News Details"></textarea>
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
