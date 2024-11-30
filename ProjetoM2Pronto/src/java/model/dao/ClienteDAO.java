//<!-- 
//    Document   : Html
//    Created on : 23 de nov. de 2024, 19:03:44
//    Author     : Breno Barbosa, Felipe Alencar, Gustavo Ferreira Santos, Gustavo Silva-->

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;
import model.Cliente;
import model.dao.ClienteDAO;
import util.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author 1
 */
public class ClienteDAO {
    //Atrib
    
    //Metodos
    public boolean insCli(Cliente p_est) throws ClassNotFoundException{
        //Inserir
        Connection conexao = null;
        try{
            conexao = ConnectDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "INSERT INTO cliente(cpf, nome, email, telefone, endereco, problema, situacao) VALUES ('" + p_est.getCpf() +
                                                                                                        "', '" + p_est.getNome() +
                                                                                                        "', '" + p_est.getEmail() +
                                                                                                        "','" + p_est.getTelefone() + 
                                                                                                        "','" + p_est.getEndereco() + 
                                                                                                        "','" + p_est.getProblema() + 
                                                                                                        "','" + p_est.getSituacao() + "')";
            stmt.executeUpdate(sql); //GO - Insert / Delete / Update
                        
            conexao.close();
            return true;                                       
        }
        catch(SQLException ex){
            System.out.println("Exception: " + ex);
            return false;
        }      
    }
    
    //
    //
    // Método para listar os dados e gerar uma tabela HTML scrollable
    public String listarFormsHTML() throws ClassNotFoundException {
        Connection conexao = null;
        StringBuilder tabelaHTML = new StringBuilder();
        
        try {
            // Conectar ao banco de dados
            conexao = ConnectDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM cliente";
            ResultSet resultSet = stmt.executeQuery(sql);
            
            // Início da construção da tabela com CSS para torná-la scrollable
            tabelaHTML.append("<div style='max-height: 400px; overflow-y: auto;'>"); // Definir altura máxima e permitir scroll
            tabelaHTML.append("<table border='1' style='width: 100%; border-collapse: collapse;'>");
            tabelaHTML.append("<thead><tr>");
            tabelaHTML.append("<th>ID</th>");
            tabelaHTML.append("<th>CPF</th>");
            tabelaHTML.append("<th>Nome</th>");
            tabelaHTML.append("<th>Email</th>");
            tabelaHTML.append("<th>Telefone</th>");
            tabelaHTML.append("<th>Endereco</th>");
            tabelaHTML.append("<th>Problema</th>");
            tabelaHTML.append("<th>Situacao</th>");
            tabelaHTML.append("</tr></thead><tbody>");
            
            // Iterar pelos resultados da consulta e construir as linhas da tabela
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String cpf = resultSet.getString("cpf");
                String nome = resultSet.getString("nome");
                String email = resultSet.getString("email");
                String tel = resultSet.getString("telefone");
                String end = resultSet.getString("endereco");
                String prob = resultSet.getString("problema");
                String sit = resultSet.getString("situacao");
                
                tabelaHTML.append("<tr>");
                tabelaHTML.append("<td>").append(id).append("</td>");
                tabelaHTML.append("<td>").append(cpf).append("</td>");
                tabelaHTML.append("<td>").append(nome).append("</td>");
                tabelaHTML.append("<td>").append(email).append("</td>");
                tabelaHTML.append("<td>").append(tel).append("</td>");
                tabelaHTML.append("<td>").append(end).append("</td>");
                tabelaHTML.append("<td>").append(prob).append("</td>");
                tabelaHTML.append("<td>").append(sit).append("</td>");
                tabelaHTML.append("</tr>");
            }
            
            // Fechamento da tabela e do div
            tabelaHTML.append("</tbody></table>");
            tabelaHTML.append("</div>");
            
            // Fechar conexões
            resultSet.close();
            stmt.close();
            conexao.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex);
            return "Erro ao gerar tabela HTML";
        }
        
        // Retornar a tabela HTML gerada como string
        return tabelaHTML.toString();
    }
    
    public boolean exCli(Cliente p_est) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConnectDB.conectar();
            Statement stmt = conexao.createStatement();
                        //DELETE FROM pesquisa WHERE pkid=6;
            String sql = "DELETE FROM cliente WHERE id=" + p_est.getId();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }  
    
    public Cliente consEstId(Cliente p_est) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConnectDB.conectar();
            Statement stmt = conexao.createStatement();
                        //SELECT * FROM pesquisa where pkid = 5;
            String sql = "SELECT * FROM cliente where id = " + p_est.getId();
            ResultSet rs = stmt.executeQuery(sql);
                        
            int n_reg = 0;
            while (rs.next()) {                
                p_est.setCpf(rs.getString("cpf"));
                p_est.setNome(rs.getString("nome"));
                p_est.setEmail(rs.getString("email"));
                p_est.setTelefone(rs.getString("telefone"));
                p_est.setEndereco( rs.getString("endereco"));                
                p_est.setProblema( rs.getString("problema"));
                p_est.setSituacao( rs.getString("situacao"));
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return p_est;               
            }
        }catch(SQLException ex){
            System.out.println("Exception: " + ex);
            return null;
        } 
    } 
    
    public boolean altCli(Cliente p_est) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConnectDB.conectar();
            Statement stmt = conexao.createStatement();
                        //UPDATE pesquisa SET nome='Talita', email='talita@umc.br', Q1=3, Q2=3, Q3=3, Q4=3, dt_pesq='2024-11-14' WHERE pkid=3         
            String sql = "UPDATE cliente SET cpf='" + p_est.getCpf()+ "'," + 
                                                    "nome='"+ p_est.getNome()+ "'," +
                                                    "email='" + p_est.getEmail()+ "'," +
                                                    "telefone='" + p_est.getTelefone()+ "', " +
                                                    "endereco='" + p_est.getEndereco()+ "', " +
                                                    "problema='" + p_est.getProblema()+ "', " +
                                                    "situacao='" + p_est.getSituacao()+  "' WHERE id=" + p_est.getId();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }   
}
