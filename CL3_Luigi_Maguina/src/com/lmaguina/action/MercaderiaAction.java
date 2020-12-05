package com.lmaguina.action;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.lmaguina.entidad.Mercaderia;
import com.lmaguina.entidad.MercaderiaExt;
import com.lmaguina.entidad.Tipo;
import com.lmaguina.service.MercaderiaService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@ParentPackage("lgmg")
public class MercaderiaAction extends ActionSupport{
	private List<Tipo> listaTipo;
	private List<MercaderiaExt> listaMercaderia;
	private Mercaderia mercaderia;
	
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private MercaderiaService servicio;
	
	public MercaderiaAction() {
		servicio=new MercaderiaService();
	}
	@Action(value = "/listTipo",results = {@Result(name="ok",type="json")})
	public String listAllTipo() {
		listaTipo=servicio.listaTipo();
		return "ok";
	}
	@Action(value = "/listMercaderia",results = {@Result(name="ok",type="json")})
	public String listAllMercaderia() {
		listaMercaderia=servicio.listaMercaderia();
		return "ok";
	}	
	@Action(value = "/save",results = {@Result(name="ok",type="redirect",
						location = "/index.jsp")})
	public String saveProducto() {
		int salida;
							
		salida=servicio.save(mercaderia);
		if(salida!=-1)
			session.put("MENSAJE", "Se ha guardado correctamente");
		else
			session.put("MENSAJE", "No se pudo guardar");
		
		return "ok";
	}
	@Action(value = "/update",results = {@Result(name="ok",type="redirect",
			location = "/index.jsp")})
	public String updateProducto() {
		int salida;
						
		salida=servicio.update(mercaderia);
		if(salida!=-1)
		session.put("MENSAJE", "Se ha actualizado correctamente");
		else
		session.put("MENSAJE", "No se pudo guardar");
		
		return "ok";
	}
	@Action(value = "/delete",results = {@Result(name="ok",type="redirect",
			location = "/index.jsp")})
	public String deleteProducto() {
		int salida;
						
		salida=servicio.delete(mercaderia);
		if(salida!=-1)
		session.put("MENSAJE", "Se ha eliminado correctamente");
		else
		session.put("MENSAJE", "No se pudo eliminar");
		
		return "ok";
	}
	public List<Tipo> getListaTipo() {
		return listaTipo;
	}
	public void setListaDistritos(List<Tipo> listaTipo) {
		this.listaTipo = listaTipo;
	}
	public List<MercaderiaExt> getListaMercaderia() {
		return listaMercaderia;
	}
	public void setListaMercaderia(List<MercaderiaExt> listaMercaderia) {
		this.listaMercaderia = listaMercaderia;
	}
	public Mercaderia getMercaderia() {
		return mercaderia;
	}
	public void setMercaderia(Mercaderia mercaderia) {
		this.mercaderia = mercaderia;
	}
}