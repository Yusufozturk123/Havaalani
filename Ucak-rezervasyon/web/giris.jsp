<%-- 
    Document   : giris
    Created on : 08.Şub.2021, 17:19:52
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<style>
    
    body{
        background-image: url(C:/Users/lenovo/Desktop/ucakk.jpg);
        background-repeat: no-repeat;
    }
    table{
        margin-left: 640px;
        margin-top: 300px;
        
    }
        
    #admin{
        background-color: white;    
        height: 300px;
        width: 300px;
        text-align: center;
        
    }
    #user{
        background-color: white;     
        height: 300px;
        width: 300px;
        text-align: center;
        
    }
    a{
        color:black;
        text-decoration: none;
        font-family: "Times New Roman", Times, serif;
        font-size:27px;
    }
    h1{
        text-align: center;
        font-family: "Times New Roman", Times, serif;
        font-size:50px;
    }
    
    
   
</style>
<body>
    <h1>Ucak Bileti Rezervasyon Sistemine hosgeldiniz</h1>
    <table border ="1">
        
        <tr>
            <td id ="admin">
                <a href ="adminGiris.jsp" id="admina" > Admin Giris </a> 
            </td> 
            <td id = "user"> 
                <a href ="userGiris.jsp" > Kullanıcı Giris </a> 
            </td> 
           
        </tr>
        
    </table>
</body>
</html>
