package com.obelov.online.bank.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obelov.online.bank.model.security.Role;
import com.obelov.online.bank.repository.RoleRepository;
import com.obelov.online.bank.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	RoleRepository roleRepository;
	
	@Autowired
	public void serRoleRepository(RoleRepository roleRepository) {
		this.roleRepository = roleRepository;
	}

	@Override
	public Role findByName(String roleName) {
		return roleRepository.findByName(roleName);
	}

	@Override
	public Role createDefaultRole(String defaultRoleName) {
		Role role = new Role();
		role.setName(defaultRoleName);
		
		return roleRepository.save(role);
	}
}
