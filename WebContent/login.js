$(document).ready(function() {
	// 인트로화면 클릭했을때
	$("#ToLogin").click(function() {// 클릭했을때
		$("#BeforeLogin").css("display", "none");
		$("#Login").css("display", "block");
	});
	// 로그인 버튼 클릭했을때
	$("#loginBtnLogin").click(function() {
		var query = {
			id : $("#loginTxtID").val(),
			pw : $("#loginTxtPw").val()
		}
		$.ajax({
			type : "post",
			url : "loginDB.jsp",
			data : query,
			success : function(data) {
				if (data == 1) {
					$("#success").css("display", "none");
					alert("비밀번호가 존재하지 않습니다.");
				} else if (data == -1) {
					$("#success").css("display", "none");
					alert("아이디가 존재하지 않습니다.");
				} else {
					var ik = JSON.parse(data);
					alert("안녕하세요<br>" + ik[0].name + "</br>님");
					$("#success").css("display", "block");
					$("#h1").html(ik[0].name);
				}
			}
		});
	});
});