<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/SBoardMVC/resources/js/jquery-2.1.4.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style type="text/css">
section{
	width:600px;
	height:800px;
	padding-top:50px;
	margin:auto;
}
table,tr,td,th{
	border:1px solid black;
	margin:auto;
}
table{
	width:100%;
}
.no{
	width:10%;
}
.title{
	width:40%;
}
.writer{
	width:20%;
}
.readhit{
	width:10%;
}
.deleted{
text-decoration: line-through;
}
a:LINK {
	text-decoration: none;
	color: black;
}
a:HOVER {
	font-weight: bold;
}
a:VISITED {
	color: black;
}
</style>
<script type="text/javascript">
$(function(){
	$("#newContent").click(function(){
		location.href="/SBoardMVC/board/insertBoard";
	});
});
</script>
</head>
<body>
<section>

<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
	</tr>
	<c:forEach var="ls" items="${list}">
		<tr>
			<td>${ls.num}</td>
			<td><a 
			href="/SBoardMVC/board/boardDetail?no=${ls.no}">
			${ls.subject}</a></td>
			<td>${ls.writer}</td>
			<td>${ls.regdate}</td>
		<tr>
	</c:forEach>
	<tr>
		<td colspan="4"><button id="newContent">새글쓰기</button></td>
	</tr>
</table>
<jsp:include page="navi.jsp">
		<jsp:param value="${navi}" name="navi"/>
	</jsp:include>
</section>

</body>
</html>








