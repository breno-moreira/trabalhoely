<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar Livros</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
            color: #333;
            transition: background-color 0.3s;
        }
        .container {
            max-width: 800px; 
            margin-top: 50px; 
            padding: 30px; 
            border-radius: 10px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-control {
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        button.btn {
            width: 100%;
            font-size: 16px;
            padding: 10px;
            transition: background-color 0.3s;
        }
        button.btn:hover {
            background-color: #0056b3;
            color: #fff;
        }
        /* Adiciona animações */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .form-group {
            animation: fadeIn 0.8s ease forwards;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Editar Livros</h2>

    <%
        int id = Integer.parseInt(request.getParameter("idlivros"));
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jogosdb", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM livros WHERE idlivros=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.next();
    %>

    <form action="edit_livros.jsp?id=<%= id %>" method="post">
        <div class="form-group">
            <label for="nome">Nome:</label>
            <input type="text" class="form-control" name="nome" value="<%= rs.getString("nome") %>" required>
        </div>
        <div class="form-group">
            <label for="plataforma">genero:</label>
            <input type="text" class="form-control" name="genero" value="<%= rs.getString("genero") %>" required>
        </div>
        <div class="form-group">
            <label for="genero">Autor:</label>
            <input type="text" class="form-control" name="autor" value="<%= rs.getString("autor") %>" required>
        </div>
        <div class="form-group">
            <label for="ano_lancamento">descricao:</label>
            <input type="number" class="form-control" name="descricao" value="<%= rs.getString("descricao") %>" required>
        </div>
        <button type="submit" class="btn btn-warning">Atualizar</button>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String nome = request.getParameter("nome");
            String genero = request.getParameter("genero");
            String autor = request.getParameter("autor");
            String descricao = Integer.parseInt(request.getParameter("descricao"));

            PreparedStatement psUpdate = con.prepareStatement("UPDATE livros SET nome=?, genero=?, autor=?, descricao=? WHERE idlivros=?");
            psUpdate.setString(1, nome);
            psUpdate.setString(2, genero);
            psUpdate.setString(3, autor);
            psUpdate.setString(4, descricao);
            psUpdate.setInt(5, id);
            psUpdate.executeUpdate();

            con.close();
            response.sendRedirect("index.jsp");
        }
    %>
</div>
</body>
</html>
>