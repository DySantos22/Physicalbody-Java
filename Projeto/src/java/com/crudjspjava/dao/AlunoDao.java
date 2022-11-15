package com.crudjspjava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.crudjspjava.bean.Aluno;
import java.sql.PreparedStatement;


public class AlunoDao {

public static Connection getConnection() {
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/physicalbody","root","");
		}catch(Exception e){
			System.out.println(e);
		}
		return con;
	}

public static Aluno getRegistroById(int id) {
	Aluno aluno = null;
	
	try {
		Connection con = getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE ID_usuario=?");
		ps.setInt(1,id);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			aluno = new Aluno();
                        aluno.setId_usuario(rs.getInt("ID_usuario"));
                        aluno.setId_plano(rs.getInt("ID_plano"));
			aluno.setNome(rs.getString("Nome"));
			aluno.setEmail(rs.getString("Email"));
			aluno.setSenha(rs.getString("Senha"));
			aluno.setCondicao(rs.getString("Condicao"));
			aluno.setAcesso(rs.getString("Acesso"));
			aluno.setCpf(rs.getString("CPF"));
			aluno.setTelefone(rs.getString("Telefone"));
			aluno.setImagem(rs.getString("Imagem"));
		}
		
	}catch(Exception e) {
		System.out.println(e);	
	}
	return aluno;
}
	

public static List<Aluno> getAllAunos(){
	List<Aluno> list = new ArrayList<Aluno>();
	
	try {
		Connection con = getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE Acesso = 'Aluno'");
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			Aluno aluno = new Aluno();
                        aluno.setId_usuario(rs.getInt("ID_usuario"));
                        aluno.setId_plano(rs.getInt("ID_plano"));
			aluno.setNome(rs.getString("Nome"));
			aluno.setEmail(rs.getString("Email"));
			aluno.setSenha(rs.getString("Senha"));
			aluno.setCondicao(rs.getString("Condicao"));
			aluno.setAcesso(rs.getString("Acesso"));
			aluno.setCpf(rs.getString("CPF"));
			aluno.setTelefone(rs.getString("Telefone"));
			aluno.setImagem(rs.getString("Imagem"));
			list.add(aluno);
		}
	}catch(Exception e) {
		System.out.println(e);
	}
	return list;
}

public static List<Aluno> getRecords(int start, int total){
	List<Aluno> list = new ArrayList<Aluno>();
	
	try {
		Connection con = getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario INNER JOIN plano ON usuario.ID_plano = plano.ID_plano LIMIT "+(start-1)+","+total);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			Aluno aluno = new Aluno();
			aluno.setId_usuario(rs.getInt("ID_usuario"));
                        aluno.setPlano(rs.getString("Nome_plano"));
			aluno.setNome(rs.getString("Nome"));
			aluno.setEmail(rs.getString("Email"));
			aluno.setSenha(rs.getString("Senha"));
			aluno.setCondicao(rs.getString("Condicao"));
			aluno.setAcesso(rs.getString("Acesso"));
			aluno.setCpf(rs.getString("CPF"));
			aluno.setTelefone(rs.getString("Telefone"));
			aluno.setImagem(rs.getString("Imagem"));
			list.add(aluno);
		}
		con.close();
	}catch(Exception e) {
		System.out.println(e);
	}
	return list;
}

            public static List<Aluno> getRelatorio() {
    List<Aluno> listP = new ArrayList<Aluno>();
    try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Aluno u = new Aluno();
		u.setId_usuario(rs.getInt("ID_usuario"));
                u.setId_plano(rs.getInt("ID_plano"));
		u.setNome(rs.getString("Nome"));
		u.setEmail(rs.getString("Email"));
		u.setSenha(rs.getString("Senha"));
		u.setCondicao(rs.getString("Condicao"));
            listP.add(u);
        }       
    }catch(Exception erro){
        System.out.println(erro);
    }
    return listP;
    }

            
 public static int[] getRelatorioAlunos() {

        int[] valor = {0, 0, 0};
        
        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Mensal FROM usuario WHERE ID_plano = '1'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                valor[0] = rs.getInt("Mensal");
            }   
 
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Trimestral FROM usuario WHERE ID_plano = '2'");
            rs = ps.executeQuery();
            while(rs.next()){
                valor[1] = rs.getInt("Trimestral");
            }    
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Anual FROM usuario WHERE ID_plano = '3'");
            rs = ps.executeQuery();
            while(rs.next()){
                valor[2] = rs.getInt("Anual");
            }     
            
        }catch(Exception erro){
            System.out.println(erro);
        }
        return valor;
    }
 
         public static int[] getRelatorioProfessores() {

        int[] valores = {0, 0};
        
        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Ativo FROM usuario WHERE Condicao = 'Ativo' AND Acesso = 'Professor'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                valores[0] = rs.getInt("Ativo");
            }   
 
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Inativo FROM usuario WHERE Condicao = 'Inativo' AND Acesso = 'Professor'");
            rs = ps.executeQuery();
            while(rs.next()){
                valores[1] = rs.getInt("Inativo");
            }            
            
        }catch(Exception erro){
            System.out.println(erro);
        }
        return valores;
    }
        
        public static int[] getRelatorioAlunosCondicao() {

        int[] condicao = {0, 0, 0};
        
        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Ativo FROM usuario WHERE Condicao = 'Ativo' AND Acesso='Aluno'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                condicao[0] = rs.getInt("Ativo");
            }   
 
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Inadimplente FROM usuario WHERE Condicao = 'Inadimplente' AND Acesso='Aluno'");
            rs = ps.executeQuery();
            while(rs.next()){
                condicao[1] = rs.getInt("Inadimplente");
            }           
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Inativo FROM usuario WHERE Condicao = 'Inativo' AND Acesso='Aluno'");
            rs = ps.executeQuery();
            while(rs.next()){
                condicao[2] = rs.getInt("Inativo");
            }  
            
        }catch(Exception erro){
            System.out.println(erro);
        }
        return condicao;
    }
        
 public static int[] getRelatorioAlunosPorMes() {

        int[] mes = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        
        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Janeiro FROM usuario WHERE MONTH(Inicio) = 1");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                mes[0] = rs.getInt("Janeiro");
            }   
 
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Fevereiro FROM usuario WHERE MONTH(Inicio) = 2");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[1] = rs.getInt("Fevereiro");
            }           
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Março FROM usuario WHERE MONTH(Inicio) = 3");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[2] = rs.getInt("Março");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Abril FROM usuario WHERE MONTH(Inicio) = 4");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[3] = rs.getInt("Abril");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Maio FROM usuario WHERE MONTH(Inicio) = 5");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[4] = rs.getInt("Maio");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Junho FROM usuario WHERE MONTH(Inicio) = 6");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[5] = rs.getInt("Junho");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Julho FROM usuario WHERE MONTH(Inicio) = 7");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[6] = rs.getInt("Julho");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Agosto FROM usuario WHERE MONTH(Inicio) = 8");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[7] = rs.getInt("Agosto");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Setembro FROM usuario WHERE MONTH(Inicio) = 9");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[8] = rs.getInt("Setembro");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Outubro FROM usuario WHERE MONTH(Inicio) = 10");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[9] = rs.getInt("Outubro");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Novembro FROM usuario WHERE MONTH(Inicio) = 11");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[10] = rs.getInt("Novembro");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Dezembro FROM usuario WHERE MONTH(Inicio) = 12");
            rs = ps.executeQuery();
            while(rs.next()){
                mes[11] = rs.getInt("Dezembro");
            }  
            
        }catch(Exception erro){
            System.out.println(erro);
        }
        return mes;
    }
 
 public static int[] getRelatorioAlunosSexo() {

        int[] sexo = {0, 0, 0};

        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Masculino FROM usuario WHERE Sexo = 'Masculino' AND Acesso = 'Aluno'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                sexo[0] = rs.getInt("Masculino");
            }
 
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Feminino FROM usuario WHERE Sexo = 'Feminino' AND Acesso = 'Aluno'");
            rs = ps.executeQuery();
            while(rs.next()){
                sexo[1] = rs.getInt("Feminino");
            }

            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Outros FROM usuario WHERE Sexo = 'Outros' AND Acesso = 'Aluno'");
            rs = ps.executeQuery();
            while(rs.next()){
                sexo[2] = rs.getInt("Outros");
            }

        }catch(Exception erro){
            System.out.println(erro);
        }
        return sexo;
    }
 
  public static int[] getRelatorioAlunosFimMatricula() {

        int[] mesFim = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        
        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Janeiro FROM usuario WHERE MONTH(Fim_matricula) = 1");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                mesFim[0] = rs.getInt("Janeiro");
            }   
 
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Fevereiro FROM usuario WHERE MONTH(Fim_matricula) = 2");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[1] = rs.getInt("Fevereiro");
            }           
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Março FROM usuario WHERE MONTH(Fim_matricula) = 3");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[2] = rs.getInt("Março");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Abril FROM usuario WHERE MONTH(Fim_matricula) = 4");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[3] = rs.getInt("Abril");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Maio FROM usuario WHERE MONTH(Fim_matricula) = 5");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[4] = rs.getInt("Maio");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Junho FROM usuario WHERE MONTH(Fim_matricula) = 6");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[5] = rs.getInt("Junho");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Julho FROM usuario WHERE MONTH(Fim_matricula) = 7");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[6] = rs.getInt("Julho");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Agosto FROM usuario WHERE MONTH(Fim_matricula) = 8");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[7] = rs.getInt("Agosto");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Setembro FROM usuario WHERE MONTH(Fim_matricula) = 9");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[8] = rs.getInt("Setembro");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Outubro FROM usuario WHERE MONTH(Fim_matricula) = 10");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[9] = rs.getInt("Outubro");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Novembro FROM usuario WHERE MONTH(Fim_matricula) = 11");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[10] = rs.getInt("Novembro");
            }  
            
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Dezembro FROM usuario WHERE MONTH(Fim_matricula) = 12");
            rs = ps.executeQuery();
            while(rs.next()){
                mesFim[11] = rs.getInt("Dezembro");
            }  
            
        }catch(Exception erro){
            System.out.println(erro);
        }
        return mesFim;
    }

}