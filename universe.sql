--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: employee; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    name character varying(20),
    age integer NOT NULL,
    dept integer NOT NULL
);


ALTER TABLE public.employee OWNER TO freecodecamp;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO freecodecamp;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_age integer,
    galaxy_star_count integer,
    galaxy_des character varying(20) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    moon_age integer,
    moon_weight numeric(4,1),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    planet_age integer,
    moon_count integer,
    description text,
    is_dwarf boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    star_age integer,
    planet_count integer,
    has_planet boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.employee VALUES (1, 'tre', 3, 34);
INSERT INTO public.employee VALUES (2, 'tyr', 6, 345);
INSERT INTO public.employee VALUES (3, 'ytr', 5, 567);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkyway', 100, 486, 'O.G');
INSERT INTO public.galaxy VALUES (2, 'syracuse', 77, 201, 'Sidekick');
INSERT INTO public.galaxy VALUES (3, 'cowboy', 16, 36, 'extra');
INSERT INTO public.galaxy VALUES (4, 'sooner', 16, 36, 'extra');
INSERT INTO public.galaxy VALUES (5, 'bulldogs', 23, 11, 'extra');
INSERT INTO public.galaxy VALUES (6, 'hornfrogs', 3, 43, 'extra');

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'poi', 23, 567.0, 1);
INSERT INTO public.moon VALUES (2, 'ppl', 2, 14.0, 2);
INSERT INTO public.moon VALUES (3, 'moon', 4, 324.0, 3);
INSERT INTO public.moon VALUES (4, 'ytr', 34, 234.0, 4);
INSERT INTO public.moon VALUES (5, 'th', 32, 246.0, 4);
INSERT INTO public.moon VALUES (6, 'port', 23, 567.0, 1);
INSERT INTO public.moon VALUES (7, 'pgthl', 2, 14.0, 2);
INSERT INTO public.moon VALUES (8, 'mdon', 4, 324.0, 3);
INSERT INTO public.moon VALUES (9, 'ysdvr', 34, 234.0, 4);
INSERT INTO public.moon VALUES (10, 'tsdvh', 32, 246.0, 4);
INSERT INTO public.moon VALUES (11, 'pogh', 23, 567.0, 1);
INSERT INTO public.moon VALUES (12, 'pdsthl', 2, 14.0, 2);
INSERT INTO public.moon VALUES (13, 'vnbon', 4, 324.0, 3);
INSERT INTO public.moon VALUES (14, 'yasddvr', 34, 234.0, 4);
INSERT INTO public.moon VALUES (15, 'tsfgh', 32, 246.0, 4);
INSERT INTO public.moon VALUES (16, 'rtgh', 23, 567.0, 1);
INSERT INTO public.moon VALUES (17, 'pnhsthl', 2, 14.0, 2);
INSERT INTO public.moon VALUES (18, 'vnmiuon', 4, 324.0, 3);
INSERT INTO public.moon VALUES (19, 'yadvr', 34, 234.0, 4);
INSERT INTO public.moon VALUES (20, 'tyu', 32, 246.0, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 23, 1, 'hottest planet', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 22, 1, 'reverse', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 990, 1, 'Green planet', false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 45, 2, 'Red Planet', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 44, 10, 'Largest Planet', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 23, 16, 'Ringed planet', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 22, 1, 'unknown', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 32, 1, 'unknown', false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 45, 0, 'dwarf Planet', true, 1);
INSERT INTO public.planet VALUES (10, 'xae12', 1, 0, 'Latest Planet', true, 1);
INSERT INTO public.planet VALUES (11, 'Merc', 23, 1, 'hottest planet', false, 2);
INSERT INTO public.planet VALUES (12, 'BMW', 22, 1, 'new', false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 99, 10, true, 1);
INSERT INTO public.star VALUES (2, 'sephora', 91, 1, true, 1);
INSERT INTO public.star VALUES (3, 'demonte', 43, 0, false, 2);
INSERT INTO public.star VALUES (4, 'thor', 5, 0, false, 2);
INSERT INTO public.star VALUES (5, 'loki', 44, 1, true, 2);
INSERT INTO public.star VALUES (6, 'hulk', 32, 0, false, 2);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: employee employee_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_name_key UNIQUE (name);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

