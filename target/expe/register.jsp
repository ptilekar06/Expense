<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<p class="text-center fs-3 "><center><h2>Registeration</h2></center></p>
</div>
<div class="card-body">
<form action="register"  method="post">
<div class="mb-3">
<label> <h5>Enter full name</h5> </label>
<input type="text" name="fullname" class="form-control">
</div>
<div class="mb-3">
<label> <h5>Email</h5> </label>
<input type="email" name="email" class="form-control">
</div>
<div class="mb-3">
<label> <h5>Password</h5> </label>
<input type="password" name="password" class="form-control">
</div>
<button class="btn btn-outline-dark col-md-12"><h6>Register	</h6></button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>>