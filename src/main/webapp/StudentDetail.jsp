<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
margin:0px auto;
box-sizing: border-box;
padding: 0px;
}
#d1{
border: 1px dotted red;
height: 350px;
width: 350px;
}
tr{
margin: auto 20px }
</style>
</head>
<body>
	<div align="center" id="d1">
		<h2>Student Registration form</h2>
		<div>
			<form action="StudentInfo.jsp">
				<table border="1px solid">
				<tr>
						<td> UserName: </td>
						<td><input type="text" name="userName"></td>
					</tr>
					<tr>
						<td> Name: </td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td> Email:</td>
						<td><input type="email" name="email"></td>
					</tr>
					<tr>
						<td> Contact:</td>
						<td><input type="tel" name="contact"></td>
					</tr>
					<tr>
						<td> Address</td>
						<td><input type="text" name="address"></td>
					</tr>
				</table>
				<input type="submit" value="Register">
			</form>
		</div>
	</div>
</body>
</html>