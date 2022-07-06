<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 라이브러리 코드 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
a {
	text-decoration: none;
}

table {
	border-collapse: collapse;
	width: 1000px;
	margin-top: 20px;
	text-align: center;
}

td, th {
	border: 1px solid black;
	height: 50px;
}

th {
	font-size: 17px;
}

thead {
	font-weight: 700;
}

.table_wrap {
	margin: 50px 0 0 50px;
}

.bno_width {
	width: 12%;
}

.writer_width {
	width: 20%;
}

.regdate_width {
	width: 15%;
}

.updatedate_width {
	width: 15%;
}

.top_btn {
	font-size: 20px;
	padding: 6px 12px;
	background-color: #fff;
	border: 1px solid #ddd;
	font-weight: 600;
}
</style>
</head>
<body>
	<h1>목록페이지입니다.</h1>

	<div class="table_wrap">
		<a href="/board/enroll" class="top_btn">게시판 등록</a>
		<table>
			<thead>
				<tr>
					<th class="bno_width">번호</th>
					<th class="title_width">제목</th>
					<th class="writer_width">작성자</th>
					<th class="regdate_width">작성일</th>
					<th class="updatedate_width">수정일</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.bno}" /></td>
					<td><a class="move" href='<c:out value="${list.bno}"/>'> <c:out
								value="${list.title}" />
					</a></td>
					<td><c:out value="${list.writer}" /></td>
					<td><fmt:formatDate pattern="yyyy/MM/dd"
							value="${list.regdate}" /></td>
					<td><fmt:formatDate pattern="yyyy/MM/dd"
							value="${list.updateDate}" /></td>
				</tr>

			</c:forEach>
		</table>
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<!-- 각 번호 페이지 버튼 -->
				<ul id="pageInfo" class="pageInfo">
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="pageInfo_btn"><a href="${num}">${num}</a></li>

					</c:forEach>
				</ul>
			</div>
		</div>
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		</form>
	</div>

	<script>
		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

				if (result === '') {
					return;
				}

				else if (result === "enroll success") {
					alert("등록이 완료되었습니다.");
				}
				
				else if(result === "modify success"){
		            alert("수정이 완료되었습니다.");
		        }
				else if(result === "delete success"){
		            alert("삭제가 완료되었습니다.");
		        }

			}

		});
		let moveForm = $("#moveForm");

		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();//이벤트 버블링 막기 자식의 이벤트를 부모에서도 인식해서 실행. 이벤트를 부에서 실행하지 않도록

					// name이 bno 인 요소
					//제이쿼리는 리무브이다.
					//비어있는 moveForm 에 동적으로 hidden input으로 bno를 추가
					//이것만이있으면 뒤로가기를햇을때bno 가 누적이되는 현상이 발생한다.
					let nameEle = $("input[name=bno]");
					nameEle.remove();
					moveForm.remove("name");
					moveForm.append("<input type='hidden' name='bno' value='"
							+ $(this).attr("href") + "'>");
					moveForm.attr("action", "/board/get");
					
					moveForm.submit();
					
				});
		
		 //페이지이동
		 $(".pageInfo a").on("click", function(e){
			 
			 	e.preventDefault();
			 	 //name이 pageNum인 input태그의 값에다가 그놈의 href값으로 대입
		        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		        moveForm.attr("action", "/board/list");//action 속성추가
		        moveForm.submit();
		        
		    });
	</script>
</body>
</html>