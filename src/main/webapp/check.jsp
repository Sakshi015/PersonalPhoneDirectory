<%--
  Created by IntelliJ IDEA.
  User: Shreee
  Date: 22-04-2021
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%! String name,password,email,phno;
    int id;
%>
<%
     name= request.getParameter("name");
     password= request.getParameter("password");
     email= request.getParameter("email");
     phno=request.getParameter("phno");
%>
<sql:setDataSource
        var="db"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/phonedirectory"
        user="root"
        password="" />

<sql:query var="rs" dataSource="${db}"  >
    select * from userdata where name=? or email=? or password=?   ;
    <sql:param value="${param.name}"/>
    <sql:param value="${param.email}}"/>
    <sql:param value="${param.password}"/>

</sql:query>
<c:choose>
    <c:when test="${rs.rowCount == 0}">
    <sql:update dataSource="${db}" var="count" >
        insert into userdata(name,email,password,phno) Values(?,?,?,?);
        <sql:param value="${param.name}"/>
        <sql:param value="${param.email}}"/>
         <sql:param value="${param.password}"/>
        <sql:param value="${param.phno}"/>
    </sql:update>
        <sql:query var="rs" dataSource="${db}"  >
            select id from userdata where name=? and email=? and password=?   ;
            <sql:param value="${param.name}"/>
            <sql:param value="${param.email}}"/>
            <sql:param value="${param.password}"/>

        </sql:query>
        <c:choose>
            <c:when test="${rs.rowCount == 1}">
                <c:forEach var="row" items="${rs.rows}">

                    <c:set var="id" scope="session" value="${row.id}" />



                </c:forEach>

            <jsp:forward page="useracc.jsp"></jsp:forward>
            </c:when>

        </c:choose>

    </c:when>
    <c:otherwise>
        <center ><h1 style="background-color:red">Something went wrong</h1><hr/></center>
        <jsp:include page="signup.jsp"/>
    </c:otherwise>
</c:choose>


</body>
</html>
