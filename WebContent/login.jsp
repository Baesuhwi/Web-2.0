<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script src="login.js"></script>
</head>
<body>
	<!-- 인트로화면 -->
	<div id="BeforeLogin" style="display: block">
		<img src="yju.jpg" width='300px' height='300px' /> <br />
		<button id="ToLogin">인트로화면에서 로그인화면으로가기</button>
	</div>
	
	<!-- 로그인 화면 -->
	<div id="Login" style="display: none">
		<h1>My SNS Service</h1>
		<br />
		<h3>로그인 해주세요</h3>
		<p>아이디</p>
		<input type="text" id="loginTxtID" maxlength="50" />
		<p>비밀번호</p>
		<input type="password" id="loginTxtPw" maxlength="50" /> <br /> <br />
		<button id="loginBtnLogin">로그인</button>
		<button id="loginBtnJoin">회원가입</button>
	</div>
	
	<!-- 로그인 확인 -->
	<div id="success" style="display: none">
		안녕하세요<br>
		<h1 id="h1"></h1>
		님
	</div>
</body>
</html>