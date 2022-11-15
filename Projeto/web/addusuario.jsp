<%@ page import="com.crudjspjava.dao.UsuarioDao"%>
<jsp:useBean id="u" class="com.crudjspjava.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
  int i = UsuarioDao.salvarUsuario(u);
 
    if(i > 0){
        response.sendRedirect("addUsuario-success.jsp");
    }else{
        response.sendRedirect("addUsuario-error.jsp");
    }
%>