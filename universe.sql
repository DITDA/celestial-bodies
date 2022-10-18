--
-- PostgreSQL database dump
--

-- Dumped from database version 11.17 (Ubuntu 11.17-1.pgdg20.04+1)
-- Dumped by pg_dump version 11.17 (Ubuntu 11.17-1.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: yellowflash2041
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO yellowflash2041;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: yellowflash2041
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_solar_system integer,
    description text,
    galaxy_types character varying(30),
    constraints name
);


ALTER TABLE public.galaxy OWNER TO yellowflash2041;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: yellowflash2041
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO yellowflash2041;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yellowflash2041
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: yellowflash2041
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    is_main_moon boolean,
    planet_id integer,
    constraints name
);


ALTER TABLE public.moon OWNER TO yellowflash2041;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: yellowflash2041
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO yellowflash2041;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yellowflash2041
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: yellowflash2041
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    has_water boolean,
    age numeric(3,1),
    star_id integer,
    constraints name
);


ALTER TABLE public.planet OWNER TO yellowflash2041;

--
-- Name: planet_moon_rel; Type: TABLE; Schema: public; Owner: yellowflash2041
--

CREATE TABLE public.planet_moon_rel (
    planet_id integer,
    moon_id integer,
    is_satellite boolean,
    planet_moon_rel_id integer NOT NULL,
    name character varying(60) NOT NULL,
    constraints name
);


ALTER TABLE public.planet_moon_rel OWNER TO yellowflash2041;

--
-- Name: planet_moon_rel_planet_moon_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: yellowflash2041
--

CREATE SEQUENCE public.planet_moon_rel_planet_moon_rel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_rel_planet_moon_rel_id_seq OWNER TO yellowflash2041;

--
-- Name: planet_moon_rel_planet_moon_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yellowflash2041
--

ALTER SEQUENCE public.planet_moon_rel_planet_moon_rel_id_seq OWNED BY public.planet_moon_rel.planet_moon_rel_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: yellowflash2041
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO yellowflash2041;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yellowflash2041
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: yellowflash2041
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_of_star numeric(6,1),
    is_gas_star boolean,
    is_sun boolean,
    galaxy_id integer,
    constraints name
);


ALTER TABLE public.star OWNER TO yellowflash2041;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: yellowflash2041
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO yellowflash2041;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yellowflash2041
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon_rel planet_moon_rel_id; Type: DEFAULT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.planet_moon_rel ALTER COLUMN planet_moon_rel_id SET DEFAULT nextval('public.planet_moon_rel_planet_moon_rel_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: yellowflash2041
--

INSERT INTO public.galaxy VALUES (1, 'milkywa', 2, 'milky way it is yo yo', 'life earth', NULL);
INSERT INTO public.galaxy VALUES (2, 'sulkyway', 0, 'sulk everything', 'badneyaar', NULL);
INSERT INTO public.galaxy VALUES (3, 'silkyway', 0, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'faultyway', 2, 'faulty  way it is yo yo', 'life is fault', NULL);
INSERT INTO public.galaxy VALUES (5, 'bulkyway', 0, 'bulk everything', 'badn 00eyaar', NULL);
INSERT INTO public.galaxy VALUES (6, 'bilkyway', 0, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: yellowflash2041
--

INSERT INTO public.moon VALUES (1, 'moon', true, true, 1, NULL);
INSERT INTO public.moon VALUES (2, 'moon2', false, false, 2, NULL);
INSERT INTO public.moon VALUES (3, 'moon3', false, false, 3, NULL);
INSERT INTO public.moon VALUES (4, 'moon4', false, false, 4, NULL);
INSERT INTO public.moon VALUES (5, 'moon5', false, false, 5, NULL);
INSERT INTO public.moon VALUES (6, 'moon6', false, false, 6, NULL);
INSERT INTO public.moon VALUES (7, 'moon7', false, false, 7, NULL);
INSERT INTO public.moon VALUES (8, 'moon8', false, false, 8, NULL);
INSERT INTO public.moon VALUES (9, 'moon9', false, false, 9, NULL);
INSERT INTO public.moon VALUES (10, 'moon10', false, false, 10, NULL);
INSERT INTO public.moon VALUES (11, 'moon11', false, false, 11, NULL);
INSERT INTO public.moon VALUES (12, 'moon12', false, false, 12, NULL);
INSERT INTO public.moon VALUES (13, 'moon13', false, false, 11, NULL);
INSERT INTO public.moon VALUES (14, 'moon14', false, false, 2, NULL);
INSERT INTO public.moon VALUES (15, 'moon15', false, false, 3, NULL);
INSERT INTO public.moon VALUES (16, 'moon16', false, false, 4, NULL);
INSERT INTO public.moon VALUES (17, 'moon17', false, false, 5, NULL);
INSERT INTO public.moon VALUES (18, 'moon18', false, false, 6, NULL);
INSERT INTO public.moon VALUES (19, 'moon19', false, false, 7, NULL);
INSERT INTO public.moon VALUES (20, 'moon20', false, false, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: yellowflash2041
--

INSERT INTO public.planet VALUES (1, 'earth', true, true, 14.0, 1, NULL);
INSERT INTO public.planet VALUES (2, 'jupiter', false, false, 12.0, 2, NULL);
INSERT INTO public.planet VALUES (3, 'mars', false, false, 1.0, 3, NULL);
INSERT INTO public.planet VALUES (4, 'neptune', false, false, 1.0, 4, NULL);
INSERT INTO public.planet VALUES (5, 'saturn', false, false, 2.0, 5, NULL);
INSERT INTO public.planet VALUES (6, 'pluto', false, false, 1.0, 6, NULL);
INSERT INTO public.planet VALUES (7, 'earth2', true, true, 14.0, 1, NULL);
INSERT INTO public.planet VALUES (8, 'jupite2r', false, false, 12.0, 2, NULL);
INSERT INTO public.planet VALUES (9, 'mars2', false, false, 1.0, 3, NULL);
INSERT INTO public.planet VALUES (10, 'neptune2', false, false, 1.0, 4, NULL);
INSERT INTO public.planet VALUES (11, 'saturn2', false, false, 2.0, 5, NULL);
INSERT INTO public.planet VALUES (12, 'pluto2', false, false, 1.0, 6, NULL);


--
-- Data for Name: planet_moon_rel; Type: TABLE DATA; Schema: public; Owner: yellowflash2041
--

INSERT INTO public.planet_moon_rel VALUES (1, 1, NULL, 1, 'data1', NULL);
INSERT INTO public.planet_moon_rel VALUES (2, 2, NULL, 2, 'data2', NULL);
INSERT INTO public.planet_moon_rel VALUES (3, 1, NULL, 3, 'data3', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: yellowflash2041
--

INSERT INTO public.star VALUES (1, 'Sun', 12.0, false, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'summa', 13.0, true, false, 2, NULL);
INSERT INTO public.star VALUES (3, 'peppa pig', 1.0, false, false, 1, NULL);
INSERT INTO public.star VALUES (4, 'pippa m', 14.0, false, false, 6, NULL);
INSERT INTO public.star VALUES (5, 'bippa', 4.0, NULL, NULL, 4, NULL);
INSERT INTO public.star VALUES (6, 'vudunga da', NULL, NULL, false, 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yellowflash2041
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yellowflash2041
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_rel_planet_moon_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yellowflash2041
--

SELECT pg_catalog.setval('public.planet_moon_rel_planet_moon_rel_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yellowflash2041
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yellowflash2041
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_constraints_key; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constraints_key UNIQUE (constraints);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_constraints_key; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_constraints_key UNIQUE (constraints);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_constraints_key; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_constraints_key UNIQUE (constraints);


--
-- Name: planet_moon_rel planet_moon_rel_constraints_key; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.planet_moon_rel
    ADD CONSTRAINT planet_moon_rel_constraints_key UNIQUE (constraints);


--
-- Name: planet_moon_rel planet_moon_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.planet_moon_rel
    ADD CONSTRAINT planet_moon_rel_pkey PRIMARY KEY (planet_moon_rel_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_constraints_key; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constraints_key UNIQUE (constraints);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
