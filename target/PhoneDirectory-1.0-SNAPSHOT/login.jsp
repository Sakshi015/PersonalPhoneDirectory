<%--
  Created by IntelliJ IDEA.
  User: Shreee
  Date: 22-04-2021
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>

<h1 style="margin-left: auto">Login Page</h1>

<hr>
<br/>
<br/>
<br/>
<div id="login">

    <form action="loginext.jsp" method="post">
        Name:
        <input type="text" name="name" ><br/><br/><br/>
        Password:
        <input type="password" name="password"><br/><br/><br/>
        <input type="submit" value="submit">
    </form>
</div>
</body>
</html>
