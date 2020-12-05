package com.lmaguina.service;
import java.util.List;

import com.lmaguina.dao.MySqlMercaderiaDAO;
import com.lmaguina.dao.MySqlTipoDAO;
import com.lmaguina.entidad.Mercaderia;
import com.lmaguina.entidad.MercaderiaExt;
import com.lmaguina.entidad.Tipo;

public class MercaderiaService {
	private MySqlMercaderiaDAO daoMercaderia;
	private MySqlTipoDAO daoTipo;
	
	public MercaderiaService() {
		daoMercaderia=new MySqlMercaderiaDAO();
		daoTipo=new MySqlTipoDAO();
	}
	
	public List<Tipo> listaTipo(){
		return daoTipo.listAllTipo();
	}
	public List<MercaderiaExt> listaMercaderia(){
		return daoMercaderia.listAllMercaderia();
	}
	public int save(Mercaderia bean) {
		return daoMercaderia.save(bean);
	}
	public int update(Mercaderia bean) {
		return daoMercaderia.update(bean);
	}
	public int delete(Mercaderia bean) {
		return daoMercaderia.delete(bean);
	}
}