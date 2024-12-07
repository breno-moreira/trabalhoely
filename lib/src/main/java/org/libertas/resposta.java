package org.libertas;

public class resposta {
	private boolean sucesso;
	private String mensagem;
	
	public resposta(boolean sucesso, String mensagem) {
		this.sucesso = sucesso;
		this.mensagem = mensagem;
	}
	
	public boolean isSucesso() {
		return sucesso;
	}
	public void setSucesso(boolean sucesso) {
		this.sucesso = sucesso;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
}
