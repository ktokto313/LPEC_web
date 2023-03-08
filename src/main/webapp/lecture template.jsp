<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <title>Úm ba la..</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/lecture.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&family=Playfair+Display&display=swap"
        rel="stylesheet">
    <link rel="icon" href="./image/homepage1/Group 1.png">
    <link rel="stylesheet" href="css/lecture.css"/>
</head>

<jsp:include page="header.jsp"/>
<body>
<c:out value="${currentLecture.content}" escapeXml="false" />

<a id="anchor"><br></br></a>
<c:choose>

<c:when test="${cookie['logged-in'].value.equals('true')}">
<form class="comment-form" method="post" action="./lecture">
<input type="hidden" name="action" value="postComment"/>
<label for="comment"><b>Bình luận</b></label>
<textarea id="comment" name="comment" rows="4" cols="50"></textarea>
<p><%= request.getSession().getAttribute("error") == null ? "":request.getSession().getAttribute("error") %></p>
<input type="submit" value="Đăng"/>
</form>
</c:when>

<c:otherwise>
<p class="comment-error">Hãy đăng nhập để bình luận</p>
</c:otherwise>

</c:choose>

<div class="comment-container">
	<c:forEach items="${commentList}" var="comment">
		<div class="comment">
			<p class="left"><b>${comment.author}</b></p>
			<c:if test="${user.role.equals('admin') or comment.user_ID == user.id}">
				<form class="right" action="./lecture" method="post">
					<input type="hidden" name="action" value="deleteComment">
					<input type="hidden" name="commentID" value="${comment.ID}"/>
					<input type="submit" value="Xóa"/>
				</form>
			</c:if>
			<p>${comment.content}</p>
		</div>
	</c:forEach>
</div>

</body>
<jsp:include page="footer.jsp"/>

</html>