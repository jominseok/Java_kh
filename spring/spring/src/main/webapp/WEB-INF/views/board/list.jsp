<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
  <h2>게시글 리스트</h2>
  <table class="table table-dark">
    <thead>
      <tr>
        <th>번호</th>
        <th>게시판</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>추천/비추천</th>
      </tr>
    </thead>
    <tbody>
	    <c:forEach items="${list}" var="board">
	      <tr>
	        <td>${board.bo_num}</td>
	        <td>${board.bo_co_name}</td>
	        <td>${board.bo_title}</td>
	        <td>${board.bo_me_id}</td>
	        <td>${board.bo_view}</td>
	        <td>${board.bo_up}/${board.bo_down}</td>
	      </tr>
	    </c:forEach>
    </tbody>
  </table>
 <ul class="pagination justify-content-center">
   <c:if test="${pm.prev}">
      <c:url value="/board/list" var="url">
         <c:param name="page" value="${pm.startPage - 1}"/>
      </c:url>
      <li class="page-item">
         <a class="page-link" href="${url}">이전</a>
      </li>
   </c:if>
   <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
      <c:url value="/board/list" var="url">
         <c:param name="page" value="${i}"/>
      </c:url>
      <li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
         <a class="page-link" href="${url}">${i}</a>
      </li>
   </c:forEach>
   <c:if test="${pm.next}">
      <c:url value="/board/list" var="url">
         <c:param name="page" value="${pm.endPage + 1}"/>
      </c:url>
      <li class="page-item">
         <a class="page-link" href="${url}">다음</a>
      </li>
   </c:if>
</ul>
</div>