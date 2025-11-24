<!-- JSTL tag library and EL configuration -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<!-- Logo / Brand name -->
		<a class="navbar-brand" href="#">
			<i class="fa-solid fa-coins"></i> Expense Tracker
		</a>

		<!-- Hamburger menu for small screens -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			
			<!-- Left-side menu items -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
				<!-- Home link -->
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/Online_Expense_Tracker">
						<i class="fa-solid fa-house-chimney"></i> Home
					</a>
				</li>

				<!-- Show these links only if user is logged in -->
				<c:if test="${not empty loginUser}">
					<li class="nav-item">
						<a class="nav-link active" href="add_expense.jsp">
							<i class="fa-solid fa-plus"></i> Add Expense
						</a>
					</li>

					<li class="nav-item">
						<a class="nav-link active" href="view_expense.jsp">
							<i class="fa-solid fa-list"></i> View Expense
						</a>
					</li>
				</c:if>
			</ul>

			<!-- Right-side menu (login/register or user info/logout) -->
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<!-- If user is logged in -->
				<c:if test="${not empty loginUser}">
					<!-- Show logged-in user name -->
					<li class="nav-item">
						<a class="nav-link active" href="#">
							<i class="fa-solid fa-user"></i> ${loginUser.fullname}
						</a>
					</li>

					<!-- Logout link -->
					<li class="nav-item">
						<a class="nav-link active" href="../logout">
							<i class="fa-solid fa-arrow-right-to-bracket"></i> Logout
						</a>
					</li>
				</c:if>

				<!-- If user is NOT logged in -->
				<c:if test="${empty loginUser}">
					<li class="nav-item">
						<a class="nav-link active" href="login.jsp">
							<i class="fa-solid fa-arrow-right-to-bracket"></i> Login
						</a>
					</li>

					<li class="nav-item">
						<a class="nav-link active" href="register.jsp">
							<i class="fa-solid fa-user-plus"></i> Register
						</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>