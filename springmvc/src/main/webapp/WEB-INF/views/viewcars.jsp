<%@page import="com.jspiders.springmvc.dto.CarDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Car</title>
<style type="text/css">
#message {
	font-size: 40px;
}

.head {
	width: 150px;
	font-size: 25px;
	padding: 10px;
	font-weight: bold;
	font-size: 25px;
	border: 1px solid;
}

#heading {
	background-color: gray;
	padding: 10px;
	width: 150px;
	border: 3px solid;
	margin: 10px auto;
}

.data {
	width: 150px;
	font-size: 20px;
	padding: 10px;
	border: 1px solid;
	text-align: center;
}

#table {
	background-color: pink;
	border: 3px solid;
}

#footer {
	height: 40px;
	width: 50px;
	margin-left: 48%;
	margin-top: 20px;
}

#footer a {
	font-size: 20px;
	padding: 10px;
	color: black;
	text-decoration: none;
	background-color: red;
	border-radius: 10px;
}

#box {
	
	
	font-size: 20px;
	font-weight: bold;
	height: 50px;
	border: 2px solid transparent;
}

form {
	margin-left: 780px;
	margin-top: 7px;
}

#button {
	height: 35px;
	width: 100px;
	background-color: black;
	color: gray;
	border-radius: 5px;
	font-size: 15px;
	text-decoration: none;
}

input {
	height: 28px;
	width: 200px;
	background-color: gray;
	border: 1px solid;
	background-color: gray;
	background-color: gray;
}
</style>
</head>
<body>
	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<div align="center">
		<h3 id="message">
			<%=message%>
		</h3>
	</div>
	<%
	}
	@SuppressWarnings("unchecked")
	List<CarDTO> cars = (List<CarDTO>) request.getAttribute("cars");
	if (cars != null) {
	%>



	<div align="center">

		<h3 id="heading">AVAILABLE CARS</h3>
		<table id="table">
			<tr>
				<th class="head">ID</th>
				<th class="head">NAME</th>
				<th class="head">BRAND</th>
				<th class="head">PRICE</th>
			</tr>

			<%
			for (CarDTO car : cars) {
			%>
			<tr>
				<td class="data"><%=car.getId()%></td>
				<td class="data"><%=car.getName()%></td>
				<td class="data"><%=car.getBrand()%></td>
				<td class="data"><%=car.getPrice()%></td>
			</tr>
			<%
			}
			%>


		</table>

	</div>

	<div id="box">

		<form action="search" method="post">
			<label>Low Price</label> <input type="text" name="low"
				required="required"> <label>High Price</label> <input
				type="text" name="high" required="required"> <input
				type="submit" id="button" value="SEARCH">
		</form>
	</div>

	<%
	}
	%>
	<div id="footer">
		<a href="home">Home</a>
	</div>
</body>
</html>