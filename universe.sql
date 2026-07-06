--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: descriptors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.descriptors (
    name character varying NOT NULL,
    descriptions text NOT NULL,
    descriptors_id integer NOT NULL
);


ALTER TABLE public.descriptors OWNER TO freecodecamp;

--
-- Name: descriptors_descriptors_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.descriptors_descriptors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.descriptors_descriptors_id_seq OWNER TO freecodecamp;

--
-- Name: descriptors_descriptors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.descriptors_descriptors_id_seq OWNED BY public.descriptors.descriptors_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    est_bill_planets integer,
    est_bill_stars integer,
    class text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    rel_mass_moon numeric,
    orbit_type character varying
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
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    rel_mass numeric NOT NULL,
    has_moons boolean,
    num_moons integer
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
    name character varying NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    rotational_centre boolean,
    mk_class text
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
-- Name: descriptors descriptors_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptors ALTER COLUMN descriptors_id SET DEFAULT nextval('public.descriptors_descriptors_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: descriptors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.descriptors VALUES ('Earth', 'The locations of considerable biomass, and a large diversity of species. Large proportion of surface area is water.', 1);
INSERT INTO public.descriptors VALUES ('Moon', 'Solitary moon of planet Earth.', 2);
INSERT INTO public.descriptors VALUES ('Mars', 'Red planet near Earth. Fourth planet in its rotational system.', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 400, 400, 'spiral');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 1000, 1000, 'spiral');
INSERT INTO public.galaxy VALUES ('Sombrero', 3, 400, 400, 'peculiar');
INSERT INTO public.galaxy VALUES ('Whirlpool', 4, 100, 100, 'spiral');
INSERT INTO public.galaxy VALUES ('Triangulum', 5, 40, 40, 'spiral');
INSERT INTO public.galaxy VALUES ('NGC 5866', 6, 100, 100, 'lenticular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 4, 1, 'prograde');
INSERT INTO public.moon VALUES ('Andrastea', 2, 9, 0.00000003, 'prograde');
INSERT INTO public.moon VALUES ('Amalthea', 3, 9, 0.000028, 'prograde');
INSERT INTO public.moon VALUES ('Atlas', 4, 13, 0.00000007, 'prograde');
INSERT INTO public.moon VALUES ('Calypso', 5, 13, NULL, 'prograde');
INSERT INTO public.moon VALUES ('Dione', 6, 13, 0.0149, 'prograde');
INSERT INTO public.moon VALUES ('Hippocamp', 7, 8, NULL, 'prograde');
INSERT INTO public.moon VALUES ('Leda', 8, 9, NULL, 'prograde');
INSERT INTO public.moon VALUES ('Mimas', 9, 13, 0.00051, 'prograde');
INSERT INTO public.moon VALUES ('Oberon', 10, 10, NULL, 'prograde');
INSERT INTO public.moon VALUES ('Ophelia', 11, 10, NULL, 'prograde');
INSERT INTO public.moon VALUES ('Pandora', 12, 13, NULL, 'prograde');
INSERT INTO public.moon VALUES ('Portia', 13, 10, NULL, 'prograde');
INSERT INTO public.moon VALUES ('Triton', 14, 8, 0.291, 'retrograde');
INSERT INTO public.moon VALUES ('Fenrir', 15, 13, NULL, 'retrograde');
INSERT INTO public.moon VALUES ('Greip', 16, 13, NULL, 'retrograde');
INSERT INTO public.moon VALUES ('Hati', 17, 13, NULL, 'retrograde');
INSERT INTO public.moon VALUES ('Jarnsaxa', 18, 13, NULL, 'retrograde');
INSERT INTO public.moon VALUES ('Loge', 19, 13, NULL, 'retrograde');
INSERT INTO public.moon VALUES ('Phoebe', 20, 13, 0.000113, 'retrograde');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Proxima Centauri b', 1, 2, 1.07, false, 0);
INSERT INTO public.planet VALUES ('Proxima Centauri c', 2, 2, 7, false, 0);
INSERT INTO public.planet VALUES ('Proxima Centauri d', 3, 2, 0.29, false, 0);
INSERT INTO public.planet VALUES ('Earth', 4, 1, 1, true, 1);
INSERT INTO public.planet VALUES ('Mars', 5, 1, 0.11, true, 2);
INSERT INTO public.planet VALUES ('Venus', 6, 1, 0.815, false, 0);
INSERT INTO public.planet VALUES ('Mercury', 7, 1, 0.055, false, 0);
INSERT INTO public.planet VALUES ('Neptune', 8, 1, 17.15, true, 16);
INSERT INTO public.planet VALUES ('Jupiter', 9, 1, 317.82, true, 115);
INSERT INTO public.planet VALUES ('Uranus', 10, 1, 14.536, true, 29);
INSERT INTO public.planet VALUES ('Kepler-452b', 11, 4, 3.29, NULL, NULL);
INSERT INTO public.planet VALUES ('Wasp-76b', 12, 3, 292.39, NULL, NULL);
INSERT INTO public.planet VALUES ('Saturn', 13, 1, 95.159, true, 293);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('The Sun', 1, 1, true, 'G2V');
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 1, true, 'M5.5Ve');
INSERT INTO public.star VALUES ('WASP-76', 3, 1, true, 'F7V');
INSERT INTO public.star VALUES ('Kepler-452', 4, 1, true, 'G2V');
INSERT INTO public.star VALUES ('Alpheratz', 5, 2, false, 'B8IV-VHgMn');
INSERT INTO public.star VALUES ('Mirach', 6, 2, false, 'M0 IIIa');


--
-- Name: descriptors_descriptors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.descriptors_descriptors_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: descriptors descriptors_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptors
    ADD CONSTRAINT descriptors_name_key UNIQUE (name);


--
-- Name: descriptors descriptors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptors
    ADD CONSTRAINT descriptors_pkey PRIMARY KEY (descriptors_id);


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

