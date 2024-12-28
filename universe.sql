--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100),
    type character varying(15) NOT NULL,
    age_in_millions_of_years numeric,
    has_life boolean,
    number_of_stars integer DEFAULT 0 NOT NULL
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
    description character varying(100),
    planet_id integer NOT NULL,
    age_in_millions_of_years numeric
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
    description character varying(100),
    star_id integer NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric,
    number_of_moons integer DEFAULT 0 NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    purpose text NOT NULL,
    planet_id integer NOT NULL,
    operational boolean NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100),
    galaxy_id integer NOT NULL,
    type character varying(15) NOT NULL,
    is_active boolean,
    details text
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 13600, true, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way', 'Spiral', 10000, false, 100);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Bright galaxy with a prominent dust lane', 'Elliptical', 9000, false, 50);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting galaxy with a companion', 'Spiral', 7000, false, 75);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Distant member of the Local Group', 'Spiral', 8000, false, 60);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Galaxy shaped like a ring', 'Ring', 10000, false, 30);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', 3, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars'' two moons', 4, 4500);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller moon of Mars', 4, 4500);
INSERT INTO public.moon VALUES (4, 'Europa', 'Icy moon with a subsurface ocean', 5, 4500);
INSERT INTO public.moon VALUES (5, 'Io', 'Volcanically active moon', 5, 4500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System', 5, 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon', 5, 4500);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', 6, 4500);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Moon with icy geysers', 6, 4500);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Small moon with a giant crater', 6, 4500);
INSERT INTO public.moon VALUES (11, 'Triton', 'Retrograde orbit moon of Neptune', 8, 4500);
INSERT INTO public.moon VALUES (12, 'Nereid', 'Distant moon of Neptune', 8, 4500);
INSERT INTO public.moon VALUES (13, 'Charon', 'Largest moon of Pluto', 8, 4500);
INSERT INTO public.moon VALUES (14, 'Proxima b Moon 1', 'First moon orbiting Proxima b', 9, 4500);
INSERT INTO public.moon VALUES (15, 'Proxima b Moon 2', 'Second moon orbiting Proxima b', 9, 4500);
INSERT INTO public.moon VALUES (16, 'Kepler-22b Moon', 'Moon orbiting Kepler-22b', 10, 4500);
INSERT INTO public.moon VALUES (17, 'TRAPPIST-1e Moon', 'Moon orbiting TRAPPIST-1e', 11, 4500);
INSERT INTO public.moon VALUES (18, 'HD 209458 b Moon', 'Moon orbiting HD 209458 b', 12, 4500);
INSERT INTO public.moon VALUES (19, 'Sirius Moon 1', 'Hypothetical moon of Sirius', 2, 4500);
INSERT INTO public.moon VALUES (20, 'Sirius Moon 2', 'Second hypothetical moon of Sirius', 2, 4500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', 1, true, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet', 1, true, 78, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the Solar System', 1, true, 628, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its rings', 1, true, 1275, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilt', 1, true, 2724, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest planet in the Solar System', 1, true, 4350, 14);
INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the Solar System', 1, true, 77, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet in the Solar System', 1, true, 261, 0);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet orbiting Proxima Centauri', 4, true, 4.24, 0);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Exoplanet in the habitable zone', 5, true, 600, 0);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'Earth-like exoplanet', 6, true, 40, 0);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'First transiting exoplanet discovered', 5, true, 150, 0);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 'Astronomical observations', 3, true);
INSERT INTO public.satellite VALUES (2, 'International Space Station', 'Research and habitation', 3, true);
INSERT INTO public.satellite VALUES (3, 'Mars Orbiter', 'Observation of Mars', 4, true);
INSERT INTO public.satellite VALUES (4, 'Voyager 1', 'Interstellar exploration', 1, true);
INSERT INTO public.satellite VALUES (5, 'Cassini', 'Study of Saturn', 6, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our solar system''s star', 1, 'G-type', true, 'The Sun is the primary star in our solar system.');
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', 1, 'S-type', true, 'Sirius is the brightest star visible from Earth.');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant in Orion', 1, 'B-type', true, 'Betelgeuse is a massive red supergiant in the constellation Orion.');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Closest star to the Sun', 2, 'A-type', true, 'Proxima Centauri is the closest known star to the Sun.');
INSERT INTO public.star VALUES (5, 'Vega', 'Prominent star in Lyra', 3, 'V-type', true, 'Vega is a bright star in the Lyra constellation.');
INSERT INTO public.star VALUES (6, 'Rigel', 'Bright blue supergiant', 4, 'R-type', true, 'Rigel is a blue supergiant in the Orion constellation.');


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
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

