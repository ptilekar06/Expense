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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<c:if test="${empty LoginUser}">
<c:redirect url="../login.jsp"/>
</c:if>
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
<p class="fs-3"><center><h2>Set Your Budget</h2></center></p>
</div>
<c:if test="${not empty mesg }">
<p class="text-center text-success fs-4">${mesg }</p>
<c:remove var="mesg"/>
</c:if>
<div class="card-body">
<form action="../saveExpense" method="post">
<div class="mb-3">
<label><h6>Amount</h6></label>
<input type="text" name="amt" class="form-control">
</div>
<div class="mb-3">
<label><h6>Date</h6></label>
<input type="date" name="date" class="form-control">
</div>
<div class="mb-3">
<label><h6>Last Saved Amount</h6></label>
<input type="text" name="description" class="form-control">
</div>
<button class="btn btn-outline-dark col-md-12">Set</button>
</form>
</div>
</div></div>
</div>
</div>
</body>
</html>