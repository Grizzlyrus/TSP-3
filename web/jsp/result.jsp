<%@ page import="classes.ActionBean" %>
<%--
  Created by IntelliJ IDEA.
  User: Den
  Date: 25/09/15
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="actionBean" scope="session" class="classes.ActionBean"/> --%>
<%ActionBean actionBean = (ActionBean) session.getAttribute("actionBean");%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web Application</title>
    <link rel="stylesheet" href="html/style.css">
    <%--<c:if test="${not empty actionBean.firstString and not empty actionBean.result}">--%>
    <% if (actionBean == null){%>
    <meta http-equiv="refresh" content="5; URL=/jsp/index.jsp"/>
    <%}%>
    <%--</c:if>--%>
</head>
<body>
<h1>Web Application</h1>

<p>
    1111
</p>

<form action="" method="post">
    <fieldset>
        <legend>Сложение двух чисел</legend>
        <%--<c:if test="${not empty actionBean.firstString and not empty actionBean.result}">--%>
        <% if(actionBean != null){%>
        <p>
            <label for="firstNumber">Число1:</label>

        <p id="firstNumber" name="firstNumber">
        <%= actionBean.getFirstNumber()%>
            <%--<jsp:getProperty name="actionBean" property="firstString"/>--%>
        </p>
        </p>
        <p>
            <label for="secondNumber">Число2:</label>

        <p id="secondNumber" name="secondNumber">
        <%= actionBean.getSecondNumber()%>
            <%--<jsp:getProperty name="actionBean" property="numberString"/>--%>
        </p>
        </p>
        <p>
            <label for="result">Результат</label>

        <p id="result" name="number">
        <%= actionBean.getResult()%>
            <%-- <jsp:getProperty name="actionBean" property="result"/>--%>
        </p>
        </p>
        <%} else {%>
        <p>Объекта не существует :(</p>
        <p>Перенаправление на начальную страницу произойдет через 5 секунд</p>
        <%}%>
        <%--</c:if>--%>
        <%-- <c:otherwise>
        <a href="/jsp/index.jsp">Переход на главную страницу</a>
        <% new Thread().sleep(5000);
        application.getRequestDispatcher("/jsp/index.jsp").forward(request, response); %>
        </c:otherwise> --%>
    </fieldset>
    <%if(actionBean != null){%>
    <p><a href="/result.xml">Скачать результат</a></p>
    <%}%>
    <p><a href="/jsp/index.jsp">Возврат на исходную страницу</a></p>
</form>
</body>
</html>
