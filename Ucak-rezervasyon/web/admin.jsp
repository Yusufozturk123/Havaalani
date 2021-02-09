<%-- 
    Document   : admin
    Created on : 07.Şub.2021, 14:59:09
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
        width: 500px;
        height: 500px;
        text-align: center;
        margin-left: 700px;
        margin-top: 190px;
    }
    
    a{
        color:black;
        text-decoration: none;
        font-family: "Times New Roman", Times, serif;
        font-size:27px;
    }
    #ekle{
        background-color: #ca66de;
    }
    #listele{
        background-color: #ca66de;
    }
    #uekle{
        background-color: #36b2eb;
    }
    #ulistele{
        background-color: #36b2eb;
    }
    h1{
        text-align: center;
        font-family: "Times New Roman", Times, serif;
        font-size:50px;
    }
    
    p{
        text-align:center;
        font-family: "Times New Roman", Times, serif;
        font-size:25px;
    }
</style>
<body>
    <h1>Admin Kontrol Paneli</h1>
    <p>${admin.fullname} Hosgeldiniz </p>   
    <table border ="1">
        <tr>
            <td id="ekle"> <a href="<%=request.getContextPath()%>/new">Personel Ekle </a></td>
            <td id="listele"> <a href="<%=request.getContextPath()%>/list">Personelleri Listele</a></td>
        </tr>
        <tr>
            <td id="uekle"> <a href="<%=request.getContextPath()%>/newUcak">Ucak Ekle</a></td>
            <td id="ulistele"> <a href="<%=request.getContextPath()%>/listUcak">Ucakları Listele</a></td>
        </tr>
    </table>
    
    
</body>
</html>
