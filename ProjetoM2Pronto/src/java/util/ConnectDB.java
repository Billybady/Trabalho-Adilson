//<!-- 
//    Document   : Html
//    Created on : 23 de nov. de 2024, 19:03:44
//    Author     : Breno Barbosa, Felipe Alencar, Gustavo Ferreira Santos, Gustavo Silva-->

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 1
 */
public class ConnectDB {
    public static Connection conectar() throws ClassNotFoundException {
        Connection conexao = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");   //tipe DB   server  port db     user    password
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/problemas", "root", "");
            return conexao;
        }
        catch(SQLException ex){
            System.out.println("Erro: " + ex);
        }
        return conexao;
    }
}
