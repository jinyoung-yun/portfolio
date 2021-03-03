<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<script type="text/javascript">
function registerCheckFunction() {
	var userId = $("#userId").val();
	$.ajax({
		type:'POST',
		url: './OverLapCheckServlet',
		data: {userId : userId} , //파라변수이름 : 사용자가입력한벨류값
		success:function(result) {
			if(userId.length < 4 || userId.length > 8){
				$("#checkMessage").html("아이디 형식이 맞지 않습니다.");
				$("#checkType").attr('class', 'modal-content panel-warning');
			}
			else if(result==1){
				$("#checkMessage").html("사용할 수 있는 아이디입니다.");
				$("#checkType").attr('class', 'modal-content panel-success');
			}
			else {
				$("#checkMessage").html("사용할 수 없는 아이디입니다.");
				$("#checkType").attr('class', 'modal-content panel-warning');
			}
			$("#checkModal").modal("show");
		}
	})
}



	</script>
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

table, tr, td {
	border: 1px solid;
	border-collapse: collapse;
	text-align: center;
	margin: 0 atuo;
	width: 500px;
	background-color: white;
	height: 40px;
}

td {
	width: auto;
}
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
			<form action="MemberJoinController" method="post" onsubmit="return submitCheck();">
				<table>
					<tr>
						<td colspan="2">회원가입</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" id="userId" name="userId"><button class="btn btn-primary" onclick="registerCheckFunction();" type="button">중복체크</button><span id="idCheck"></span></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="userPw" name="userPw"></td>
					</tr>
					<tr>
					<td>이름</td>
					<td><input type="text" id="userName" name="userName"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" id="userNum" name="userPhone"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>남<input type="radio" id="userGender" value="남" name="userGender"> 여<input
							type="radio" id="userGender" value="여" name="userGender"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" id="userAdd" name="userAddr"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="userEmail1" name="userEmail1">@<input type="text" id="userEmail2" name="userEmail2">
                <select id="eSel">
                    <option value="">직접입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="gmail.com">gmail.net</option>
                </select></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="등록" width="30px" id="joinbtn">
						<input type="reset" value="취소"></td>
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




<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null){
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if (session.getAttribute("messageType") != null){
			messageType = (String) session.getAttribute("messageType");
		}
		
		if(messageContent != null){
			%>
			<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="vertical-alignment-helper">
					<div class="modal-dialog vertical-align-center">
						<div class="modal-content
						<%if(messageType.equals("오류 메시지")){ out.println("panel-warning"); } else { out.println("panel-success");}%>">
							<div class="modal-header panel-heading">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">
									<%= messageType %>
								</h4>
							</div>
							<div class="modal-body">
							<h5 style="color: black;"><%= messageContent %></h5>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
			 $("#messageModal").modal('show');
			</script>
			<%
			session.removeAttribute("messageType");
			session.removeAttribute("messageContent");
		}
	%>



<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="vertical-alignment-helper">
					<div class="modal-dialog vertical-align-center">
						<div id = "checkType" class="modal-content panel-info>">
							<div class="modal-header panel-heading">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="checkType">
									확인 메시지
								</h4>
							</div>
							<div class="modal-body" id="checkMessage">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
<script>
	function Home() {	location.href = "index.jsp"	}
	function Login() {	location.href = "LoginForm.jsp"	}
	function Join() { location.href = "JoinForm.jsp"	}
	 function emailSelect(){
         var email = $("#eSel").val();
         console.log(email);
         $("#userEmail2").val(email);
     }
	 $(function(){
    		$("#eSel").change(function() {
    			emailSelect();
    		})	
    		$("#joinbtn").click(function() {
    			submitCheck();
    		})
    		
    	})
    			
    		function submitCheck(){
    		var userId = $("#userId").val();
    		var userPw = $("#userPw").val();
    		var userName = $("#userName").val();
    		var userNum = $("#userNum").val();
    		var userGender = $("#userGender").val();
    		var userAdd = $("#userAdd").val();
    		var userEmail = $("#userEmail1").val()+"@"+$("#userEmail2").val();
    		var msg = "[아이디] : "+userId+"\n [비밀번호] : "+userPw+"\n [이름] : "+userName+
    		"\n [전화번호] : "+userNum+"\n [성별] : "+userGender+"\n [주소] : "+userAdd+"\n [이메일] : "+userEmail;
    		
    		if(userId == null || userId == ""){
    			var len = $('#userId').val().length;
    			$('#userId').focus();
    			$('#userId')[0].setSelectionRange(len, len);
    			alert('아이디를 입력하세요.');
    			 return false;
    			
    		}else if (userPw == null || userPw == ""){
    			var len = $('#userPw').val().length;
    			$('#userPw').focus();
    			$('#userPw')[0].setSelectionRange(len, len);
    			alert('비밀번호를 입력하세요.');
    			 return false;
    		}else if(userName == null || userName == ""){
    			var len = $('#userName').val().length;
    			$('#userName').focus();
    			$('#userName')[0].setSelectionRange(len, len);
    			alert('이름을 입력하세요.');
    			 return false;
    		}else if(userNum == null || userNum == ""){
    			var len = $('#userNum').val().length;
    			$('#userNum').focus();
    			$('#userNum')[0].setSelectionRange(len, len);
    			alert('전화번호를 입력하세요.');
    			 return false;
    		}else{
    			alert(msg);
    			 return true;
    			 
    		}
    		
    		
    	} 
	 
	/*  $(function(){
		 var userId = $("#userId").val();
	 		if(userId.length<4 || userId.length > 8 || userId == null|| userId.equals("")){		 
         $("#subbtn").click(function()
             $("#userId").focus()
             alert('아이디 오류');
         }
         }); */
         
	/*  function checkValidate(){
		 var userId = $("#userId").val();
 		if(userId.length<4 || userId.length > 8 || userId == null|| userId.equals("")){
 			console.log(userId);
 			alert('아이디 오류');
 		}
	 } */

	 
</script>

</html>