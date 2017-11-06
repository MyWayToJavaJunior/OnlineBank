-- Database: OnlineBanking

DROP DATABASE "OnlineBanking";

CREATE DATABASE "OnlineBanking"
    WITH 
    OWNER = postgres
	ENCODING = 'UTF8'
	TABLESPACE = pg_default
	LC_COLLATE = 'en_US.UTF-8'
	LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
GRANT CONNECT, TEMPORARY ON DATABASE "OnlineBanking" TO public;
GRANT ALL ON DATABASE "OnlineBanking" TO postgres;
GRANT CONNECT ON DATABASE "OnlineBanking" TO blibrary;

-- Schema: public

DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA public TO postgres;
COMMENT ON SCHEMA public
  IS 'standard public schema';

DROP TABLE IF EXISTS public.user CASCADE;
DROP TABLE IF EXISTS public.appointment CASCADE;
DROP TABLE IF EXISTS public.primary_account CASCADE;
DROP TABLE IF EXISTS public.primary_transaction CASCADE;
DROP TABLE IF EXISTS public.savings_account CASCADE;
DROP TABLE IF EXISTS public.savings_transaction CASCADE;
DROP TABLE IF EXISTS public.recipient CASCADE;
DROP TABLE IF EXISTS public.role CASCADE;
DROP TABLE IF EXISTS public.user_role CASCADE;

------ Cteate Tables --------
CREATE TABLE public.user
(	
	user_id serial,
    user_name character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
	first_name character varying(255) COLLATE pg_catalog."default",
    last_name character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(255) COLLATE pg_catalog."default",
    enabled boolean,
    CONSTRAINT user_pkey PRIMARY KEY (user_id),
    CONSTRAINT email_unique UNIQUE (email)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.user
    OWNER to postgres;

CREATE TABLE public.appointment
(
    appointment_id serial,
    date timestamp without time zone,
    location character varying(255) COLLATE pg_catalog."default",
    description character varying(255) COLLATE pg_catalog."default",
    confirmed boolean NOT NULL,
    user_id bigint,
    CONSTRAINT appointment_pkey PRIMARY KEY (appointment_id),
    CONSTRAINT appointment_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.user (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.appointment
    OWNER to postgres;
	

CREATE TABLE public.primary_account
(
	primary_account_id serial,
	number integer NOT NULL, 
	balance numeric(19,2),
	user_id bigint,
	CONSTRAINT primary_account_pkey PRIMARY KEY (primary_account_id),
	CONSTRAINT primary_account_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.user (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.primary_account
    OWNER to postgres;

CREATE TABLE public.primary_transaction
(
    primary_transaction_id serial,
    amount double precision NOT NULL,
    available_balance numeric(19,2),
    date timestamp without time zone,
    description character varying(255) COLLATE pg_catalog."default",
    status character varying(255) COLLATE pg_catalog."default",
    type character varying(255) COLLATE pg_catalog."default",
    primary_account_id bigint,
    CONSTRAINT primary_transaction_pkey PRIMARY KEY (primary_transaction_id),
    CONSTRAINT primary_transaction_primary_account_id_fkey FOREIGN KEY (primary_account_id)
        REFERENCES public.primary_account (primary_account_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.primary_transaction
    OWNER to postgres;
	
CREATE TABLE public.savings_account
(
	savings_account_id serial,
	number integer NOT NULL, 
	balance numeric(19,2),
	user_id bigint,
	CONSTRAINT psavings_account_pkey PRIMARY KEY (savings_account_id),
	CONSTRAINT savings_account_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.user (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.savings_account
    OWNER to postgres;

CREATE TABLE public.savings_transaction
(
    savings_transaction_id serial,
    amount double precision NOT NULL,
    available_balance numeric(19,2),
    date timestamp without time zone,
    description character varying(255) COLLATE pg_catalog."default",
    status character varying(255) COLLATE pg_catalog."default",
    type character varying(255) COLLATE pg_catalog."default",
    savings_account_id bigint,
    CONSTRAINT savings_transaction_pkey PRIMARY KEY (savings_transaction_id),
    CONSTRAINT savings_transaction_savings_account_id_fkey FOREIGN KEY (savings_account_id)
        REFERENCES public.savings_account (savings_account_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.savings_transaction
    OWNER to postgres;
	
CREATE TABLE public.recipient
(
    recipient_id serial,
	name character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    phone character varying(255) COLLATE pg_catalog."default",
    description character varying(255) COLLATE pg_catalog."default",
    account_number character varying(255) COLLATE pg_catalog."default",
    user_id bigint,
    CONSTRAINT recipient_pkey PRIMARY KEY (recipient_id),
	CONSTRAINT srecipient_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.user (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.recipient
    OWNER to postgres;	
	
CREATE TABLE public.role
(
    role_id serial,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT role_pkey PRIMARY KEY (role_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.role
    OWNER to postgres;

CREATE TABLE public.user_role
(
    user_role_id serial,
    role_id integer,
    user_id bigint,
    CONSTRAINT user_role_pkey PRIMARY KEY (user_role_id),
	CONSTRAINT user_role_role_id_fkey FOREIGN KEY (role_id)
        REFERENCES public.role (role_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT user_role_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.user (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.user_role
    OWNER to postgres;