<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
	height: 170px auto;
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
	table,tr,td{
	border: 1px solid;
    border-collapse:  collapse;
	text-align: center;
	margin: 0 atuo;
	width: 300px;
	background-color: white;
	height: 40px;
	}
	td{
	width: auto;
	}	

</style>

</head>
<body>
	<div id="header">
		<h1>게시판 제목</h1>
	</div>

	<div id="navagation">
		<input type="button" value="홈으로" class="graybutton" 
		onclick="location.href='index.jsp'">
		<span id="right-button"> <input type="button" value="로그인"
			class="graybutton" onclick="location.href='LoginForm.jsp'"> <input type="button"
			value="회원가입" class="graybutton" onclick="location.href='JoinForm.jsp'">
		</span>
	</div>

	<div id="content">
		<h3>컨텐츠 화면</h3>
		Java기반 Back-End 개발자 & 정보처리산업기사
		<div id="content-in">
		
		<div id="LoginTable" align="center">
		<form action="memberLogin" method="post" onsubmit="return MemberLogin()">
		<table>
		<tr>
		<td colspan="2">로그인</td>
		</tr>
		<tr>
		<td>아이디</td>
		<td><input type="text" id="userId" name="userId"></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input type="password" id="userPw" name="userPw"></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="로그인" width="30px" id="LoginBtn"></td>
		</tr>
		</table>
		</form>
		</div>
		
		
		
		
		
		
		
		</div>
		
			Some text.<br> Lorem lpsum is simply dummy text of the printing
			and typesetting industry <br> book.<br> with desktop
			publishing
		
	</div>

	<div id="footer">인천일보 아카데미 Copyright 2020</div>

</body>
<script>
$(function() {
	$("#LoginBtn").click(function() {
		MemberLogin();
	})
})

function MemberLogin() {
	var userId = $("#userId").val();
	var userPw = $("#userPw").val();
	if(userId.length==0){
		alert("아이디를 입력해주세요");
		return false;
	}else if(userPw.length==0){
		alert('비밀번호를 입력해주세요')
		return false;
	}else if(userId.length>10){
		alert("아이디 입력 자릿수가 10자리를 초과했습니다..");
		return false;
	}else if(userPw.length>10){
		alert("비밀번호 입력 자릿수가 10자리를 초과했습니다..");
		return false;
	}else if(userId.length<4||userId.length>8){
		alert("아이디 입력 형식이 잘못되었습니다.\n (4~8자리 입력)");
		return false;
	}else if(userPw.length<4||userPw.length>8){
		alert("비밀번호 입력 형식이 잘못되었습니다.\n (4~8자리 입력)");
		return false;
	}
	return true;
}


	function Home() {
		location.href = "index.jsp"
	}
	function Login() {
		location.href = "LoginForm.jsp"
	}
	function Join() {
		location.href = "JoinForm.jsp"
	}
</script>
</html>