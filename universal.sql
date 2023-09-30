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
-- Name: astroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astroid (
    astroid_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric NOT NULL,
    is_dangerous boolean NOT NULL,
    has_moons boolean NOT NULL
);


ALTER TABLE public.astroid OWNER TO freecodecamp;

--
-- Name: astroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: astroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astroid_asteroid_id_seq OWNED BY public.astroid.astroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    galaxy_type character varying(20) NOT NULL,
    distance_from_earth numeric NOT NULL,
    num_stars_in_billion integer NOT NULL,
    age_in_millions integer NOT NULL,
    name character varying NOT NULL
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
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet numeric NOT NULL,
    is_in_habitable_zone boolean NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(20) NOT NULL,
    mass numeric NOT NULL,
    radius numeric NOT NULL,
    has_water boolean NOT NULL
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
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    luminosity numeric NOT NULL,
    has_life boolean NOT NULL
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
-- Name: astroid astroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid ALTER COLUMN astroid_id SET DEFAULT nextval('public.astroid_asteroid_id_seq'::regclass);


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
-- Data for Name: astroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astroid VALUES (1, 'Asteroid 1', 1, 100, true, false);
INSERT INTO public.astroid VALUES (2, 'Asteroid 2', 2, 50, false, false);
INSERT INTO public.astroid VALUES (3, 'Asteroid 3', 3, 80, true, false);
INSERT INTO public.astroid VALUES (4, 'Asteroid 4', 4, 120, true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'A spiral galaxy with a large central bulge.', 'Spiral', 28100000, 200, 15000, 'Sombrero');
INSERT INTO public.galaxy VALUES (2, 'A peculiar galaxy with an active galactic nucleus.', 'Elliptical', 11200000, 100, 13000, 'Centaurus A');
INSERT INTO public.galaxy VALUES (3, 'A grand-design spiral galaxy with prominent arms.', 'Spiral', 23500000, 180, 14000, 'Whirlwind');
INSERT INTO public.galaxy VALUES (4, 'The galaxy that contains our Solar System.', 'Spiral', 26000, 400, 13000, 'Milky Way');
INSERT INTO public.galaxy VALUES (5, 'A spiral galaxy with a prominent spiral arm.', 'Spiral', 23000000, 150, 15000, 'Whirlpool');
INSERT INTO public.galaxy VALUES (6, 'The closest large galaxy to the Milky Way.', 'Spiral', 2200000, 1000, 14000, 'Andromeda');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 384400, false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 9377, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 23460, false, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 671034, true, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 1070400, false, false);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 1882700, false, false);
INSERT INTO public.moon VALUES (7, 'Titan', 4, 1221870, false, true);
INSERT INTO public.moon VALUES (8, 'Enceladus', 5, 238020, true, true);
INSERT INTO public.moon VALUES (9, 'Triton', 6, 354759, true, true);
INSERT INTO public.moon VALUES (10, 'Charon', 7, 19571, false, false);
INSERT INTO public.moon VALUES (11, 'Io', 8, 421700, false, true);
INSERT INTO public.moon VALUES (12, 'Phoebe', 9, 12952000, false, false);
INSERT INTO public.moon VALUES (13, 'Ariel', 10, 191020, false, false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 10, 266300, false, false);
INSERT INTO public.moon VALUES (15, 'Miranda', 10, 129390, false, false);
INSERT INTO public.moon VALUES (16, 'Proteus', 11, 117647, false, false);
INSERT INTO public.moon VALUES (17, 'Nereid', 12, 5513817, false, false);
INSERT INTO public.moon VALUES (18, 'Larissa', 12, 73548, false, false);
INSERT INTO public.moon VALUES (19, 'Despina', 12, 52538, false, false);
INSERT INTO public.moon VALUES (20, 'Thalassa', 12, 50074, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 5970000000000000000000000, 6371, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 639000000000000000000000, 3389, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', 4870000000000000000000000, 6051, false);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 'Terrestrial', 330000000000000000000000, 2440, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 1900000000000000000000000000, 69911, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 568000000000000000000000000, 58232, false);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 'Ice Giant', 102000000000000000000000000, 24622, true);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Ice Giant', 86800000000000000000000000, 25362, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Dwarf Planet', 13100000000000000000000, 1187, true);
INSERT INTO public.planet VALUES (10, 'Makemake', 1, 'Dwarf Planet', 3000000000000000000000, 715, false);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 'Dwarf Planet', 4000000000000000000000, 620, false);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 'Dwarf Planet', 16600000000000000000000, 1163, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4, true, 1.0, true);
INSERT INTO public.star VALUES (5, 'Andromeda Alpha', 6, true, 0.9, false);
INSERT INTO public.star VALUES (2, 'Sirius', 4, true, 25, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 4, false, 100000, false);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 4, true, 1.519, false);
INSERT INTO public.star VALUES (6, 'Andromeda Beta', 6, true, 2.5, false);
INSERT INTO public.star VALUES (7, 'Andromeda Gamma', 6, true, 0.7, false);


--
-- Name: astroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astroid_asteroid_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: astroid astroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_name_key UNIQUE (name);


--
-- Name: astroid astroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_pkey PRIMARY KEY (astroid_id);


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
-- Name: astroid astroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

