package com.lmaguina.dao;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lmaguina.entidad.Tipo;
import com.lmaguina.interfaces.TipoDAO;
import com.lmaguina.utils.MySqlFactory;

public class MySqlTipoDAO implements TipoDAO{

	private SqlSessionFactory factory;	
	
	
	//constructor
	public MySqlTipoDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tipo> listAllTipo() {
		List<Tipo> lista=new ArrayList<Tipo>(); 
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaTipo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return lista;
	}

}
