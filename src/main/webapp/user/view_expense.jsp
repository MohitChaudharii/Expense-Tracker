<%@page import="com.entity.Expense"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Expense</title>
<%@include file="../component/all_css.jsp"%>
</head>
<body>

<!-- Redirect if user not logged in -->
<c:if test="${empty loginUser}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@include file="../component/navbar.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header text-center">
                    <p class="fs-3">All Expenses</p>

                    <!-- ✅ Message Alert -->
                    <c:if test="${not empty msg}">
                        <div class="alert alert-success text-center">${msg}</div>
                        <c:remove var="msg" />
                    </c:if>
                </div>

                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark text-center">
                            <tr>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Fetch logged-in user's expenses
                                User user = (User) session.getAttribute("loginUser");
                                ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
                                List<Expense> list = dao.getAllExpenseByUser(user);
                                for (Expense ex : list) {
                            %>
                            <tr>
                                <td><%=ex.getTitle()%></td>
                                <td><%=ex.getDescription()%></td>
                                <td><%=ex.getDate()%></td>
                                <td><%=ex.getTime()%></td>
                                <td><%=ex.getPrice()%></td>
                                <td>
                                    <a href="edit_expense.jsp?id=<%=ex.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                    <a href="../deleteExpense?id=<%=ex.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
