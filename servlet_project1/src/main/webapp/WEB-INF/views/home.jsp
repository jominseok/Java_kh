<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="container">
		<h1>메인페이지입니다.</h1>
		<c:forEach begin="1" end="4" var="i"> ${i },</c:forEach>
		<c:set var="name" value="홍길동1" />
		${name}
		<!-- eq : 같다로 표현 가능 equals
			 ne : 같지 않다로 표현 가능 not equals
		  -->
		<c:if test='${name == "홍길동"}'>홍길동입니다.</c:if>

		<c:choose>
			<c:when test='${name == "홍길동"}'>홍길도입니다.</c:when>
			<c:otherwise>홍길동이 아닙니다.</c:otherwise>
		</c:choose>
		<!-- 서버에서 보낸 id가 "abc"로 되어 있으면 -->
		<input type="text" value="${id}"> <br>
		<c:forTokens items="a/b/c/d" delims="/" var="ch">${ch}</c:forTokens>
		<br>
		<c:url value="/" var="url">
			<c:param name="name" value="홍길동" />
			<c:param name="age" value="30" />
		</c:url>
		${url}
	</div>
</body>
</html>



















