--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-08-07 10:15:10

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
-- TOC entry 202 (class 1259 OID 24576)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    dni character(9) NOT NULL,
    nombre character varying(10),
    apellidos character varying(30),
    domicilio character(30),
    telefono character varying(9)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24641)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    numreg integer NOT NULL,
    nombre character varying(32),
    incorporacion timestamp without time zone,
    sueldo integer,
    cods integer
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24621)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    codigof integer NOT NULL,
    entrada timestamp without time zone,
    salida timestamp without time zone,
    dni character(9),
    numero integer NOT NULL,
    supletoria integer,
    forma character varying(8) NOT NULL,
    total real
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24702)
-- Name: factura_prov; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_prov (
    codfp integer NOT NULL,
    fecha timestamp without time zone,
    importe integer,
    nif character varying(10) NOT NULL,
    numreg integer NOT NULL
);


ALTER TABLE public.factura_prov OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24615)
-- Name: formapago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formapago (
    forma character varying(8) NOT NULL,
    comision integer,
    CONSTRAINT formapago_forma_check CHECK (((forma)::text = ANY ((ARRAY['efectivo'::character varying, 'tarjeta'::character varying, 'talon'::character varying])::text[])))
);


ALTER TABLE public.formapago OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24587)
-- Name: habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitacion (
    numero integer NOT NULL,
    superficie integer,
    bar character(2),
    terraza character(2),
    puedesupletoria character(2),
    tipo character varying(10) NOT NULL,
    CONSTRAINT habitacion_bar_check CHECK ((bar = ANY (ARRAY['SI'::bpchar, 'NO'::bpchar]))),
    CONSTRAINT habitacion_puedesupletoria_check CHECK ((puedesupletoria = ANY (ARRAY['SI'::bpchar, 'NO'::bpchar]))),
    CONSTRAINT habitacion_terraza_check CHECK ((terraza = ANY (ARRAY['SI'::bpchar, 'NO'::bpchar])))
);


ALTER TABLE public.habitacion OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24677)
-- Name: incluye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incluye (
    codigof integer NOT NULL,
    cods integer NOT NULL,
    coste integer,
    fecha timestamp without time zone NOT NULL
);


ALTER TABLE public.incluye OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24717)
-- Name: limpieza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.limpieza (
    numreg integer NOT NULL,
    numero integer NOT NULL,
    fecha timestamp without time zone NOT NULL
);


ALTER TABLE public.limpieza OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24581)
-- Name: precio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precio (
    tipo character varying(10) NOT NULL,
    precio integer,
    CONSTRAINT precio_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['individual'::character varying, 'doble'::character varying])::text[])))
);


ALTER TABLE public.precio OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24692)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor (
    nif character varying(10) NOT NULL,
    nombre character varying(16),
    direccion character(30),
    numreg integer NOT NULL
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24600)
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    dni character(9) NOT NULL,
    numero integer NOT NULL,
    entrada timestamp without time zone,
    salida timestamp without time zone
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24646)
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio (
    cods integer NOT NULL,
    descripcion character(15),
    costeinterno integer,
    numreg integer NOT NULL,
    CONSTRAINT servicio_descripcion_check CHECK ((descripcion = ANY (ARRAY['tintoreria'::bpchar, 'plancha'::bpchar, 'lavanderia'::bpchar, 'bar'::bpchar, 'restaurante'::bpchar, 'floristeria'::bpchar])))
);


ALTER TABLE public.servicio OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24662)
-- Name: usa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usa (
    cods integer NOT NULL,
    servicio_cods integer NOT NULL,
    fecha timestamp without time zone NOT NULL
);


ALTER TABLE public.usa OWNER TO postgres;

--
-- TOC entry 2740 (class 2606 OID 24580)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (dni);


--
-- TOC entry 2752 (class 2606 OID 24645)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (numreg);


--
-- TOC entry 2750 (class 2606 OID 24625)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (codigof);


--
-- TOC entry 2762 (class 2606 OID 24706)
-- Name: factura_prov factura_prov_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_prov
    ADD CONSTRAINT factura_prov_pkey PRIMARY KEY (codfp);


--
-- TOC entry 2748 (class 2606 OID 24620)
-- Name: formapago formapago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formapago
    ADD CONSTRAINT formapago_pkey PRIMARY KEY (forma);


--
-- TOC entry 2744 (class 2606 OID 24594)
-- Name: habitacion habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (numero);


--
-- TOC entry 2758 (class 2606 OID 24681)
-- Name: incluye incluye_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incluye
    ADD CONSTRAINT incluye_pkey PRIMARY KEY (codigof, cods, fecha);


--
-- TOC entry 2764 (class 2606 OID 24721)
-- Name: limpieza limpieza_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.limpieza
    ADD CONSTRAINT limpieza_pkey PRIMARY KEY (numreg, numero, fecha);


--
-- TOC entry 2742 (class 2606 OID 24586)
-- Name: precio precio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precio
    ADD CONSTRAINT precio_pkey PRIMARY KEY (tipo);


--
-- TOC entry 2760 (class 2606 OID 24696)
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (nif);


--
-- TOC entry 2746 (class 2606 OID 24604)
-- Name: reserva reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (dni, numero);


--
-- TOC entry 2754 (class 2606 OID 24651)
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (cods);


--
-- TOC entry 2756 (class 2606 OID 24666)
-- Name: usa usa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usa
    ADD CONSTRAINT usa_pkey PRIMARY KEY (cods, servicio_cods, fecha);


--
-- TOC entry 2771 (class 2606 OID 24657)
-- Name: empleado empleado_cods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_cods_fkey FOREIGN KEY (cods) REFERENCES public.servicio(cods);


--
-- TOC entry 2768 (class 2606 OID 24626)
-- Name: factura factura_dni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_dni_fkey FOREIGN KEY (dni) REFERENCES public.cliente(dni) ON UPDATE CASCADE;


--
-- TOC entry 2770 (class 2606 OID 24636)
-- Name: factura factura_forma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_forma_fkey FOREIGN KEY (forma) REFERENCES public.formapago(forma) ON UPDATE CASCADE;


--
-- TOC entry 2769 (class 2606 OID 24631)
-- Name: factura factura_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_numero_fkey FOREIGN KEY (numero) REFERENCES public.habitacion(numero) ON UPDATE CASCADE;


--
-- TOC entry 2778 (class 2606 OID 24707)
-- Name: factura_prov factura_prov_nif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_prov
    ADD CONSTRAINT factura_prov_nif_fkey FOREIGN KEY (nif) REFERENCES public.proveedor(nif) ON UPDATE CASCADE;


--
-- TOC entry 2779 (class 2606 OID 24712)
-- Name: factura_prov factura_prov_numreg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_prov
    ADD CONSTRAINT factura_prov_numreg_fkey FOREIGN KEY (numreg) REFERENCES public.empleado(numreg);


--
-- TOC entry 2765 (class 2606 OID 24595)
-- Name: habitacion habitacion_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_tipo_fkey FOREIGN KEY (tipo) REFERENCES public.precio(tipo) ON UPDATE CASCADE;


--
-- TOC entry 2775 (class 2606 OID 24682)
-- Name: incluye incluye_codigof_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incluye
    ADD CONSTRAINT incluye_codigof_fkey FOREIGN KEY (codigof) REFERENCES public.factura(codigof) ON UPDATE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 24687)
-- Name: incluye incluye_cods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incluye
    ADD CONSTRAINT incluye_cods_fkey FOREIGN KEY (cods) REFERENCES public.servicio(cods) ON UPDATE CASCADE;


--
-- TOC entry 2781 (class 2606 OID 24727)
-- Name: limpieza limpieza_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.limpieza
    ADD CONSTRAINT limpieza_numero_fkey FOREIGN KEY (numero) REFERENCES public.habitacion(numero) ON UPDATE CASCADE;


--
-- TOC entry 2780 (class 2606 OID 24722)
-- Name: limpieza limpieza_numreg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.limpieza
    ADD CONSTRAINT limpieza_numreg_fkey FOREIGN KEY (numreg) REFERENCES public.empleado(numreg) ON UPDATE CASCADE;


--
-- TOC entry 2777 (class 2606 OID 24697)
-- Name: proveedor proveedor_numreg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_numreg_fkey FOREIGN KEY (numreg) REFERENCES public.empleado(numreg) ON UPDATE CASCADE;


--
-- TOC entry 2766 (class 2606 OID 24605)
-- Name: reserva reserva_dni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_dni_fkey FOREIGN KEY (dni) REFERENCES public.cliente(dni) ON UPDATE CASCADE;


--
-- TOC entry 2767 (class 2606 OID 24610)
-- Name: reserva reserva_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_numero_fkey FOREIGN KEY (numero) REFERENCES public.habitacion(numero) ON UPDATE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 24652)
-- Name: servicio servicio_numreg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_numreg_fkey FOREIGN KEY (numreg) REFERENCES public.empleado(numreg) ON UPDATE CASCADE;


--
-- TOC entry 2773 (class 2606 OID 24667)
-- Name: usa usa_cods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usa
    ADD CONSTRAINT usa_cods_fkey FOREIGN KEY (cods) REFERENCES public.servicio(cods);


--
-- TOC entry 2774 (class 2606 OID 24672)
-- Name: usa usa_servicio_cods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usa
    ADD CONSTRAINT usa_servicio_cods_fkey FOREIGN KEY (servicio_cods) REFERENCES public.servicio(cods);


-- Completed on 2020-08-07 10:15:11

--
-- PostgreSQL database dump complete
--

