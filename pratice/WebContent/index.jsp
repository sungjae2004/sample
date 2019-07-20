<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인 페이지</title>
</head>
<body>


	<h3 align='center'>프리스톤테일 랭킹</h3>
	<% 

	//자바 코드와 태그를 같이 사용
	out.println("<table align='center'border='1'>");
	out.println("<tr><th>순위</th>");
	out.println("<th>서버</th>");
	out.println("<th>직업</th>");
	out.println("<th>이름</th></tr>");
	//MySQL 연결할 수 있도록 드라이버를 가져오기
	Class.forName("com.mysql.jdbc.Driver");
	//데이터베이스 연결하기
	Connection con =DriverManager.getConnection("jdbc:mysql://192.168.0.100:3306/user08?useUnicode=true&characterEncoding=utf8","user08","user08");
	//SQL 만들기
	PreparedStatement pstmt =con.prepareStatement(
			"select * from pristontale");	
	//실행
	ResultSet rs =pstmt.executeQuery();
	//전체를 순회하면서 읽기
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>" +rs.getString("rank")+"</td>");
		out.println("<td>" +rs.getString("server")+"</td>");
		out.println("<td>" +rs.getString("job")+"</td>");
		out.println("<td>" +rs.getString("name")+"</td>");
		out.println("</tr>");
	}
	rs.close();
	pstmt.close();
	con.close();
	out.println("</table>");
%>


</body>
</html>