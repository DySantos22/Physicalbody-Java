<%@ page import="com.crudjspjava.dao.ProfessorDao"%>
<jsp:useBean id="u" class="com.crudjspjava.bean.Professor"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>


<%
	ProfessorDao.deletarProfessor(u);
	response.sendRedirect("viewprofessores.jsp?page=1");
%>