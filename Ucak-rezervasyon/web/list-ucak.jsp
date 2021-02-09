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
                    widht:20px;
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
                
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/listUcak">Ucak Listesi</a></li>
                    </ul>
                
            </header>
            <br>

            <div >
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                
                    <h3 >Ucak Listesi</h3>
                    <hr>
                    <div >

                        <a href="<%=request.getContextPath()%>/newUcak" >Yeni Ucak Ekle</a>
                    </div>
                    <br>
                    <table>
                        <thead>
                            <tr>
                                <th>Ucak ID</th>
                                <th>KALKIS</th>
                                <th>INIS</th>
                                <th>TARIH</th>
                                <th>Eylemler</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach var="ucak" items="${listUcak}">

                                <tr>
                                    <td>
                                        <c:out value="${ucak.iducak}" />
                                    </td>
                                    <td>
                                        <c:out value="${ucak.kalkis}" />
                                    </td>
                                    <td>
                                        <c:out value="${ucak.inis}" />
                                    </td>
                                    <td>
                                        <c:out value="${ucak.tarih}" />
                                    </td>
                                    <td><a href="editucak?iducak=<c:out value='${ucak.iducak}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="deleteUcak?iducak=<c:out value='${ucak.iducak}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                
            </div>
        </body>

        </html>
   