<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<div class="container-md">
<jsp:include page="../layout/header.jsp"></jsp:include> <br>
<jsp:include page="../layout/nav.jsp"></jsp:include> <br><br>

<h2>Member modify Page</h2><br>
	<form action="/member/modify" method="post">
		<div class="mb-3">
		  <label for="title" class="form-label">email</label>
		  <input type="text" class="form-control" name="email" id="e" value="${mvo.email }" readonly>
		</div>
		<div class="mb-3">
		  <label for="title" class="form-label">password</label>
		  <input type="password" class="form-control" name="pwd" id="p" value="">
		</div>
		<div class="mb-3">
		  <label for="title" class="form-label">nick_name</label>
		  <input type="text" class="form-control" name="nickName" id="n" value="${mvo.nickName }">
		</div>
	<!-- 해당 멤버의 권한 출력(2개일수도 있음) -->
		<button type="submit" class="btn btn-dark">회원정보수정</button>
		
		
		
	
	</form>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>