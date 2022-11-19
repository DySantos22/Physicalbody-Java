function getPDF() {

//Cria o objeto para gerar o PDF
  var doc = new jsPDF();
 
  var specialElementHandlers = {
    '#getPDF': function(element, renderer){
      return true;
    },
    '.controls': function(element, renderer){
      return true;
    }
  };

//Captura o conteúdo da DIV content
  doc.fromHTML($('#content_p').get(0), 10, 10, {
    'width': 180, 
    'elementHandlers': specialElementHandlers
  });
  

//Gera o PDF com o nome especificado.
  doc.save('Contrato.pdf');
}