<%@page import="com.db.HibernateUtil"%>      <!-- Importing Hibernate utility class -->
<%@page import="org.hibernate.SessionFactory"%>  <!-- Importing Hibernate SessionFactory -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker</title>

<!-- Include reusable CSS and JS (like Bootstrap) -->
<%@include file="component/all_css.jsp"%>
</head>
<body>

	<!-- Including common navigation bar -->
	<%@include file="component/navbar.jsp"%>

	<!-- Bootstrap Carousel (sliding images) -->
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<!-- First image -->
			<div class="carousel-item active">
				<img src="image/expense_1.jpg" class="d-block w-100 vh-100 object-fit-cover" alt="first-image">
			</div>

			<!-- Second image -->
			<div class="carousel-item">
				<img src="image/expense_2.jpg" class="d-block w-100 vh-100 object-fit-cover" alt="second-image">
			</div>

			<!-- Third image -->
			<div class="carousel-item">
				<img src="image/expense_3.jpg" class="d-block w-100 vh-100 object-fit-cover" alt="third-image">
			</div>
		</div>

		<!-- Carousel navigation buttons -->
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>

</body>
</html>
