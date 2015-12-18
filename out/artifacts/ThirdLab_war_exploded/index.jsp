<%@ page import="java.util.Map" %>
<%@ page import="java.util.Collection" %>
<%--
  Created by IntelliJ IDEA.
  User: Den
  Date: 09/09/15
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="actionBean" scope="session" class="classes.ActionBean"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>Web Application</title>
    <link rel="stylesheet" href="web\jsp\html\style.css">
</head>
<body>
<h1>Web Application</h1>

<p>
    Удаление концевых символов (первый аргумент – строка, второй – количество символов, которые надо удалить, результат
    – уменьшенная строка)
</p>
<form action="index.jsp" id="myForm" method="get">
    <fieldset>
        <legend>Удаление концевых символов</legend>
        <p>
            <label for="firstString">Строка</label>
            <input type="text" id="firstString" name="firstString" placeholder="Введите строку" autofocus required
                    <c:set var="str" scope="session" value="${param.firstString}"/>
                    <c:if test="${not empty paramValues}">
                        <c:choose>
                            <c:when test="${empty str}">
                                class="exceptionForm"
                                <% System.out.println("Ошибка, пустое предложение");%>
                            </c:when>
                            <c:otherwise>
                                <jsp:setProperty name="actionBean" property="firstString" value="${str}"/>
                                <% System.out.println("Сохранение предложения в бин");%>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    />
        </p>

        <p>
            <label for="numberString">Число</label>
            <input type="number" id="numberString" name="numberString" placeholder="Введите число"
                    <c:set var="num" scope="session" value="${param.numberString}"/>
                    <c:if test="${not empty paramValues}">
                        <c:choose>
                            <c:when test="${empty num}">
                                class="exceptionForm"
                                <% System.out.println("Ошибка, пустое число");%>
                            </c:when>
                            <c:otherwise>
                                <jsp:setProperty name="actionBean" property="numberString" value="${num}"/>
                                <jsp:setProperty name="actionBean" property="ok" value="true"/>
                                <%
                                    Map<String, String[]> map = request.getParameterMap();
                                    for (Map.Entry<String, String[]> entry : map.entrySet()) {
                                        String name = entry.getKey();
                                        String[] values = entry.getValue();
                                        System.out.print(name + ": ");
                                        for(String s: values){
                                            System.out.println(s);
                                        }
                                    }%>
                                <% System.out.println("Сохранение числа в бин, установка ОК");
                                    System.out.println(actionBean.isOk());%>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    />
        </p>
    </fieldset>
    <!--<p>
    <input type="submit" value="Подтвердить"/>
    </p> -->
    <% System.out.println(actionBean.isOk());%>
    <c:if test="${actionBean.ok}">
        <% System.out.println("Начало отсылки на другую страницу");%>
        <% application.getRequestDispatcher("/jsp/result.forward").forward(request, response); %>
        <%-- <jsp:forward page="result.html"/> --%>
        <% System.out.println("Конец отсылки на другую страницу");%>
        <jsp:setProperty name="actionBean" property="ok" value="false"/>
    </c:if>
    <p>
        <button class="submit" type="submit" onclick="validate()">Подтвердить</button>
    </p>
</form>
<script>
    function validate() {
        var input = document.getElementById("numberString");
        var num = input.value;
        var inputText = document.getElementById("firstString");
        var textString = inputText.value;
        if (num == "") {
            input.setCustomValidity("Введите число");
        } else if (num < 0) {
            input.setCustomValidity("Число не должно быть отрицательным");
        } else if (num > textString.length) {
            input.setCustomValidity("Число не должно превышать длину строки");
        } else if (num.indexOf(".") != -1) {
            input.setCustomValidity("Введите целое число");
        } else {
            input.setCustomValidity("");
        }
        if (textString == "") {
            inputText.setCustomValidity("Строка не должна быть пустой");
        } else {
            inputText.setCustomValidity("");
        }
    }
</script>
</body>
</html>
