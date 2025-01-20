<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
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
</head>
<body>
<c:if test="${empty LoginUser}">
<c:redirect url="../login.jsp"></c:redirect>
</c:if>
<%@include file="../components/navbar1.jsp" %>
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="../img/expense3.jpg" class="d-block w-100" alt="..." height="727px">
	    </div>
	    <div class="carousel-item">
	      <img src="../img/expense.jpg" class="d-block w-100" alt="..." height="727px">
	    </div>
	    <div class="carousel-item">
	      <img src="../img/expense4.jpg" class="d-block w-100" alt="..." height="727px">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</body>
</html>