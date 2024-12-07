<%@ page import="java.sql.*" %>
<%@ page import="org.livros.livros" %>
<%@ page import="org.livros.livrosDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar livros</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f8ff;
            font-family: 'Arial', sans-serif;
            animation: fadeIn 1s ease-in;
        }

        h2 {
            margin-bottom: 30px;
            color: #333;
        }

        .form-control {
            border-radius: 25px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn-primary {
            border-radius: 25px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-default {
            border-radius: 25px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-default:hover {
            background-color: #e0e0e0;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .container {
            margin-top: 50px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Adicionar Jogo</h2>
        
        <%
            int id = 0;
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                id = Integer.parseInt(idParam);
            }
            livros l = new livros();
            livrosDao ldao = new livrosDao();
            if (id > 0) {
                l = ldao.consultar(id);
            } else {
                l.setNome("");
                l.setGenero("");
                l.setAutor("");
                l.setDescricao("");
            }
        %>

        <form action="gravar.jsp" method="post" class="form-horizontal">
            <input type="hidden" name="id" value="<%= l.getIdlivros() %>" />

            <div class="form-group">
                <label for="nome" class="col-sm-2 control-label">Nome:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="nome" name="nome" value="<%= l.getNome() %>" required>
                </div>
            </div>

            <div class="form-group">
                <label for="plataforma" class="col-sm-2 control-label">Genero:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="plataforma" name="plataforma" value="<%= l.getGenero() %>" required>
                </div>
            </div>

            <div class="form-group">
                <label for="genero" class="col-sm-2 control-label">Autor:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="genero" name="genero" value="<%= l.getAutor() %>" required>
                </div>
            </div>

            <div class="form-group">
                <label for="ano_lancamento" class="col-sm-2 control-label">Descricão:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="ano_lancamento" name="ano_lancamento" value="<%= l.getDescricao() %>" required>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">Salvar</button>
                    <a href="index.jsp" class="btn btn-default">Cancelar</a>
                </div>
            </div>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>