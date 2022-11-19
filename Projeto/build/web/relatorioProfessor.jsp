<%@ page import="com.crudjspjava.dao.UsuarioDao, com.crudjspjava.bean.Usuario, com.crudjspjava.dao.AlunoDao, com.crudjspjava.bean.Aluno, java.util.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/html_principal.css">
        <link rel="stylesheet" href="css/main_controlar.css">
        <link rel="stylesheet" href="css/tabela.css">
        <link rel="stylesheet" href="css/navbarlateral.css">
        <link href="css/grafico.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
        
        <script src="./scripts/filtrar.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <link rel="icon" href="images/TCC-logo.png" />
        <title>Relatório</title>
    </head>
    <body>
        
  <nav class="navigation">
    <ul>
      <li class="list">
        <a href="viewalunos.jsp?page=1">
          <span class="icon" style="top:20px;">
            <ion-icon name="file-tray-full-outline"></ion-icon>
          </span>
          <span class="title">Controlar Alunos</span>
        </a>
      </li>

      <li class="list">
        <a href="viewprofessores.jsp?page=1">
          <span class="icon" style="top:20px;">
            <ion-icon name="file-tray-full-outline"></ion-icon>
          </span>
          <span class="title">Controlar Professores</span>
        </a>
      </li>
      
      <li class="list active">
        <a href="relatorioProfessor.jsp">
          <span class="icon" style="top:20px;">
            <ion-icon name="file-tray-full-outline"></ion-icon>
          </span>
          <span class="title">Relatorio</span>
        </a>
      </li>
    </ul>
  </nav>
      
        <div class="content">
            <%
                
                List<Usuario> list = UsuarioDao.getRelatorio();
                request.setAttribute("list", list);
               
                int[] valores = UsuarioDao.getRelatorioProfessores();
                request.setAttribute("valores", valores);
                
                List<Aluno> listP = AlunoDao.getRelatorio();
                request.setAttribute("listP", listP);
               
                int[] valor = AlunoDao.getRelatorioAlunos();
                request.setAttribute("valor", valor);
                
                int[] condicao = AlunoDao.getRelatorioAlunosCondicao();
                request.setAttribute("condicao", condicao);

                int[] mes = AlunoDao.getRelatorioAlunosPorMes();
                request.setAttribute("mes", mes);
                
                int[] sexo = AlunoDao.getRelatorioAlunosSexo();
                request.setAttribute("sexo", sexo);
                
                int[] mesFim = AlunoDao.getRelatorioAlunosFimMatricula();
                request.setAttribute("mesFim", mesFim);
            %>
        
          <h1 id="apresentacao">NOSSOS<span class="relatorio"> RELATÓRIOS</span></h1>
    
 
            <div class="grafico">
                <canvas id="myChart"></canvas>
                <p>Condição dos professores:</p>
                <p>Ativos: <%=valores[0]%></p>
                <p>Inativos: <%=valores[1]%></p>
            </div>
            
            <div class="grafico">
                <canvas id="myChart2"></canvas>
                <p>Condição dos alunos:</p>
                <p>Ativos: <%=condicao[0]%></p>
                <p>Inadimplentes <%=condicao[1]%></p>
                <p>Inativos: <%=condicao[2]%></p>
            </div>
            
            <div class="grafico">
                <canvas id="myChart3"></canvas>
                <p>Planos mais populares:</p>
                <p>Mensal: <%=valor[0]%></p>
                <p>Trimestral: <%=valor[1]%></p>
                <p>Anual: <%=valor[2]%></p>
            </div>
            
            <div class="grafico">
                <p>Pagamentos em cada mês:</p>
                <canvas id="myChart4"></canvas>
            </div>

            <div class="grafico">
                <canvas id="myChart5"></canvas>
                <p>Sexo dos alunos:</p>
                <p>Masculino: <%=sexo[0]%></p>
                <p>Feminino: <%=sexo[1]%></p>
                <p>Outros: <%=sexo[2]%></p>
            </div>
            
            <div class="grafico">
                <p>Alunos que sairam por mês:</p>
                <canvas id="myChart6"></canvas>
            </div>
            
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

    <script type="text/javascript">
        var ctx = document.getElementById("myChart");
        var valores = [<%=valores[0]%>, <%=valores[1]%>];
        var tipos = ["Ativo", "Inativo"];

        var myChart = new Chart(ctx, {
          type: "pie",
          data: {
            labels: tipos,
            datasets: [
              {
                label: "Professores",
                data: valores,
                backgroundColor: [
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 206, 86, 0.2)",
                  "rgba(75, 192, 192, 0.2)",
                  "rgba(153, 102, 255, 0.2)"
                ]
              }
            ]
          }
        }); 
    </script>  
    
        <script type="text/javascript">
        var ctx = document.getElementById("myChart2");
        var valoresC = [<%=condicao[0]%>, <%=condicao[1]%>, <%=condicao[2]%>];
        var condicoes = ["Ativo", "Inadimplente", "Inativo"];

        var myChart2 = new Chart(ctx, {
          type: "pie",
          data: {
            labels: condicoes,
            datasets: [
              {
                label: "Professores",
                data: valoresC,
                backgroundColor: [
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 206, 86, 0.2)",
                  "rgba(75, 192, 192, 0.2)",
                  "rgba(153, 102, 255, 0.2)"
                ]
              }
            ]
          }
        }); 
    </script>  
    
        <script type="text/javascript">
        var ctx = document.getElementById("myChart3");
        var valor = [<%=valor[0]%>, <%=valor[1]%>, <%=valor[2]%>];
        var planos = ["Mensal", "Trimestral", "Anual"];

        var myChart3 = new Chart(ctx, {
          type: "pie",
          data: {
            labels: planos,
            datasets: [
              {
                label: "Valores",
                data: valor,
                backgroundColor: [
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 206, 86, 0.2)",
                  "rgba(75, 192, 192, 0.2)",
                  "rgba(153, 102, 255, 0.2)"
                ]
              }
            ]
          }
        }); 
    </script>  
    
    <script type="text/javascript">
        var ctx = document.getElementById("myChart4");
        var mes = [<%=mes[0]%>, <%=mes[1]%>, <%=mes[2]%>, <%=mes[3]%>, <%=mes[4]%>, <%=mes[5]%>, <%=mes[6]%>, <%=mes[7]%>, <%=mes[8]%>, <%=mes[9]%>, <%=mes[10]%>, <%=mes[11]%>];
        var nome_mes = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

        var myChart4 = new Chart(ctx, {
          type: "bar",
          data: {
            labels: nome_mes,
            datasets: [
              {
                label: "Pagamentos por mês",
                data: mes,
                backgroundColor: [
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 206, 86, 0.2)",
                  "rgba(75, 192, 192, 0.2)",
                  "rgba(153, 102, 255, 0.2)",
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 206, 86, 0.2)",
                  "rgba(75, 192, 192, 0.2)",
                  "rgba(153, 102, 255, 0.2)",
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)"
                ]
              }
            ]
          }
        }); 
    </script> 
    
        <script type="text/javascript">
        var ctx = document.getElementById("myChart5");
        var sexo = [<%=sexo[0]%>, <%=sexo[1]%>, <%=sexo[2]%>];
        var sexos = ["Masculino", "Feminino", "Outros"];

        var myChart2 = new Chart(ctx, {
          type: "pie",
          data: {
            labels: sexos,
            datasets: [
              {
                label: "Sexo",
                data: sexo,
                backgroundColor: [
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(255, 206, 86, 0.2)"
                ]
              }
            ]
          }
        }); 
    </script> 
    
        <script type="text/javascript">
        var ctx = document.getElementById("myChart6");
        var mesFim = [<%=mesFim[0]%>, <%=mesFim[1]%>, <%=mesFim[2]%>, <%=mesFim[3]%>, <%=mesFim[4]%>, <%=mesFim[5]%>, <%=mesFim[6]%>, <%=mesFim[7]%>, <%=mesFim[8]%>, <%=mesFim[9]%>, <%=mesFim[10]%>, <%=mesFim[11]%>];
        var nome_mes = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

        var myChart6 = new Chart(ctx, {
          type: "bar",
          data: {
            labels: nome_mes,
            datasets: [
              {
                label: "Desmatriculas por mês",
                data: mesFim,
                backgroundColor: [
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 206, 86, 0.2)",
                  "rgba(75, 192, 192, 0.2)",
                  "rgba(153, 102, 255, 0.2)",
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 206, 86, 0.2)",
                  "rgba(75, 192, 192, 0.2)",
                  "rgba(153, 102, 255, 0.2)",
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)"
                ]
              }
            ]
          }
        }); 
    </script> 
    </div>
        
    </body>
</html>