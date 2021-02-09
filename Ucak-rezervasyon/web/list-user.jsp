<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <style>
                body{
                    background-image: url(C:/Users/lenovo/Desktop/ucakk.jpg);
                    background-repeat: no-repeat;
                }
                label{
                    font-size:20px;
                }
                p{
                    text-align:center;
                    font-size:35px;
                    font-family: "Times New Roman", Times, serif;
                    
                }
                .form-group{
                    margin-left: 30px;
                    margin-top: 50px;
                    margin-right: 30px;
                    background-color: darkturquoise;
                }
                b{
                    text-align:center;
                    font-size:20px;
                    
                    margin-left:30px;
                }
                a{
                    font-size:30px;
                    text-decoration: none;
                    color:white;
                }
                li{
                    font-size:30px;
                }
                th{
                    font-size:30px;
                }
                td{
                    font-size:30px;
                    margin-rigt:20px;
                }
            </style>
             
        </head>

        <body>

            <header>
                
                    <div>
                        <a href="admin.jsp" > Admin Paneli </a>
                    </div>

                    <ul >
                        <li><a href="<%=request.getContextPath()%>/list" >Users</a></li>
                    </ul>
               
            </header>
            <br>

            <div >
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div >
                    <h3>Kullanıcı Listesi</h3>
                    <hr>
                    <div >

                        <a href="<%=request.getContextPath()%>/new" >Yeni Kullanıcı Ekle</a>
                    </div>
                    <br>
                    <table >
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>SIFRE</th>
                                <th>Eylemler</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:forEach var="user" items="${listUser}">

                                <tr>
                                    <td>
                                        <c:out value="${user.id}" />
                                    </td>
                                    <td>
                                        <c:out value="${user.fullname}" />
                                    </td>
                                    <td>
                                        <c:out value="${user.email}" />
                                    </td>
                                    <td>
                                        <c:out value="${user.password}" />
                                    </td>
                                    <td><a href="edit?id=<c:out value='${user.id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody> 

                    </table>
                </div>
            </div>
        </body>

        </html>
   