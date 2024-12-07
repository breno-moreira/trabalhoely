<%@ page import="org.livros.livros" %>
<%@ page import="org.livros.livrosDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<jsp:useBean id="livrosDao" class="org.livros.livrosDao" scope="request" />
<jsp:useBean id="livros" class="org.livros.livros" scope="request" />

<%
    // Coleta os parâmetros do formulário e atribui ao bean
    livros.setId(Integer.parseInt(request.getParameter("id")));
    livros.setNome(request.getParameter("nome"));
    livros.setGenero(request.getParameter("genero"));
    livros.setAutor(request.getParameter("autor"));
    livros.setDescricao(request.getParameter("descricao"));

    // Salva o jogo: atualiza se já existe, adiciona se não
    if (livros.getIdlivros() > 0) {
        livrosDao.alterar(livros);
    } else {
        livrosDao.alterar(livros);
    }

    // Redireciona para a página de sucesso
    response.sendRedirect("gravar.jsp");
%>
