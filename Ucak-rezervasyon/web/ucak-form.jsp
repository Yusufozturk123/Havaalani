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
            </style>
            
        </head>

        <body>

            <header>
                

                    <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/listUcak" class="nav-link">Ucak Listesi</a></li>
                    </ul>
                
            </header>
            <br>
            
                
                    
                        <c:if test="${ucak != null}">
                            <form action="updateUcak" method="post">
                        </c:if>
                        <c:if test="${ucak == null}">
                            <form action="insertUcak" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${ucak != null}">
                                    Ucak Duzenle
                                </c:if>
                                <c:if test="${ucak == null}">
                                   <p> Yeni Ucak Ekle</p>
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${ucak != null}">
                            <input type="hidden" name="iducak" value="<c:out value='${ucak.iducak}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Ucak kalkis</label> <input type="text" value="<c:out value='${ucak.kalkis}' />" class="form-control" name="kalkis" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Ucak inis</label> <input type="text" value="<c:out value='${ucak.inis}' />" class="form-control" name="inis">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Ucak tarih</label> <input type="text" value="<c:out value='${ucak.tarih}' />" class="form-control" name="tarih">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <button type="submit" ><b>Kaydet</b></button>
                        </fieldset>
                        </form>
                    
                
          
        </body>

        </html>