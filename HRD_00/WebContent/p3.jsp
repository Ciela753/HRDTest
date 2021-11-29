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
			"SELECT CUSTNO, (SELECT CUSTNAME FROM MEMBER_TBL_02 B where A.CUSTNO = B.CUSTNO), (SELECT GRADE FROM MEMBER_TBL_02 B where A.CUSTNO = B.CUSTNO), SUM(PRICE) FROM MONEY_TBL_02 A GROUP BY CUSTNO ORDER BY 1");
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
	<h3>홈쇼핑 회원 매출 조회</h3>
<form method="POST" name="frm">
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<th>회원성명(자동발생)</th>
			<th>고객등급[A:vip, b:일반, c:직원]</th>
			<th>매출</th>
		</tr>
		<%while(rs.next()) { %>
		<tr>
			<td><%=rs.getString(1) %></td>	
			<td><%=rs.getString(2) %></td>	
			<td><%=rs.getString(3).equals("A") ? "VIP" : rs.getString(3).equals("B") ? "고객" : "직원"%></td>	
			<td><%=rs.getString(4) %></td>	
		</tr>
		<%} %>
	</table>
</form>
<%
	conn.close();
} else {
	Connection conn = DBConn.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(
			"INSERT INTO MEMBER_TBL_02 VALUES (?, ?, ?, ?, TO_DATA(?, 'YYYYMMDD'), ?, ?)");
	int idx=1;
	pstmt.setString(idx++, request.getParameter("custno"));
	pstmt.setString(idx++, request.getParameter("custname"));
	pstmt.setString(idx++, request.getParameter("phone"));
	pstmt.setString(idx++, request.getParameter("address"));
	pstmt.setString(idx++, request.getParameter("joindate"));
	pstmt.setString(idx++, request.getParameter("grade"));
	pstmt.setString(idx++, request.getParameter("city"));
	
	pstmt.executeUpdate();
	out.print("<script>alert('회원등록이 완료되었습니다.'); location.href = 'p2.jsp';</script>");
	
}

%>
</section>
<footer>
	<p>HRDKOREA Copyright &copy; All rights reserved Human Resources Development Service of Korea</p>
</footer>
</body>
</html>