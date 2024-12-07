package org.livros;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class livrosDao {

    public void salvar(livros l) {
        if (l.getIdlivros() > 0) {
            alterar(l);
        } else {
            inserir(l);
        }
    }

    public boolean inserir(livros l) {
        Conexao con = new Conexao();
        boolean sucesso = false;
        
        try {
            String sql = "INSERT INTO livros (nome, genero, autor, descricao) VALUES (?, ?, ?, ?)";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setString(1, l.getNome());
            prep.setString(2, l.getGenero());
            prep.setString(3, l.getAutor());
            prep.setString(4, l.getDescricao());
            
            sucesso = prep.executeUpdate() > 0; // verdadeiro se pelo menos uma linha foi afetada
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return sucesso;
    }

    public boolean alterar(livros l) {
        Conexao con = new Conexao();
        boolean sucesso = false;
        
        try {
            String sql = "UPDATE pessoa SET nome = ?, genero = ?, autor = ?, descricao = ? WHERE idlivros = ?";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setString(1, l.getNome());
            prep.setString(2, l.getGenero());
            prep.setString(3, l.getAutor());
            prep.setString(4, l.getDescricao());
            prep.setInt(5, l.getIdlivros());
            
            sucesso = prep.executeUpdate() > 0; // verdadeiro se pelo menos uma linha foi afetada
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return sucesso;
    }

    public boolean excluir(livros l) {
        Conexao con = new Conexao();
        boolean sucesso = false;
        
        try {
            String sql = "DELETE FROM pessoa WHERE idlivros = ?";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setInt(1, l.getIdlivros());
            
            sucesso = prep.executeUpdate() > 0; // verdadeiro se pelo menos uma linha foi afetada
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return sucesso;
    }

    public LinkedList<livros> listar() {
        LinkedList<livros> lista = new LinkedList<>();
        Conexao con = new Conexao();
        
        try {
            String sql = "SELECT * FROM livros ORDER BY nome";
            Statement sta = con.getConnection().createStatement();
            ResultSet res = sta.executeQuery(sql);
            
            while (res.next()) {
                livros l = new livros();
                l.setIdlivros(res.getInt("idlivros"));
                l.setNome(res.getString("nome"));
                l.setGenero(res.getString("genero"));
                l.setAutor(res.getString("autor"));
                l.setDescricao(res.getString("descricao"));
                lista.add(l);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return lista;
    }

    public livros consultar(int id) {
        livros l = new livros();
        Conexao con = new Conexao();
        
        try {
            String sql = "SELECT * FROM livros WHERE idlivros = " + id;
            Statement sta = con.getConnection().createStatement();
            ResultSet res = sta.executeQuery(sql);
            
            while (res.next()) {
            	 l.setIdlivros(res.getInt("idlivros"));
                 l.setNome(res.getString("nome"));
                 l.setGenero(res.getString("genero"));
                 l.setAutor(res.getString("autor"));
                 l.setDescricao(res.getString("descricao"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return l;
    }
}
