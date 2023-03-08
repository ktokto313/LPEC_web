<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Ãm ba la..</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/project.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&family=Playfair+Display&display=swap"
        rel="stylesheet">
    <link rel="icon" href="./image/homepage1/Group 1.png">
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<body>
    <!-- Page heading -->
    <section id="page-heading">
        <image class="desktop" src="./image/homepage1/Group 74.png"></image>
        <image class="mobile" src="./image/Project (3)/Group 76.png"></image>
    </section>

    <!-- Section 1 -->
    <section>
        <!-- Section 1 heading -->
        <div class="heading">
            <svg height="50px" width="95%">
                <line x1="0%" y1="50%" x2="100%" y2="50%" style="stroke:black;stroke-width:1px"></line>
                Your browser doesn't support svg line
                <h1 class="header serif">Hôm nay có gì</h1>
            </svg>
        </div>
        <!-- Section 1 body -->
        <c:choose>
        	<c:when test="${lastestLecture == null}">
        		<p class="center-text">No lecture available</p>
        	</c:when>
       		<c:otherwise>
		        <div class="body notification">
		            <h2 class="center-text"><a href="./lecture?lecture=${lastestLecture.id}">${lastestLecture.title}</a></h2>
		            <image class="center-div" src="./image/Project (3)/image 8.png"></image>
		            <p style="font-size: larger;">${lastestLecture.shortContent}</p>
		            <a class="button" href="./lecture?lecture=${lastestLecture.id}">Xem thêm</a>
		        </div>
		     </c:otherwise>
		</c:choose>
    </section>

    <!-- Section 2 -->
    <section>
        <!-- Section 2 heading -->
        <div class="heading">
            <svg height="50px" width="95%">
                <line x1="0%" y1="50%" x2="100%" y2="50%" style="stroke:black;stroke-width:1px"></line>
                Your browser doesn't support svg line
                <h1 class="header serif">Ý tưởng mới</h1>
            </svg>
        </div>
        <!-- Section 2 body -->
        <div class="body grid-container">
        	<c:if test="${lectureList.size() == 0}">
        		<p class="center-text">No lecture available</p>
        	</c:if>
        	<c:forEach items="${lectureList}" var="lecture" begin="${(param.page-1)*4}" end="${param.page*4-1}" varStatus="status">
        		<div class="card grid-item" id="card-${status.index+1}">
	                <a class="center-div" href="./lecture?lecture=${status.index+1}">${lecture.title}</a>
	                <image src="./image/Project (3)/Rectangle 16.png"></image>
	                <p class="left">${lecture.date}</p>
	                <p class="right">bởi <b>${lecture.author}</b></p>
	                <p>${lecture.shortContent}</p>
				</div>
        	</c:forEach>
        </div>
        <div class="project-nav center-div center-text">
        	<c:forEach begin="1" end="${Math.ceil(lectureList.size()/4)}" varStatus="status">
        	<a href="project.jsp?page=${status.index}">${status.index}</a>
        	</c:forEach>
        </div>
    </section>
    
    <a id="anchor"><br></br></a>
	<c:choose>
	
	<c:when test="${cookie['logged-in'].value.equals('true')}">
	<form class="post-1" method="post" action="./project">
	<label for="title">Tựa đề</label>
	<input type="text" name="title" id="title"/>
	<label for="shortContent">Lời mở đầu</label>
	<textarea name="shortContent" id="shortContent" rows="4" cols="50"></textarea>
	<label for="content">Nội dung</label>
	<textarea name="content" id="content" rows="10" cols="50"></textarea>
	<p><%= request.getSession().getAttribute("error") == null ? "":request.getSession().getAttribute("error") %></p>
	<input type="submit" value="Đăng"/>
	</form>
	</c:when>
	
	<c:otherwise>
	<p class="post-2 center-text">Hãy đăng nhập để đăng bài</p>
	</c:otherwise>
	
	</c:choose>
</body>
<jsp:include page="footer.jsp"/>

</html>