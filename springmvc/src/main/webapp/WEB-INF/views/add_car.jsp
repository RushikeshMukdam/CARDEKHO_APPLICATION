
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Car</title>
<style type="text/css">
	#parent{
		border: 1px solid;
		height: 340px;
		width: 340px;
		margin: 100px auto;
		background-color: grey;
		display: flex;
		flex-direction: column;
		align-items: center;
		
	}
	.data{
		padding: 10px;
		font-size: 25px;
	}
	.input input{
		padding:10px;
		size:50;
		font-size: 14px;
		
	}
	#addbtn{
		margin: 15px;
		padding:10px;
		border-radius:8px;
		margin-left: 80%;
	}
	#footer{
		height: 40px;
		width: 50px;
		margin-left: 48%;
		margin-top: 20px; 		
	}
	#footer a{
	font-size:20px;
	padding:10px;
	color:black;
		text-decoration: none;
		background-color: red;
		border-radius:10px; 
		
	}
</style>
</head>
<body>
	<div id="parent">
		<h1>Add Car Details</h1>
		<form action="add_car" method="post">
			<table>
				<tr>
					<td class="data">Name</td>
					<td class="input"><input type="text" name="name" required="required" placeholder="car name"></td>
				</tr>
				<tr>
					<td class="data">Brand</td>
					<td class="input"><input type="text" name="brand" required="required" placeholder="car brand"></td>
				</tr>
				<tr>
					<td class="data">Price</td>
					<td class="input"><input type="text" name="price" required="required" placeholder="car price"></td>
				</tr>
			</table>
			<input type="submit" value="ADD" id="addbtn">
		</form>
	</div>
	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<div align="center">
		<h3><%=message%></h3>
	</div>
	<%
	}
	%>
	<div id="footer">
		<a href="home">Home</a>
	</div>
</body>
</html>
