<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container-md">
<jsp:include page="../layout/header.jsp"></jsp:include> <br>
<jsp:include page="../layout/nav.jsp"></jsp:include> <br><br>

<h2>Detail Page</h2><br>

	<c:set value="${bdto.bvo }" var="bvo" />
	
	<form action="/board/register" method="post">
		<div class="mb-3">
		  <label for="bno" class="form-label">bno</label>
		  <input type="text" class="form-control" name="bno" value="${bvo.bno }" id="bno" readonly="readonly"> 
		</div>
		<div class="mb-3">
		  <label for="title" class="form-label">Title</label>
		  <input type="text" class="form-control" name="title" value="${bvo.title }" id="title" readonly="readonly">  
		</div>
		<div class="mb-3">
		  <label for="writer" class="form-label">Writer</label>
		  <input type="text" class="form-control" name="writer" value="${bvo.writer }" id="writer" readonly="readonly">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">Content</label>
		  <textarea class="form-control" name="content" id="content" readonly="readonly">${bvo.content }</textarea>
		</div>
		<div class="mb-3">
		  <label for="reg_date" class="form-label">reg_date</label>
		  <span class="badge rounded-pill text-bg-primary">${bvo.readCount }</span>
		  <input type="text" class="form-control" name="reg_date" value="${bvo.regAt }" id="reg_date" readonly="readonly">
		</div>
		
		<!-- 댓글 등록 라인 -->
		<div class="input-group input-group-sm mb-3">
		  <span class="input-group-text" id="cmtWriter">${bvo.writer }</span>
		  <input type="text" class="form-control" id="cmtText" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
		  <button type="button" class="btn btn-dark" id="cmtPostBtn">Post</button>
		</div>
				
		<!-- 댓글 표시 라인 -->
		
		<ul class="list-group" id="cmtListArea">
		  <li class="list-group-item">
		  	<div>
		  		<div class="fw-bold">Writer</div>
		  		Content
		  	</div>
		  	<span class="badge rounded-pill text-bg-warning">modAt</span>
		  </li>
		</ul>
		
		
		<!-- 댓글 더보기 버튼 -->
		<div>
			<button type="button" id="moreBtn" data-page="1" class="btn btn-outline-dark" style="visibility:hidden">MORE+</button>
		</div>
		
		<!-- 모달창 -->
		<div class="modal" id="myModal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Writer</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div class="input-group input-group-sm mb-3">
		        <input type="text" class="form-control" id="cmtTextMod" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
		        <button type="button" class="btn btn-primary" id="cmtModBtn">Post</button>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
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
									<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fvo.fileName }">
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-arrow-down" viewBox="0 0 16 16">
										  <path d="M8.5 6.5a.5.5 0 0 0-1 0v3.793L6.354 9.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L8.5 10.293V6.5z"/>
										  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
										</svg>
									</a>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="ms-2 me-auto">
							<div class="fw-bold">${fvo.fileName }</div>
							<span class="badge text-bg-secondary">${fvo.fileSize }</span>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<br><br>
		<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
		<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-success">modify</button></a>
		<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-danger">delete</button></a>
		<br><hr>
	</form>	
	
	<script type="text/javascript">
		let bnoVal=`<c:out value="${bdto.bvo.bno}"/>`;
		console.log(bnoVal);
	</script>
	
	<script src="/resources/js/boardComment.js"></script>
	<script type="text/javascript">
		spreadCommentList(bnoVal);
	</script>
	<jsp:include page="../layout/footer.jsp"></jsp:include> <br><br>
</div>