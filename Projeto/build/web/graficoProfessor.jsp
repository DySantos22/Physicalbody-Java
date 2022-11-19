 <%@ page import="com.crudjspjava.dao.ProfessorDao, com.crudjspjava.bean.Professor, java.util.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 
             <%               
                int[] valores = ProfessorDao.getRelatorioProfessores();
                request.setAttribute("valores", valores);  

JSONObject jo = new JSONObject();
jo.put("status", true);
jo.put("dados", valores);

            %>
<%=jo%>