<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {margin: 0}
header, footer {background:#00F; padding:20px;}
nav {background: #66f; padding:15px;}
header h2, footer p {text-align:center}
header, footer, a {color:#fff; text-decoration: none;}
a{margin:15px}
section {min-height: 300px; padding:15px;}
section h3 {margin: 0 auto;}
table {margin:0 auto;}
</style>
</head>
<body>
<header>
	<h2>쇼핑몰 회원관리 ver 1.0</h2>
</header>
<nav>
	<a href="p1.jsp">회원등록</a>
	<a href="p2.jsp">회원목록조회/수정</a>
	<a href="p3.jsp">회원매출조회</a>
	<a href="index.jsp">홈으로</a>
</nav>
<section>

<%
request.setCharacterEncoding("utf-8");
String custno = request.getParameter("custno");

if(request.getMethod().equals("GET")) {
	Connection conn = DBConn.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(
			"SELECT MEMBER_TBL_02.*, TO_CHAR(SYSDATE, 'YYYY-MM-DD') JOINDATE FROM MEMBER_TBL_02 WHERE CUSTNO = ?");
	pstmt.setString(1, custno);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
	<h3>홈쇼핑 회원 수정</h3>
<form method="POST" name="frm">

	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td><input readonly value="<%=rs.getString(1)%>" name="custno"></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input name="custname" value="<%=rs.getString(2)%>"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input name="phone" size="30" value="<%=rs.getString(3)%>"></td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input name="address" value="<%=rs.getString(4)%>"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input name="joindate" readonly value="<%=rs.getString(8)%>"></td>
		</tr>
		<tr>
			<th>고객등급[A:vip, b:일반, c:직원] </th>
			<td><input name="grade" value="<%=rs.getString(6)%>"></td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td><input name="city" value="<%=rs.getString(7)%>"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button>수정</button>
				<a href="p2.jsp"><button type="button">조회</button></a>
			</th>
			<td><input name="city"></td>
		</tr>
	</table>
</form>
<script>
	frm.onsubmit = function() {
		event.preventDefualt();
		if(!frm.custname.value) {
			frm.custname.focus();
			alert("회원이름을 입력하세요");
		} else if(!frm.phone.value) {
			frm.phone.focus();
			alert("회원전화를 입력하세요");
			
		} else if(!frm.address.value) {
			frm.address.focus();
			alert("회원주소를 입력하세요");
			
		} else if(!frm.grade.value) {
			frm.grade.focus();
			alert("회원등급을 입력하세요");
			
		} else if(!frm.city.value) {
			frm.city.focus();
			alert("회원도시를 입력하세요");
			
		} else {
			frm.submit();
		}
	}
</script>
<%
	conn.close();
} else {
	Connection conn = DBConn.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(
			"UPDATE MEMBER_TBL_02 SET CUSTNAME = ?, PHONE = ?, ADDRESS = ?, JOINDATE = TO_DATE(?, 'YYYY-MM-DD'), GRADE = ?, CITY = ? WHERE CUSTNO = ?");
	int idx=1;
	pstmt.setString(idx++, request.getParameter("custno"));
	pstmt.setString(idx++, request.getParameter("custname"));
	pstmt.setString(idx++, request.getParameter("phone"));
	pstmt.setString(idx++, request.getParameter("address"));
	pstmt.setString(idx++, request.getParameter("joindate"));
	pstmt.setString(idx++, request.getParameter("grade"));
	pstmt.setString(idx++, request.getParameter("city"));
	
	pstmt.executeUpdate();
	out.print("<script>alert('회원수정이 완료되었습니다.'); location.href = 'p2.jsp';</script>");
	
}

%>
</section>
<footer>
	<p>HRDKOREA Copyright &copy; All rights reserved Human Resources Development Service of Korea</p>
</footer>
</body>
</html>