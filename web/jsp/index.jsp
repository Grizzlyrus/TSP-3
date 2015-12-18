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
    <link rel="stylesheet" href="html/style.css">
</head>
<body>
<h1>Web Application</h1>

<p>
    Сложение двух чисел
</p>
<form action="index.jsp" id="myForm" method="get">
    <fieldset>
        <legend>Сложение двух чисел</legend>
        <p>
            <label for="firstNumber">Первое число</label>
            <input type="number" id="firstNumber" name="firstNumber" placeholder="Введите первое число" autofocus required
                    <c:set var="num1" scope="session" value="${param.firstNumber}"/>
                    <c:if test="${not empty paramValues}">
                        <c:choose>
                            <c:when test="${empty num1}">
                                class="exceptionForm"
                                <% System.out.println("Ошибка, пустое число");%>
                            </c:when>
                            <c:otherwise>
                                <jsp:setProperty name="actionBean" property="firstNumber" value="${num1}"/>
                                <% System.out.println("Сохранение числа 1 в бин");%>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    />
        </p>

        <p>
            <label for="secondNumber">Второе число</label>
            <input type="number" id="secondNumber" name="secondNumber" placeholder="Введите второе число"
                    <c:set var="num2" scope="session" value="${param.secondNumber}"/>
                    <c:if test="${not empty paramValues}">
                        <c:choose>
                            <c:when test="${empty num2}">
                                class="exceptionForm"
                                <% System.out.println("Ошибка, пустое число");%>
                            </c:when>
                            <c:otherwise>
                                <jsp:setProperty name="actionBean" property="secondNumber" value="${num2}"/>
                                <jsp:setProperty name="actionBean" property="ok" value="true"/>
                                <% System.out.println("Сохранение числа 2 в бин, установка ОК");
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
        } else if(num.indexOf("e") != -1 || num.indexOf("е") != -1){
            input.setCustomValidity("Не поддерживаю запись через мантиссу");
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
