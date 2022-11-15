/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crudjspjava.dao;
import com.crudjspjava.bean.Usuario;
import static com.crudjspjava.dao.UsuarioDao.getConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.security.crypto.bcrypt.BCrypt;

public class UsuarioDao {
    
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
    
        public static int salvarUsuario(Usuario u){
            int status = 0;
            
            String senha = u.getSenha();
            String hashPass = BCrypt.hashpw(senha, BCrypt.gensalt(12));
            
            try{
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("INSERT INTO usuario(Nome, Email, Senha, Condicao, Acesso, Chave, Imagem, ID_plano, Matricula, CPF, Data_de_nascimento, Telefone, Sexo, Inicio, Expiracao, Data_matricula, Fim_matricula, Versao_termo)VALUES(?,?,?,?,?,?,?, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0' ,'v1')");
                ps.setString(1, u.getNome());
                ps.setString(2, u.getEmail());
                ps.setString(3, hashPass);
                ps.setString(4, u.getCondicao());
                ps.setString(5, u.getAcesso());
                ps.setString(6, u.getChave());
                ps.setString(7, u.getImagem());
                  status = ps.executeUpdate();
                  
            }catch(Exception e){
                System.out.println(e);
            }
            return status;
        }
    
    
        public static Usuario getRegistroById(int id) {
		Usuario usuario = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE ID_usuario=? AND Acesso = 'Professor'");
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("ID_usuario"));
                                usuario.setNome(rs.getString("Nome"));
				usuario.setEmail(rs.getString("Email"));		
				usuario.setSenha(rs.getString("Senha"));
                                usuario.setCondicao(rs.getString("Condicao"));
			}
			
		}catch(SQLException e) {
			System.out.println(e);	
		}
		return usuario;
	}
        
        public static int updateUsuario(Usuario u){
            int status = 0;
            
            String senha = u.getSenha();
            String hashPass = BCrypt.hashpw(senha, BCrypt.gensalt(12));
            
            try{
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("UPDATE usuario SET Nome=?,  "+ "Email=?, Senha=?, Condicao=? WHERE ID_usuario=?");
                
                ps.setString(1, u.getNome());
                ps.setString(2, u.getEmail());
                ps.setString(3, hashPass);
                ps.setString(4, u.getCondicao()); 
                ps.setInt(5, u.getId());
                status = ps.executeUpdate();
   
            }catch(Exception e){
                System.out.println(e);
            }
            return status;
        }
    
         public static List<Usuario> getAllUsuarios(){
		List<Usuario> list = new ArrayList<Usuario>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE Acesso = 'Professor'");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("ID_usuario"));
                                usuario.setNome(rs.getString("Nome"));
                                usuario.setEmail(rs.getString("Email"));
				usuario.setSenha(rs.getString("Senha"));	
				usuario.setCondicao(rs.getString("Condicao"));
            
				list.add(usuario);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static List<Usuario> getRecords(int start, int total){
		List<Usuario> list = new ArrayList<Usuario>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE Acesso = 'Professor'");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("ID_usuario"));
                                usuario.setNome(rs.getString("Nome"));
                                usuario.setEmail(rs.getString("Email"));
				usuario.setSenha(rs.getString("Senha"));		
				usuario.setCondicao(rs.getString("Condicao"));
                                list.add(usuario);
			}
			con.close();
		}catch(SQLException e) {
			System.out.println(e);
		}
		return list;
	}
        
      
        
        	public static int bloquearUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE usuario SET Condicao = 'Inativo' WHERE ID_usuario=?");
			ps.setInt(1, u.getId());
			status=ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e);
		}
		return status;
	}
        
        
    public static List<Usuario> getRelatorio() {
    List<Usuario> listP = new ArrayList<Usuario>();
    try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE Acesso = 'Professor'");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Usuario u = new Usuario();
		u.setId(rs.getInt("ID_usuario"));
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
        
        public static int[] getRelatorioProfessores() {

        int[] valores = {0, 0};
        
        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Ativo FROM usuario WHERE Acesso = 'Professor' AND Condicao = 'Ativo'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                valores[0] = rs.getInt("Ativo");
            }   
 
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Inativo FROM usuario WHERE Acesso = 'Professor' AND Condicao = 'Inativo'");
            rs = ps.executeQuery();
            while(rs.next()){
                valores[1] = rs.getInt("Inativo");
            }            
            
        }catch(Exception erro){
            System.out.println(erro);
        }
        return valores;
    }
        
        
}

