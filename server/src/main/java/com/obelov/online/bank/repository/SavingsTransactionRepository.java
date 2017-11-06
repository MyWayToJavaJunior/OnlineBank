package com.obelov.online.bank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.obelov.online.bank.model.SavingsTransaction;

@Repository
public interface SavingsTransactionRepository extends JpaRepository<SavingsTransaction, Long> {

}
