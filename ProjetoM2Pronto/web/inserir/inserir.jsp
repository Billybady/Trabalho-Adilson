<!-- 
    Document   : Inserir
    Created on : 23 de nov. de 2024, 19:03:44
    Author     : Breno Barbosa, Felipe Alencar, Gustavo Ferreira Santos, Gustavo Silva-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style2.css">
    </head>
    <div class="container">
        <%
            // Entrada
            String cpf = request.getParameter("cpf");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String endereco = request.getParameter("endereco");
            String problema = request.getParameter("problema");
            String situacao = request.getParameter("situacao");

            // Instancia e atrib. valores
            Cliente e = new Cliente();
            e.setCpf(cpf);
            e.setNome(nome);
            e.setEmail(email);
            e.setTelefone(telefone);
            e.setEndereco(endereco);
            e.setProblema(problema);
            e.setSituacao(situacao);
            ClienteDAO eDAO = new ClienteDAO();
            if (eDAO.insCli(e)) {
                out.println("<h1>Produto inserido com sucesso!</h1>");
            } else {
                out.println("ERRO!!!");
            }
        %>
        
        <div class="botoes">
            
                <form name="frmReg" method="post" action="../gerenciar.jsp">
                    <button type="submit">Voltar</button>
                </form>
        </div>
        
    </div>
    
</body>
</html>
