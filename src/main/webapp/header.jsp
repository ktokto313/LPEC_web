<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Úm ba la..</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&family=Playfair+Display&display=swap"
        rel="stylesheet">
    <link rel="icon" href="./image/homepage1/Group 1.png">
    <link rel="stylesheet" href="css/header.css">
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<!-- Nav bar -->
    <nav class="nav-bar desktop">
        <!-- Web name/logo -->
        <a href="./index"><img src="./image/homepage1/Group 1.png"></img> ÚM BA LA</a>
        <!-- Main navigation section -->
        <c:choose>
	        <c:when test="${cookie['logged-in'].value.equals('true')}">
	        <a class="nav" href="./user?action=logout">Đăng xuất</a>	
	        </c:when>
	        <c:otherwise>
	        <a class="nav" href="./user?action=register">Đăng kí</a>
	        <a class="nav" href="./user?action=login">Đăng nhập</a>
	        </c:otherwise>
        </c:choose>
        
        <a class="nav" href="./project">Dự án</a>
        <a class="nav" href="./index">Trang chủ</a>
    </nav>
    <nav class="nav-bar mobile">
		<a href="./index"><img src="./image/homepage1/Group 1.png"></img> ÚM BA LA</a>
		<a class="nav" href="./index">Trang chủ</a>
		<a class="nav" href="./project">Dự án</a>
		<c:choose>
        <c:when test="${cookie['logged-in'].value.equals('true')}">
        <a class="nav" href="./user?action=logout">Đăng xuất</a>	
        </c:when>
        <c:otherwise>
        <a class="nav" href="./user?action=login">Đăng nhập</a>
        <a class="nav" href="./user?action=register">Đăng kí</a>
        </c:otherwise>
       	</c:choose>
  	</nav>
</body>
</html>