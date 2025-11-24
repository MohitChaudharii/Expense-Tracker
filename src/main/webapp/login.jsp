<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- JSTL core tag library -->
<%@page isELIgnored="false"%> <!-- Enable Expression Language -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- Include CSS/JS -->
<%@include file="component/all_css.jsp"%>

<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3); /* Shadow for card */
}
</style>
</head>
<body class="bg-light">

	<!-- Include navigation bar -->
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<!-- Card for login form -->
				<div class="card card-sh">
					<div class="card-header">
						<p class="text-center fs-3">Login Page</p>

						<!-- Display message if login fails (from session) -->
						<c:if test="${not empty msg}">
							<p class="text-center text-danger fs-4">${msg}</p>
							<c:remove var="msg"/>  <!-- Remove message after showing -->
						</c:if>
					</div>

					<div class="card-body">
						<!-- Login form sends data to servlet 'login' -->
						<form action="login" method="post">

							<div class="mb-3">
								<label>Email</label>
								<input type="text" name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label>Password</label>
								<input type="password" name="password" class="form-control">
							</div>

							<!-- Submit button -->
							<button class="btn btn-success col-md-12">Login</button>

							<!-- Redirect to register page -->
							<div class="text-center mt-2">
								Don't have an account? 
								<a href="register.jsp" class="text-decoration-none">Create one</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
