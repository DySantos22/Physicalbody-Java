<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Controlar Alunos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/main_controlar.css">
  <link rel="stylesheet" href="css/tabela.css">
  <link rel="stylesheet" href="css/navbarlateral.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>
  <script src="scripts/filtrar.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
  <link rel="icon" href="images/TCC-logo.png" />
  <!-- PDF -->
        <script src="./scripts/pdf.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.4/jspdf.plugin.autotable.min.js"></script>
</head>
<body>
 <%@ page import="com.crudjspjava.dao.AlunoDao, com.crudjspjava.bean.Aluno, java.util.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  
   <nav class="navigation">
       <ul>
      <li class="list active">
        <a href="viewalunos.jsp?page=1">
          <span class="icon">
            <ion-icon name="file-tray-full-outline"></ion-icon>
          </span>
          <span class="title">Controlar Alunos</span>
        </a>
      </li>

      <li class="list">
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
  <h1 id="apresentacao">NOSSOS<span class="alun"> ALUNOS</span></h1>
  <%
  	
  String pageid = request.getParameter("page");
  int id = Integer.parseInt(pageid);
  int total = 10;
  
  	//List<Aluno> list = AlunoDao.getAllAlunos();
  List<Aluno> list = AlunoDao.getRecords(id, total);
  request.setAttribute("list", list);
  %>
            <input type="text" id="filtrarnomes" onkeyup="filtrar('filtrarnomes', 0)" placeholder="Busca de nomes">
            <input type="text" id="filtraremails" onkeyup="filtrar('filtraremails', 1)" placeholder="Busca de emails">
            <input type="button" value="Download Contrato" onclick="getPDF()">
     <table id="tabela" class="table table-stripe">
		<tr>
                    <th class="text-center">Nome</th>
                    <th class="text-center">Email</th>
                    <th class="text-center">Condição</th>
                    <th class="text-center">Plano</th>
                    <th class="text-center">Telefone</th>
		</tr>
		<c:forEach items="${list}" var="aluno">
		<tr>
                    <td class="text-center">${aluno.getNome()}</td>
                    <td class="text-center">${aluno.getEmail()}</td>
                    <td class="text-center">${aluno.getCondicao()}</td>
                    <td class="text-center">${aluno.getPlano()}</td>
                    <td class="text-center">${aluno.getTelefone()}</td>
		</tr>
		</c:forEach>
  </table>
  <br>
  <a href="viewalunos.jsp?page=1">1</a>
   <a href="viewalunos.jsp?page=2">2</a>
    <a href="viewalunos.jsp?page=3">3</a>
    
    <div id="content_p">
        
        <h5 style="margin-left: 22rem;">PHYSICAL BODY ACADEMIA</h5>
        
        <p>
       

<b>DADOS DO CLIENTE CONTRATANTE</b><br>
Nome: [NOME_CLIENTE]. CPF:[CPF]. Data de Nascimento: [NASCIMENTO]. Celular: [CELULAR]. E-mail: [EMAIL]. Gênero: [GÊNERO].
Serviço contratado: [CONTRATOS]
Valor total contratado: [VALOR TOTAL]
Data da compra: [DT_VENDA].

<h6>SERVIÇOS</h6>
Este contrato tem como objeto o uso da ACADEMIA, pelo CLIENTE, para a prática de atividades físicas com a coordenação e supervisão de profissionais da Performa, de acordo com as condições do plano contratado. Os horários e dias de atendimentopodem sofrer alterações no decorrer do contrato, de acordo com as necessidades da ACADEMIA. O CLIENTE poderá frequentar as instalações da ACADEMIA nos horários pré-determinados de acordo com a(s) modalidade(s) contratada (s). Caso a ACADEMIA disponibilize novas atividades, CLIENTE seguirá as mesmas normas que regem este contrato para delas participar e/ou normas específicas da nova modalidade. O CLIENTE, portanto, está ciente de que poderão ser extintas, criadas ou remanejadas aulas e modalidades de atividades, como também efetuadas mudanças de horários e de instrutores, sem prévio aviso, independentemente do plano de serviços que o CLIENTE tiver contratado.<br>

<h6>MENORES</h6>
Se o CLIENTE for menor (de 18 anos) ou incapaz para atos civis assinará este contrato juntamente com o pai, a mãe ou o responsável legal. O adulto responsável responderá, solidariamente, por todos os atos, omissões ou obrigações do menor ou incapaz e autoriza-o à prática das atividades físicas pretendidas.<br>

<h6>ACESSO</h6>
O acesso às dependências da ACADEMIA será realizado através de registro da impressão digital, que deve ser realizado pelo aluno no ato da matrícula. Alguns planos com preços especiais apresentam restrições de acesso em determinados horários. Não é permitida a entrada de acompanhantes nos espaços restritos aos clientes. O aluno titular pode trazer um convidado à academia, com intenção de conhecer, mediante prévia autorização para a data solicitada, sendo que este ficará responsável pela conduta de seu convidado enquanto permanecerem nas dependências da academia. Por motivos de segurança, é proibida a permanência de crianças nas dependências da academia sem acompanhamento dos pais ou responsável. Elas devem permanecer no espaço kids, somente no horário em que houver recreacionista e enquanto o (s) responsável (eis) estiver (em) treinando na academia.<br>

<h6>AULAS</h6>
O CLIENTE está submetido à disponibilidade de vagas para as modalidades de aulas coletivas e semi-personal. O gerenciamento será feito através de sistema de reservas online via site ou aplicativo Performa. As reservas podem ser realizadas peloCLIENTE com 24 horas de antecedência até o horário de início da atividade. De acordo com o plano contratado pode haver restrições no acesso a determinadas atividades. Caso não possa comparecer, o CLIENTE deve cancelar a aula reservada pelo site ou app com até 1h de antecedência. O CLIENTE que por 3 vezes reservar, mas não comparecer às aulas, dentro de um período de 30 dias, não conseguirá fazer novos agendamentos por 20 dias. A suspensão é para agendamentos online, e não para o acesso à ACADEMIA. O cliente poderá participar de qualquer aula com vaga disponível no horário de início. Para agendar avaliação física e bioimpedância, o CLIENTE também deverá usar sistema de reservas online via site ou aplicativo Performa. As reservas podem ser realizadas pelo CLIENTE com 7 dias de antecedência até o horário de início da atividade. Caso não possa comparecer, o CLIENTE deve cancelar a avaliação e/ou bioimpedância reservada com até 24h de antecedência. O CLIENTE que reservar e não comparecer a avaliação terá que aguardar 45 dias para nova reserva gratuita. O CLIENTE que reservar e não comparecer à bioimpedância terá que aguardar 90 dias para nova reserva gratuita. A tolerância de atraso para o ingresso do aluno nas salas onde estiverem sendo desenvolvidas as atividades físicas com horários pré-estabelecidos é de, no máximo, 10 (dez) minutos, podendo a vaga ser liberada para outro cliente presente após este tempo.<br>

<h6>DECLARAÇÃO DE SAÚDE</h6>
Para contratar os serviços e usufruir deles o CLIENTE deverá preencher o PAR-Q (Questionário de Aptidão para Atividade Física) e/ou apresentar atestado médico específico para a prática da (s) atividade (s) contratada(s) e renová-lo (s) na periodicidade que vier a ser determinada pela lei aplicável, assim como atender a outras exigências da ACADEMIA relacionadas a comprovação e/ou entendimento das suas condições e limitações para a prática de atividades físicas. Em razão de exigências legais e/ou para a sua segurança, caso o CLIENTE não cumpra com o disposto nesta cláusula a ACADEMIA poderá não permitir o seu acesso a academia e/ou a prática de atividades físicas até a regularização.<br>

<h6>PRAZO</h6>
Este contrato tem o prazo contratado de [NOME DO PLANO]. O plano mensal e os planos de venda direta no cartão de crédito e boleto não se renovam automaticamente. A cada renovação será aplicável o Contrato de Prestação de Serviços de Atividades Físicas que estiver vigente na data respectiva. Na modalidade DCC (Débito Recorrente no Cartão de Crédito) o plano é válido por prazo indeterminado. Se o CLIENTE não desejar renovar ao final do período mínimo contratado deverá cancelar o contrato sem multa conforme regras descritas no item Cancelamento deste Contrato.<br>

<h6>PAGAMENTO</h6>
A ACADEMIA oferece planos mensais, concedendo descontos sobre a mensalidade em função do prazo contratado. Em razão dos descontos concedidos, em caso de cancelamento do plano antes de seu término, fica ressalvado o disposto no item Cancelamento deste Contrato. O CLIENTE somente poderá frequentar as instalações da ACADEMIA enquanto estiver em dia com os pagamentos, sendo que estes deverão ser realizados independentemente da frequência às atividades. Pelos serviços ora contratados, o CLIENTE pagará à ACADEMIA, além da taxa de matrícula no momento da contratação, o valor mensal de acordo com a tabela de preços vigente na data da contratação. Nos planos mensal e venda direta no cartão de crédito o valor total do plano comprometerá o limite do cartão de crédito. No plano DCC (Débito Recorrente no Cartão de Crédito) o valor total do plano não comprometerá o limite do cartão de crédito, apenas o valor mensal contará no limite, estando o CLIENTE sujeito às regras de pagamento das administradoras. Aderindo a este contrato DCC, o CLIENTE autoriza a ACADEMIA a debitar, no cartão de crédito indicado, os valores mensais previstos. A autorização aqui concedida é irrevogável e terá validade enquanto existirem valores a serem pagos, ainda que a matrícula tenha sido cancelada e o contrato rescindido. Na hipótese de a administradora do cartão de crédito não autorizar a liberação da quantia devida, oCLIENTE deverá comparecer à ACADEMIA imediatamente a fim de quitar o débito, podendo ser permitido ao CLIENTE apresentar outra forma de pagamento praticada pela ACADEMIA para quitação, devendo também neste momento o CLIENTE ratificar ou indicar um novo cartão de crédito, se for o caso. Para o plano DCC, considerando o prazo indeterminado do plano, o valor dos serviços será reajustado na periodicidade mínima admitida em lei, atualmente anual, com base na variação.<br>

<h6>INADIMPLÊNCIA</h6>
O CLIENTE que estiver inadimplente terá o seu acesso à ACADEMIA suspenso após 5 dias do vencimento, até a quitação do débito, sem direito à compensação dos dias em que esteve impedido de frequentá-la. Os valores não recebidos nas datas de seus vencimentos serão atualizados com multa de 2% do valor da mensalidade e 0,5% de juros por dia de atraso.

Havendo atraso da mensalidade, superior a 15 dias do vencimento, a ACADEMIA fica desde já autorizada a:

a) Incluir o nome do CLIENTE no SPC/Serasa;
b) Emitir títulos de créditos contra o CLIENTE;
c) Ajuizar Ação Moratória ou Ação de Execução;

Sempre que julgar necessário, a ACADEMIA poderá exigir do CLIENTE a prova de quitação das mensalidades juntamente com o documento de identificação emitido pela mesma.<br>

<h6>CANCELAMENTO</h6>
O CLIENTE poderá solicitar o cancelamento a qualquer momento pessoalmente e por escrito na recepção da ACADEMIA, desde que esteja em dia com o pagamento das mensalidades ou outros débitos existentes. Em hipótese alguma será aceito cancelamento deste contrato por telefone ou e-mail. Não haverá devolução dos valores já pagos mesmo que o CLIENTE não tenha frequentado a ACADEMIA. Para o cancelamento do contrato antes do término de seu período de vigência mínima, por iniciativa do CLIENTE ou em decorrência do descumprimento, pelo CLIENTE, de suas obrigações contratuais, será devido à ACADEMIA o equivalente a 25% (vinte e cinco por cento) do valor das parcelas a vencer, além de perder o período de trancamento a que tenha direito, caso este ainda não tenha sido usufruído. O CLIENTE declara-se ciente que, no caso dos planos pagos com cartão de crédito, caso deseje efetuar o cancelamento deverá fazê-lo pessoalmente na academia com antecedência mínima de 40 (quarenta) dias da data prevista para a ocorrência do próximo débito, sendo certo que, caso o CLIENTE solicite o cancelamento em prazo inferior, a ACADEMIA não efetuará a devolução do (s) valor(es) correspondente(s) aos débitos devidos deste prazo de 40 (quarenta) dias. A ACADEMIA poderá rescindir o contrato de prestação de serviços de forma unilateral, caso o CLIENTE atue nas dependências da ACADEMIA de forma indisciplinada ou de forma que denigra a imagem da ACADEMIA.<br>

<h6>TRANCAMENTO</h6>
A ACADEMIA oferece a opção de trancamento por determinado período (mínimo de sete dias), devendo o CLIENTE, para usufruir deste direito, comunicar o interesse à recepção da ACADEMIA com antecedência mínima de um dia, através de formulário específico, sendo que o CLIENTE não poderá frequentar a academia durante este período. 1. Plano Trimestral - interrupção de 7 dias corridos; (2) Plano Semestral - interrupção total de 15 dias; (3) Plano Anual - interrupção total de 30 dias; Plano 18 Meses - interrupção total de 45 dias.<br>

<h6>CESSÃO DE DIREITO DE USO</h6>
O CLIENTE que não pretende mais utilizar seu plano pode ceder o direito de utilização dos serviços e instalações da ACADEMIA para outra pessoa, mediante requisição escrita feita na recepção da ACADEMIA, e sujeito à aprovação da ACADEMIA. O CLIENTE não deixa de ser o responsável financeiro pelo plano, sendo que TODOS os pagamentos devidos continuam sob sua responsabilidade. No momento da transferência, o titular do plano não pode ceder o período de trancamento a que tenha direito, caso este ainda não tenha sido usufruído. Na cessão de uso, a pessoa a quem for cedido o direito fará jus à utilização dos dias vincendos, considerado tal período como a diferença entre a quantidade de dias decorridos desde o início da vigência do plano e o período total inicialmente contratado. Caso a pessoa que recebeu o direito de cessão de uso já seja CLIENTE da ACADEMIAdeverá cumprir seu plano até o final e somente depois passará a usufruir o direito de uso cedido, sendo-lhe creditados os dias vincendos do cedente e vetado efetuar nova cessão de direito de uso dos dias recebidos. Caso a pessoa que vier a receber o direito de cessão de uso não seja aluno matriculado na ACADEMIA, ficará ela obrigada a cumprir todas as normas da ACADEMIA, devendo arcar com as despesas referentes à taxa de matrícula, sendo-lhe vetado efetuar nova cessão de direito de uso dos dias recebidos. A ACADEMIA não interfere e nem intermedia a CESSÃO DE DIREITO DE USO e está isenta de qualquer responsabilidade no acordo entre as partes.<br>

<h6>NORMAS DE CONDUTA</h6>
É expressamente proibida qualquer conduta do aluno que não esteja de acordo com o objeto deste instrumento, que seja contrária à moral e aos bons costumes ou que, por qualquer forma, cause perturbação ao ambiente da ACADEMIA, aos funcionários, instrutores, professores ou frequentadores, como, exemplificativamente: (I) uso inadequado ou impróprio dos equipamentos; (II) atos ou atitudes que perturbem outros clientes e que pelos mesmos sejam repelidas; (III) atitudes agressivas com outros clientes ou com funcionários da academia; (IV) a comercialização de produtos ou serviços nas dependências da academia.
Além das condutas acima referidas, a ACADEMIA reserva-se ao direito de considerar como inadequadas e proibidas outras condutas que não estejam de acordo com o objeto deste instrumento. É vetado ao CLIENTE retirar equipamentos ou qualquer outro bem de propriedade da ACADEMIA de suas instalações. O CLIENTE deve zelar e utilizar adequadamente os equipamentos e bens da ACADEMIA, ficando obrigado a reparar quaisquer danos por ele causados a equipamentos, funcionários e/ou terceiros, podendo ter as suas atividades suspensas até a efetiva reparação do dano. OS DANOS DE QUALQUER NATUREZA DECORRENTES DE ATIVIDADES EXECUTADAS SEM A SOLICITAÇÃO DE ORIENTAÇÃO OU COM INOBSERVÂNCIA DAS INSTRUÇÕES DOS PROFESSORES DA ACADEMIA NÃO SERÃO DE RESPONSABILIDADE DA MESMA E CARACTERIZARÃO CULPA EXCLUSIVA DO CLIENTE. O aluno que cometer qualquer atitude, ofensa, agressão física e demais atos que infrinjam a lei e/ou que resultem em prejuízo para a academia, deverá ressarcir a mesma. Não é permitido o uso de qualquer outro calçado que não seja tênis para a prática dos exercícios, salvo em modalidades específicas. Para que os movimentos sejam executados com exatidão, é vetado se exercitar com roupas jeans, cargo ou social. Os trajes adequados são: shorts, calças de agasalho ou moletom, camiseta ou regata. A ACADEMIA pode impedir a participação de aluno em aula que não lhe seja recomendada pela sua avaliação física, médica ou se o aluno não estiver devidamente trajado e/ou equipado. A tolerância de atraso para o ingresso do aluno nas salas onde são realizadas atividades coletivas com horários pré-estabelecidos é de, no máximo, dez minutos. É vetada a entrada e a circulação de animais na academia. Não é permitido fumar ou ingerir bebida alcoólica no interior da academia. É terminantemente proibido o ingresso de pessoas portando armas de fogo no interior da academia. Somente estão autorizados a exercer a atividade de personal trainer, os profissionais devidamente cadastrados junto à academia, sendo que não será permitida, em hipótese alguma, a atuação do aluno de forma a caracterizar trabalho como instrutor e/ou personal trainer. Não é permitido filmar ou fotografar o interior da academia e das aulas, salvo mediante autorização expressa da Direção.<br>

<h6>DESCUMPRIMENTO DE NORMAS</h6>
O CLIENTE que mantiver conduta em desacordo com o objeto deste contrato, estará sujeito à advertência verbal e/ou cancelamento de sua matrícula com rescisão antecipada do contrato ou a não renovação do mesmo, a critério da ACADEMIA. O CLIENTE que praticar, no interior da academia, atos de agressão física, ameaça, venda de substâncias ilícitas, roubo, furto e outros que configurem ilícitos penais, bem como atos cuja gravidade justifique tal medida.<br>

<h6>RESPONSABILIDADE POR BENS DO CLIENTE</h6>
A ACADEMIA não se responsabiliza pela perda, dano ou extravio de objetos e pertences pessoais ou de valor nas suas dependências. A utilização do guarda-volumes não implica em dever de guarda da ACADEMIA, sendo vetado ao CLIENTE deixar seus pertences nos vestiários após a saída da academia. Para a utilização dos armários no vestiário masculino, por questões de sua própria segurança e inviolabilidade do armário, o CLIENTE deve utilizar cadeado de sua propriedade, ficando a ACADEMIA isenta de qualquer responsabilidade sobre o material deixado no armário. No vestiário feminino, a CLIENTE deverá criar uma senha eletrônica nova todos os dias, obedecendo às normas de segurança conforme manual de instruções afixado no mural do vestiário, ficando a ACADEMIA isenta de qualquer responsabilidade caso tal procedimento não seja obedecido. A utilização do armário é permitida somente durante a permanência do cliente na academia e os armários encontrados fechados após o horário de funcionamento serão abertos e os objetos neles contidos serão encaminhados às autoridades competentes, sem direito a indenização.<br>

<h6>IMAGEM</h6>
O CLIENTE, neste ato, autoriza que a ACADEMIA se utilize dos meios eletrônicos (e-mail, telefone, mensagens SMS) com o objetivo de enviar notícias, avisos, dicas, promoções e outras informações relevantes acerca do funcionamento da academia. O presente instrumento constitui autorização de uso da imagem, permitindo a utilização da imagem do
CLIENTE pela ACADEMIA em qualquer suporte material apto a reprodução de imagens ou imagens.

<h6>CONTRATAÇÃO ELETRÔNICA</h6>
A adesão ao presente contrato poderá ocorrer de forma eletrônica, através do website, tablets, seu celular, totens ou outros dispositivos eletrônicos. Ao contratar este serviço de atividades físicas o CLIENTE manifesta sua ciência e concordância com os termos do presente contrato, assim como declara-se ciente e de acordo de que a ACADEMIA no processo de adesão poderá efetuar a coleta e armazenamento de seus dados biométricos e informações pessoais, bem como de registros de suas ações, necessários para a comprovação de validade desta contratação.

<h6>DISPOSIÇÕES FINAIS</h6>
As normas constantes dos avisos e orientações afixados no interior das instalações da academia, que não estiverem contempladas neste contrato, passam a fazer parte integrante do mesmo, sendo certo que o seu não cumprimento poderá acarretar na rescisão antecipada ou a não renovação do mesmo. Toda e qualquer sugestão, reclamação ou alteração deverá ser encaminhada, por escrito, à direção da ACADEMIA, que analisará cada caso conforme critérios estabelecidos. Os casos omissos neste contrato deverão ser analisados pela direção da ACADEMIA.<br>

Declaro que li integralmente este Contrato de Prestação de Serviços de Atividades Físicas, entendi e concordo com todas as cláusulas e condições.  
          
        </p>
        
    </div>
    
</body>
</html>