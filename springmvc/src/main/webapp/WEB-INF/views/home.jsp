<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<style type="text/css">
p {
	width: 600px;
	font-size: 20px;
	text-align: justify;
	font-family: cursive;
	font-style: italic;
}

h1 {
	margin-top: 5px;
}
#box{
	height: 100px;
	width: 500px;
	margin-left: 54%;
	margin-top: 50px;
	
}
#box a{
	padding: 14px;
	font-size:18px;
	color:black;
	border: 1px;
	border-radius:10px;
	margin: 10px;
	background-color: gray;
	text-decoration: none;
}
#footer a{
	border: 1px solid;
	padding: 10px;
	margin-left: 55%;
	font-size: 20px;
	color: black;
	background-color: red;
	text-decoration: none;
}
</style>

</head>

<body>
	<div id="box" align="center">
		<nav>
			<a href="add_page">ADD</a> <a href="viewAllCars">All CARS</a> <a
				href="my_cars">MY CARS</a> <a href="sign_out">SIGN OUT</a>
		</nav>
	</div>
	
	<div id="box1" align="center">
		<h1>WELCOME TO CARDEKHO</h1>
		<p>Car Dekho is a one stop solution for used car dealers and
			dealership business to manage and grow their used car (second hand
			cars) business. Developed by WEJA4 group of developers with a vision
			to empower every used car dealer in every part of India to benefit
			from digital India and make in India revolution.</p>
	</div>
	<div align="center" id="footer">
		<a href="delete_user">Delete User</a>
	</div>	
	
</body>
</html>