<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="/">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/board/list">게시판 보기</a>
  </li>
  
  <!-- 현재 인증한 사용자의 정보를 가져와서 해당 권한이 있는지 확인 -->
  <!-- 현재 사용자의 정보는 principal -->
  <!-- anyMach() : stream 매칭 메서드(최소한 1개의 요소가 주어진 조건에 맞는지 조사 -->
  <sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal.mvo.email" var="authEmail"/>
  <sec:authentication property="principal.mvo.nickName" var="authNick"/>
  <sec:authentication property="principal.mvo.authList" var="auths"/>
  
  <c:choose>
  	<c:when test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
	  	<li class="nav-item">
	    	<a class="nav-link" href="/member/list">MemberList ${authNick }(${authEmail }/ADMIN)</a>
  		</li>
  		<li class="nav-item">
			<a class="nav-link" href="/member/modify">회원정보 수정 ${authNick }(${authEmail })</a>
	    </li>
  	</c:when>
  	<c:otherwise>
 	<li class="nav-item">
		<a class="nav-link" href="/member/modify">회원정보 수정 ${authNick }(${authEmail })</a>
    </li>
  	</c:otherwise>
  </c:choose>
  
  <li class="nav-item">
    <a class="nav-link" href="/board/register">게시판 글쓰기</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" id="logoutLink">로그아웃</a>
  </li>
  <form action="/member/logout" method="post" id="logoutForm">
  <!-- 인증된(로그인한 계정의) 이메일 -->
  	<input type="hidden" name="email" value="${authEmail }">
  </form>
  </sec:authorize>
  
  <sec:authorize access="isAnonymous()">
  <li class="nav-item">
    <a class="nav-link" href="/member/register">회원가입</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/member/login">로그인</a>
  </li>
  </sec:authorize>
</ul>

<script type="text/javascript">
	document.getElementById('logoutLink').addEventListener('click',(e)=>{
	    e.preventDefault();
	    document.getElementById('logoutForm').submit();
	});
</script>


