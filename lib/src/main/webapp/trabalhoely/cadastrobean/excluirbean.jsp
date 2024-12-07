<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="l" class="org.livros.livros" scope="page"/>
	<jsp:useBean id="lDao" class="org.livros.livrosDao" scope="page"/>
	<jsp:setProperty property="*" name="l"/>
	${lDao.excluir(l)}
	livro excluido com sucesso!
	<br/>
	<a href="index.jsp">Ok</a>

</body>
</html>