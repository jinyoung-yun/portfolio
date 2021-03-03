<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
body {
	background-color: blanchedalmond;
}

#header {
	background-color: skyblue;
	height: 100px;
	text-align: center;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 100%
}

#navagation {
	background-color: gray;
	box-sizing: border-box;
	height: 50px;
	line-height: 50px;
}

.graybutton {
	background-color: gray;
	border: 0px;
	color: aliceblue;
}

#right-button {
	float: right;
}

#content {
	background-color: white;
}

#content-in {
	background-color: coral;
	height: 130px;
	margin: 20px;
	padding: 20px;
}

#footer {
	background-color: lightgray;
	height: 80px;
	text-align: center;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 100%
}
</style>
</head>
<body>
	<div id="header">
		<h1>게시판 제목</h1>
	</div>
		<div id="navagation">
		<input type="button" value="홈으로" class="graybutton" onclick="Home()">
<%
	String userId = null;
	if(session.getAttribute("userId") != null){
	userId = (String) session.getAttribute("userId");
	
}
	System.out.println("index.jsp / session /" + userId);
	if(userId == null){
%>
		<span id="right-button"> <input type="button" value="로그인"
			class="graybutton" onclick="Login()"> <input type="button"
			value="회원가입" class="graybutton" onclick="Join()">
		</span>

<%
	}
%>

<% if(userId != null){
	%>
<span id="right-button"> <input type="button" value="로그아웃"
			class="graybutton" onclick="location.href='logoutAction.jsp'" > 
			<input type="button" value="회원정보수정" class="graybutton" onclick="location.href='MemberModifyController'">
		</span>
	<% } %>
		
		
	</div>

	<div id="content">
		<h3>컨텐츠 화면</h3>
		Java기반 Back-End 개발자 & 정보처리산업기사
		<div id="content-in"></div>

		Some text.<br> Lorem lpsum is simply dummy text of the printing
		and typesetting industry <br> book.<br> with desktop
		publishing

	</div>
	<div id="footer">인천일보 아카데미 Copyright 2020</div>

</body>
<script>
	function Home() {
		location.href = "index.jsp"
	}
	function Login() {
		location.href = "LoginForm.jsp"
	}
	function Join() {
		location.href = "JoinForm.jsp"
	}
	function BoardListMove() {
		location.href = "BoardList.jsp"

	}
	function logout() {
		location.href = "logoutAction.jsp"
	}
	
	
</script>
</html>