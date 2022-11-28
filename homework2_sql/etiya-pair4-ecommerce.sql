--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-11-28 14:52:14

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
-- TOC entry 214 (class 1259 OID 16881)
-- Name: address_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address_types (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.address_types OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16886)
-- Name: address_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.address_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.address_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16887)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    description character varying NOT NULL,
    address_type_id integer NOT NULL,
    street_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16892)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.addresses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16893)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    total_price money NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16896)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.carts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16897)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16902)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16903)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16908)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16909)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16914)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.countries ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16915)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    customer_number character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16920)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16921)
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    id integer NOT NULL,
    name character varying NOT NULL,
    town_id integer NOT NULL
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16926)
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.districts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16927)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    product_suppliers_id integer NOT NULL,
    quantity integer
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16930)
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16931)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    payment_id integer NOT NULL,
    order_detail_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16934)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16935)
-- Name: payment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_types (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.payment_types OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16940)
-- Name: payment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16941)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    payment_type_id integer NOT NULL,
    description character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16946)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 16947)
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    id integer NOT NULL,
    product_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16950)
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 16951)
-- Name: product_suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_suppliers (
    id integer NOT NULL,
    product_id integer NOT NULL,
    supplier_id integer NOT NULL
);


ALTER TABLE public.product_suppliers OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16954)
-- Name: product_suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_suppliers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 16955)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    unit_price money NOT NULL,
    stock integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16960)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 16961)
-- Name: streets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streets (
    id integer NOT NULL,
    name character varying NOT NULL,
    district_id integer NOT NULL
);


ALTER TABLE public.streets OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16966)
-- Name: streets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.streets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.streets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 246 (class 1259 OID 16967)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    id integer NOT NULL,
    supplier_number character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16972)
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.suppliers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 16973)
-- Name: towns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.towns (
    id integer NOT NULL,
    name character varying NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.towns OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16978)
-- Name: towns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.towns ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.towns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 250 (class 1259 OID 16979)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    phone_number character varying,
    email character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16984)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3462 (class 0 OID 16881)
-- Dependencies: 214
-- Data for Name: address_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address_types (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Ev');
INSERT INTO public.address_types (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'İş');


--
-- TOC entry 3464 (class 0 OID 16887)
-- Dependencies: 216
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.addresses (id, description, address_type_id, street_id, user_id) OVERRIDING SYSTEM VALUE VALUES (1, 'denemeev', 1, 1, 1);


--
-- TOC entry 3466 (class 0 OID 16893)
-- Dependencies: 218
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carts (id, total_price, user_id) OVERRIDING SYSTEM VALUE VALUES (1, '£555.00', 1);


--
-- TOC entry 3468 (class 0 OID 16897)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Giyim');
INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'İçecek');
INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE VALUES (3, 'Teknoloji');


--
-- TOC entry 3470 (class 0 OID 16903)
-- Dependencies: 222
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (id, name, country_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Ankara', 1);
INSERT INTO public.cities (id, name, country_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Berlin', 2);
INSERT INTO public.cities (id, name, country_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Bursa', 1);
INSERT INTO public.cities (id, name, country_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Adana', 1);
INSERT INTO public.cities (id, name, country_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Amsterdam', 3);


--
-- TOC entry 3472 (class 0 OID 16909)
-- Dependencies: 224
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.countries (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Turkiye');
INSERT INTO public.countries (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'Almanya');
INSERT INTO public.countries (id, name) OVERRIDING SYSTEM VALUE VALUES (3, 'Hollanda');


--
-- TOC entry 3474 (class 0 OID 16915)
-- Dependencies: 226
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers (id, customer_number, user_id) OVERRIDING SYSTEM VALUE VALUES (1, '123123', 2);


--
-- TOC entry 3476 (class 0 OID 16921)
-- Dependencies: 228
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.districts (id, name, town_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Eryaman', 1);


--
-- TOC entry 3478 (class 0 OID 16927)
-- Dependencies: 230
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_details (id, product_suppliers_id, quantity) OVERRIDING SYSTEM VALUE VALUES (1, 1, 2);
INSERT INTO public.order_details (id, product_suppliers_id, quantity) OVERRIDING SYSTEM VALUE VALUES (2, 2, 5);
INSERT INTO public.order_details (id, product_suppliers_id, quantity) OVERRIDING SYSTEM VALUE VALUES (3, 3, 1);
INSERT INTO public.order_details (id, product_suppliers_id, quantity) OVERRIDING SYSTEM VALUE VALUES (4, 4, 3);


--
-- TOC entry 3480 (class 0 OID 16931)
-- Dependencies: 232
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, payment_id, order_detail_id) OVERRIDING SYSTEM VALUE VALUES (2, 1, 1);
INSERT INTO public.orders (id, payment_id, order_detail_id) OVERRIDING SYSTEM VALUE VALUES (5, 1, 2);
INSERT INTO public.orders (id, payment_id, order_detail_id) OVERRIDING SYSTEM VALUE VALUES (6, 4, 3);
INSERT INTO public.orders (id, payment_id, order_detail_id) OVERRIDING SYSTEM VALUE VALUES (7, 3, 4);


--
-- TOC entry 3482 (class 0 OID 16935)
-- Dependencies: 234
-- Data for Name: payment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment_types (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Kart');
INSERT INTO public.payment_types (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'havale');
INSERT INTO public.payment_types (id, name) OVERRIDING SYSTEM VALUE VALUES (4, 'Kapıda ödeme');
INSERT INTO public.payment_types (id, name) OVERRIDING SYSTEM VALUE VALUES (5, 'Nakit');


--
-- TOC entry 3484 (class 0 OID 16941)
-- Dependencies: 236
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payments (id, payment_type_id, description, user_id) OVERRIDING SYSTEM VALUE VALUES (4, 2, 'iban', 2);
INSERT INTO public.payments (id, payment_type_id, description, user_id) OVERRIDING SYSTEM VALUE VALUES (1, 1, 'ziraat kartı', 1);
INSERT INTO public.payments (id, payment_type_id, description, user_id) OVERRIDING SYSTEM VALUE VALUES (3, 1, 'garanti kartı', 1);
INSERT INTO public.payments (id, payment_type_id, description, user_id) OVERRIDING SYSTEM VALUE VALUES (5, 5, 'nakit', 3);


--
-- TOC entry 3486 (class 0 OID 16947)
-- Dependencies: 238
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_categories (id, product_id, category_id) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public.product_categories (id, product_id, category_id) OVERRIDING SYSTEM VALUE VALUES (2, 2, 2);
INSERT INTO public.product_categories (id, product_id, category_id) OVERRIDING SYSTEM VALUE VALUES (3, 3, 3);
INSERT INTO public.product_categories (id, product_id, category_id) OVERRIDING SYSTEM VALUE VALUES (4, 4, 3);
INSERT INTO public.product_categories (id, product_id, category_id) OVERRIDING SYSTEM VALUE VALUES (5, 5, 1);


--
-- TOC entry 3488 (class 0 OID 16951)
-- Dependencies: 240
-- Data for Name: product_suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_suppliers (id, product_id, supplier_id) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public.product_suppliers (id, product_id, supplier_id) OVERRIDING SYSTEM VALUE VALUES (2, 2, 2);
INSERT INTO public.product_suppliers (id, product_id, supplier_id) OVERRIDING SYSTEM VALUE VALUES (3, 3, 3);
INSERT INTO public.product_suppliers (id, product_id, supplier_id) OVERRIDING SYSTEM VALUE VALUES (4, 4, 4);
INSERT INTO public.product_suppliers (id, product_id, supplier_id) OVERRIDING SYSTEM VALUE VALUES (5, 2, 1);
INSERT INTO public.product_suppliers (id, product_id, supplier_id) OVERRIDING SYSTEM VALUE VALUES (6, 2, 3);
INSERT INTO public.product_suppliers (id, product_id, supplier_id) OVERRIDING SYSTEM VALUE VALUES (7, 3, 1);
INSERT INTO public.product_suppliers (id, product_id, supplier_id) OVERRIDING SYSTEM VALUE VALUES (8, 1, 2);


--
-- TOC entry 3490 (class 0 OID 16955)
-- Dependencies: 242
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (id, name, unit_price, stock) OVERRIDING SYSTEM VALUE VALUES (1, 'T-shirt', '£222.00', 22);
INSERT INTO public.products (id, name, unit_price, stock) OVERRIDING SYSTEM VALUE VALUES (2, 'Gazoz', '£11.00', 44);
INSERT INTO public.products (id, name, unit_price, stock) OVERRIDING SYSTEM VALUE VALUES (3, 'Laptop', '£4,444.00', 5);
INSERT INTO public.products (id, name, unit_price, stock) OVERRIDING SYSTEM VALUE VALUES (4, 'Klavye', '£333.00', 22);
INSERT INTO public.products (id, name, unit_price, stock) OVERRIDING SYSTEM VALUE VALUES (5, 'Kazak', '£177.00', 33);
INSERT INTO public.products (id, name, unit_price, stock) OVERRIDING SYSTEM VALUE VALUES (6, 'Sweat', '£337.00', 51);
INSERT INTO public.products (id, name, unit_price, stock) OVERRIDING SYSTEM VALUE VALUES (7, 'Ayakkabı', '£888.00', 15);
INSERT INTO public.products (id, name, unit_price, stock) OVERRIDING SYSTEM VALUE VALUES (8, 'Monitör', '£2,222.00', 5);


--
-- TOC entry 3492 (class 0 OID 16961)
-- Dependencies: 244
-- Data for Name: streets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.streets (id, name, district_id) OVERRIDING SYSTEM VALUE VALUES (1, '111. Sk', 1);


--
-- TOC entry 3494 (class 0 OID 16967)
-- Dependencies: 246
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.suppliers (id, supplier_number, user_id) OVERRIDING SYSTEM VALUE VALUES (1, '12313123123', 1);
INSERT INTO public.suppliers (id, supplier_number, user_id) OVERRIDING SYSTEM VALUE VALUES (2, '14124124124', 2);
INSERT INTO public.suppliers (id, supplier_number, user_id) OVERRIDING SYSTEM VALUE VALUES (3, '15151515151', 4);
INSERT INTO public.suppliers (id, supplier_number, user_id) OVERRIDING SYSTEM VALUE VALUES (4, '123132141', 3);


--
-- TOC entry 3496 (class 0 OID 16973)
-- Dependencies: 248
-- Data for Name: towns; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.towns (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Etimesgut', 1);


--
-- TOC entry 3498 (class 0 OID 16979)
-- Dependencies: 250
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, phone_number, email) OVERRIDING SYSTEM VALUE VALUES (2, 'Burak', '66666666', 'asdasd1@gmail.com');
INSERT INTO public.users (id, name, phone_number, email) OVERRIDING SYSTEM VALUE VALUES (3, 'Deneme', '77777777', 'asdasd2@gmail.com');
INSERT INTO public.users (id, name, phone_number, email) OVERRIDING SYSTEM VALUE VALUES (4, 'Deneme2', '8888888', 'asdasd3@gmail.com');
INSERT INTO public.users (id, name, phone_number, email) OVERRIDING SYSTEM VALUE VALUES (5, 'burak', '5555555', 'asdasdad@gmail.com');
INSERT INTO public.users (id, name, phone_number, email) OVERRIDING SYSTEM VALUE VALUES (6, 'Mert', '7987878', 'asdasda@gmail.com');
INSERT INTO public.users (id, name, phone_number, email) OVERRIDING SYSTEM VALUE VALUES (7, 'Deneme3', NULL, 'asdasd4@gmail.com');
INSERT INTO public.users (id, name, phone_number, email) OVERRIDING SYSTEM VALUE VALUES (8, 'Deneme4', NULL, 'asdasd5@gmail.com');
INSERT INTO public.users (id, name, phone_number, email) OVERRIDING SYSTEM VALUE VALUES (1, 'Mert', NULL, 'asdasd@gmail.com');


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 215
-- Name: address_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_types_id_seq', 2, true);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 217
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1, true);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 219
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 1, true);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 221
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 223
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 8, true);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 225
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 5, true);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 227
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, true);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 229
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.districts_id_seq', 1, true);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_id_seq', 4, true);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 233
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 7, true);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 235
-- Name: payment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_types_id_seq', 7, true);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 237
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 5, true);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 239
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 5, true);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 241
-- Name: product_suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_suppliers_id_seq', 8, true);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 243
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 245
-- Name: streets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.streets_id_seq', 1, true);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 247
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 4, true);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 249
-- Name: towns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.towns_id_seq', 1, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 251
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- TOC entry 3264 (class 2606 OID 16986)
-- Name: address_types address_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address_types
    ADD CONSTRAINT address_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 16988)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 16990)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 16992)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 16994)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 16996)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 16998)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 17000)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 17002)
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 17004)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 17006)
-- Name: payment_types payment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_types
    ADD CONSTRAINT payment_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 17008)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 17010)
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 17012)
-- Name: product_suppliers product_suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_suppliers
    ADD CONSTRAINT product_suppliers_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 17014)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 17016)
-- Name: streets streets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 17018)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 17020)
-- Name: towns towns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.towns
    ADD CONSTRAINT towns_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 17022)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 17023)
-- Name: addresses addresses_address_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_address_type_id_fk FOREIGN KEY (address_type_id) REFERENCES public.address_types(id);


--
-- TOC entry 3302 (class 2606 OID 17028)
-- Name: addresses addresses_street_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_street_id_fk FOREIGN KEY (street_id) REFERENCES public.streets(id);


--
-- TOC entry 3303 (class 2606 OID 17033)
-- Name: addresses addresses_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3304 (class 2606 OID 17038)
-- Name: carts carts_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3305 (class 2606 OID 17043)
-- Name: cities cities_countries_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_countries_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 3306 (class 2606 OID 17048)
-- Name: customers customers_users_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_users_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3307 (class 2606 OID 17053)
-- Name: districts districts_towns_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_towns_id_fk FOREIGN KEY (town_id) REFERENCES public.towns(id);


--
-- TOC entry 3308 (class 2606 OID 17058)
-- Name: order_details order_details_product_suppliers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_product_suppliers_id_fk FOREIGN KEY (product_suppliers_id) REFERENCES public.product_suppliers(id);


--
-- TOC entry 3309 (class 2606 OID 17063)
-- Name: orders orders_order_details_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_details_id_fk FOREIGN KEY (order_detail_id) REFERENCES public.order_details(id);


--
-- TOC entry 3310 (class 2606 OID 17068)
-- Name: orders orders_payments_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_payments_id_fk FOREIGN KEY (payment_id) REFERENCES public.payments(id);


--
-- TOC entry 3311 (class 2606 OID 17073)
-- Name: payments payments_payment_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_payment_type_id_fk FOREIGN KEY (payment_type_id) REFERENCES public.payment_types(id);


--
-- TOC entry 3312 (class 2606 OID 17078)
-- Name: payments payments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3313 (class 2606 OID 17083)
-- Name: product_categories product_categories_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_category_id_fk FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3314 (class 2606 OID 17088)
-- Name: product_categories product_categories_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3315 (class 2606 OID 17093)
-- Name: product_suppliers product_suppliers_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_suppliers
    ADD CONSTRAINT product_suppliers_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3316 (class 2606 OID 17098)
-- Name: product_suppliers product_suppliers_suppliers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_suppliers
    ADD CONSTRAINT product_suppliers_suppliers_id_fk FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- TOC entry 3317 (class 2606 OID 17103)
-- Name: streets streets_districts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_districts_id_fk FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- TOC entry 3318 (class 2606 OID 17108)
-- Name: suppliers suppliers_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3319 (class 2606 OID 17113)
-- Name: towns towns_cities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.towns
    ADD CONSTRAINT towns_cities_id_fk FOREIGN KEY (city_id) REFERENCES public.cities(id);


-- Completed on 2022-11-28 14:52:14

--
-- PostgreSQL database dump complete
--

