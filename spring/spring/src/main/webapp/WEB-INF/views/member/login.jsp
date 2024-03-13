<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html> 
<html>
<head>
	<title>로그인</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
  <ul class="navbar-nav">
	<li class="nav-item active">
	  <a class="nav-link" href="#">Cafe</a>
	</li>
	<li class="nav-item">
	  <a class="nav-link" href='<c:url value="/signup"/>'>회원가입</a>
	</li>
	<li class="nav-item">
	  <a class="nav-link" href='<c:url value="/login"/>'>로그인</a>
	</li>
  </ul>
</nav>

<div class="container">
	<form action="<c:url value="/login"/>" method="post">
		<h1>로그인</h1>
		<div class="form-group">
		  <label for="id">아이디:</label>
		  <input type="text" class="form-control" id="id" name="id">
		</div>
		<div class="form-group">
		  <label for="pw">비번:</label>
		  <input type="password" class="form-control" id="pw" name="pw">
		</div>
		<button class="btn btn-outline-success col-12">로그인</button>
	</form>
</div>

</body>
</html>