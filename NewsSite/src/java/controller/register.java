/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBclass.DB;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ahmed ElSayed
 */
public class register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ResultSet set=null;
        
        String user=request.getParameter("username");
        String pass=request.getParameter("password");
        String name=request.getParameter("name");
        String msg=" ";
        HttpSession ses=request.getSession(true);
          
        DB db=new DB();
        if (name !=null && user!=null&& pass!=null &&name !="" && user!=""&& pass!="") {
        Boolean flag=db.adduser(user,name,pass);
          if(flag==true){
             response.sendRedirect("login.jsp");
            
          }else{
           msg=" Not Added ";
            request.setAttribute("msg", msg);
            request.setAttribute("user", user);
            request.setAttribute("name", name);
            response.sendRedirect("register.jsp");
           }
    }else{
          msg=" Must Complete All ";
            request.setAttribute("msg", msg);
            request.setAttribute("user", user);
            request.setAttribute("name", name);
            response.sendRedirect("register.jsp");
        }
       // rd.forward(request, response);
    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
