<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGNUP</title>
<style type="text/css">
#parent {
	height: 250px;
	width: 400px;
	border: 1px solid;
	margin: 100px auto;
}

.data {
	padding: 10px;
	font-size: 20px;
}

.data input {
	height: 20px;
}
</style>
</head>
<body>
	<div id="parent" align="center">
		<h3>SIGN UP</h3>
		<form action="add_user" method="post">
			<table>
				<tr class="row">
					<td class="data">Email:</td>
					<td class="data"><input type="text" name="email"
						required="required"></td>
				</tr>
				<tr class="row">
					<td class="data">Password:</td>
					<td class="data"><input type="text" name="password"
						required="required"></td>
				</tr>
			</table>
			<input type="submit" value="SIGIN UP">
		</form>

	</div>

</body>
</html>