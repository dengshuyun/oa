package com.neo.dao;

import com.neo.bo.Employee;
import com.neo.dto.Employeedto;

public interface Employeedao {
	//��½
	public Employeedto findbyNameAndPassword(String name,String password);
}
