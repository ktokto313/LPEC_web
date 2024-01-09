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
	<%
	String usr = "";
	String pwd = "";

	if (request.getCookies() != null)
		for (Cookie cookie : request.getCookies()) {
			if (cookie != null && cookie.getName().equals("usr")) {
		usr = cookie.getValue();
			}
			if (cookie != null && cookie.getName().equals("pwd")) {
		pwd = cookie.getValue();
			}
		}
	if (usr.equals("") && request.getSession().getAttribute("usr") != null) {
		usr = (String)request.getSession().getAttribute("usr");
		pwd = (String)request.getSession().getAttribute("pwd");
	}
	%>
	<div class="login center-div center-text">
		<div class="left half">
			<image class="center-div" src="./image/homepage1/Group 50.png"/>
		</div>
		<div class="right half">
			<h1>Đăng nhập</h1>
			<form action="./user" method="post">
				<input type="hidden" name="action" value="login"> 
				<input type="text" name="username" value="<%=usr%>" placeholder="Username">
				<input type="password" name="password" value="<%=pwd%>" placeholder="Password">
				<p><%=request.getSession().getAttribute("error") == null ? "" : request.getSession().getAttribute("error")%></p>
				<div>
					<input type="checkbox" id="remember" name="remember"> <label
						for="remember">Nhớ tài khoản</label>
				</div>
				<p>Quên mật khẩu?</p>
				<input type="submit" value="Đăng nhập">
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>