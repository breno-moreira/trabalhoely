package org.livros;

import java.io.IOException;
import java.util.stream.Collectors;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class PessoaAPI
 */
public class livrosAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public livrosAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		livrosDao ldao = new livrosDao();
		Gson gson = new Gson();
		
		//pega o id passado por parametro
		int id = 0;
		try {
			id = Integer.parseInt( request.getPathInfo().substring(1) );
		} catch (Exception e) {
		}
		
		String resposta; 
		if (id==0) {
			//listar todos
			resposta = gson.toJson(ldao.listar());
		} else {
			//consultar apenas 1
			resposta = gson.toJson(ldao.consultar(id));
		}
		
		response.setHeader("content-type", "application/json");
		response.getWriter().print(resposta);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pega o body da requisição
		String body = request.getReader().lines().collect(
					Collectors.joining(System.lineSeparator())
				);
		
		//converte o body para um objeto Java
		Gson gson = new Gson();
		livros l = gson.fromJson(body, livros.class);
		
		//salva a nova pessoa
		livrosDao ldao = new livrosDao();
		
		resposta r;
		if (ldao.inserir(l)) {
			r = new resposta(true, "Livro inserida com sucesso");
		} else {
			r = new resposta(false, "Falha ao inserir Livros");
		}
		String resposta = gson.toJson(r);
		
		//envia resposta
		response.setHeader("content-type", "application/json");
		response.getWriter().print(resposta);
		
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pega o body da requisição
		String body = request.getReader().lines().collect(
					Collectors.joining(System.lineSeparator())
				);
		
		//converte o body para um objeto Java
		Gson gson = new Gson();
		livros l = gson.fromJson(body, livros.class);
		
		//pega o id passado por parametro
		int id = 0;
		try {
			id = Integer.parseInt( request.getPathInfo().substring(1) );
		} catch (Exception e) {
		}
		l.setIdlivros(id);
		
		//salva a nova pessoa
		livrosDao ldao = new livrosDao();
		resposta r;
		if (ldao.alterar(l)) {
			r = new resposta(true, "Livro alterada com sucesso");
		} else {
			r = new resposta(false, "Falha ao alterar Livro");
		}
		String resposta = gson.toJson(r);
		response.getWriter().print(resposta);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pega o id passado por parametro
		int id = 0;
		try {
			id = Integer.parseInt( request.getPathInfo().substring(1) );
		} catch (Exception e) {
		}
		
		//exclui a nova pessoa
		livrosDao ldao = new livrosDao();
		livros l = new livros();
		l.setIdlivros(id);

		resposta r;
		if (ldao.excluir(l)) {
			r = new resposta(true, "Livro excluida com sucesso");
		} else {
			r = new resposta(false, "Falha ao excluir livro");
		}
		Gson gson = new Gson();
		String resposta = gson.toJson(r);
		
		//envia resposta
		response.getWriter().print(resposta);
	}
}
