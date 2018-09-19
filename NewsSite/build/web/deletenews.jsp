<%-- 
    Document   : deletenews
    Created on : May 3, 2017, 12:16:17 PM
    Author     : ahmed
--%>

<%@page import="DBclass.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
        
        DBclass.DB db=new DB();
        String id =request.getParameter("id");
         db.deletenews(id);
         response.sendRedirect("index.jsp");
        %>
    </head>
    <body>
        
    </body>
</html>
