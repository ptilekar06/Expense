<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="com.servlet.SaveExpenseServlet"%>
<%@page import="com.entity.Expense"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/all_css.jsp" %>
<style type="text/css">
.card-sh{
box-shadow:0 0 6px 0 rgba(0,0,0,0,3);
}
</style>
</head>
<body class="bg-dark">
<%
int id=Integer.parseInt(request.getParameter("id"));
ExpenseDAO dao=new ExpenseDAO(HibernateUtil.getSessionFactory());
Expense ex=dao.getExpenseById(id);

%>
<%@include file="../components/navbar1.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-header text-center">
<p class="fs-3"><center><h2>Edit Expense</h2></center></p>
</div>
<div class="card-body">
<form action="../update" method="post">
<div class="mb-3">
<label><h6>Title</h6></label>
<input type="text" name="title" class="form-control" value="<%=ex.getTitle() %>") >
</div>
<div class="mb-3">
<label><h6>Date</h6></label>
<input type="date" name="date" class="form-control" value="<%=ex.getDate() %>">
</div>
<div class="mb-3">
<label><h6>Price</h6></label>
<input type="number" name="price" class="form-control" value="<%=ex.getPrice() %>">
</div>
<div class="mb-3">
<label><h6>Description</h6></label>
<input type="text" name="description" class="form-control" value="<%=ex.getDescr() %>">
</div>
<input type="hidden" name="id" value="<%=ex.getId()%>">
<button class="btn btn-outline-dark col-md-12">Update</button>
</form>
</div>
</div></div>
</div>
</div>
</body>
</html>