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
-- Name: moon_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_mission (
    moon_mission_id integer NOT NULL,
    name character varying NOT NULL,
    year_of_mission integer NOT NULL,
    mission_summary text,
    lander_mission boolean,
    mission_successful boolean
);


ALTER TABLE public.moon_mission OWNER TO freecodecamp;

--
-- Name: dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_id_seq OWNED BY public.moon_mission.moon_mission_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    contains text,
    name character varying NOT NULL,
    constellation text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    constellation text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    radius_in_km integer,
    star_id integer NOT NULL,
    water_vapor numeric(2,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    evolutionary_stage text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: moon_mission moon_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_mission ALTER COLUMN moon_mission_id SET DEFAULT nextval('public.dwarf_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Includes the Solar System', 'Earth', 'Milky Way', 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Nearest galaxy', 'A lot of stuff', 'Andromeda Galaxy', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Looks like a sombrero', 'Planets etc.', 'Sombrero Galaxy', 'Virgo');
INSERT INTO public.galaxy VALUES (4, 'Satellite galaxy of Milky Way', 'Matter...', 'Large Magellanic Cloud', 'Dorado/Mensa');
INSERT INTO public.galaxy VALUES (5, 'Super-giant elliptical galaxy', 'things', 'Messier 87', 'Virgo');
INSERT INTO public.galaxy VALUES (6, 'Ring galaxy', 'same as other ones', 'Hoags object', 'Serpens

');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mimas', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (2, 'Enceladus', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (3, 'Tethys', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (4, 'Dione', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (5, 'Rhea', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (6, 'Titan', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (7, 'Iapetus', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (8, 'Iapets', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (9, 'Iapet', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (10, 'Iape', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (11, 'Iap', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (12, 'Ia', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (13, 'I', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (15, 'ap', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (16, 'ape', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (17, 'apet', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (18, 'apetu', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (19, 'apetus', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (20, 'apetus rocks!', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (21, 'apetus!', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (22, 'apetus!!', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (23, 'apetus!!!', '...', 'Sagittarius', 6);
INSERT INTO public.moon VALUES (24, 'apetus!!!!', '...', 'Sagittarius', 6);


--
-- Data for Name: moon_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_mission VALUES (1, 'Apollo 11', 1969, 'First crewed landing', true, true);
INSERT INTO public.moon_mission VALUES (2, 'Luna 3', 1959, 'First images of the far side of the moon', false, true);
INSERT INTO public.moon_mission VALUES (3, 'Luna 9', 1966, 'First successful landing', false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2, 7, 0.00);
INSERT INTO public.planet VALUES (2, 'Venus', 6, 7, 0.00);
INSERT INTO public.planet VALUES (3, 'Earth', 6, 7, 0.99);
INSERT INTO public.planet VALUES (4, 'Mars', 6, 7, 0.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', 6, 7, 0.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 6, 7, 0.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 6, 7, 0.00);
INSERT INTO public.planet VALUES (8, 'Neptune', 6, 7, 0.00);
INSERT INTO public.planet VALUES (9, 'QZ-ab', 6, 7, 0.00);
INSERT INTO public.planet VALUES (10, 'QZ-1', 6, 7, 0.00);
INSERT INTO public.planet VALUES (11, 'QZ-2', 6, 7, 0.00);
INSERT INTO public.planet VALUES (12, 'QZ-3', 6, 7, 0.00);
INSERT INTO public.planet VALUES (13, 'QZ-4', 6, 7, 0.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Tau Ceti', 1, '-', '-');
INSERT INTO public.star VALUES (2, 'Yz Ceti', 1, '-', '-');
INSERT INTO public.star VALUES (3, 'Altair', 1, '-', '-');
INSERT INTO public.star VALUES (4, 'AD Leonis', 1, '-', '-');
INSERT INTO public.star VALUES (5, 'Delta Pavonis', 1, '-', '-');
INSERT INTO public.star VALUES (6, 'Sigma Draconis', 1, '-', '-');
INSERT INTO public.star VALUES (7, 'Sun', 1, '-', '-');


--
-- Name: dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 24, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: moon_mission dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_mission
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (moon_mission_id);


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
-- Name: moon_mission moon_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_mission
    ADD CONSTRAINT moon_mission_name_key UNIQUE (name);


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

