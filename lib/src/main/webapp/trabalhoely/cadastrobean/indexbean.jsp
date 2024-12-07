<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="lDao" class="org.livros.livrosDao" scope="request" />
<jsp:setProperty name="lDao" property="*" />

<html>
<head>
    <title>Lista de livros em Bean</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center">livros</h2>
    <a href="add_livroBean.jsp" class="btn btn-primary">Adicionar livro</a>

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
            <c:forEach var="livros" items="${lDao.listar()}">
                <tr>
                    <td class="text-center">${livro.idlivros}</td>
                    <td class="text-center">${livro.nome}</td>
                    <td class="text-center">${livro.genero}</td>
                    <td class="text-center">${livro.autor}</td>
                    <td class="text-center">${livro.descricao}</td>
                    <td class="text-center">
                        <a href="edd_livroBean.jsp?id=${livro.idlivros}" class="btn btn-warning btn-sm">Alterar</a>
                        <a href="excluirBean.jsp?id=${livro.idlivros}" class="btn btn-danger btn-sm">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>