
<%--
  Created by IntelliJ IDEA.
  User: Shreee
  Date: 22-04-2021
  Time: 19:20
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
    <title>Title</title>
</head>
<body>

<c:out value="${param.cid}"/>
<sql:setDataSource
        var="db"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/phonedirectory"
        user="root"
        password="" />

<sql:update var="rs" dataSource="${db}"  >
    delete from phonediary where sno=? ;
    <sql:param value="${param.cid}"/>
</sql:update>
<jsp:forward page="useracc.jsp"></jsp:forward>


</body>
</html>
