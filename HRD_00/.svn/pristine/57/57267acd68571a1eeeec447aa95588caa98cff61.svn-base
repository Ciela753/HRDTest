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
table a {color:blue}
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
			"SELECT mt2.*, TO_CHAR(JOINDATE, 'YYYY-MM-DD') FROM MEMBER_TBL_02 mt2");
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
	<h3>홈쇼핑 회원 목록 조회</h3>
<form method="POST" name="frm">

	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<th>회원성명(자동발생)</th>
			<th>회원전화</th>
			<th>회원주소</th>
			<th>가입일자</th>
			<th>고객등급[A:vip, b:일반, c:직원]</th>
			<th>거주지역</th>
		</tr>
		<%while(rs.next()) { %>
		<tr>
			<td><a href="p2_1.jsp?custno=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
			<td><%=rs.getString(2) %></td>	
			<td><%=rs.getString(3) %></td>	
			<td><%=rs.getString(4) %></td>	
			<td><%=rs.getString(8) %></td>	
			<td><%=rs.getString(6).equals("A") ? "vip" : rs.getString(6).equals("B") ? "일반" : "직원"%></td>	
			<td><%=rs.getString(7) %></td>	
		</tr>
		<%} %>
	</table>
</form>
<%
	conn.close();
} 

%>
</section>
<footer>
	<p>HRDKOREA Copyright &copy; All rights reserved Human Resources Development Service of Korea</p>
</footer>
</body>
</html>