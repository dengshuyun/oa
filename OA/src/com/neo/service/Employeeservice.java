package com.neo.service;

import com.neo.dto.Employeedto;

public interface Employeeservice {

	//��½
	public Employeedto findbyNameAndPassword(String name,String password);
}
