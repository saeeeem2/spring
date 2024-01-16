<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<div class="container-md">
<jsp:include page="../layout/header.jsp"></jsp:include> <br>
<jsp:include page="../layout/nav.jsp"></jsp:include> <br><br>

<h2>Member List Page</h2><br>
	<form action="/member/list" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th>이메일</th>
				<th>닉네임</th>
				<th>권한</th>
				<th>회원가입일</th>
				<th>최종 로그인</th>
				<th> </th>
				<th> </th>
			</tr>
			<c:forEach items="${mvo }" var="mvo">
			<tr>
				<td>${mvo.email }</td>
				<td>${mvo.nickName }</td>
				<td><c:forEach items="${mvo.authList }" var="authList">${authList.auth }</c:forEach></td>
				<td>${mvo.regAt }</td>
				<td>${mvo.lastLogin }</td>
				<td><a href="/member/modify?email=${mvo.email }"><button type=button class="btn btn-dark">modify</button></a></td>
				<td><a href="/member/remove?email=${mvo.email }"><button type=button class="btn btn-dark">delete</button></a></td>
			</tr>
			</c:forEach>
			
		</table>
	</form>	
<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>


