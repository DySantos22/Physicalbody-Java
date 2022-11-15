<%@ page import="com.crudjspjava.dao.UsuarioDao"%>
<jsp:useBean id="u" class="com.crudjspjava.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i = UsuarioDao.bloquearUsuario(u);
response.sendRedirect("viewprofessores.jsp?page=1");
%>