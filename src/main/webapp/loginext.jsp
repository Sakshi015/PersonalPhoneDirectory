<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%! String name,password;

%>
<%
        name= request.getParameter("name");
        password= request.getParameter("password");
%>

    <sql:setDataSource
            var="db"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/phonedirectory"
            user="root"
            password="" />

    <sql:query var="rs" dataSource="${db}"  >
        select * from userdata where name=? and  password=?   ;
        <sql:param value="${param.name}"/>

        <sql:param value="${param.password}"/>

    </sql:query>
    <c:out value="${rs.rowCount}"/>
<c:choose>
    <c:when test="${rs.rowCount == 1}">
        <center ><h1 style="background-color:green">Login Successfully</h1><hr/></center>
        <c:forEach var="row" items="${rs.rows}">

            <c:set var="id" scope="session" value="${row.id}" />



        </c:forEach>
        <jsp:forward page="useracc.jsp"/>

    </c:when>
    <c:otherwise>
        <center ><h1 style="background-color:red">Something went wrong</h1><hr/></center>

        <jsp:include page="login.jsp"/>
    </c:otherwise>
</c:choose>
</body>
</html>
