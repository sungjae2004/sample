<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������</title>
</head>
<body>


	<h3 align='center'>������������ ��ŷ</h3>
	<% 

	//�ڹ� �ڵ�� �±׸� ���� ���
	out.println("<table align='center'border='1'>");
	out.println("<tr><th>����</th>");
	out.println("<th>����</th>");
	out.println("<th>����</th>");
	out.println("<th>�̸�</th></tr>");
	//MySQL ������ �� �ֵ��� ����̹��� ��������
	Class.forName("com.mysql.jdbc.Driver");
	//�����ͺ��̽� �����ϱ�
	Connection con =DriverManager.getConnection("jdbc:mysql://192.168.0.100:3306/user08?useUnicode=true&characterEncoding=utf8","user08","user08");
	//SQL �����
	PreparedStatement pstmt =con.prepareStatement(
			"select * from pristontale");	
	//����
	ResultSet rs =pstmt.executeQuery();
	//��ü�� ��ȸ�ϸ鼭 �б�
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