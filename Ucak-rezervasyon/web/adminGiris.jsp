<%-- 
    Document   : giris
    Created on : 17.Oca.2021, 13:50:54
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
        background-color: #9acce3;
        width: 70%;
        height: 100px;
        margin-left : 300px;
        margin-top : 300px;
    }
    p{
        font-family: "Times New Roman", Times, serif;
        font-size:25px;
        margin-right : 50px;
    }
    input{
        font-size: 20px;
    }
     h1{
        text-align: center;
        font-family: "Times New Roman", Times, serif;
        font-size:50px;
    }
</style>
<body>
    <h1>Admin Giris sayfasi </h1>
    
    <form action="loginadmin" method = "post">
        <table>
            <tr>
                <td>
                    <p>Lütfen Adınız ve Soyadınızı Giriniz: </p><br>
                    <input type  ="text" name ="fullname" />
                </td>
            <td>
                <p>Lütfen Emailinizi Giriniz: </p><br>
            <input type ="text" name="email" />
            </td>
            <td>
                <p>Lütfen Sifrenizi Giriniz: </p><br>
            <input type ="password" name="password" />
            </td>
            <td>
                <input type ="submit" value ="sisteme gir"/>
            </td>
            
            </tr>
        </table>        
        </form>
</body>
</html>
