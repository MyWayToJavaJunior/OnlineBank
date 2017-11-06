package com.obelov.online.bank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.obelov.online.bank.model.PrimaryTransaction;

@Repository
public interface PrimaryTransactionRepository extends JpaRepository<PrimaryTransaction, Long> {

}
