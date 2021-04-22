
<%@ page import="java.io.PrintWriter" %>
<%--
  Created by IntelliJ IDEA.
  User: Shreee
  Date: 22-04-2021
  Time: 17:29
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
    <title></title>
</head>
<body id="phonediary">
<h1>Your Phone Directory</h1>
<form name="newCitizenForm" action="useracc.jsp" method="POST">
    <table border="0">

        <tr>
            <td> Name:</td>
            <td><input type="text" name="uname" />
        </tr>
        <tr>
            <td>Phone Number</td>
            <td><input type="text" name="uphno" />
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="uemail" /> </td>
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
    <c:when test="${not empty param.uname && not empty param.uphno && not empty param.uemail }">
        <sql:update dataSource="${myDS}" var="newCitizen">
            INSERT INTO phonediary
            (userid,name,email,phno) VALUES (?, ?, ?, ?);
            <sql:param value="${sessionScope.id}" />
            <sql:param value="${param.uname}" />
            <sql:param value="${param.uemail}" />
            <sql:param value="${param.uphno}" />

        </sql:update>
    </c:when>
    <c:otherwise>
        <font color="#cc0000">Please enter mandatory information.</font>
    </c:otherwise>
</c:choose>

<br/><br/>
<sql:query dataSource="${myDS}" var="phonediary">
    SELECT * from phonediary Where userid=${sessionScope.id};
</sql:query>
<table border="1px SOLID BLACK">
    <tr><th>name</th>
        <th>phone</th>
        <th>email</th>
        <th>delete</th></tr>
    <c:forEach var="row" items="${phonediary.rows}">
        <tr>

            <td><c:out value="${row.name}" /></td>
            <td><c:out value="${row.phno}" /></td>
            <td><c:out value="${row.email}" /></td>
            <td><button><a href="aa.jsp?cid=${row.sno}">delete</a></button></td>

        </tr>
    </c:forEach>
</table>
</body>
</html>


