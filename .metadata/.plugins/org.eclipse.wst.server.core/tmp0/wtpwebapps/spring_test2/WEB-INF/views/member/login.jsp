<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-md">
<jsp:include page="../layout/header.jsp"></jsp:include> <br>
<jsp:include page="../layout/nav.jsp"></jsp:include> <br><br>

<h4 class="mb-3">Input Your Information</h4>
	<form action="/member/login" method="post">
		<div class="mb-3">
		  <label for="e" class="form-label">email</label>
		  <input type="email" class="form-control" name="email" id="email" placeholder="example@000.com">
		</div>
		<div class="mb-3">
		  <label for="p" class="form-label">password</label>
		  <input type="password" class="form-control" name="pwd" id="pwd" placeholder="*******">
		</div>
		
		<button type="submit" class="btn btn-primary">LOGIN</button>
	</form>
	
	<c:if test="${not empty param.errMsg }">
		<div class="mb-3">
			<c:choose>
				<c:when test="${param.errMsg eq 'Bad credentials' }">
					<c:set value="이메일&비밀번호가 일치하지 않습니다." var="errText"></c:set>
				</c:when>
				<c:otherwise>
					<c:set value="관리자에게 문의해주세요." var="errText"></c:set>
				</c:otherwise>
			</c:choose>
			${errText }
		</div>
	</c:if>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>