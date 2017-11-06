package com.obelov.online.bank.service;

import com.obelov.online.bank.model.security.Role;

public interface RoleService {

	Role findByName(String roleName);

	Role createDefaultRole(String defaultRoleName);
}
