<%@page import="com.entity.Expense"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>
<%@include file="../component/all_css.jsp"%>
<style>
.card-sh {
    box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body class="bg-light">

<!-- Redirect if not logged in -->
<c:if test="${empty loginUser}">
    <c:redirect url="../login.jsp" />
</c:if>

<%
    // Fetch expense details by ID from database
    int id = Integer.parseInt(request.getParameter("id"));
    ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
    Expense ex = dao.getExpenseById(id);
%>

<%@include file="../component/navbar.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card card-sh">
                <div class="card-header text-center">
                    <p class="fs-3">Edit Expense</p>
                </div>

                <div class="card-body">
                    <form action="../updateExpense" method="post">
                        <div class="mb-3">
                            <label>Title</label>
                            <input type="text" name="title" value="<%=ex.getTitle()%>" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Date</label>
                            <input type="date" name="date" value="<%=ex.getDate()%>" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Time</label>
                            <input type="time" name="time" value="<%=ex.getTime()%>" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Description</label>
                            <input type="text" name="description" value="<%=ex.getDescription()%>" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Price</label>
                            <input type="number" name="price" value="<%=ex.getPrice()%>" class="form-control" required>
                        </div>

                        <input type="hidden" name="id" value="<%=ex.getId()%>">

                        <button class="btn btn-success col-md-12">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

