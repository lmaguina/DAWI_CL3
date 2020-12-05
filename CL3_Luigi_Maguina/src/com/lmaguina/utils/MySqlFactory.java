package com.lmaguina.utils;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MySqlFactory {
	
	public static SqlSessionFactory getSqlSessionFactory() {
		SqlSessionFactory factory=null;
		try {
			//leer archivo ConfiguracionIbatis.xml
			Reader reader=Resources.getResourceAsReader("ConfiguracionIbatis.xml");
			//obtener la conexión
			factory=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return factory;
	}
}
