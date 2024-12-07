<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="l" class="org.livros.livros" scope="request" />
<jsp:useBean id="lDao" class="org.livros.livrosDao" scope="application" />
<jsp:setProperty name="jogo" property="*" />

<html>
<head>
    <title>Editar livros em Bean</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center">Editar livros</h2>

    <form action="edd_livros.jsp?id=<%= l.getIdlivros() %>" method="post">
        <div class="form-group">
            <label for="nome">Nome:</label>
            <input type="text" class="form-control" name="nome" value="<jsp:getProperty name='l' property='nome' />" required>
        </div>
        <div class="form-group">
            <label for="plataforma">Genero:</label>
            <input type="text" class="form-control" name="genero" value="<jsp:getProperty name='l' property='genero' />" required>
        </div>
        <div class="form-group">
            <label for="genero">Autor:</label>
            <input type="text" class="form-control" name="autor" value="<jsp:getProperty name='l' property='autor' />" required>
        </div>
        <div class="form-group">
            <label for="ano_lancamento">Descricao:</label>
            <input type="number" class="form-control" name="descricao" value="<jsp:getProperty name='l' property='desceicao' />" required>
        </div>
        <button type="submit" class="btn btn-warning">Atualizar</button>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String nome = request.getParameter("nome");
            String genero = request.getParameter("genero");
            String autor = request.getParameter("autor");
            String descricao = (request.getParameter("descricao"));

            // Atualizando os dados do Bean
            l.setNome(nome);
            l.setGenero(genero);
            l.setAutor(autor);
            l.setDescricao(descricao);

            // Salvando no banco de dados
            lDao.alterar(l);

            response.sendRedirect("index.jsp");
        }
    %>
</div>
</body>
</html>
