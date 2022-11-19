<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Editar Professor</title>
        <link rel="stylesheet" href="css/form_editarecadastrar.css">
    </head>
    <body>

        <%@ page import="com.crudjspjava.bean.Usuario, com.crudjspjava.dao.UsuarioDao"%>

        <%
            String id = request.getParameter("id");
            Usuario usuario = UsuarioDao.getRegistroById(Integer.parseInt(id));
            
            
        %>

        <h1 id="titulo">Editar Professor</h1>

        <div class="editar">
            <form action="editprofessor.jsp" method="post">

                <div>
                    <label for="ID">
                        <input type="hidden" name="id" value="<%=usuario.getId()%>">
                    </label>
                </div>
                <div>
                    <label for="Nome">
                        <input type="text" name="nome" placeholder="Nome" value="<%=usuario.getNome()%>" required>
                    </label>
                </div>
                <div>
                    <label for="Email">
                        <input type="email"  name="email" placeholder="Email" value="<%=usuario.getEmail()%>" required>
                    </label>
                </div>
                      <div>
                    <label for="Senha">
                        <input type="password"  name="senha" placeholder="Senha" required>
                    </label>
                </div>
                <div>
                    <label for="Condicao">Condição:
                        <input type="radio" name="condicao" value="Ativo" checked>Ativo
                        <input type="radio" name="condicao" value="Inativo">Inativo<br>
                    </label>
                <div>
                    <label for="button">
                        <input type="submit" value="Editar">
                    </label>
                </div>
            </form>
        </div>

    </body>
</html>