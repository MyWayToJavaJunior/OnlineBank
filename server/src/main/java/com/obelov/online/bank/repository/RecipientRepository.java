package com.obelov.online.bank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.obelov.online.bank.model.Recipient;

@Repository
public interface RecipientRepository extends JpaRepository<Recipient, Long> {

	Recipient findByName(String recipientName);

	void deleteByName(String recipientName);

}
