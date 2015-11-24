<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" 
src="/SBoardMVC/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#commit").click(function(){
		var sub = $("#subject").val();
		var con = $("#content").val();
		if(sub==""){
			alert("제목을 입력해주세요");
			return false;
		}else if(con==""){
			alert("내용을 입력해주세요");
			return false;
		}else{
			document.form.submit();
		}
	});
	$("#reset").click(function(){
		location.href="/SBoardMVC/board/BoardList";
		return false;
	});
});
</script>
<style type="text/css">
table,tr,td{
	top:30px;
	border:1px solid black;
}
table{
	margin:auto;
	width:80%;
}
.content{
	height:500px;
}
</style>
</head>
<body>
<form id="form" name="form" method="post" 
action="/SBoardMVC/board/insertBoard" encType="multipart/form-data">
<input type="hidden" name="writer" value="hong">
<input type="hidden" name="password" value="1234">
<table>
	<tr>
		<td>제목 : 
			<input type="text" id="subject" name="subject">
		</td>
	</tr>
	<tr class="content">
		<td><textarea rows="16" cols="100" 
		id="content" name="content"></textarea><br>
		<label>파일첨부 : 
		<input type="file" name="file" id="file" multiple></label>
		</td>
	</tr>
	<tr>
		<td>
			<button id="commit">등록</button>
			<button id="reset">취소</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>