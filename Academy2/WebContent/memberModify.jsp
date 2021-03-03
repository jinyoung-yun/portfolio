<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {background-color: blanchedalmond;}

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

#right-button {float: right;}

#content {background-color: white;}

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

table, tr, td {
	border: 1px solid;
	border-collapse: collapse;
	text-align: center;
	margin: 0 atuo;
	width: 500px;
	background-color: white;
	height: 40px;
}

td {	width: auto;	}
</style>
</head>
<body>
	<div id="header">
		<h1>게시판 제목</h1>
	</div>

	<div id="navagation">
		<input type="button" value="홈으로" class="graybutton" onclick="Home()">
		<span id="right-button"> <input type="button" value="로그인"
			class="graybutton" onclick="Login()"> <input type="button"
			value="회원가입" class="graybutton" onclick="Join()">
		</span>
	</div>

	<div id="content">
		<h3>컨텐츠 화면</h3>
		Java기반 Back-End 개발자 & 정보처리산업기사
		<div id="content-in">
	
			<div id="JoinTable" align="center">
			<form action="MemberModifyProcessController" method="post">
				<table>
					<tr>
						<td colspan="2">회원가입</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${memberInfo.userId }</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="userPw" name="userPw" value="${memberInfo.userPw }"></td>
					</tr>
					<tr>
					<td>이름</td>
					<td>${memberInfo.userName }</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" id="userNum" name="userPhone" value="${memberInfo.userPhone }"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>${memberInfo.userGender }</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" id="userAdd" name="userAddr" value=${memberInfo.userAddr }></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="userEmail" value="${memberInfo.userEmail }"></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="수정 완료" width="30px">
						<input type="button" value="돌아가기" onclick="location.href='index.jsp'"></td>
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
	function Home() {
		location.href = "index.jsp"
		console.log("Home to Join");

	}
	function Login() {
		location.href = "LoginForm.jsp"
		console.log("Login to Join");
	}
	function Join() {
		location.href = "JoinForm.jsp"
			console.log("Join to Join");
	}
	 function emailSelect(){
         var email = $("#eSel").val();
         console.log(email);
         $("#userEmail2").val(email);
     }
</script>
</html>