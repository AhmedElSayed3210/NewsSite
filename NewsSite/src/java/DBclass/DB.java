/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBclass;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DB {
    
    private static Connection conn(){
        Connection con=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Newsdata","root","root");
        } catch (ClassNotFoundException ex) {
            System.out.println("conn error");
            
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("url error");
        }
    return con;
    }
    
    public  boolean usersearch(String username,String pass){
    
        boolean flag=false;
        try {
            PreparedStatement ps=conn().prepareStatement("select * from member where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, pass);
            
           ResultSet set= ps.executeQuery();
           if(set.next()){
           flag=true;
           }
           
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
      return flag;
    }
    public  ResultSet selectuser(String username ,String pass){
     ResultSet set=null;
       
        try {
           
            PreparedStatement ps=conn().prepareStatement("select * from member where username=? and password=?");
           ps.setString(1, username);
           ps.setString(2, pass);
           set= ps.executeQuery();
           
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
      return set;
    }
    public  ResultSet selectuserid(String id){
     ResultSet set=null;
        try {
            PreparedStatement ps=conn().prepareStatement("select * from member where id=?");
           ps.setString(1, id);
           set= ps.executeQuery();
           
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
      return set;
    }
    
     public  static boolean adduser(String user,String name,String pass){
         boolean flag=false;
        try {
            PreparedStatement ps=conn().prepareStatement("insert into member (username,password,name) values(?,?,?)");
       ps.setString(1, user);
       ps.setString(2, pass);
       ps.setString(3, name);
    int x= ps.executeUpdate();  
            if (x>0) {
              flag=true;  
            }
        } catch (SQLException ex) {
            System.out.println("*************************          "+ex);
        }
        return flag;
}
    /////////////////////
    
     public static boolean edituser( String id,String user ,String pass ,String name){
        int x=0;
        boolean flag=false;
        try {
            String sql="update member set username=? , password=? , name=? where id='"+Integer.parseInt(id)+"'";
            PreparedStatement ps=conn().prepareStatement(sql);
            
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3,name );
            
            x=ps.executeUpdate();
            if(x==1){
            flag=true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);      
        }
       
    return flag;
    
    }
    
    public static boolean insertnews(String ntitle,String ndetails,String nimage){
    
        boolean flag=false;
        try {
            String sql="insert into news (ntitle , ndetails, nimage,ndate) values (? ,?,?,?)";
            PreparedStatement ps=conn().prepareStatement(sql);
            ps.setString(1, ntitle);
            ps.setString(2, ndetails);
            ps.setString(3, nimage);
            
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            java.util.Date date=new java.util.Date();
            String d=df.format(date);
            
            ps.setString(4, d);
            int x=ps.executeUpdate();
           
           if(x==0){
           flag=false;
           }
           else{
           flag =true;
           }
           
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
      return flag;
    }
  
    public    ResultSet selectallnews(){
        ResultSet set=null;
        try {
            String sql="select * from news order by ndate desc";
            PreparedStatement ps=conn().prepareStatement(sql);
            
            set=ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    return set;
    
    }
    public    ResultSet selectnewsbyWhere(String id){
        ResultSet set=null;
        try {
            String sql="select * from news where id =?";
            PreparedStatement ps=conn().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            set=ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    return set;
    
    }
    public  int deletenews(String id){
        int x=0;
        try {
            String sql="delete  from news where id =?";
            PreparedStatement ps=conn().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            x=ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    return x;
    
    }
    public  int editenews(String id ,String title ,String details){
        int x=0;
        try {
            String sql="update news set ntitle=? , ndetails=? where id =?";
            PreparedStatement ps=conn().prepareStatement(sql);
            
            ps.setString(1, title);
            ps.setString(2, details);
            ps.setInt(3, Integer.parseInt(id));
            x=ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    return x;
    
    }
    
    
    public static void main(String[] args)  {
DB db=new DB();
        ResultSet rs=db.selectuser("root","root");
        try {
            if(rs.next()){
                String user=rs.getString("username");
                String pass=rs.getString("password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
