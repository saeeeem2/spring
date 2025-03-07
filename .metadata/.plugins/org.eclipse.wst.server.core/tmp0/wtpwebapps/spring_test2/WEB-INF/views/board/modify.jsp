<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<div class="container-md">
<jsp:include page="../layout/header.jsp"></jsp:include> <br>
<jsp:include page="../layout/nav.jsp"></jsp:include> <br><br>

<h2>Modify Page</h2><br>
<c:set value="${bdto.bvo }" var="bvo"/>

	<form action="/board/modify" method="post" enctype="multipart/form-data">
		<div class="mb-3">
		  <label for="bno" class="form-label">bno</label>
		  <input type="text" class="form-control" name="bno" value="${bvo.bno }" id="bno" readonly="readonly">
		</div>
		<div class="mb-3">
		  <label for="title" class="form-label">Title</label>
		  <input type="text" class="form-control" name="title" value="${bvo.title }" id="title" placeholder="title...">
		</div>
		<div class="mb-3">
		  <label for="writer" class="form-label">Writer</label>
		  <input type="text" class="form-control" name="writer" value="${bvo.writer }" id="writer" placeholder="writer...">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">Content</label>
		  <textarea class="form-control" name="content" id="content" placeholder="content...">${bvo.content }</textarea>
		</div>
		<div class="mb-3">
		  <label for="reg_date" class="form-label">reg_date</label>
		  <%-- <span class="badge rounded-pill text-bg-primary">${bvo.read_count }</span> --%>
		  <input type="text" class="form-control" name="reg_date" value="${bvo.regAt }" id="reg_date">
		</div>
		
		<!-- file list -->
		<c:set value="${bdto.flist }" var="flist"></c:set>
			<div class="col-12">
			<label for="f" class="form-label">File</label>
				<ul class="list-group list-group-flush">
					<c:forEach items="${flist }" var="fvo">
						<li class="list-group-item">
							<c:choose>
								<c:when test="${fvo.fileType==1 }">
									<div>
										<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<!-- 일반 파일 표시할 아이콘 -->
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-arrow-down" viewBox="0 0 16 16">
										  <path d="M8.5 6.5a.5.5 0 0 0-1 0v3.793L6.354 9.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L8.5 10.293V6.5z"/>
										  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
										</svg>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="ms-2 me-auto">
								<div class="fw-bold">${fvo.fileName }</div>
								<span class="badge text-bg-secondary">${fvo.fileSize }</span>
								<button type="button" data-uuid="${fvo.uuid }" class="btn btn-outline-danger btn-sm file-x">X</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<!-- 파일 등록 라인 -->
			<div class="mb-3">
			  <label for="fileUpload" class="form-label">files..</label>
			  <input type="file" class="form-control" name="files" id="files" multiple="multiple" style="display:none"><br>
			  <!-- 파일 버튼트리거 사용하기 위해서 주는 버튼 -->
			  <button type="button" class="btn btn-primary" id="trigger">FileUpload</button>
			</div>
			
			<!-- 파일 목록 표시 라인 -->
			<div class="mb-3" id="fileZone"> </div>
		
		<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
		<button type="submit" class="btn btn-success" id="regBtn">modify</button>
		<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-danger">delete</button></a>
		<br><hr>
	</form>

<script src="/resources/js/boardModify.js"></script>
<script src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>

