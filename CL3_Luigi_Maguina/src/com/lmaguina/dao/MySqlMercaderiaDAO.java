package com.lmaguina.dao;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lmaguina.entidad.Mercaderia;
import com.lmaguina.entidad.MercaderiaExt;
import com.lmaguina.interfaces.MercaderiaDAO;
import com.lmaguina.utils.MySqlFactory;

public class MySqlMercaderiaDAO implements MercaderiaDAO{

	private SqlSessionFactory factory;	
	
	
	//constructor
	public MySqlMercaderiaDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	
	@Override
	public int save(Mercaderia bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_regMercaderia",bean);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return estado;
	}

	@Override
	public int update(Mercaderia bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_upMercaderia",bean);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return estado;
	}
	@Override
	public int delete(Mercaderia bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_delMercaderia",bean);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return estado;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MercaderiaExt> listAllMercaderia() {
		List<MercaderiaExt> lista=new ArrayList<MercaderiaExt>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_lstMercaderia");
			System.out.println(lista.get(0).getId()+""+lista.get(0).getNombre());
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return lista;
	}

}
