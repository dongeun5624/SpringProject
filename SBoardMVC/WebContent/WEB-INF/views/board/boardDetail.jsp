<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 보기</title>
<style type="text/css">

<style type="text/css">
#viewForm{
	margin: auto;
}
table,tr,td{
	top:30px;
	border:1px solid black;
}
table{
	margin:auto;
	width:80%;
}
.content{
	height:250px;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#deleteButton").click(function(){
		var url="${pageContext.request.contextPath}/board/deleteBoard?no=${vo.no}";
		location.href=url;
	});
	/* $("#modifyButton").click(function(){
		var url="${pageContext.request.contextPath}/board/modify?no=${dto.no}&comm=2";
		location.href=url;
	});
	
	$("#goback").click(function(){
		var url="${pageContext.request.contextPath}/board/list";
		location.href=url;
	});
	
	/*$.ajax({
		url:"/mvcProject/ReplyServlet?no=${dto.no}",
		type:"post",
		dataType:"html",
		success:function(data){
			$("#d1").html(data);
		}
	});*/
	
	//$("#addButton").click(function(){
		/* var url="${pageContext.request.contextPath}/BoardServletReplyInsert" */
		
	//});
	
	/* $("#replyButton").click(function(){
		 $.ajax({
			url:"${pageContext.request.contextPath}/ReplyServletInsert",
			type:"post",
			data:{
				no : ${dto.no},
				content : $("#replycontent").val()
			},
			dataType:"html",
			success:function(data){
				$("#d1").html(data);
				$("#replycontent").val("");
			},
			error:function(){
				alert("답글 입력에 실패하였습니다.");	
			} 
		});
	}); */
	/************************* ReplyList의 객체를 쓰기위한 동적바인딩 ***************************/
	/* $(document).on("click", ".rsubmit", function(){
		var cont = $("#rcontent").val();
		var attr = $(this).parent().attr("alt");
		var arra = attr.split(":");
		
		var sendData = {
				content : cont,
				parentid: ${dto.no},
				groupid : arra[1],
				groupcnt : arra[2],
				depth : arra[3],
				id : arra[0]
		} */
		/* $.ajax({
			url:"/mvcProject/ReplyServletInsert2",
			type:"post",
			data: sendData,
			dataType:"html",
			success:function(data){
				$("#d1").html(data);
			}
		});	 
	});*/
	/************************* ReplyList의 객체를 쓰기위한 동적바인딩 ***************************/	
	/* $(document).on("click", ".usubmit", function(){
		var cont = $("#ucontent").val();
		var attr = $(this).parent().attr("alt");
		var arra = attr.split(":");
		
		var sendData = {
				content : cont,
				parentid: ${dto.no},
				id : arra[0]
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/ReplyServletUpdate",
			type:"post",
			data: sendData,
			dataType:"html",
			success:function(data){
				$("#d1").html(data);
			}
		});	
	}); */
	
	/************************* ReplyList의 객체를 쓰기위한 동적바인딩 ***************************/
	/* $(document).on("click", ".deleter", function(){
		var attr = $(this).parent().attr("alt");
		var arra = attr.split(":");
		alert("Deleter");
		$.ajax({
			url:"${pageContext.request.contextPath}/ReplyServletRemove",
			type:"post",
			data: {
				id : arra[0],
				parentid : ${dto.no}
				},
			dataType:"html",
			success:function(data){
				$("#d1").html(data);
			}
		});	 
	}); */
});
</script>
</head>
<body>
<table id="viewForm" border=1>
	<tr>
		<td colspan="2">작성자</td><td colspan="2">
			<spring:message text="${vo.writer}"/>
		</td>
	</tr>
	<tr>
		<td>작성일</td><td align="center">
		<spring:message text="${vo.regdate}"/></td>
		<td>조회수</td><td align="center">
		<spring:message text="${vo.readhit}"/></td>
	</tr>
	<tr>
		<td colspan="2">제목</td>
		<td name="subject" colspan="2" align="center">
		<spring:message text="${vo.subject}"/></td>
	</tr>
	<tr>
		<td colspan="4">
		<textarea name="content" cols="100" rows="16" readonly>
		${vo.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2"><label for="file">첨부파일</label></td><td colspan="2">
			<c:choose>
				<c:when test="${vo.filename != '' || vo.filename != null}">
					<a href="#">
						<spring:message text="${vo.filename}"/>
					</a><spring:message text="(${vo.filesize}KB)"/>
				</c:when>
				<c:otherwise>
					없음
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td align="left"><button id="modifyButton">수정</button></td>
		<td align="right"><button id="addButton">답글</button> </td>
		<td align="left"><button id="goback">목록</button></td>
		<td align="right"><button id="deleteButton">삭제</button></td>
	</tr>
</table>
<div id="d1">
</div>
<div id="replyinput">
	<textarea rows="5" cols="80" name="replycontent" id="replycontent">
	</textarea><button id="replyButton">확인</button>
</div>
</body>
</html>