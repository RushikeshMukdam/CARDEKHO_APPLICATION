<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#parent{
		height: 350px;
		width: 400px;
		border: 1px solid;
		margin: 100px auto;
	}
	 .data{
		padding: 10px;
		font-size: 20px;	
	}
	.data input{
		height: 20px;
	}
	a{
	 border: 1px solid;
	 padding: 5px;
	 text-decoration: none;
	 color: black;
	 background-color: gray;
	}
	p{
		height: 25px;
		width: 300px;
		text-align: center;
		color: gray;
	}
</style>
</head>
<body>
		<div align="center" id="parent">
			<h1>Sign in</h1>
			<form action="check_user" method="post">
				<table>
					<tr class="row">
						<td class="data">Email:</td>
						<td class="data"><input type="text" name="email" required="required" ></td>
					</tr>
					<tr class="row">
						<td class="data">Password:</td>
						<td class="data"><input type="password" name="password" required="required" ></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="SIGN IN">
			</form>
			
			<h3>
			New User? <a href="sign_up">Sign Up</a>
			</h3>
			<p>forgot password: contact:9421424269</p>
		</div>
		<%
			String message = (String) request.getAttribute("message");
			if(message != null){
		%>
			<div align="center">
				<h3><%= message %></h3>
			</div>
		<%} %>
</body>
</html>