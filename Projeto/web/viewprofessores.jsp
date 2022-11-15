<!DOCTYPE html>
<html>
    <head>
        <title>Controlar Professores</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="css/main_controlar.css">
        <link rel="stylesheet" href="css/tabela.css">
        <link rel="stylesheet" href="css/navbarlateral.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

        <script src="scripts/filtrar.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <link rel="icon" href="images/TCC-logo.png" />
    </head>

    <body>
        <%@ page import="com.crudjspjava.bean.Usuario, com.crudjspjava.dao.UsuarioDao, java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

        <nav class="navigation">
            <ul>

                <li class="list">
                    <a href="viewalunos.jsp?page=1">
                        <span class="icon">
                            <ion-icon name="file-tray-full-outline"></ion-icon>
                        </span>
                        <span class="title">Controlar Alunos</span>
                    </a>
                </li>

                <li class="list active ">
                    <a href="viewprofessores.jsp?page=1">
                        <span class="icon">
                            <ion-icon name="file-tray-full-outline"></ion-icon>
                        </span>
                        <span class="title">Controlar Professores</span>
                    </a>
                </li>

                <li class="list">
                    <a href="relatorioProfessor.jsp">
                        <span class="icon">
                            <ion-icon name="file-tray-full-outline"></ion-icon>
                        </span>
                        <span class="title">Relatorio</span>
                    </a>
                </li>
            </ul>
        </nav>
        
        <div class="content">
            <h1 id="apresentacao">Lista de Professores</h1>
            <%

                String pageid = request.getParameter("page");
                int id = Integer.parseInt(pageid);
                int total = 10;

                List<Usuario> list = UsuarioDao.getRecords(id,total);
                request.setAttribute("list", list);

            %>

            <input type="text" id="filtrarnomes" onkeyup="filtrar('filtrarnomes', 0)" placeholder="Busca de nomes">
            <input type="text" id="filtraremails" onkeyup="filtrar('filtraremails', 1)" placeholder="Busca de emails">

            <a href="addusuarioform.jsp">Cadastrar professor</a>
            <table id="tabela" class="table table-stripe">
                <tr>
                    <th class="text-center">Nome</th>
                    <th class="text-center">Email</th>    
                    <th class="text-center">Condicao</th>
                    <th class="text-center">Ações</th>
                </tr>
                    <c:forEach items="${list}" var="usuario">
                        <tr>   
                            <td class="text-center">${usuario.getNome()}</td>
                            <td class="text-center">${usuario.getEmail()}</td>
                            <td class="text-center">${usuario.getCondicao()}</td>
                            <td class="text-center"><a href="editform.jsp?id=${usuario.getId()}">Editar</a>
                                <a href="bloquearprofessor.jsp?id=${usuario.getId()}">Bloquear</a>
                        </tr>
                    </c:forEach>    
                      
            </table>
            <br>
            <a href="viewprofessores.jsp?page=1">1</a>
            <a href="viewprofessores.jsp?page=2">2</a>
            <a href="viewprofessores.jsp?page=3">3</a>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

        </div>
    </body>

</html>