<!-- 
    Document   : AlterarProd
    Created on : 23 de nov. de 2024, 19:03:44
    Author     : Breno Barbosa, Felipe Alencar, Gustavo Ferreira Santos, Gustavo Silva-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="../style2.css">
    </head>
    <body>
        <div class="container">
        <h1>Alterar Cliente</h1>
        <%
            //Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));
            String cpf = request.getParameter("cpf");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String endereco = request.getParameter("endereco");
            String problema = request.getParameter("problema");
            String situacao = request.getParameter("situacao");

            // Instância e atrib de valor
            Cliente est = new Cliente();
            est.setId(id);
            est.setCpf(cpf);
            est.setNome(nome);
            est.setEmail(email);
            est.setTelefone(telefone);
            est.setEndereco(endereco);
            est.setProblema(problema);
            est.setSituacao(situacao);

            //Insert
            ClienteDAO estDAO = new ClienteDAO();
            if (estDAO.altCli(est)) {
                out.println("Registro Alterado com sucesso!");
            } else {
                out.println("Erro! Registro não Alterado!!!");
            }
        %>
        <form action="../gerenciar.jsp">
            <button type="submit">Voltar</button>
        </form>
        </div>
    </body>
</html>
