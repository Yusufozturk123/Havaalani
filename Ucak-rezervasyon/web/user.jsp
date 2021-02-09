<%-- 
    Document   : user
    Created on : 08.Şub.2021, 15:06:59
    Author     : lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body{
                    background-image: url(C:/Users/lenovo/Desktop/ucakk.jpg);
                    background-repeat: no-repeat;
            }
            
        table {
        width: 70%;
        border-collapse: collapse;
        text-align: center;
        background-color: #f5f5f5;
        padding: 400px;
}
        tr:hover {background-color: #f5f5f5;}
    </style>

</head>


<body>
    <h1>Ucak Listesi</h1>
   
    <%
        String jdbcURL = "jdbc:mysql://localhost:3306/ucakbileti";
        String jdbcUsername = "root";
        String jdbcPassword = "yusuf";
        
        try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword); 
       Statement stmt = con.createStatement();
       ResultSet rs = stmt.executeQuery("SELECT * FROM ucak");

       while(rs.next()){
       
       
           %>
           <table border = "1" >
              
               <tr >
               
                    <th >   <%= rs.getString(1)%> </th>
                    <th >  <%= rs.getString(2)%> </th>
                    <th >  <%= rs.getString(3)%> </th>
                    <th > <%= rs.getString(4)%> </th>
               
               </tr>
           
    <%
    
    
       }
       %>
       </table>
       <%
        }
        catch(Exception e){
        out.println(e);
}
        %>
    
</body>
</html>
