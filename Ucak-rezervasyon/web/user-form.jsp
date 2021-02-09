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
            </style>
            
        </head>

        <body>

            <header>
                

                    <ul>
                        <li><a href="<%=request.getContextPath()%>/list" >Kullanıcılar</a></li>
                    </ul>
                
            </header>
            <br>
            <div>
                <div>
                    <div>
                        <c:if test="${user != null}">
                            <form action="update" method="post">
                        </c:if>
                        <c:if test="${user == null}">
                            <form action="insert" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${user != null}">
                                    Kullanıcı Duzenle
                                </c:if>
                                <c:if test="${user == null}">
                                    Kullanıcı Ekle
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${user != null}">
                            <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Kullanıcı Adı</label> <input type="text" value="<c:out value='${user.fullname}' />" class="form-control" name="fullname" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Kullanıcı Email</label> <input type="text" value="<c:out value='${user.email}' />" class="form-control" name="email">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Kullanıcı Sifre</label> <input type="text" value="<c:out value='${user.password}' />" class="form-control" name="password">
                        </fieldset>
                           
                        <button type="submit" ><b>Kaydet</b></button>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>