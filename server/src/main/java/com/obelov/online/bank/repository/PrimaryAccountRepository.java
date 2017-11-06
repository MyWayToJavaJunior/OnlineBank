package com.obelov.online.bank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.obelov.online.bank.model.PrimaryAccount;

@Repository
public interface PrimaryAccountRepository extends JpaRepository<PrimaryAccount, Long> {

	PrimaryAccount findByAccountNumber(int accountNumber);

}
