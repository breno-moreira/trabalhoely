<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de livros</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Fundo mais suave */
        }
        h2 {
            color: #343a40; /* Cor do título mais suave */
            margin-bottom: 30px;
        }
        .table {
            background-color: #ffffff; /* Fundo da tabela */
            border-radius: 8px; /* Bordas arredondadas */
            overflow: hidden; /* Esconde bordas da tabela */
        }
        th {
            background-color: #e9ecef; /* Fundo mais claro para cabeçalho */
        }
        .btn-custom {
            background-color: #6c757d; /* Cor personalizada para botões */
            color: #ffffff; /* Cor do texto dos botões */
        }
        .btn-custom:hover {
            background-color: #5a6268; /* Cor de hover mais escura */
        }
        .text-center h4, .text-center p {
            color: #495057; /* Cor do texto mais suave */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Lista de livros</h2>
        
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Genero</th>
                    <th>Autor</th>
                    <th>descricao</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrosdb", "root", "root");
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM livros");

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String nome = rs.getString("nome");
                            String genero = rs.getString("genero");
                            String autor = rs.getString("autor");
                            String descricao = rs.getString("descricao");
                %>
                            <tr>
                                <td class="text-center"><%= id %></td>
                                <td class="text-center"><%= nome %></td>
                                <td class="text-center"><%= genero %></td>
                                <td class="text-center"><%= autor %></td>
                                <td class="text-center"><%= descricao %></td>
                                <td class="text-center">
                                    <a href="edd_livros.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Alterar</a>
                                    <a href="excluir.jsp?id=<%= id %>" class="btn btn-danger btn-sm">Excluir</a>
                                </td>
                            </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
        
        <div class="text-center">
            <h4>Tem algum livro incrível? Não deixe de compartilhar!</h4>
            <p>Cadastre seus livros e faça parte da nossa comunidade!</p>
            <a href="add_livro.jsp?id=0" class="btn btn-custom">Adicionar livro</a>
        </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>