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
<style type="text/css">
.card-sh{
box-shadow:0 0 6px 0 rgba(0,0,0,0,3);
}
</style>
</head>
<body class="bg-dark">
	<c:if test="${empty LoginUser}">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
<%@include file="../components/navbar1.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-8 offset-md-2">
<div class="card">
<div class="card-header text-center">
<p class="fs-3"><center><h2>All Expenses</h2></center></p>
</div>
<c:if test="${not empty mesg }">
<p class="text-center text-success fs-4">${mesg }</p>
<c:remove var="mesg"/>
</c:if>
<div class="card-body">
<table class="table table-light table-striped">
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Description</th>
      <th scope="col">Date</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  
  User user=(User)session.getAttribute("LoginUser");
  ExpenseDAO dao=new ExpenseDAO(HibernateUtil.getSessionFactory());
  List<Expense> list=dao.getAllExpenseByUser(user);
  for(Expense ex:list){%>
	  <tr>
      <th scope="row"><%=ex.getTitle() %></th>
      <td><%=ex.getDescr() %></td>
      <td><%=ex.getDate() %></td>
      <td><%=ex.getPrice() %></td>
      <td><a href="editexp.jsp?id=<%=ex.getId() %>" class="btn btn-sm btn-primary me-1">Edit</a>
      <a href="../delete?id=<%=ex.getId() %>" class="btn btn-sm btn-danger me-1">Delete</a></td>
    </tr>
  <%}
  %>
    
    
    
  </tbody>
</table>

</div>
</div></div>
</div>
</div>
</body>
</html>