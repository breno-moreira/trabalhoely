<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.livros.livrosDao, org.livros.livros, java.util.List" %>

<html>
<head>
    <title>Lista de livros</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center">Lista de livros</h2>
    <a href="add_jogo.jsp" class="btn btn-primary">Adicionar Novo livro</a>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Genero</th>
                <th>Autor</th>
                <th>Descricao</th>
            </tr>
        </thead>
        <tbody>
            <%
                livrosDao lDao = new livrosDao();
                List<livros> lista = lDao.listar();
                
                for (livros livro : lista) {
            %>
                <tr>
                    <td class="text-center"><%= livro.getIdlivros() %></td>
                    <td class="text-center"><%= livro.getNome() %></td>
                    <td class="text-center"><%= livro.getGenero() %></td>
                    <td class="text-center"><%= livro.getAutor() %></td>
                    <td class="text-center"><%= livro.getDescricao() %></td>
                    <td class="text-center">
                        <a href="edd_livros.jsp?id=<%= livro.getIdlivros() %>" class="btn btn-warning btn-sm">Alterar</a>
                        <a href="excluir.jsp?id=<%= livro.getIdlivros() %>" class="btn btn-danger btn-sm">Excluir</a>
                    </td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
