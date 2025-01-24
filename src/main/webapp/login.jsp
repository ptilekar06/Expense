<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/all_css.jsp" %>
<style type="text/css">
.card-sh{
box-shadow:0 0 6px 0 rgba(0,0,0,0,3);
}
</style>
</head>
<body class="bg-dark">
<%@include file="components/navbar.jsp" %>

<div class ="container">

<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card card-sh">
<div class="card-header">
<p class="text-center fs-3 "><center><h2>Login</h2></center></p>
<c:if test="${not empty msg }">
<p class="text-center text-danger fs-4">${msg }</p>
<c:remove var="msg"/>
</c:if>
<c:if test="${empty msgs }">
<p class="text-center text-primary fs-4">${msgs }</p>
<c:remove var="msgs"/>
</c:if>
<c:if test="${not empty mesg }">
<p class="text-center text-success fs-4">${mesg }</p>
<c:remove var="mesg"/>
</c:if>
</div>
<div class="card-body">
<form action="login" method="post">
<div class="mb-3">
<label> <h6>Email</h6> </label>
<input type="email" name="email" class="form-control" value="${email }">
</div>
<div class="mb-3">
<label> <h6>Password</h6> </label>
<input type="password" name="password" class="form-control" value="${password }">
</div>

<button class="btn btn-outline-dark col-md-12">Sign in</button>
<div class="text-center mt-2">Don't have an account <a href="register.jsp" class="text-decoration-name">create one</a></div>

</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>>