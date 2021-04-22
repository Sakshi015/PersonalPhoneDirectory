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
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<h1>SignUp Page</h1>
<hr>
<br/>
<br/>
<br/>
<div id="signup">
    <form action="check.jsp" method="post">
    Username:
    <input type="text" name="name" ><br/><br/>
    Email:
    <input type="text" name="email"> <br/> <br/>
    Password:
    <input type="pass" name="password"> <br/><br>
    Phone Number:
    <input type="text" name="phno"> <br/><br/>
    <input type="submit" name="submit">
    </form>
</div>
</body>
</html>
