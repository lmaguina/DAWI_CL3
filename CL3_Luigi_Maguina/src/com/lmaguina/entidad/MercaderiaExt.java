package com.lmaguina.entidad;

public class MercaderiaExt {
	private int id,stock,idtipo;
	private String nombre,tipo;
	private float precio;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStock() {
		return stock;
	}
	public void setSock(int stock) {
		this.stock = stock;
	}
	public int getIdTipo() {
		return idtipo;
	}
	public void setIdTipo(int idtipo) {
		this.idtipo = idtipo;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
}

