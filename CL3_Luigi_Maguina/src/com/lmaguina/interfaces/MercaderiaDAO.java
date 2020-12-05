package com.lmaguina.interfaces;
import java.util.List;

import com.lmaguina.entidad.Mercaderia;
import com.lmaguina.entidad.MercaderiaExt;

public interface MercaderiaDAO {
	public int save(Mercaderia bean);
	public int update(Mercaderia bean);
	public int delete(Mercaderia bean);
	public List<MercaderiaExt> listAllMercaderia();
}
