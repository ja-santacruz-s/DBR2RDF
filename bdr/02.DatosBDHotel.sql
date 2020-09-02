--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-08-07 10:20:19

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

--
-- TOC entry 2908 (class 0 OID 24576)
-- Dependencies: 202
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('111111   ', 'Antonio', 'Aguirre', 'Pez 20, 1º A                  ', '999418768');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('222222   ', 'Jorge', 'Anguiano López', 'Churruca 2, 6º D              ', '999876737');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('333333   ', 'Pilar', 'Méndez Alonso', 'Gran Via 167                  ', '999343543');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('444444   ', 'Azucena', 'Rubio del Val', 'Brasil 63, 2º A               ', '999456765');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('555555   ', 'Raúl', 'Gutiérrez González', 'Literatos 3, 5º               ', '999876234');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('666666   ', 'Santiago', 'Rivera Romero', 'Avda. de la Paz 30            ', '999111232');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('777777   ', 'Pedro', 'González Hernando', 'Castellana 290, 9º B          ', '999232221');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('888888   ', 'Antonio', 'Díaz Martín', 'Cuba 1                        ', '999444554');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('999999   ', 'Virginia', 'Fernández Fernández', 'Brasil 65, 3º                 ', '999009009');
INSERT INTO public.cliente (dni, nombre, apellidos, domicilio, telefono) VALUES ('000000   ', 'Francisco', 'Vilansó Rodríguez', 'General Rodrigos 24           ', '999666565');


--
-- TOC entry 2914 (class 0 OID 24641)
-- Dependencies: 208
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (10, 'Antonio Sancho Sancho', '2010-01-01 00:00:00', 1000, NULL);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (11, 'María Gonzalo Fuentes', '2010-01-01 00:00:00', 1000, NULL);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (12, 'Juana Peláez Trasto', '2010-01-01 00:00:00', 900, NULL);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (13, 'Gonzalo Cabezas Muiño', '2010-01-01 00:00:00', 1500, NULL);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (1, 'Luisa Blanco Baroja', '1996-10-23 00:00:00', 1000, 1);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (2, 'Fernando Serrano Vázquez', '1996-10-23 00:00:00', 1000, 2);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (3, 'Manuel Pérez Calo', '2000-01-01 00:00:00', 900, 3);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (4, 'Ana Troncoso Calvo', '2000-01-01 00:00:00', 900, 4);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (5, 'Alba Troncoso Calvo', '2002-09-13 00:00:00', NULL, 1);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (6, 'Jorge Alonso Alonso', '2002-09-13 00:00:00', NULL, 5);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (7, 'Fernando Soaje Alvarez', '2010-01-01 00:00:00', NULL, 5);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (8, 'Rosa Luigi Paz', '2010-01-01 00:00:00', 1000, 5);
INSERT INTO public.empleado (numreg, nombre, incorporacion, sueldo, cods) VALUES (9, 'Rafael Fuertes Cabrera', '2010-01-01 00:00:00', 1100, 6);


--
-- TOC entry 2912 (class 0 OID 24615)
-- Dependencies: 206
-- Data for Name: formapago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.formapago (forma, comision) VALUES ('efectivo', 0);
INSERT INTO public.formapago (forma, comision) VALUES ('tarjeta', 1);
INSERT INTO public.formapago (forma, comision) VALUES ('talon', 2);


--
-- TOC entry 2909 (class 0 OID 24581)
-- Dependencies: 203
-- Data for Name: precio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.precio (tipo, precio) VALUES ('individual', 75);
INSERT INTO public.precio (tipo, precio) VALUES ('doble', 90);


--
-- TOC entry 2910 (class 0 OID 24587)
-- Dependencies: 204
-- Data for Name: habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (100, 17, 'SI', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (101, 17, 'SI', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (102, 17, 'SI', 'SI', 'SI', 'individual');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (200, 17, 'SI', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (201, 17, 'SI', 'SI', 'NO', 'doble');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (202, 15, 'SI', 'SI', 'NO', 'individual');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (203, 15, 'NO', 'SI', 'SI', 'individual');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (204, 17, 'SI', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (300, 17, 'NO', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion (numero, superficie, bar, terraza, puedesupletoria, tipo) VALUES (301, 17, 'SI', 'SI', 'SI', 'doble');


--
-- TOC entry 2913 (class 0 OID 24621)
-- Dependencies: 207
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (1, '2010-01-01 00:00:00', '2010-01-03 00:00:00', '111111   ', 100, 30, 'efectivo', 360);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (0, '2010-01-01 00:00:00', '2010-01-05 00:00:00', '999999   ', 300, 0, 'tarjeta', 220);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (2, '2010-06-01 00:00:00', '2010-06-03 00:00:00', '111111   ', 100, 30, 'efectivo', 180);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (3, '2010-09-01 00:00:00', '2010-09-03 00:00:00', '111111   ', 100, 30, 'efectivo', 338);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (4, '2010-11-02 00:00:00', NULL, '111111   ', 100, 0, 'efectivo', NULL);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (5, '2010-11-01 00:00:00', NULL, '333333   ', 200, 0, 'tarjeta', NULL);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (6, '2010-10-29 00:00:00', NULL, '999999   ', 204, 30, 'talon', NULL);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (7, '2010-11-01 00:00:00', NULL, '555555   ', 300, 0, 'efectivo', NULL);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (8, '2010-10-30 00:00:00', NULL, '777777   ', 301, 30, 'tarjeta', NULL);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (9, '2010-05-15 00:00:00', '2010-05-17 00:00:00', '999999   ', 301, 0, 'tarjeta', 218);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (10, '2010-08-10 00:00:00', '2010-08-13 00:00:00', '333333   ', 300, 0, 'tarjeta', 270);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (11, '2010-08-15 00:00:00', '2010-08-22 00:00:00', '888888   ', 102, 0, 'tarjeta', 525);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (12, '2010-12-23 00:00:00', '2010-12-24 00:00:00', '444444   ', 201, 0, 'talon', 90);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (13, '2010-05-01 00:00:00', '2010-05-05 00:00:00', '999999   ', 300, 0, 'efectivo', 380);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (14, '2010-06-06 00:00:00', '2010-06-11 00:00:00', '555555   ', 203, 0, 'tarjeta', 375);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (15, '2010-08-15 00:00:00', '2010-08-19 00:00:00', '555555   ', 203, 0, 'tarjeta', 363);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (16, '2010-08-19 00:00:00', '2010-08-21 00:00:00', '666666   ', 204, 0, 'efectivo', 212);
INSERT INTO public.factura (codigof, entrada, salida, dni, numero, supletoria, forma, total) VALUES (17, '2010-08-22 00:00:00', '2010-08-24 00:00:00', '666666   ', 203, 0, 'tarjeta', 190);


--
-- TOC entry 2918 (class 0 OID 24692)
-- Dependencies: 212
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proveedor (nif, nombre, direccion, numreg) VALUES ('121212T', 'Carnes SA', 'Plaza de los de Acá 20        ', 8);
INSERT INTO public.proveedor (nif, nombre, direccion, numreg) VALUES ('343434L', 'Logística Pérez', 'Calle del Pueblo 30, 1º       ', 1);
INSERT INTO public.proveedor (nif, nombre, direccion, numreg) VALUES ('545454Q', 'Prd. Quimicos SA', 'Colombiana 34                 ', 12);


--
-- TOC entry 2919 (class 0 OID 24702)
-- Dependencies: 213
-- Data for Name: factura_prov; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (1, '2010-03-21 00:00:00', 1500, '121212T', 8);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (2, '2010-04-21 00:00:00', 1000, '121212T', 8);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (3, '2010-05-21 00:00:00', 500, '121212T', 8);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (4, '2010-06-21 00:00:00', 976, '121212T', 8);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (5, '2010-03-21 00:00:00', 345, '343434L', 1);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (6, '2010-05-21 00:00:00', 235, '343434L', 1);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (7, '2010-07-21 00:00:00', 1000, '343434L', 1);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (8, '2010-08-21 00:00:00', 765, '343434L', 1);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (9, '2010-03-21 00:00:00', 1235, '545454Q', 12);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (10, '2010-04-11 00:00:00', 2342, '545454Q', 12);
INSERT INTO public.factura_prov (codfp, fecha, importe, nif, numreg) VALUES (11, '2010-06-15 00:00:00', 2567, '545454Q', 12);


--
-- TOC entry 2915 (class 0 OID 24646)
-- Dependencies: 209
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.servicio (cods, descripcion, costeinterno, numreg) VALUES (1, 'tintoreria     ', 50, 1);
INSERT INTO public.servicio (cods, descripcion, costeinterno, numreg) VALUES (2, 'plancha        ', 30, 2);
INSERT INTO public.servicio (cods, descripcion, costeinterno, numreg) VALUES (3, 'lavanderia     ', 60, 3);
INSERT INTO public.servicio (cods, descripcion, costeinterno, numreg) VALUES (4, 'bar            ', 15, 4);
INSERT INTO public.servicio (cods, descripcion, costeinterno, numreg) VALUES (5, 'restaurante    ', 50, 8);
INSERT INTO public.servicio (cods, descripcion, costeinterno, numreg) VALUES (6, 'floristeria    ', 25, 9);


--
-- TOC entry 2917 (class 0 OID 24677)
-- Dependencies: 211
-- Data for Name: incluye; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (1, 1, 25, '2010-01-01 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (1, 2, 15, '2010-01-01 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (3, 3, 25, '2010-09-01 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (3, 3, 25, '2010-09-02 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (3, 3, 25, '2010-09-03 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (3, 2, 10, '2010-09-01 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (3, 2, 20, '2010-09-03 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (3, 1, 10, '2010-09-01 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (3, 5, 43, '2010-09-02 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (5, 5, 25, '2010-11-01 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (5, 5, 28, '2010-11-02 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (5, 5, 33, '2010-11-03 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (5, 5, 24, '2010-11-04 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (5, 3, 13, '2010-11-02 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (7, 6, 20, '2010-11-02 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (9, 4, 6, '2010-05-15 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (9, 4, 8, '2010-05-16 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (9, 5, 24, '2010-05-16 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (13, 2, 10, '2010-05-03 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (13, 2, 10, '2010-05-04 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (15, 5, 45, '2010-08-15 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (15, 4, 5, '2010-08-15 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (15, 2, 13, '2010-08-15 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (16, 5, 32, '2010-08-19 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (17, 1, 10, '2010-08-20 00:00:00');
INSERT INTO public.incluye (codigof, cods, coste, fecha) VALUES (17, 5, 30, '2010-08-23 00:00:00');


--
-- TOC entry 2920 (class 0 OID 24717)
-- Dependencies: 214
-- Data for Name: limpieza; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 101, '2010-08-20 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 101, '2010-08-21 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 101, '2010-08-22 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 101, '2010-08-23 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 102, '2010-08-24 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 202, '2010-09-23 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 203, '2010-09-23 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 204, '2010-09-30 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 301, '2010-10-01 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (10, 300, '2010-10-01 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 100, '2010-09-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 101, '2010-09-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 102, '2010-09-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 200, '2010-09-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 201, '2010-09-11 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 202, '2010-09-11 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 203, '2010-09-11 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 204, '2010-09-11 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 300, '2010-09-12 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (12, 301, '2010-09-12 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 100, '2010-08-01 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 100, '2010-09-01 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 100, '2010-10-01 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 100, '2010-10-02 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 101, '2010-08-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 101, '2010-09-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 101, '2010-08-14 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 102, '2010-08-15 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 200, '2010-08-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 201, '2010-09-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 202, '2010-09-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 203, '2010-01-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 204, '2010-01-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 301, '2010-01-10 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 301, '2010-01-01 00:00:00');
INSERT INTO public.limpieza (numreg, numero, fecha) VALUES (11, 301, '2010-01-07 00:00:00');


--
-- TOC entry 2911 (class 0 OID 24600)
-- Dependencies: 205
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reserva (dni, numero, entrada, salida) VALUES ('111111   ', 101, '2011-02-01 00:00:00', '2011-02-04 00:00:00');
INSERT INTO public.reserva (dni, numero, entrada, salida) VALUES ('111111   ', 102, '2011-02-03 00:00:00', '2011-02-04 00:00:00');
INSERT INTO public.reserva (dni, numero, entrada, salida) VALUES ('222222   ', 300, '2011-02-02 00:00:00', '2011-02-06 00:00:00');
INSERT INTO public.reserva (dni, numero, entrada, salida) VALUES ('777777   ', 203, '2011-02-17 00:00:00', '2011-02-19 00:00:00');
INSERT INTO public.reserva (dni, numero, entrada, salida) VALUES ('777777   ', 204, '2011-03-25 00:00:00', '2011-03-27 00:00:00');
INSERT INTO public.reserva (dni, numero, entrada, salida) VALUES ('999999   ', 200, '2011-02-11 00:00:00', '2011-02-15 00:00:00');


--
-- TOC entry 2916 (class 0 OID 24662)
-- Dependencies: 210
-- Data for Name: usa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 1, '2010-08-25 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 1, '2010-08-30 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 1, '2010-09-24 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 2, '2010-08-18 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 2, '2010-09-01 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 3, '2010-09-05 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 4, '2010-09-20 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 4, '2010-09-29 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (5, 6, '2010-09-25 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (4, 2, '2010-09-17 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (4, 2, '2010-08-29 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (4, 3, '2010-09-01 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (4, 3, '2010-09-05 00:00:00');
INSERT INTO public.usa (cods, servicio_cods, fecha) VALUES (4, 3, '2010-09-19 00:00:00');


-- Completed on 2020-08-07 10:20:19

--
-- PostgreSQL database dump complete
--

