<!-- 
    Document   : Gerenciar
    Created on : 23 de nov. de 2024, 19:03:44
    Author     : Breno Barbosa, Felipe Alencar, Gustavo Ferreira Santos, Gustavo Silva-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gerenciar Clientes</title>
        <link rel="stylesheet" href="style2.css">
    </head>
    <body>
        <div class="containerRel">
            <h2>Lista de Clientes</h2>
            <div class="tabela">
                <%
                    // Instanciar o DAO e chamar o método para listar os formulários
                    ClienteDAO ClienteDao = new ClienteDAO();
                    String tabelaHTML = ClienteDao.listarFormsHTML();
                    out.println(tabelaHTML);  // Exibir a tabela HTML na página
%>
            </div>
            <div class="botoesAcao">
                <form action="inserir/inserir.html">
                    <button type="submit">Adicionar Cliente</button>
                </form>
                <form action="excluir/excluir.html">
                    <button type="submit">Excluir Cliente</button>
                </form>
                <form action="alterar/alterar.html">
                    <button type="submit">Alterar Cliente</button>
                </form>
            </div>
            
            <div class="botaoRelVoltar">
                <form name="frmReg" method="post" action="index.html">
                    <button type="submit">Voltar</button>
                </form>
            </div>
        </div>
        
    </body>
</html>
