<%-- 
    Document   : alterar
    Created on : 23 de nov. de 2024, 19:03:44
    Author     : Breno Barbosa, Felipe Alencar, Gustavo Ferreira Santos, Gustavo Silva
--%>
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
        <h1 class="alt">Alterar problema</h1>
        <%
            //Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));

            // Instância e atrib de valor
            Cliente est = new Cliente();
            est.setId(id);

            //Insert
            ClienteDAO estDAO = new ClienteDAO();
            if (estDAO.consEstId(est) != null) {
                //out.println("Registro encontrado!")
%>  
        <form method="post" action="alterarProd.jsp">
            Identificador: <input type="text" name="id" value="<%=est.getId()%>" readonly="true"> <p>            
                Cpf: <input type="number" name="cpf" value="<%=est.getCpf()%>"min="1"> <p>            
                Nome: <input type="text" name="nome" value="<%=est.getNome()%>" > <p>       
                Email: <input type="text" name="email" value="<%=est.getEmail()%>" step="0.01"> <p>       
                Telefone: <input type="number" name="telefone" value="<%=est.getTelefone()%>"> <p>       
                Endereço: <input type="text" name="endereco" value="<%=est.getEndereco()%>"> <p>
                Problema: <input type="text" name="problema" value="<%=est.getProblema()%>"> <p>
                <label>Situação:</label>
                <select name="situacao">
                    <option>Resolvido</option>
                    <option>Em andamento</option>
                    <option>Não Solucionado</option>
                </select><br>
                <button type="submit">Salvar Alteração</button>
        </form>        
        <%
            } else {
                out.println("Registro não encontrado!!!");
            }
        %>
        </div>
    </body>
</html>
