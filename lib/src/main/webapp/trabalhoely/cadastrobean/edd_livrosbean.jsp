<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="l" class="org.livros.livros" scope="request" />
<jsp:setProperty name="l" property="*" />

<html>
<head>
    <title>Adicionar livros em Bean</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <form action="gravarBean.jsp" method="post" class="form-horizontal">
        <input type="hidden" name="id" value="<jsp:getProperty name="l" property="id" />" />
        
        <div class="form-group">
            <label for="nome" class="col-sm-2 control-label">Nome:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="nome" name="nome" value="<jsp:getProperty name="l" property="nome" />" required>
            </div>
        </div>
        
        <div class="form-group">
            <label for="genero" class="col-sm-2 control-label">Genero:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="genero" name="genero" value="<jsp:getProperty name="l" property="genero" />" required>
            </div>
        </div>
        
        <div class="form-group">
            <label for="autor" class="col-sm-2 control-label">Autor:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="autor" name="autor" value="<jsp:getProperty name="l" property="autor" />" required>
            </div>
        </div>
        
        <div class="form-group">
            <label for="descricao" class="col-sm-2 control-label">Descricao:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="descricao" name="descricao" value="<jsp:getProperty name="l" property="descricao" />" required>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        </div>
    </form>
</body>
</html>