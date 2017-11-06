package com.obelov.online.bank.service;

import java.util.List;

import com.obelov.online.bank.model.Appointment;

public interface AppointmentService {
	Appointment createAppointment(Appointment appointment);

    List<Appointment> findAll();

    Appointment findAppointment(Long id);

    void confirmAppointment(Long id);
}
