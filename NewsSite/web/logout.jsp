<%-- 
    Document   : logout
    Created on : May 3, 2017, 12:59:55 PM
    Author     : ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%
        HttpSession ses=request.getSession(false);
        ses.invalidate();
        response.sendRedirect("index.jsp");
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
