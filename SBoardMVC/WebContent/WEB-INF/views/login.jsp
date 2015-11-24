<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	margin:auto;
	margin-top: 300px;
	width:350px;
	height:100px;
	border:1px solid black;
}
</style>
<script type="text/javascript" src="/SBoardMVC/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#regist").click(function(){
		location.href="/SBoardMVC/regist/registPage";
	});
})
</script>
</head>
<body>
<div>
	<form action="/SBoardMVC/login/welcomePage">
		<label>아이디 : 
		<input type="text" name="id" id="id"></label><br>
		<label>비밀번호 :
		<input type="password" name="pw" id="pw">
		</label><br>
		<input type="submit" value="로그인">
	</form>
	<button id="regist">회원가입</button>
</div>
</body>
</html>







