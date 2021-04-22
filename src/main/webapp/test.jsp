<%--
  Created by IntelliJ IDEA.
  User: Shreee
  Date: 22-04-2021
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>&lt;sql:param&gt; Demo</title>
</head>
<body>
<h1>&lt;sql:param&gt; Demo</h1>
<form name="newCitizenForm" action="test.jsp" method="POST">
    <table border="0">

        <tr>
            <td> Name:</td>
            <td><input type="text" name="name" />
        </tr>
        <tr>
            <td>Phone Number</td>
            <td><input type="text" name="phno" />
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" /> </td>
        </tr>

        <tr>
            <td><input type="submit" value="Submit"/></td>
        </tr>
    </table>

</form>
<br/><br/>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/phonedirectory"
        user="root"
        password="" />

<c:choose>
    <c:when test="${not empty param.name && not empty param.phno && not empty param.email }">
        <sql:update dataSource="${myDS}" var="newCitizen">
            INSERT INTO phonediary
            (uid,name,email,phone) VALUES (?, ?, ?, ?)
            <sql:param value="${}" />
            <sql:param value="${param.firstName}" />
            <sql:param value="${param.lastName}" />
            <sql:param value="${param.address}" />
            <sql:param value="${param.tel}" />
        </sql:update>
    </c:when>
    <c:otherwise>
        <font color="#cc0000">Please enter mandatory information.</font>
    </c:otherwise>
</c:choose>

<br/><br/>
<sql:query dataSource="${myDS}" var="citizens">
    SELECT * from citizens;
</sql:query>
<table border="1">
    <c:forEach var="row" items="${citizens.rows}">
        <tr>

            <td><c:out value="${row.name}" /></td>
            <td><c:out value="${row.Phno}" /></td>
            <td><c:out value="${row.email}" /></td>

        </tr>
    </c:forEach>
</table>
</body>
</html>