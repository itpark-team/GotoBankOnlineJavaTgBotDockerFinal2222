--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    chat_id bigint NOT NULL,
    balance numeric(16,2) NOT NULL,
    number bigint NOT NULL,
    payment_system_id integer NOT NULL
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_id_seq OWNER TO postgres;

--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- Name: payment_systems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_systems (
    id integer NOT NULL,
    name character varying(16) NOT NULL
);


ALTER TABLE public.payment_systems OWNER TO postgres;

--
-- Name: payment_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_systems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_systems_id_seq OWNER TO postgres;

--
-- Name: payment_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_systems_id_seq OWNED BY public.payment_systems.id;


--
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- Name: payment_systems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_systems ALTER COLUMN id SET DEFAULT nextval('public.payment_systems_id_seq'::regclass);


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, chat_id, balance, number, payment_system_id) FROM stdin;
1	984903039	3124.00	2222333344445555	2
10	732314018	0.00	838501151009485	3
8	732314018	10000.00	922154893310502	2
9	732314018	5000.00	4274788242051368	1
11	247021014	0.00	3627938801131594	2
12	1139166057	100000.00	4789411859098784	3
6	247021014	2329.00	9376437851174408	1
7	247021014	13000.00	4429144610222166	3
13	247021014	600.00	309914510451073	1
\.


--
-- Data for Name: payment_systems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_systems (id, name) FROM stdin;
1	МИР
2	VISA
3	MasterCard
\.


--
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_id_seq', 1, false);


--
-- Name: payment_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_systems_id_seq', 1, false);


--
-- Name: cards cards_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pk PRIMARY KEY (id);


--
-- Name: payment_systems payment_systems_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_systems
    ADD CONSTRAINT payment_systems_pk PRIMARY KEY (id);


--
-- Name: cards cards_payment_systems_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_payment_systems_id_fk FOREIGN KEY (payment_system_id) REFERENCES public.payment_systems(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

