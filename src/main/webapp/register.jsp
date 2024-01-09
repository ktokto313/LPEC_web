<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đăng nhập</title>
<link rel="stylesheet" href="css/index.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="login center-div center-text">
	<div class="left half">
		<h1>Chào mừng!</h1>
		<p>Để bắt đầu hành trình của bạn, hãy tạo một tài khoản mới</p>
	</div>
	<div class="right half">
		<h1>Đăng kí</h1>
		<form action="./user" method="post">
			<input type="hidden" name="action" value="register"> 
			<input type="text" name="username" value="" placeholder="Username"> 
			<input type="password" name="password" value="" placeholder="Password">
			<p><%=request.getSession().getAttribute("error") == null ? "" : request.getSession().getAttribute("error")%></p>
			<input type="submit" value="Tạo tài khoản">
		</form>
	</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>