package com.obelov.online.bank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.obelov.online.bank.model.security.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

	Role findByName(String roleName);
}
