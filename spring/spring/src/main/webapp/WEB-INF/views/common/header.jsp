<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
  <ul class="navbar-nav">
		<li class="nav-item active">
		  <a class="nav-link" href="<c:url value="/" />">Cafe</a>
		</li>
  	<c:if test="${user == null}">
		<li class="nav-item">
		  <a class="nav-link" href='<c:url value="/signup"/>'>회원가입</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href='<c:url value="/login"/>'>로그인</a>
		</li>
  	</c:if>
  		<li class="nav-item">
		  <a class="nav-link" href='<c:url value="/board/list"/>'>게시글</a>
		</li>
  </ul>
</nav>