<%@page import="org.livros.livros"%>
<%@page import="org.livros.livrosDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Livro Salvo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<%
		 livros l = new livros();
	     livrosDao ldao = new livrosDao();
	     
         l.setId(Integer.parseInt(request.getParameter("id")));
         l.setNome(request.getParameter("nome"));
         l.setGenero(request.getParameter("genero"));
         l.setAutor(request.getParameter("autor"));
         l.setDescricao(request.getParameter("descricao"));
         
         ldao.salvar(l);
	     
 	%>
    <div class="container">
        <h1>Livro salvo com sucesso</h1>
        <a href="index.jsp" class="btn btn-primary">Início</a>
    </div>
</body>
</html>