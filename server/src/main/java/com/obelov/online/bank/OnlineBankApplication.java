package com.obelov.online.bank;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.obelov.online.bank.model.User;
import com.obelov.online.bank.model.security.Role;
import com.obelov.online.bank.model.security.UserRole;
import com.obelov.online.bank.service.RoleService;
import com.obelov.online.bank.service.UserService;

@SpringBootApplication
public class OnlineBankApplication {
//	private static Logger log = LoggerFactory.getLogger(getCurrentClassName());
	
	@Autowired
	private UserService userService;
	
	@Autowired
    private RoleService roleService;
	
	public static void main(String[] args) {
		SpringApplication.run(OnlineBankApplication.class, args);
	}
	
	@PostConstruct
	public void init(){
		User user = new User();
		user.setUsername("obelov");
		user.setPassword("password");
		user.setFirstName("Oleg");
		user.setLastName("Belov");
		user.setEmail("hiimoleg@gmail.com");
		user.setPhone("333-333-3333");
		
		Set<UserRole> userRoles = new HashSet<>();
    	Role role = roleService.findByName("ROLE_USER");
       	role = role != null? role : roleService.createDefaultRole("ROLE_USER");
        userRoles.add(new UserRole(user, role));
        role = roleService.findByName("ROLE_ADMIN");
       	role = role != null? role : roleService.createDefaultRole("ROLE_ADMIN");
        userRoles.add(new UserRole(user, role));
         
        userService.createUser(user, userRoles);
	}
}
