<!-- 
    Document   : excluir
    Created on : 23 de nov. de 2024, 18:46:40
    Author     : Felipe Alencar-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../style2.css">
        <title>Cliente</title>
    </head>
    <body>
        <div class="container">
            <h1>Excluir Informação</h1>
            <%
                //Entrada/Receber
                int id = Integer.parseInt(request.getParameter("id"));

                // Instância e atrib de valor
                Cliente est = new Cliente();
                est.setId(id);

                //Insert
                ClienteDAO cliDAO = new ClienteDAO();
                if (cliDAO.exCli(est)) {
                    out.println("Problema/cliente excluido!");
                } else {
                    out.println("Problema/cliente não excluído!!!");
                }
            %>
            <div>
                <form method="post" action="../gerenciar.jsp">
                    <button type="submit">Voltar</button>
                </form>
            </div>
        </div>
    </body>
</html>*
