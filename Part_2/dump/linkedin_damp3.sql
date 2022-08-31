--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-08-30 08:10:21

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
-- TOC entry 2 (class 3079 OID 17647)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 17194)
-- Name: companies; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    location character varying(100) NOT NULL,
    employees integer NOT NULL,
    email character varying(120) NOT NULL,
    company_url character varying(1000) NOT NULL
);


ALTER TABLE public.companies OWNER TO gb_user;

--
-- TOC entry 229 (class 1259 OID 17192)
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO gb_user;

--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 229
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- TOC entry 218 (class 1259 OID 17103)
-- Name: connections; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.connections (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at date NOT NULL,
    confirmed_at date NOT NULL
);


ALTER TABLE public.connections OWNER TO gb_user;

--
-- TOC entry 217 (class 1259 OID 17101)
-- Name: connections_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.connections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connections_id_seq OWNER TO gb_user;

--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 217
-- Name: connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.connections_id_seq OWNED BY public.connections.id;


--
-- TOC entry 216 (class 1259 OID 17092)
-- Name: contacts; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.contacts OWNER TO gb_user;

--
-- TOC entry 215 (class 1259 OID 17090)
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO gb_user;

--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 215
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- TOC entry 212 (class 1259 OID 17067)
-- Name: docs; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.docs (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at date NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.docs OWNER TO gb_user;

--
-- TOC entry 211 (class 1259 OID 17065)
-- Name: docs_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.docs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.docs_id_seq OWNER TO gb_user;

--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 211
-- Name: docs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.docs_id_seq OWNED BY public.docs.id;


--
-- TOC entry 210 (class 1259 OID 17058)
-- Name: educations; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.educations (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    kind character varying(150) NOT NULL,
    degree character varying(150) NOT NULL,
    started_at date,
    finished_at date
);


ALTER TABLE public.educations OWNER TO gb_user;

--
-- TOC entry 209 (class 1259 OID 17056)
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.educations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.educations_id_seq OWNER TO gb_user;

--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 209
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.educations_id_seq OWNED BY public.educations.id;


--
-- TOC entry 222 (class 1259 OID 17145)
-- Name: events; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.events (
    id integer NOT NULL,
    event_name character varying(120) NOT NULL,
    creator_id integer NOT NULL,
    created_at date NOT NULL,
    started_at date NOT NULL
);


ALTER TABLE public.events OWNER TO gb_user;

--
-- TOC entry 221 (class 1259 OID 17143)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO gb_user;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 221
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 208 (class 1259 OID 17046)
-- Name: experiencies; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.experiencies (
    id integer NOT NULL,
    skill character varying(150) NOT NULL,
    body text,
    skill_level character varying(150) NOT NULL
);


ALTER TABLE public.experiencies OWNER TO gb_user;

--
-- TOC entry 207 (class 1259 OID 17044)
-- Name: experiencies_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.experiencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experiencies_id_seq OWNER TO gb_user;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 207
-- Name: experiencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.experiencies_id_seq OWNED BY public.experiencies.id;


--
-- TOC entry 220 (class 1259 OID 17111)
-- Name: groups; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    group_name character varying(120),
    creator_id integer NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.groups OWNER TO gb_user;

--
-- TOC entry 219 (class 1259 OID 17109)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO gb_user;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 226 (class 1259 OID 17161)
-- Name: jobs; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    job_name character varying(120) NOT NULL,
    company_id character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    format character varying(15) NOT NULL,
    skills_requirement character varying(750) NOT NULL,
    salary character varying(15) NOT NULL
);


ALTER TABLE public.jobs OWNER TO gb_user;

--
-- TOC entry 225 (class 1259 OID 17159)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO gb_user;

--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 228 (class 1259 OID 17180)
-- Name: learnings; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.learnings (
    id integer NOT NULL,
    skill character varying(120) NOT NULL,
    company_id character varying(150) NOT NULL,
    location character varying(150) NOT NULL,
    format character varying(150) NOT NULL,
    kind character varying(150),
    started_at date NOT NULL
);


ALTER TABLE public.learnings OWNER TO gb_user;

--
-- TOC entry 227 (class 1259 OID 17178)
-- Name: learnings_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.learnings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.learnings_id_seq OWNER TO gb_user;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 227
-- Name: learnings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.learnings_id_seq OWNED BY public.learnings.id;


--
-- TOC entry 214 (class 1259 OID 17080)
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_read boolean,
    is_unread boolean,
    created_at date NOT NULL
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- TOC entry 213 (class 1259 OID 17078)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 213
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 224 (class 1259 OID 17153)
-- Name: news; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.news (
    id integer NOT NULL,
    is_read boolean,
    is_unread boolean,
    from_user_id integer NOT NULL,
    from_groups_id integer NOT NULL
);


ALTER TABLE public.news OWNER TO gb_user;

--
-- TOC entry 223 (class 1259 OID 17151)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO gb_user;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 223
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 232 (class 1259 OID 17619)
-- Name: posts; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    post_title character varying(200),
    body text,
    creator_id integer NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.posts OWNER TO gb_user;

--
-- TOC entry 231 (class 1259 OID 17617)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO gb_user;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 231
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 206 (class 1259 OID 17029)
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    job_position character varying(150) NOT NULL,
    company character varying(150) NOT NULL,
    location character varying(150) NOT NULL,
    profile_photo_id integer,
    profile_url character varying(250) NOT NULL,
    visibility boolean,
    created_at date
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- TOC entry 205 (class 1259 OID 17027)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 205
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2938 (class 2604 OID 17197)
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- TOC entry 2932 (class 2604 OID 17106)
-- Name: connections id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.connections ALTER COLUMN id SET DEFAULT nextval('public.connections_id_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 17095)
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 17070)
-- Name: docs id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.docs ALTER COLUMN id SET DEFAULT nextval('public.docs_id_seq'::regclass);


--
-- TOC entry 2928 (class 2604 OID 17061)
-- Name: educations id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.educations ALTER COLUMN id SET DEFAULT nextval('public.educations_id_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 17148)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 2927 (class 2604 OID 17049)
-- Name: experiencies id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.experiencies ALTER COLUMN id SET DEFAULT nextval('public.experiencies_id_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 17114)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 17164)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 2937 (class 2604 OID 17183)
-- Name: learnings id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.learnings ALTER COLUMN id SET DEFAULT nextval('public.learnings_id_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 17083)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 17156)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 17622)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 17032)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3156 (class 0 OID 17194)
-- Dependencies: 230
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.companies (id, name, location, employees, email, company_url) FROM stdin;
1	Npath	Russia	94947	mjoscelin0@admin.ch	https://tinypic.com/eu/sapien/cursus/vestibulum.html
2	Shufflebeat	China	27039	dmacsharry1@bloglovin.com	https://sakura.ne.jp/sit/amet/eleifend/pede/libero.jsp
3	Kimia	China	86186	eclair2@redcross.org	https://wufoo.com/dapibus/duis/at/velit/eu/est/congue.jpg
4	Skajo	China	24205	kletham3@plala.or.jp	https://loc.gov/sapien/arcu/sed/augue/aliquam/erat/volutpat.png
5	Kimia	Canada	12044	scadalleder4@unicef.org	http://printfriendly.com/felis/sed/lacus/morbi/sem.jsp
6	Ntag	China	59515	dkirkham5@51.la	https://google.ru/donec/ut/dolor.js
7	Rhycero	China	15817	lmanford6@youku.com	https://abc.net.au/rhoncus/mauris/enim/leo/rhoncus.aspx
8	Zooxo	China	35873	hgoring7@ted.com	https://zdnet.com/habitasse/platea/dictumst/aliquam/augue.xml
9	Avamm	Greece	57736	lmcentegart8@yellowpages.com	http://bbb.org/donec/odio/justo/sollicitudin.json
10	Trilith	China	10351	wmartindale9@springer.com	https://nifty.com/ultrices.jpg
11	Feedspan	Sweden	48	mshailera@istockphoto.com	http://mail.ru/suspendisse/potenti.js
12	Voonte	United States	49881	lswatonb@irs.gov	http://phoca.cz/nulla/tempus.jsp
13	Innojam	Indonesia	28290	mfishleec@skype.com	https://feedburner.com/sodales/scelerisque/mauris/sit/amet/eros.html
14	Centimia	China	90551	srosellinid@economist.com	http://wordpress.com/gravida/nisi/at/nibh/in/hac.xml
15	Realpoint	Indonesia	88010	llagdee@furl.net	http://bluehost.com/quis/turpis/sed/ante/vivamus/tortor.aspx
16	Einti	China	85712	pciccoloif@kickstarter.com	https://prlog.org/phasellus/id/sapien/in/sapien.js
17	Yodoo	Switzerland	64642	posbistong@sciencedaily.com	http://storify.com/vestibulum/sed/magna/at/nunc/commodo/placerat.html
18	Thoughtbridge	Canada	76226	fspackmanh@vk.com	https://bluehost.com/interdum/mauris/non/ligula/pellentesque.json
19	Skynoodle	South Africa	20201	mrevillei@sfgate.com	http://vkontakte.ru/in/porttitor/pede/justo/eu/massa/donec.aspx
20	Thoughtbridge	Russia	76740	eescaleroj@blogspot.com	https://angelfire.com/ante/ipsum/primis/in/faucibus/orci/luctus.jpg
21	Twitterbridge	Peru	73523	aperrottetk@constantcontact.com	https://ameblo.jp/mi/in/porttitor/pede/justo/eu/massa.png
22	Lajo	Thailand	27012	tekinsl@toplist.cz	https://newsvine.com/odio/porttitor/id/consequat/in.xml
23	Vinte	Ukraine	64055	ajuschkam@friendfeed.com	https://fc2.com/sapien/ut/nunc/vestibulum/ante/ipsum.png
24	Avamba	Indonesia	90998	rvenesn@tripadvisor.com	http://weebly.com/vulputate/vitae/nisl/aenean/lectus.png
25	Thoughtbridge	Honduras	73079	cbriztmano@house.gov	http://tripadvisor.com/turpis/donec/posuere.png
26	Agimba	Poland	22573	upreecep@scribd.com	https://amazon.co.jp/sapien/dignissim/vestibulum/vestibulum/ante/ipsum.png
27	Aimbu	China	99720	mdasq@jiathis.com	http://reuters.com/morbi/non/quam/nec/dui/luctus/rutrum.jpg
28	Kaymbo	China	65978	ltheakstonr@zimbio.com	https://shareasale.com/odio/in/hac/habitasse.aspx
29	Feedfish	Indonesia	73973	ostratfords@posterous.com	https://ucsd.edu/elit/proin/interdum/mauris/non/ligula/pellentesque.xml
30	Flipopia	China	53123	aaxcelt@apache.org	http://upenn.edu/et/ultrices/posuere.jpg
31	Devbug	Norway	45148	achaimsonu@cargocollective.com	http://usnews.com/interdum/mauris/non/ligula/pellentesque/ultrices.aspx
32	Meetz	Israel	12841	dducev@nyu.edu	https://springer.com/parturient/montes.png
33	Feednation	China	14646	acartmaelw@cnbc.com	http://youku.com/pede/ac/diam/cras/pellentesque.aspx
34	Tagopia	Tanzania	44342	bquenellx@imgur.com	http://nature.com/ligula/nec/sem/duis.html
35	Youtags	Sweden	8250	pwaldocky@squarespace.com	https://mapy.cz/arcu/libero/rutrum/ac/lobortis/vel.js
36	Kwimbee	China	77565	ldoughtyz@ameblo.jp	http://dyndns.org/sapien/in/sapien/iaculis.js
37	Rhycero	Poland	8515	espenley10@boston.com	http://about.me/sagittis/dui/vel/nisl/duis/ac/nibh.png
38	Jaloo	Canada	97208	kbernholt11@about.me	http://surveymonkey.com/habitasse/platea.js
39	Cogilith	Russia	78724	pbeeken12@fc2.com	https://slideshare.net/porttitor/lorem/id/ligula/suspendisse.json
40	Muxo	Indonesia	58060	rbleyman13@amazon.co.uk	http://vk.com/nunc.json
41	Photobean	Russia	11125	weverix14@usatoday.com	https://google.co.jp/lobortis/sapien/sapien/non.html
42	Skaboo	Indonesia	90950	bbrownbill15@seesaa.net	https://youtu.be/diam/erat/fermentum/justo/nec.json
43	Wordtune	China	99558	pbaythorp16@japanpost.jp	http://smugmug.com/iaculis/congue/vivamus/metus.html
44	Thoughtbridge	Indonesia	75808	ashoebotham17@aol.com	http://nationalgeographic.com/bibendum/felis/sed/interdum/venenatis.png
45	Quimba	China	98991	ibredgeland18@bandcamp.com	https://wunderground.com/metus/sapien/ut.html
46	Rhycero	Czech Republic	68389	cavis19@buzzfeed.com	https://deliciousdays.com/hac/habitasse.html
47	Yombu	Russia	35557	hbertlin1a@meetup.com	http://apple.com/nisi/volutpat/eleifend/donec/ut.png
48	Topicware	Greece	60241	rwelsby1b@twitpic.com	http://digg.com/fusce/posuere/felis/sed/lacus/morbi.png
49	Edgepulse	China	99341	rwilcockes1c@clickbank.net	https://fastcompany.com/ipsum/integer/a/nibh/in.aspx
50	Skinix	China	1222	ralliband1d@google.fr	http://miibeian.gov.cn/ultrices.aspx
51	Quire	Indonesia	78247	biveagh1e@drupal.org	https://nyu.edu/tincidunt/eget/tempus.js
52	Twitterlist	Myanmar	92841	kdron1f@ocn.ne.jp	http://slate.com/elementum/eu/interdum/eu/tincidunt/in/leo.aspx
53	Yoveo	Japan	28981	gbalassi1g@aboutads.info	https://senate.gov/pulvinar/sed/nisl/nunc.png
54	Trupe	Russia	66583	pcancellor1h@altervista.org	https://techcrunch.com/nulla/pede/ullamcorper/augue.js
55	Gabtype	Japan	80633	achrichton1i@exblog.jp	https://cloudflare.com/purus.html
56	Skyble	Afghanistan	94167	dsecretan1j@is.gd	https://multiply.com/in/felis/eu/sapien/cursus/vestibulum/proin.json
57	Gevee	Colombia	82394	jbarbey1k@epa.gov	https://marriott.com/morbi/odio/odio.html
58	Leenti	South Korea	16529	bkilbride1l@free.fr	https://prlog.org/nisl/duis/bibendum/felis/sed.json
59	Jaxworks	Portugal	1286	bchalcot1m@craigslist.org	http://usda.gov/at/feugiat/non/pretium/quis/lectus.js
60	Linkbuzz	Philippines	39907	jraikes1n@salon.com	https://posterous.com/tincidunt/eu/felis/fusce/posuere/felis/sed.jpg
61	Babbleblab	Hong Kong	58246	nverity1o@delicious.com	https://phoca.cz/amet/erat/nulla.html
62	Jaxworks	Indonesia	6629	lsharer1p@sina.com.cn	http://msu.edu/integer.jsp
63	Tagopia	Burundi	48253	bsimonutti1q@icq.com	https://soup.io/ante/nulla/justo/aliquam.png
64	Npath	China	72705	sfalshaw1r@marriott.com	https://live.com/ante/vel/ipsum/praesent/blandit.jsp
65	Kayveo	Czech Republic	70739	cmacmarcuis1s@toplist.cz	https://shutterfly.com/proin/risus/praesent/lectus.aspx
66	Flashdog	Cuba	45557	rkurdani1t@ebay.com	http://tuttocitta.it/integer/aliquet/massa/id/lobortis.jsp
67	Jaxworks	Thailand	25255	wmacmanus1u@trellian.com	https://mysql.com/sit/amet.png
68	Abatz	France	74737	rmoncreiff1v@digg.com	http://free.fr/duis/consequat/dui.json
69	Snaptags	China	44187	adoey1w@independent.co.uk	http://geocities.com/diam.jpg
70	Meevee	South Africa	89437	wfrostdicke1x@baidu.com	https://amazon.co.uk/habitasse/platea/dictumst/aliquam.jsp
71	Buzzdog	Japan	5742	rfalconer1y@earthlink.net	http://squarespace.com/aenean/auctor.html
72	Realblab	Papua New Guinea	90610	hketchen1z@virginia.edu	http://guardian.co.uk/viverra/diam/vitae/quam.xml
73	Mybuzz	Pakistan	57688	cstreather20@example.com	http://twitpic.com/ipsum/dolor/sit.jsp
74	Reallinks	Sweden	66630	jeley21@icq.com	http://over-blog.com/blandit/nam/nulla/integer.html
75	Skinix	Indonesia	22035	krenoden22@hc360.com	https://prnewswire.com/quis.aspx
76	Youbridge	Indonesia	65313	epetworth23@histats.com	https://last.fm/ut/erat/curabitur/gravida/nisi/at.png
77	Jabbercube	China	91196	dcrimin24@youtube.com	https://4shared.com/amet/lobortis.html
78	Zazio	United States	61925	frentalll25@prlog.org	https://tumblr.com/volutpat/sapien/arcu/sed.png
79	Kwideo	Czech Republic	98074	ieslinger26@npr.org	https://google.com.au/cubilia/curae.jsp
80	Kimia	Samoa	76791	smcdiarmid27@auda.org.au	https://gov.uk/cras/pellentesque.jpg
81	Feedspan	China	66863	gwhickman28@webeden.co.uk	http://blogs.com/quam/fringilla/rhoncus/mauris/enim/leo/rhoncus.jsp
82	Buzzster	Ukraine	36031	sfooter29@purevolume.com	http://naver.com/non/ligula/pellentesque/ultrices/phasellus/id.png
83	Agivu	Palestinian Territory	91661	erucklesse2a@yahoo.com	http://japanpost.jp/sapien/non/mi.html
84	Edgeblab	Morocco	26487	lmeates2b@uiuc.edu	https://163.com/nulla/tellus/in.json
85	Skyba	Japan	224	vlabrom2c@ox.ac.uk	http://edublogs.org/maecenas/ut.png
86	Ainyx	Costa Rica	8075	mclothier2d@sciencedaily.com	https://creativecommons.org/vitae/mattis/nibh/ligula/nec/sem.aspx
87	BlogXS	China	34330	spetrowsky2e@usda.gov	https://drupal.org/pretium.xml
88	Yacero	China	42588	lrawlcliffe2f@alibaba.com	http://usda.gov/nunc/donec/quis/orci/eget.xml
89	Mudo	Philippines	86958	vmuzzini2g@xrea.com	https://constantcontact.com/nibh/in/lectus.png
90	Meeveo	Poland	65842	tthamelt2h@bravesites.com	http://cisco.com/ac/neque/duis/bibendum.xml
91	Shufflester	Italy	60898	famsden2i@spiegel.de	https://trellian.com/quis/turpis/sed/ante.js
92	Dynava	Thailand	52235	sroumier2j@businessweek.com	https://mashable.com/id/turpis/integer.js
93	Tagpad	China	12660	wsiegertsz2k@geocities.com	https://a8.net/phasellus/id/sapien/in/sapien/iaculis.xml
94	Lajo	Afghanistan	9298	astorek2l@un.org	https://house.gov/risus/semper/porta/volutpat/quam.js
95	Yozio	Peru	66656	ostrood2m@foxnews.com	http://skyrock.com/id.json
96	Vinte	China	35696	xcaldow2n@csmonitor.com	http://usa.gov/morbi/quis/tortor/id/nulla/ultrices/aliquet.aspx
97	Thoughtstorm	Japan	34443	ehukins2o@privacy.gov.au	http://amazon.co.uk/quis/turpis/eget/elit/sodales/scelerisque.png
98	Eimbee	Indonesia	98985	cmoncreif2p@elegantthemes.com	https://cdc.gov/lorem.js
99	Feednation	China	504	gmarkson2q@opera.com	https://fema.gov/quisque/erat/eros/viverra/eget/congue.jsp
100	Livepath	Luxembourg	20924	arosi2r@csmonitor.com	https://youtube.com/nisl/nunc/rhoncus/dui/vel/sem.js
\.


--
-- TOC entry 3144 (class 0 OID 17103)
-- Dependencies: 218
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.connections (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	44	90	3	2009-02-09	2017-04-04
2	68	55	3	2013-06-21	2005-02-05
3	87	69	3	2008-04-26	2021-10-02
4	83	29	3	2006-12-31	2002-08-13
5	38	28	2	2002-05-03	2019-02-04
6	48	84	1	2012-01-05	2014-12-11
7	82	8	1	2005-02-01	2012-12-03
8	42	1	1	2012-01-07	2002-02-11
9	60	49	3	2001-03-18	2020-08-06
10	3	80	2	2011-08-23	2018-05-09
11	51	93	3	2006-12-10	2017-02-07
12	67	66	2	2021-07-09	2016-11-25
13	14	84	2	2012-10-06	2017-02-15
14	98	99	1	2004-06-18	2012-02-06
15	87	80	1	2008-11-28	2018-10-26
16	53	37	1	2002-09-29	2015-08-24
17	66	57	1	2004-11-02	2002-08-16
18	5	28	1	2013-11-15	2003-07-20
19	28	95	3	2019-01-14	2004-07-12
20	60	11	1	2002-10-01	2020-10-21
21	44	82	2	2012-08-12	2012-09-22
22	22	93	2	2008-12-30	2011-04-11
23	92	93	3	2013-05-18	2000-10-24
24	27	76	3	2016-08-15	2010-03-03
25	58	14	3	2001-06-02	2015-08-01
26	94	14	2	2018-01-30	2020-12-01
27	34	33	1	2001-05-06	2018-10-13
28	16	77	1	2012-07-30	2020-10-20
29	51	42	3	2010-08-15	2018-09-15
30	15	29	3	2004-02-13	2006-08-15
31	28	28	1	2004-06-14	2016-12-31
32	92	9	2	2015-03-18	2014-05-29
33	32	54	3	2012-11-19	2015-09-18
34	49	15	3	2003-11-27	2002-08-13
35	71	64	3	2004-10-13	2007-06-19
36	66	70	2	2020-10-17	2011-04-15
37	90	60	3	2010-10-15	2021-12-13
38	28	29	1	2017-10-26	2001-02-15
39	49	54	3	2014-06-21	2003-09-02
40	62	69	1	2019-06-17	2011-10-31
41	2	98	2	2015-04-06	2012-10-18
42	14	19	3	2009-10-16	2002-12-09
43	88	94	2	2005-12-06	2010-09-18
44	46	13	2	2017-05-26	2006-09-23
45	6	36	2	2009-08-28	2018-08-19
46	11	80	3	2010-03-08	2013-07-25
47	59	96	2	2001-11-16	2007-08-30
48	1	7	1	2005-04-06	2016-03-16
49	35	67	3	2018-04-29	2016-06-21
50	91	16	3	2017-08-14	2005-04-25
51	76	8	3	2006-12-11	2021-11-30
52	49	89	2	2020-03-07	2002-09-18
53	97	14	2	2014-11-13	2001-02-06
54	86	13	1	2017-03-01	2022-07-10
55	16	55	3	2008-04-08	2020-08-11
56	94	91	2	2011-04-19	2013-04-22
57	18	68	1	2005-04-10	2003-11-06
58	60	82	1	2019-10-13	2013-09-02
59	73	88	2	2001-11-11	2015-08-03
60	7	77	2	2012-01-18	2012-01-04
61	46	80	2	2006-01-07	2022-06-30
62	41	3	3	2014-02-28	2004-03-03
63	54	35	1	2004-02-10	2004-11-02
64	54	33	1	2009-04-30	2022-02-23
65	80	72	1	2003-09-22	2014-03-28
66	8	16	3	2006-06-01	2011-10-19
67	17	25	1	2006-10-27	2010-11-14
68	77	16	1	2019-11-11	2013-12-29
69	35	33	3	2015-09-03	2013-02-25
70	6	83	2	2003-02-07	2017-06-06
71	62	62	2	2013-10-11	2006-12-02
72	41	7	1	2012-05-27	2016-05-28
73	12	11	3	2014-09-20	2020-04-16
74	43	57	3	2016-07-20	2020-04-23
75	73	29	2	2005-10-07	2008-01-26
76	2	6	1	2019-04-07	2010-04-20
77	29	52	2	2012-02-20	2011-05-28
78	83	49	1	2020-09-16	2018-01-22
79	85	43	3	2010-01-03	2005-01-15
80	65	56	2	2010-06-27	2003-02-06
81	91	37	1	2007-10-03	2021-11-09
82	21	71	1	2012-01-30	2019-04-29
83	58	97	2	2016-08-10	2007-07-11
84	86	73	3	2012-08-05	2018-02-06
85	87	37	2	2011-06-02	2003-06-01
86	87	2	1	2006-06-23	2006-03-24
87	72	1	3	2004-07-08	2006-09-25
88	81	20	2	2021-07-05	2021-01-05
89	45	93	3	2011-10-10	2013-08-15
90	89	30	1	2010-12-13	2022-05-26
91	70	97	1	2021-11-24	2006-05-25
92	88	44	2	2002-08-25	2011-12-19
93	33	41	1	2021-07-09	2019-03-03
94	70	9	3	2019-05-31	2019-04-09
95	58	44	1	2021-08-28	2017-10-25
96	42	91	1	2015-03-20	2003-01-11
97	33	25	2	2015-10-15	2008-07-28
98	9	70	1	2021-04-19	2007-05-24
99	22	7	2	2008-01-12	2008-12-08
100	71	60	2	2002-08-12	2009-03-09
\.


--
-- TOC entry 3142 (class 0 OID 17092)
-- Dependencies: 216
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.contacts (id, first_name, last_name, email, created_at) FROM stdin;
1	Nahum	Prator	nprator0@smugmug.com	2022-07-19
2	Sonni	Tweede	stweede1@aol.com	2019-12-24
3	Jefferey	Bertot	jbertot2@stanford.edu	2007-03-24
4	Martguerita	Cawley	mcawley3@psu.edu	2016-12-24
5	Vinny	Shawyer	vshawyer4@moonfruit.com	2012-07-11
6	Margeaux	Huckabe	mhuckabe5@psu.edu	2021-10-01
7	Lurline	Guerrazzi	lguerrazzi6@un.org	2009-09-10
8	Tiffie	Hugnin	thugnin7@hibu.com	2016-01-04
9	Courtnay	Jakuszewski	cjakuszewski8@ucoz.com	2010-09-24
10	Zenia	Gee	zgee9@chron.com	2004-11-14
11	Kaitlynn	Romans	kromansa@tripod.com	2010-06-25
12	Lottie	Kynd	lkyndb@ibm.com	2017-11-17
13	Pippo	Cahill	pcahillc@51.la	2003-12-21
14	Camellia	Dibsdale	cdibsdaled@usgs.gov	2016-01-03
15	Maura	Bratten	mbrattene@state.gov	2005-01-22
16	Hendrik	Beumant	hbeumantf@mapy.cz	2006-06-02
17	Regina	Davidow	rdavidowg@telegraph.co.uk	2016-07-31
18	Reggie	Fallowfield	rfallowfieldh@fastcompany.com	2008-07-16
19	Jephthah	Scarrisbrick	jscarrisbricki@ca.gov	2017-06-10
20	Kalila	Dorking	kdorkingj@miibeian.gov.cn	2011-05-15
21	Kennan	Furst	kfurstk@cocolog-nifty.com	2011-05-19
22	Harland	Lepard	hlepardl@discuz.net	2002-05-26
23	Mignonne	Castelletti	mcastellettim@lycos.com	2010-03-17
24	Francoise	Sket	fsketn@unesco.org	2002-10-30
25	Auroora	Pickerill	apickerillo@oracle.com	2013-06-25
26	Osmund	Brecken	obreckenp@timesonline.co.uk	2016-12-08
27	Chen	Wellen	cwellenq@flavors.me	2019-10-19
28	Ax	Cowen	acowenr@qq.com	2018-11-30
29	Archibald	Bearcroft	abearcrofts@artisteer.com	2011-04-06
30	Hagen	Hawke	hhawket@yandex.ru	2017-06-29
31	Kylen	Arnson	karnsonu@un.org	2001-05-04
32	Claybourne	Howson	chowsonv@tamu.edu	2018-01-25
33	Jon	Mardoll	jmardollw@spotify.com	2012-08-26
34	Dolli	Blannin	dblanninx@vinaora.com	2011-11-11
35	Cecil	Brewitt	cbrewitty@china.com.cn	2013-11-07
36	Jordan	Frandsen	jfrandsenz@bbb.org	2002-08-18
37	Gilbertina	Amiss	gamiss10@mediafire.com	2016-10-03
38	Barbabra	Pluvier	bpluvier11@webeden.co.uk	2001-05-20
39	Egan	Ruslin	eruslin12@plala.or.jp	2019-03-20
40	Darcy	Garrood	dgarrood13@hc360.com	2006-12-18
41	Muire	MacDaid	mmacdaid14@ftc.gov	2021-05-23
42	Drucy	Gribbell	dgribbell15@deviantart.com	2001-05-10
43	Tobin	Caso	tcaso16@chronoengine.com	2022-08-21
44	Christophorus	Swiffan	cswiffan17@tripadvisor.com	2016-09-19
45	Meggie	Clegg	mclegg18@exblog.jp	2018-07-30
46	Serena	Spellsworth	sspellsworth19@cdbaby.com	2019-04-29
47	Garvy	Durman	gdurman1a@surveymonkey.com	2014-11-22
48	Siouxie	Abels	sabels1b@simplemachines.org	2009-09-08
49	Ingemar	Mandell	imandell1c@ted.com	2008-08-05
50	Traci	Bacon	tbacon1d@nba.com	2014-11-01
51	Mirella	Duplan	mduplan1e@wikipedia.org	2018-02-17
52	Lissa	McFarlane	lmcfarlane1f@alibaba.com	2018-04-03
53	Bernetta	Rozalski	brozalski1g@guardian.co.uk	2005-02-01
54	Gilles	Kringe	gkringe1h@163.com	2008-12-01
55	Robbyn	Lauret	rlauret1i@newyorker.com	2002-02-15
56	Arv	Gerrels	agerrels1j@loc.gov	2019-06-07
57	Lindsay	Frossell	lfrossell1k@simplemachines.org	2011-03-12
58	Gertruda	Puddle	gpuddle1l@ucoz.com	2003-07-22
59	Yanaton	Dods	ydods1m@fastcompany.com	2017-11-19
60	Heddie	Bryan	hbryan1n@buzzfeed.com	2015-12-11
61	Fanny	Gwyn	fgwyn1o@barnesandnoble.com	2012-06-23
62	Bridget	Salsbury	bsalsbury1p@dyndns.org	2020-02-03
63	Tamiko	Pringle	tpringle1q@vimeo.com	2018-03-27
64	Willi	Sambrok	wsambrok1r@geocities.com	2016-06-28
65	Kendricks	Curror	kcurror1s@lulu.com	2020-08-01
66	Quillan	Aldrick	qaldrick1t@mit.edu	2015-03-15
67	Letitia	Le Gallo	llegallo1u@webeden.co.uk	2016-07-21
68	Jeremias	Berfoot	jberfoot1v@wiley.com	2004-09-02
69	Clyve	Pickton	cpickton1w@npr.org	2005-01-09
70	Helenelizabeth	Layland	hlayland1x@biblegateway.com	2005-01-11
71	Elia	Kipping	ekipping1y@unesco.org	2014-02-01
72	Rudolfo	Freschi	rfreschi1z@chron.com	2020-04-11
73	Evania	Stott	estott20@google.es	2004-11-30
74	Georges	Saffin	gsaffin21@mtv.com	2002-12-07
75	Emelyne	Edgerley	eedgerley22@printfriendly.com	2012-03-06
76	Lyman	Duncan	lduncan23@sciencedaily.com	2020-11-26
77	Dwayne	Selvey	dselvey24@wikimedia.org	2019-02-01
78	Alessandra	De Cristofalo	adecristofalo25@nytimes.com	2010-12-02
79	Selinda	McGann	smcgann26@wufoo.com	2021-07-05
80	Bride	Hostan	bhostan27@salon.com	2002-10-24
81	Moreen	Sines	msines28@godaddy.com	2011-02-25
82	Meredeth	Olyonov	molyonov29@google.es	2017-06-08
83	Antonetta	Whyman	awhyman2a@army.mil	2015-01-25
84	Dennet	Wedderburn	dwedderburn2b@elegantthemes.com	2001-07-18
85	Raymond	Grzeskowski	rgrzeskowski2c@google.co.uk	2016-01-02
86	Collete	Ablewhite	cablewhite2d@dion.ne.jp	2020-02-22
87	Edyth	Folca	efolca2e@gizmodo.com	2001-04-15
88	Wolfy	Kuller	wkuller2f@sina.com.cn	2019-02-20
89	Roger	Halvosen	rhalvosen2g@youtube.com	2003-04-29
90	Tish	Yakobowitch	tyakobowitch2h@tuttocitta.it	2022-08-18
91	Carree	Wagenen	cwagenen2i@dion.ne.jp	2015-04-11
92	Margarita	Drynan	mdrynan2j@netlog.com	2016-08-31
93	Lazarus	Moughton	lmoughton2k@jigsy.com	2014-01-13
94	Mirella	Durnian	mdurnian2l@bluehost.com	2002-12-19
95	Olva	Gheraldi	ogheraldi2m@people.com.cn	2008-12-12
96	Siouxie	Goodley	sgoodley2n@cornell.edu	2018-12-29
97	Lexi	Defond	ldefond2o@apache.org	2022-09-05
98	Markus	Mussotti	mmussotti2p@rakuten.co.jp	2015-12-18
99	Lilyan	Capponeer	lcapponeer2q@state.tx.us	2018-03-01
100	Susanne	Bordman	sbordman2r@g.co	2016-07-09
\.


--
-- TOC entry 3138 (class 0 OID 17067)
-- Dependencies: 212
-- Data for Name: docs; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.docs (id, name, url, owner_id, description, uploaded_at, size) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 17058)
-- Dependencies: 210
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.educations (id, title, kind, degree, started_at, finished_at) FROM stdin;
1	UniversitÃ© Henri PoincarÃ© (Nancy I)	n/a	Mauv	2017-12-09	2018-01-26
2	Toyo University	Technology	Indigo	2021-07-13	2019-06-09
3	Troy University, Troy	Basic Industries	Pink	2017-10-12	2019-08-12
4	Gustav-Siewerth-Akademie	Health Care	Khaki	2020-02-07	2019-08-02
5	Ghana Telecom University College	n/a	Khaki	2016-12-23	2020-05-21
6	COSMIQ Institute of Technology	Public Utilities	Crimson	2013-09-22	2018-06-02
7	Universidad Nacional AndrÃ©s Bello	Technology	Fuscia	2018-11-06	2017-11-20
8	Sanno University	Basic Industries	Turquoise	2021-03-26	2019-09-10
9	Universidad Interamericana	n/a	Puce	2015-08-04	2020-01-31
10	University of Wisconsin - Stevens Point	n/a	Blue	2016-04-06	2020-02-06
11	Universidade Federal de GoiÃ¡s	n/a	Crimson	2014-07-22	2019-05-12
12	Strathmore University	Consumer Services	Red	2022-07-08	2017-09-30
13	Universidad El Bosque	n/a	Pink	2013-01-25	2019-05-22
14	Ibn Sina University	Energy	Goldenrod	2018-12-23	2018-01-07
15	Kurashiki University of Science and the Arts	Consumer Services	Pink	2020-04-11	2016-07-27
16	University of California, Davis	Consumer Services	Crimson	2017-04-23	2020-05-10
17	Fachhochschule Heilbronn, Hochschule fÃ¼r Technik und Wirtschaft	Public Utilities	Pink	2021-06-11	2018-05-29
18	Institute of Teachers Education, Sarawak	n/a	Violet	2020-04-08	2020-04-29
19	Intercollege	Finance	Mauv	2017-12-24	2016-11-22
20	University of the Sciences in Philadelphia	Technology	Goldenrod	2013-04-23	2015-09-22
21	Hidayatullah National Law University, Raipur	Consumer Services	Puce	2022-07-10	2022-02-12
22	Montana State University - Billings	Finance	Pink	2020-11-02	2017-09-30
23	Ecole SupÃ©rieure d'IngÃ©nieurs en GÃ©nie Electrique	Consumer Services	Mauv	2012-11-30	2018-04-28
24	Heilongjiang University	Consumer Services	Puce	2014-02-25	2018-06-16
25	University of Montana Western	n/a	Blue	2020-09-20	2016-02-24
26	Universidad PedagÃ³gica Nacional, Unidad LeÃ³n	Technology	Red	2022-07-10	2018-01-20
27	Southern Connecticut State University	Consumer Services	Fuscia	2022-04-03	2018-11-04
28	Naval Postgraduate School	Finance	Puce	2018-11-10	2022-03-30
29	University of California, Berkeley	Finance	Pink	2020-01-19	2019-08-26
30	Lund University	Finance	Teal	2016-01-24	2017-09-14
31	College of Technology at Jazan	Finance	Pink	2014-06-09	2021-02-07
32	St. Petersburg State Forest-Technical Academy	Health Care	Violet	2013-05-13	2020-07-07
33	Mountain State University	Finance	Blue	2013-06-20	2022-01-31
34	Universidad de La Laguna	Technology	Maroon	2021-01-06	2021-04-02
35	University of Chester	Finance	Yellow	2018-07-30	2015-10-18
36	University of Maine, Machias	Technology	Pink	2013-04-29	2017-03-29
37	University of San Diego	Technology	Red	2013-10-11	2022-09-07
38	Riara University School of Business and Law	n/a	Orange	2015-08-06	2018-11-22
39	Baku Slavic University	Finance	Blue	2020-12-21	2019-04-03
40	University of Dundee	Finance	Khaki	2014-11-08	2016-09-06
41	Institut Textile et Chimique de Lyon	Consumer Services	Khaki	2013-03-01	2016-01-14
42	Usmanu Danfodiyo University Sokoto	Public Utilities	Yellow	2015-09-20	2022-04-08
43	Ege University	Transportation	Maroon	2021-04-16	2021-01-02
44	UniversitÃ© de Ziguinchor	Technology	Maroon	2013-03-05	2017-08-26
45	Universitas Sanata Dharma	Finance	Orange	2016-03-17	2021-06-01
46	Maine College of Art	Consumer Non-Durables	Aquamarine	2019-06-18	2017-04-17
47	Jawzjan University	Capital Goods	Khaki	2020-03-23	2018-11-12
48	Universidade Catolica Portuguesa	Finance	Mauv	2013-10-29	2021-12-04
49	FachhochschulstudiengÃ¤nge der Wiener Wirtschaft	Technology	Red	2022-02-15	2020-01-22
50	Centro de Estudios Avanzados de Puerto Rico y el Caribe	Health Care	Puce	2018-06-10	2016-06-07
51	Tyumen State University of Gas and Oil	Technology	Puce	2012-10-30	2021-09-26
52	Mehrabyan Medical Institute and Medical College	Consumer Services	Pink	2022-09-10	2019-08-22
53	Arts, Sciences and Technology University	Finance	Yellow	2022-09-11	2020-11-30
54	University of Insurance and Banking in Warsaw	Energy	Orange	2014-01-15	2016-12-04
55	Universidad de Talca	Capital Goods	Puce	2017-05-04	2016-05-21
56	Universidad MotolinÃ­a del Pedegral	Consumer Services	Aquamarine	2013-10-26	2018-05-31
57	Shobhit University, Meerut	n/a	Violet	2017-10-24	2022-08-18
58	Art Institute of Charlotte	n/a	Teal	2017-08-23	2021-12-06
59	University of Ontario Institute of Technology	Health Care	Teal	2021-12-21	2017-03-10
60	Iceland University of Education	n/a	Khaki	2021-03-03	2016-03-30
61	Kirksville College of Osteopathic Medicine	n/a	Maroon	2013-12-09	2015-10-12
62	University of Lethbridge	Basic Industries	Maroon	2014-12-11	2016-03-03
63	University of Agriculture Abeokuta	Technology	Yellow	2017-09-22	2022-06-23
64	Samford University	n/a	Teal	2013-06-06	2016-07-09
65	Ecole Nationale d'IngÃ©nieurs de Tarbes	Miscellaneous	Orange	2016-03-06	2017-09-06
66	Indiana University at Kokomo	Basic Industries	Fuscia	2020-10-21	2016-11-15
67	Universidad Gran Mariscal de Ayacucho	Health Care	Violet	2013-07-06	2019-06-21
68	Eastern New Mexico University	n/a	Red	2016-04-10	2017-07-07
69	Universidad Nacional de Quilmes	Energy	Red	2012-11-12	2022-08-03
70	University of Essex	Finance	Violet	2013-10-04	2017-06-27
71	National Institute of Fitness and Sports Kanoya	n/a	Aquamarine	2019-04-03	2018-07-11
72	Georgia Health Sciences University	n/a	Indigo	2016-05-27	2021-05-14
73	Gezira College of Technology	Public Utilities	Crimson	2015-12-09	2017-10-06
74	Concordia University, River Forest	Public Utilities	Aquamarine	2021-08-25	2022-09-27
75	Aoyama Gakuin University	Finance	Goldenrod	2018-02-26	2016-05-25
76	Northern University Bangladesh	Finance	Khaki	2014-06-01	2021-11-27
77	University "Aurel Vlaicu" Arad	Technology	Green	2015-11-21	2020-12-28
78	Universidad International SEK, Santiago	Consumer Services	Red	2015-06-10	2021-09-23
79	Haynal Imre University of Health Sciences Budapest	Finance	Puce	2015-10-17	2017-09-02
80	Thi Qar University	Health Care	Orange	2013-09-29	2018-03-23
81	UniversitÃ© de Tunis El Manar	Health Care	Mauv	2021-03-31	2016-04-15
82	College of Notre Dame of Maryland	Consumer Services	Mauv	2016-04-12	2018-03-03
83	New England School of Art and Design	Finance	Green	2014-10-08	2021-01-17
84	Laurus Technical Institute	Transportation	Indigo	2017-01-05	2020-03-29
85	UniversitÃ¤t Erfurt	Finance	Aquamarine	2016-08-17	2020-10-28
86	University College of BorÃ¥s	Energy	Orange	2017-06-16	2017-02-04
87	Wake Forest University	Technology	Maroon	2014-01-21	2021-03-09
88	Lumbini Buddhist University	Technology	Red	2022-08-03	2015-11-29
89	Chung-Ju National University	Basic Industries	Maroon	2017-11-21	2018-11-23
90	UniversitÃ© ChrÃ©tienne du Nord d'Haiti	Energy	Purple	2020-09-02	2019-09-28
91	Groupe Sup de Co Amiens Picardie	Technology	Yellow	2018-05-20	2020-04-13
92	Kumamoto University	Consumer Services	Fuscia	2021-05-20	2016-06-04
93	Universitas Nusa Cendana	n/a	Maroon	2019-02-17	2018-01-27
94	Universidad de CÃ¡diz	Consumer Services	Red	2020-06-01	2018-04-21
95	College of Mount St. Vincent	Finance	Turquoise	2014-04-06	2018-07-07
96	UniversitÃ© Catholique de Lyon	Consumer Services	Fuscia	2014-05-16	2022-07-09
97	Marycrest International University	Public Utilities	Mauv	2015-11-13	2022-08-25
98	Universitas Surabaya	Finance	Purple	2019-03-12	2018-12-15
99	Universidade Federal de RondÃ´nia	Miscellaneous	Mauv	2013-06-10	2017-01-10
100	Northwest University Xi'an	Technology	Yellow	2022-01-12	2020-05-08
\.


--
-- TOC entry 3148 (class 0 OID 17145)
-- Dependencies: 222
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.events (id, event_name, creator_id, created_at, started_at) FROM stdin;
1	æ¬§	60	2021-09-12	2022-02-25
2	ç§‹	29	2022-05-18	2022-05-20
3	çš®	7	2022-03-04	2022-03-20
4	ä¸‡	4	2022-03-26	2022-07-20
5	è´¡	81	2022-05-18	2022-04-19
6	é‚°	30	2022-03-12	2022-07-28
7	ä¸œ	100	2022-08-08	2022-01-02
8	éº´	59	2021-09-02	2022-04-02
9	æ–‡	43	2022-07-02	2021-08-31
10	éº»	89	2022-07-30	2022-03-27
11	è¨¾	56	2021-08-22	2022-08-19
12	ç”˜	39	2022-07-02	2022-05-07
13	ç¦„	58	2022-01-15	2021-09-02
14	å¸¸	64	2022-01-04	2021-11-18
15	éž 	74	2022-07-08	2022-08-06
16	å…š	30	2022-03-14	2022-02-08
17	éœ�	10	2022-03-28	2022-06-15
18	æ�œ	69	2021-10-16	2021-10-20
19	éƒ�	64	2021-09-20	2022-02-25
20	å�°	10	2021-10-30	2022-04-16
21	å°�	48	2021-10-08	2022-01-10
22	ç¿Ÿ	33	2022-04-16	2022-06-17
23	èƒ½	20	2022-06-26	2022-07-25
24	é€„	77	2021-11-15	2021-08-28
25	è“¬	38	2021-12-03	2022-04-13
26	æ²ˆ	79	2022-05-17	2022-07-17
27	ä¹œ	42	2021-11-23	2022-04-03
28	ä¾¯	94	2022-05-22	2021-10-27
29	å›½	3	2021-09-15	2021-09-28
30	å†€	62	2022-06-10	2022-04-30
31	ç½—	30	2021-10-19	2021-11-11
32	èµµ	54	2022-02-07	2022-07-24
33	å¼“	7	2022-05-18	2022-08-12
34	å¼º	46	2022-05-06	2022-05-16
35	èµµ	98	2021-09-07	2022-08-13
36	æ�¾	97	2022-04-02	2021-12-25
37	è£˜	27	2021-08-26	2021-10-06
38	ç‡•	47	2021-12-04	2021-12-01
39	å¹²	15	2022-03-28	2022-03-06
40	ä¹ 	35	2022-05-20	2022-07-24
41	èŒ…	100	2022-07-07	2022-04-28
42	éƒ�	50	2022-02-01	2022-05-21
43	è‡§	43	2021-09-05	2022-04-25
44	å·©	67	2022-04-11	2022-02-05
45	ç‹„	92	2022-06-27	2021-11-16
46	èµµ	25	2021-09-22	2022-01-26
47	é¥¶	67	2021-09-10	2021-12-26
48	é”º	92	2021-11-24	2021-12-22
49	è“Ÿ	28	2022-05-30	2022-03-15
50	æ´ª	36	2021-12-09	2022-04-30
51	è™ž	34	2022-07-29	2021-11-16
52	çŽ‹	79	2021-09-11	2021-11-19
53	æ»•	16	2022-08-08	2022-01-22
54	æ¡“	21	2021-12-06	2022-07-20
55	å�´	83	2022-04-09	2021-09-10
56	å†‰	63	2021-12-13	2022-05-24
57	å¸ˆ	16	2021-09-14	2022-07-13
58	è’²	34	2022-06-25	2021-09-01
59	è¨¾	29	2022-01-26	2021-12-13
60	ç‡•	98	2021-09-15	2021-10-19
61	å�²	66	2022-06-18	2022-05-15
62	æ–‡	50	2021-12-07	2022-07-22
63	å�²	40	2021-09-23	2021-11-13
64	è¿ž	1	2021-08-30	2022-05-01
65	æ�¾	71	2022-01-24	2022-01-03
66	è´�	9	2022-07-19	2022-04-14
67	èƒ¡	63	2022-02-25	2022-01-12
68	é«˜	8	2022-01-19	2022-02-25
69	å”�	19	2021-12-02	2022-01-22
70	å¹¿	18	2021-08-30	2022-01-28
71	é¢œ	54	2022-04-10	2022-01-01
72	é¾š	84	2021-09-16	2022-03-23
73	è“Ÿ	17	2022-05-22	2022-05-29
74	è¤š	39	2021-09-06	2021-08-30
75	å�´	98	2022-04-05	2021-09-02
76	å‚¨	90	2022-06-30	2021-10-14
77	å�²	14	2022-04-26	2022-08-15
78	æ´ª	97	2022-07-07	2022-07-17
79	å¥š	37	2022-08-10	2022-06-20
80	æ�¾	81	2022-01-31	2022-01-13
81	èµµ	24	2021-09-28	2022-04-11
82	ç¥�	25	2022-03-08	2022-02-11
83	æˆš	18	2021-11-12	2021-12-24
84	é”º	59	2022-08-06	2022-04-29
85	åˆ˜	24	2022-01-06	2022-06-11
86	è®¡	63	2022-07-26	2022-02-26
87	æ”¯	81	2021-10-10	2021-08-25
88	é‚“	57	2022-01-12	2021-08-29
89	è”š	77	2022-06-11	2022-03-10
90	é‚£	93	2022-07-01	2021-09-04
91	é’­	87	2021-11-16	2022-07-16
92	é˜³	17	2022-06-11	2021-10-19
93	èŠ®	100	2022-01-11	2022-05-14
94	è®¡	95	2022-04-15	2021-11-23
95	é˜š	73	2022-06-05	2022-04-16
96	å€ª	71	2021-09-19	2022-01-28
97	å·¢	71	2022-04-21	2021-10-26
98	è€¿	92	2021-12-08	2022-03-02
99	ä¼�	79	2022-01-14	2021-12-09
100	åº”	53	2021-12-14	2022-02-21
\.


--
-- TOC entry 3134 (class 0 OID 17046)
-- Dependencies: 208
-- Data for Name: experiencies; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.experiencies (id, skill, body, skill_level) FROM stdin;
1	JD Edwards	vestibulum sed magna at nunc commodo placerat praesent blandit	optimal
2	Microsoft Office	at turpis a pede posuere	info-mediaries
3	Emotional Intelligence	nullam porttitor lacus at turpis donec posuere	Re-engineered
4	Urban Redevelopment	praesent id massa id nisl venenatis lacinia aenean sit amet	bi-directional
5	BPMN	morbi ut odio cras mi pede malesuada in imperdiet	firmware
6	LLU	porttitor id consequat in consequat ut	Synchronised
7	Unity3D	sit amet consectetuer adipiscing elit proin risus praesent	Phased
8	NHibernate	purus eu magna vulputate luctus cum sociis natoque penatibus et	grid-enabled
9	VCL	nulla justo aliquam quis turpis eget elit	Enhanced
10	MBS	vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla	tertiary
11	Urban Studies	consequat in consequat ut nulla sed	Centralized
12	Environmental Policy	turpis enim blandit mi in	encompassing
13	JDE Enterprise One	consectetuer adipiscing elit proin interdum mauris non ligula	solution
14	ETABS	et ultrices posuere cubilia curae nulla dapibus dolor	methodology
15	KOL Management	dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien	matrix
16	HTFS	aliquet maecenas leo odio condimentum id luctus nec	actuating
17	OH&amp;S	in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem	encompassing
18	Medical Affairs	justo in hac habitasse platea dictumst etiam faucibus cursus urna	Persistent
19	Sage ERP X3	sapien urna pretium nisl ut volutpat	pricing structure
20	TTP	sapien placerat ante nulla justo aliquam quis turpis eget elit	help-desk
21	Lumion	aliquam sit amet diam in magna bibendum imperdiet nullam	scalable
22	PNR	eu felis fusce posuere felis sed	composite
23	Brand Equity	auctor gravida sem praesent id massa id nisl	User-friendly
24	IBM iSeries	placerat ante nulla justo aliquam quis	uniform
25	Financial Risk Management	ut tellus nulla ut erat id mauris vulputate elementum	mobile
26	GNU	est lacinia nisi venenatis tristique fusce congue diam	Cloned
27	HCP	lacus at turpis donec posuere metus vitae ipsum aliquam	extranet
28	Acute Care	ultrices posuere cubilia curae mauris	full-range
29	Youth Engagement	id ornare imperdiet sapien urna pretium	Programmable
30	IT Solutions	aliquam convallis nunc proin at turpis	4th generation
31	IKE	a nibh in quis justo maecenas rhoncus aliquam lacus morbi	Programmable
32	Twisted	a feugiat et eros vestibulum ac est lacinia	initiative
33	MVC Architecture	nulla suscipit ligula in lacus curabitur	zero administration
34	Network Administration	pellentesque volutpat dui maecenas tristique est et tempus semper	Organic
35	IEEE standards	curae mauris viverra diam vitae quam suspendisse potenti	standardization
36	DFSS	ut odio cras mi pede malesuada in imperdiet et	uniform
37	Shopper Marketing	est donec odio justo sollicitudin ut suscipit a feugiat	Networked
38	HTK	eu interdum eu tincidunt in	client-server
39	Video Production	vel pede morbi porttitor lorem id ligula suspendisse ornare consequat	artificial intelligence
40	JBA	nibh in hac habitasse platea dictumst aliquam augue quam	migration
41	Traditional IRA	sed tristique in tempus sit amet	responsive
42	SnagIt	sit amet eleifend pede libero	even-keeled
43	Private Piloting	diam neque vestibulum eget vulputate ut ultrices vel	Face to face
44	HPLC-MS	tempor convallis nulla neque libero convallis eget eleifend	Reverse-engineered
45	Bridge	lobortis convallis tortor risus dapibus augue vel accumsan	tangible
46	TMJ Treatment	proin leo odio porttitor id consequat in consequat ut	clear-thinking
47	HSRP	cras non velit nec nisi vulputate nonummy	Progressive
48	MSN AdCenter	adipiscing elit proin risus praesent	Synergistic
49	NPDES	ultrices mattis odio donec vitae nisi nam ultrices libero non	Re-engineered
50	Microsoft Dynamics SL	aliquam lacus morbi quis tortor	customer loyalty
51	CDMA2000	amet erat nulla tempus vivamus in	bi-directional
52	High Yield Bonds	justo sollicitudin ut suscipit a feugiat et	eco-centric
53	RDC	eget elit sodales scelerisque mauris sit	systematic
54	EBMS	vel nisl duis ac nibh	collaboration
55	Ticketing	vel lectus in quam fringilla rhoncus	function
56	PKCS	nulla quisque arcu libero rutrum	Integrated
57	Luxury Brand Marketing	vitae nisl aenean lectus pellentesque eget nunc donec	fault-tolerant
58	GHS	nulla facilisi cras non velit nec nisi vulputate nonummy	Extended
59	Flex	in hac habitasse platea dictumst maecenas ut massa quis	Extended
60	Academic Writing	justo etiam pretium iaculis justo in hac	bifurcated
61	Rig	dapibus dolor vel est donec odio justo sollicitudin	holistic
62	HST	tristique fusce congue diam id ornare imperdiet sapien urna	definition
63	iLife	phasellus id sapien in sapien iaculis congue	eco-centric
64	EOI	neque sapien placerat ante nulla justo aliquam quis turpis	methodology
65	CPR Certified	tempus semper est quam pharetra magna ac consequat	local
66	Air Force	dui vel sem sed sagittis	analyzer
67	Github	eleifend pede libero quis orci nullam molestie	Visionary
68	CSAT	fusce consequat nulla nisl nunc nisl duis bibendum	Operative
69	WSGI	dignissim vestibulum vestibulum ante ipsum primis in faucibus	Fundamental
70	EJB	sed tristique in tempus sit amet	Phased
71	Platform LSF	mauris enim leo rhoncus sed vestibulum sit	parallelism
72	Digital TV	morbi odio odio elementum eu interdum eu	functionalities
73	Lyra	cubilia curae duis faucibus accumsan odio curabitur convallis	projection
74	JGroups	nulla justo aliquam quis turpis eget elit sodales scelerisque	disintermediate
75	IP PBX	consequat morbi a ipsum integer a	eco-centric
76	PPE	libero nam dui proin leo odio porttitor id	tangible
77	RMI	dictumst morbi vestibulum velit id pretium iaculis diam	Cloned
78	DMR	aliquam lacus morbi quis tortor	moderator
79	MQL	faucibus cursus urna ut tellus nulla ut erat	explicit
80	CTT	aenean fermentum donec ut mauris eget massa tempor convallis nulla	firmware
81	Hydrography	odio curabitur convallis duis consequat dui	needs-based
82	Spring MVC	ipsum primis in faucibus orci luctus et ultrices posuere cubilia	Inverse
83	ATLS	urna pretium nisl ut volutpat sapien arcu sed	discrete
84	TDMA	semper rutrum nulla nunc purus phasellus in felis donec	24 hour
85	Elementary Education	donec odio justo sollicitudin ut suscipit a	core
86	Static Timing Analysis	ac enim in tempor turpis nec euismod scelerisque	flexibility
87	PDS Frameworks	vestibulum rutrum rutrum neque aenean auctor gravida sem	Inverse
88	xPON	sollicitudin ut suscipit a feugiat et	human-resource
89	Cycle Counting	magna bibendum imperdiet nullam orci pede venenatis	database
90	VB.NET	dui vel nisl duis ac nibh fusce lacus purus aliquet	process improvement
91	WPF Development	pellentesque ultrices phasellus id sapien in sapien iaculis	user-facing
92	Process Simulation	eros vestibulum ac est lacinia	leverage
93	PNF	vehicula condimentum curabitur in libero ut massa volutpat convallis morbi	Reactive
94	Mycobacteriology	morbi vestibulum velit id pretium iaculis diam erat	system engine
95	IIS	ipsum primis in faucibus orci luctus et ultrices posuere cubilia	frame
96	General Surgery	cum sociis natoque penatibus et magnis dis parturient montes nascetur	encompassing
97	Account Management	morbi vel lectus in quam fringilla rhoncus mauris enim leo	cohesive
98	RTK	placerat praesent blandit nam nulla integer pede justo lacinia	support
99	CBI	luctus nec molestie sed justo pellentesque viverra	throughput
100	UK Bribery Act	proin risus praesent lectus vestibulum	responsive
\.


--
-- TOC entry 3146 (class 0 OID 17111)
-- Dependencies: 220
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.groups (id, group_name, creator_id, created_at) FROM stdin;
1	Spy in Black, The	95	2005-10-06
2	Sunday in Kigali, A (Un dimanche Ã  Kigali)	54	2005-10-08
3	Jingle All the Way 2	9	2019-10-10
4	Diary of the Dead	35	2007-05-31
5	Santa Claus	32	2019-10-09
6	Sahara	67	2020-04-01
7	Inspector General, The	33	2017-07-07
8	Woman's Secret, A	52	2008-04-25
9	Tales That Witness Madness	14	2022-03-31
10	Delivery, The	18	2004-07-24
11	Lolita	80	2011-11-01
12	Sweet Dreams	85	2006-09-08
13	Cloak and Dagger	9	2010-03-16
14	Housemaid, The (Hanyo)	31	2010-09-04
15	Darkness Falls	41	2019-12-27
16	Cry Freedom	100	2007-11-28
17	Crush	77	2017-08-09
18	Horse Soldiers, The	56	2008-04-06
19	Things Change	37	2013-04-05
20	Once in the Life	16	2013-03-13
21	Munich	54	2005-11-13
22	Mr. Hobbs Takes a Vacation	69	2016-12-29
23	Super Bitch	70	2006-03-15
24	Tyler Perry's A Madea Christmas	45	2021-03-19
25	Dust of Time, The	56	2016-10-06
26	Afghan Star	33	2008-12-03
27	13 Fighting Men	66	2016-07-17
28	Nightbreed	43	2020-02-04
29	Catlow	37	2006-12-21
30	Dreamscape	41	2010-01-30
31	Kumail Nanjiani: Beta Male 	52	2009-09-13
32	Return of Swamp Thing, The	45	2011-02-08
33	Phantasm III: Lord of the Dead	19	2002-11-12
34	Broadway Melody of 1938	43	2010-02-05
35	Sexy Baby	2	2015-05-24
36	Peeping Tom	19	2006-05-13
37	Longest Day, The	81	2004-06-10
38	Warlock: The Armageddon	21	2005-08-31
39	The Grump	89	2022-08-07
40	Education of Little Tree, The	14	2006-08-25
41	Emil i LÃ¶nneberga	75	2001-10-14
42	The Lazarus Effect	11	2006-10-30
43	Blow Out	70	2018-04-18
44	Mondo Trasho	38	2021-06-28
45	Colourful (Karafuru)	78	2018-06-11
46	Footlight Parade	91	2012-01-22
47	Lucky One, The	68	2002-05-27
48	Rebirth	19	2004-07-01
49	Warriors, The	48	2011-06-09
50	Obsessed	37	2003-04-28
51	Antibodies (AntikÃ¶rper)	78	2003-06-24
52	Town Called Hell, A	27	2004-06-20
53	Sword in the Stone, The	34	2002-08-19
54	Michael the Brave (Mihai Viteazul)	75	2008-05-04
55	Ray Harryhausen: Special Effects Titan	31	2002-10-29
56	Chinese Puzzle (Casse-tÃªte chinois)	100	2012-09-26
57	Rhythm of a Crime (Ritam zlocina)	55	2005-11-07
58	Copycat	43	2010-01-16
59	Dante's Peak	15	2001-07-18
60	A Phantasy	36	2003-12-05
61	War and Peace (Voyna i mir)	31	2015-10-18
62	April Story	3	2013-11-03
63	In Your Hands (Forbrydelser)	39	2016-05-02
64	How to Succeed in Business Without Really Trying	75	2002-12-09
65	Chain Reaction	43	2011-11-19
66	Town & Country	92	2004-07-06
67	When You Comin' Back, Red Ryder?	99	2020-10-14
68	Tumbleweeds	11	2012-02-08
69	Cobra	87	2004-05-04
70	What Happens in Vegas...	26	2009-10-12
71	Third Miracle, The	38	2006-03-14
72	Another Harvest Moon	44	2015-02-21
73	Beautiful Darling	93	2017-01-18
74	Summer Place, A	19	2009-01-17
75	Hunting Party, The	90	2000-11-29
76	Once Upon a Time in America	17	2020-12-21
77	Contact High	64	2021-06-15
78	Wrong Turn 3: Left for Dead	4	2010-08-13
79	The Cheat	16	2002-10-10
80	Big One, The	63	2017-10-04
81	[REC]Â³ 3 GÃ©nesis	85	2017-12-15
82	My Boss's Daughter	82	2009-08-28
83	Identification of a Woman (Identificazione di una donna)	76	2021-07-08
84	Agent Cody Banks	19	2005-06-28
85	Sleeping with Other People	56	2012-09-07
86	Tie Xi Qu: West of the Tracks (Tiexi qu)	34	2020-03-01
87	Tic Code, The	89	2010-04-16
88	To the Left of the Father (Lavoura Arcaica)	99	2019-02-11
89	I Wish (Kiseki)	95	2020-01-10
90	Wreck-It Ralph	10	2021-12-05
91	Sport, Sport, Sport	25	2009-01-12
92	Gorillas in the Mist	87	2022-01-21
93	Holidaze	28	2001-09-21
94	Without Bias (a.k.a. Len Bias)	75	2006-06-16
95	Thunderpants	57	2016-05-28
96	Final Cut	43	2013-09-28
97	Triangle (Tie saam gok)	41	2009-07-03
98	Commune	30	2007-12-15
99	Jackass 2.5	15	2021-08-10
100	Missing Picture, The (L'image manquante)	97	2016-07-20
\.


--
-- TOC entry 3152 (class 0 OID 17161)
-- Dependencies: 226
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.jobs (id, job_name, company_id, location, format, skills_requirement, salary) FROM stdin;
1	Business Development	Buzzster	Indonesia	Male	System Architecture	$9764.73
2	Marketing	Yabox	Mexico	Female	Online Publishing	$5344.19
3	Accounting	Teklist	Indonesia	Male	Sports Injuries	$4775.80
4	Marketing	Flashspan	Azerbaijan	Female	Classical	$1776.38
5	Accounting	Gevee	Serbia	Female	EHS	$7358.22
6	Training	Divanoodle	Croatia	Male	Backbone.js	$3775.70
7	Human Resources	Kazu	Argentina	Male	Bonds	$1065.10
8	Services	Gigazoom	China	Female	SSH Client	$7657.84
9	Marketing	Rhyloo	Venezuela	Male	OLEDs	$7450.86
10	Marketing	Realcube	China	Male	PGA	$6401.42
11	Marketing	Fivebridge	Brazil	Female	Psychopharmacology	$4162.77
12	Services	Roodel	Bulgaria	Male	ERD	$4908.21
13	Marketing	Feednation	Syria	Female	eEmpact	$9922.10
14	Business Development	Leenti	Thailand	Female	Westlaw	$8203.23
15	Research and Development	Wikivu	China	Male	GFSI	$8703.12
16	Engineering	Bubbletube	Zimbabwe	Female	Hummingbird DM	$3924.94
17	Legal	BlogXS	Iraq	Female	PDS Frameworks	$3023.21
18	Product Management	Feedmix	Sweden	Male	NCSS	$6640.02
19	Legal	Cogidoo	Poland	Male	TPNS	$2759.77
20	Legal	Jaxnation	China	Female	GMF	$5121.22
21	Product Management	Avavee	Netherlands	Female	nVision	$9893.02
22	Training	Edgetag	Indonesia	Male	Wheat	$8366.23
23	Human Resources	Camimbo	France	Male	Illustrator	$7208.78
24	Support	Rhynoodle	Brazil	Female	Cisco VPN	$4951.84
25	Sales	Fivebridge	Poland	Female	Awareness Raising	$5826.18
26	Accounting	Rhyloo	Vietnam	Male	Legal Liability	$5568.93
27	Support	Kayveo	Indonesia	Male	Legal Issues	$9238.58
28	Training	Tazzy	China	Male	VLSI CAD	$7995.12
29	Marketing	Wikido	Poland	Male	Pneumatics	$7764.57
30	Accounting	Quinu	Indonesia	Female	SG&amp;A	$9359.04
31	Services	Digitube	Brazil	Male	HDS	$8586.35
32	Product Management	Wikido	China	Male	QC 9.2	$4903.50
33	Support	Brainsphere	Portugal	Male	OS/390	$7791.52
34	Research and Development	Divape	Sweden	Male	IP PBX	$2371.26
35	Accounting	Eabox	China	Male	Singing	$9731.01
36	Accounting	Zoonder	Indonesia	Female	Trail Running	$7007.13
37	Human Resources	Photobug	Iran	Male	Yii	$8600.77
38	Training	Skynoodle	Indonesia	Male	Back Office	$2017.04
39	Research and Development	Camimbo	Ghana	Male	Physics	$4666.52
40	Support	InnoZ	Philippines	Male	Military Aviation	$1185.02
41	Support	Realblab	Greece	Male	Quest vWorkspace	$7192.45
42	Marketing	Skiba	Brazil	Female	AC/DC	$3461.95
43	Services	Trilia	Brazil	Male	WM modules	$8395.13
44	Sales	Yoveo	Latvia	Male	Dysphagia	$1982.52
45	Support	Riffpedia	Egypt	Male	Water Treatment	$4423.15
46	Research and Development	Twitterlist	China	Male	Requirements Analysis	$7290.19
47	Training	Yacero	Peru	Female	LCSH	$5283.09
48	Accounting	Voonyx	Indonesia	Male	Grant Writing	$6720.17
49	Accounting	Roomm	China	Male	NVH	$1473.88
50	Human Resources	Digitube	Philippines	Female	Tax Accounting	$1961.83
51	Accounting	Myworks	Albania	Female	Semantic HTML	$2507.04
52	Training	Zooxo	Indonesia	Male	HCS12	$9651.75
53	Product Management	Snaptags	France	Female	VNC	$5285.84
54	Human Resources	Mudo	United States	Male	MRTG	$3732.34
55	Research and Development	Teklist	Burkina Faso	Male	Drafting Agreements	$6108.21
56	Sales	Agivu	Indonesia	Female	LCD	$2655.75
57	Accounting	Riffpath	Ukraine	Female	HTML Help Workshop	$1999.53
58	Product Management	Flashset	China	Female	DMR	$4733.39
59	Accounting	Pixope	China	Female	Interactive Whiteboard	$9031.00
60	Sales	Dabtype	China	Male	Online Communications	$3258.67
61	Research and Development	Riffwire	China	Female	BMP	$2430.29
62	Marketing	Twitterworks	Finland	Female	Eyebrow	$8663.79
63	Services	Camimbo	Slovenia	Male	Athletic Training	$1975.87
64	Accounting	Snaptags	China	Male	Job Search Strategies	$6930.75
65	Sales	Quatz	Thailand	Female	GMRA	$8505.89
66	Legal	Skinte	Argentina	Female	PTS	$9775.90
67	Support	Meeveo	China	Female	RFP Generation	$5200.44
68	Services	Trilith	China	Female	In-situ Chemical Oxidation	$4674.73
69	Engineering	Photojam	Serbia	Female	Information Technology	$3661.37
70	Accounting	Npath	Iran	Male	Typography	$4665.51
71	Legal	Photobug	Brazil	Female	CentOS	$5300.50
72	Product Management	Jetwire	Colombia	Male	Glassfish	$5279.24
73	Business Development	Plambee	Kenya	Female	JBoss Seam	$5868.26
74	Engineering	Centizu	Bulgaria	Female	UE	$7287.91
75	Human Resources	Browsecat	North Korea	Male	WTT	$2443.91
76	Engineering	Muxo	Indonesia	Female	Rhetoric	$9729.03
77	Support	DabZ	Portugal	Male	International Trade	$4304.26
78	Business Development	Gigazoom	Bangladesh	Female	Direct Mail	$3992.33
79	Accounting	Tambee	Poland	Male	Defect Life Cycle	$5216.10
80	Training	Blogtags	France	Female	Hatha Yoga	$4870.08
81	Human Resources	Pixonyx	Norway	Female	Customer Support	$5974.68
82	Product Management	Gigazoom	Portugal	Male	Not for Profit	$2205.96
83	Sales	Linklinks	Argentina	Female	Cyber-security	$1454.00
84	Legal	Blognation	Portugal	Male	Test Planning	$1661.11
85	Marketing	Twiyo	China	Male	Finance	$5541.10
86	Services	Skivee	Gabon	Female	Microsoft MVP	$4496.25
87	Research and Development	Browsezoom	Greece	Female	SRDS	$2626.18
88	Accounting	Yakijo	United Arab Emirates	Female	Zephyr	$7190.91
89	Product Management	Youspan	Vietnam	Male	Engineering Management	$9678.29
90	Business Development	Quatz	China	Male	Machine Knitting	$8181.51
91	Sales	Avamm	Indonesia	Female	Career Counseling	$9797.92
92	Services	Dynazzy	Cuba	Male	Blog Marketing	$9984.98
93	Engineering	Gigashots	Sweden	Male	Banners	$9663.19
94	Human Resources	Quinu	Russia	Male	HBDI	$8758.21
95	Sales	Voonix	China	Male	SBR	$1516.77
96	Engineering	Skimia	China	Female	Rotating Equipment	$3230.39
97	Business Development	Yotz	Portugal	Female	Psychodynamic Psychotherapy	$3710.41
98	Human Resources	Skiptube	Madagascar	Female	NDMP	$7445.26
99	Business Development	Chatterpoint	Brazil	Female	Psychological Assessment	$9567.36
100	Services	Myworks	Philippines	Male	VMD	$8303.76
\.


--
-- TOC entry 3154 (class 0 OID 17180)
-- Dependencies: 228
-- Data for Name: learnings; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.learnings (id, skill, company_id, location, format, kind, started_at) FROM stdin;
1	Benefits Negotiation	Avamba	United States	Male	USD	2021-11-04
2	WordPress	Realmix	Kazakhstan	Female	KZT	2022-06-16
3	VTC	Brainlounge	Brazil	Female	BRL	2022-01-21
4	Yamaha PM5D	Innotype	Poland	Female	PLN	2021-12-01
5	Mythology	Twinder	Tanzania	Female	TZS	2022-02-01
6	Nielsen	Thoughtworks	Indonesia	Female	IDR	2022-07-22
7	Export	Youspan	Indonesia	Female	IDR	2022-05-16
8	Business Efficiency	Skyndu	Philippines	Female	PHP	2022-03-10
9	Aerospace	Trilia	China	Female	CNY	2021-10-25
10	GSX	Rhynyx	Reunion	Female	EUR	2022-05-16
11	Overall Wellness	Vidoo	Indonesia	Male	IDR	2022-06-25
12	eGate	Trudeo	South Africa	Male	ZAR	2021-11-09
13	UK Immigration	Jamia	China	Female	CNY	2021-09-12
14	Logistics Management	Kayveo	China	Female	CNY	2022-05-18
15	Receptionist Duties	Reallinks	United States	Male	USD	2021-12-13
16	RTDS	Zoomzone	Japan	Female	JPY	2021-09-20
17	Microsoft Project	InnoZ	Mali	Male	XOF	2021-09-09
18	EPANET	Jayo	Cameroon	Female	XAF	2021-11-28
19	Volunteer Recruiting	Realbridge	Serbia	Male	RSD	2021-09-13
20	Power Utilities	Topiclounge	Netherlands	Male	EUR	2022-07-28
21	Property &amp; Casualty Insurance	Chatterbridge	Argentina	Female	ARS	2022-02-21
22	IEC 60601	Voomm	Argentina	Female	ARS	2021-10-26
23	PPPoE	Plambee	Japan	Female	JPY	2022-07-11
24	GNMA	Shufflebeat	China	Male	CNY	2021-09-14
25	Ethernet over Copper	Twitterbeat	China	Male	CNY	2021-08-27
26	IICRC Certifications	Aimbo	Myanmar	Female	MMK	2022-06-17
27	Identity Management	Dabtype	Colombia	Female	COP	2022-03-24
28	Automotive Aftermarket	Skyvu	Norway	Female	NOK	2022-02-20
29	Oil Analysis	Voonix	Indonesia	Female	IDR	2022-01-28
30	Communication	Riffpath	China	Female	CNY	2022-05-04
31	Legal Writing	Mynte	France	Male	EUR	2022-01-11
32	Judicial Review	Jabbercube	Norway	Female	NOK	2022-07-10
33	Iron Ore	Jabbersphere	China	Male	CNY	2022-06-14
34	Juvenile Law	Brightdog	Serbia	Male	RSD	2022-08-09
35	IXOS	Vinder	Poland	Female	PLN	2022-07-12
36	RTO	Mycat	Cyprus	Male	EUR	2022-07-09
37	Intercollegiate Athletics	Skipstorm	South Sudan	Female	SSP	2022-07-21
38	XMLHTTP	Fiveclub	Costa Rica	Male	CRC	2022-05-22
39	QKA	Blognation	Philippines	Male	PHP	2022-03-26
40	Yammer	Snaptags	Egypt	Male	EGP	2022-06-09
41	Political Science	Tagpad	Netherlands	Male	EUR	2021-10-11
42	VJ	Fiveclub	Brazil	Male	BRL	2022-04-14
43	OEIC	Mita	Thailand	Male	THB	2022-08-15
44	Uniform Combined State Law	Voolith	China	Female	CNY	2022-06-15
45	Contemporary Art	Divanoodle	Argentina	Female	ARS	2021-09-03
46	Perl	Twitterwire	Honduras	Male	HNL	2022-03-25
47	Evidence	Realfire	Czech Republic	Male	CZK	2021-10-15
48	Cfengine	Voomm	China	Male	CNY	2022-06-15
49	LRO	Lazz	Poland	Male	PLN	2022-06-13
50	Radar	Meevee	Nigeria	Female	NGN	2021-10-09
51	GNU Debugger	Twitterwire	Iran	Male	IRR	2022-03-07
52	Allergic Rhinitis	Zoombox	Colombia	Male	COP	2022-08-05
53	KML	Meeveo	Panama	Male	PAB	2021-12-02
54	Documentaries	Gabvine	France	Male	EUR	2022-07-09
55	Data Structures	Dynabox	Bosnia and Herzegovina	Female	BAM	2021-09-10
56	Tgrid	Realcube	China	Female	CNY	2021-10-11
57	GPS Devices	Twinder	Sri Lanka	Female	LKR	2022-05-25
58	Nanofabrication	Realcube	Panama	Female	PAB	2022-08-19
59	Jazz	Myworks	Russia	Male	RUB	2022-01-14
60	Project Planning	Demivee	Mauritius	Female	MUR	2021-09-15
61	NCSim	Zoomlounge	China	Female	CNY	2022-01-20
62	VCM	Dynabox	China	Male	CNY	2021-11-26
63	Air Conditioning	Devify	Finland	Male	EUR	2022-04-28
64	MFR	Browsebug	Iran	Male	IRR	2021-10-28
65	Construction Loans	Eire	Venezuela	Female	VEF	2021-09-24
66	Entrepreneurship	Oozz	Philippines	Male	PHP	2021-11-21
67	ICP-MS	Aivee	China	Female	CNY	2022-03-18
68	Lymphoma	Yamia	Honduras	Female	HNL	2022-01-07
69	OMB Circular A-133	Jaxnation	France	Female	EUR	2021-09-29
70	Windows Azure	Tagfeed	Mexico	Female	MXN	2021-10-01
71	German	Skyndu	Thailand	Female	THB	2022-05-16
72	Design Thinking	Wordpedia	China	Female	CNY	2022-05-31
73	ILOG	Shuffletag	Russia	Male	RUB	2022-08-18
74	Sage ERP X3	Topicshots	China	Female	CNY	2022-08-07
75	Nursing Care	Skimia	Greece	Male	EUR	2022-07-27
76	Corporate Governance	Feedspan	Iraq	Female	IQD	2022-04-24
77	PDM Works	Mynte	China	Male	CNY	2021-08-29
78	High Availability	Tambee	Philippines	Female	PHP	2022-04-11
79	Abstract Paintings	Skinte	Indonesia	Male	IDR	2021-11-21
80	XPAC	Feedmix	Indonesia	Female	IDR	2022-04-02
81	Computer Network Operations	Oba	Indonesia	Female	IDR	2022-07-30
82	BST	Blognation	Indonesia	Male	IDR	2022-06-24
83	IUI	Skiptube	Russia	Female	RUB	2022-05-14
84	Broadband	Livetube	Philippines	Female	PHP	2022-06-22
85	OTL	Thoughtstorm	Indonesia	Female	IDR	2021-12-02
86	Sports Medicine	Voomm	Ukraine	Female	UAH	2021-10-03
87	DMPK	Meevee	Nigeria	Male	NGN	2021-11-07
88	Gaming Industry	Blognation	Russia	Male	RUB	2021-10-24
89	Czech	Mymm	China	Male	CNY	2021-10-27
90	Abstracting	Dynava	Philippines	Female	PHP	2021-10-26
91	User Research	Oyoyo	China	Female	CNY	2021-10-19
92	XPS	Brainsphere	Portugal	Male	EUR	2022-04-12
93	eEmpact	Lazzy	Indonesia	Male	IDR	2022-05-03
94	Erosion	Pixonyx	China	Male	CNY	2022-07-21
95	Ultra Low Latency	Vitz	Canada	Female	CAD	2022-03-06
96	Clinical Research	Demimbu	Indonesia	Female	IDR	2021-10-17
97	GCF	Youspan	Serbia	Male	RSD	2022-05-12
98	LAN-WAN	Browseblab	Chile	Male	CLP	2022-05-15
99	Professional Ethics	Vipe	China	Male	CNY	2021-10-14
100	GxP	Realpoint	Indonesia	Female	IDR	2021-11-14
\.


--
-- TOC entry 3140 (class 0 OID 17080)
-- Dependencies: 214
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_read, is_unread, created_at) FROM stdin;
1	64	50	turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante	t	t	2019-09-02
2	36	34	dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum	f	t	2012-11-28
3	1	7	luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum	f	f	2003-11-30
4	45	87	tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non	f	t	2004-08-22
5	75	83	mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus	t	t	2008-10-31
6	11	4	erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam	t	f	2014-09-12
7	28	28	sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla	f	f	2007-06-16
8	14	25	cursus id turpis integer aliquet massa id lobortis convallis tortor risus	t	f	2011-07-25
9	2	29	posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend	f	t	2015-07-06
10	67	27	magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque	t	t	2011-07-27
11	67	4	nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum	f	f	2008-10-30
12	9	67	mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis	f	t	2006-09-28
13	15	92	sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum	f	t	2002-08-29
14	34	4	dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan	t	f	2003-06-12
15	63	46	ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat	f	t	2003-11-10
16	26	31	sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero	t	f	2004-06-11
17	26	60	donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id	f	t	2013-01-04
18	93	29	dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at	t	t	2022-09-13
19	41	78	rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan	f	t	2014-07-09
20	72	8	enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus	t	t	2002-01-22
21	96	32	molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec	f	f	2012-06-03
22	23	77	lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam	t	f	2016-03-18
23	49	43	maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque	t	f	2011-08-08
24	85	89	etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem	t	t	2004-05-01
25	71	25	consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis	t	t	2017-05-23
26	33	75	integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis	t	f	2009-09-09
27	51	40	pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae	t	t	2003-05-12
28	23	2	ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer	t	f	2009-12-22
29	67	81	a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie	f	f	2020-03-20
30	36	98	cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit	f	f	2003-04-16
31	45	63	consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus	f	t	2003-04-18
32	43	5	odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac	f	f	2022-09-28
33	100	89	integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla	t	f	2012-04-22
34	6	43	dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras	t	f	2013-09-27
35	67	19	quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh	f	f	2002-10-22
36	86	25	accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque	f	f	2022-06-19
37	50	21	vel augue vestibulum ante ipsum primis in faucibus orci luctus et	t	t	2006-08-19
38	51	77	donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus	t	f	2018-09-11
39	45	80	duis at velit eu est congue elementum in hac habitasse platea dictumst morbi	t	f	2003-10-31
40	14	94	vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere	f	f	2012-09-09
41	37	72	augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero	t	t	2016-09-17
42	47	34	tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer	f	t	2005-07-16
43	60	41	cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi	f	f	2004-06-26
44	81	94	ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac	t	f	2007-09-27
45	74	93	a pede posuere nonummy integer non velit donec diam neque	f	t	2002-02-05
46	22	28	pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus	f	t	2020-08-05
47	67	68	quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas	t	t	2013-06-22
48	35	36	felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed	f	t	2016-05-05
49	99	40	scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede	f	f	2010-10-22
50	45	92	mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in	f	t	2001-08-02
51	12	34	non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros	f	f	2008-05-24
52	62	48	vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor	t	t	2020-03-08
53	9	27	cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue	t	t	2013-08-04
54	36	86	nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper	t	t	2018-10-30
55	91	73	placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet	t	t	2003-03-19
56	34	4	odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis	t	f	2007-06-30
57	37	75	velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id	f	t	2004-01-07
58	100	60	morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id	t	f	2020-02-29
59	84	100	ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam	t	f	2011-07-29
60	13	53	eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed	t	t	2007-10-12
61	64	99	nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse	f	t	2020-05-15
62	47	43	ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate	t	t	2005-01-01
63	66	11	ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere	t	f	2021-08-09
64	1	68	adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus	f	t	2003-05-16
65	31	23	libero convallis eget eleifend luctus ultricies eu nibh quisque id	t	f	2002-06-12
66	98	92	phasellus in felis donec semper sapien a libero nam dui proin	t	t	2014-03-05
67	39	18	pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus	f	f	2010-11-07
68	31	23	bibendum felis sed interdum venenatis turpis enim blandit mi in	t	t	2013-11-01
69	82	38	dapibus dolor vel est donec odio justo sollicitudin ut suscipit	t	f	2005-02-24
70	55	84	luctus rutrum nulla tellus in sagittis dui vel nisl duis ac	t	f	2020-02-06
71	5	50	curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere	f	t	2016-01-06
72	98	86	fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa	t	f	2011-02-08
73	50	93	nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum	t	f	2017-07-29
74	80	62	at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et	t	t	2021-10-04
75	16	55	rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio	t	t	2001-05-07
76	2	31	faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec	t	f	2019-03-06
77	66	32	tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus	t	f	2019-12-30
78	16	18	lectus in est risus auctor sed tristique in tempus sit amet	f	t	2004-11-27
79	66	87	cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur	f	f	2011-08-02
80	20	34	a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus	t	t	2001-11-03
81	18	17	ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor	t	f	2012-07-10
82	9	77	cras in purus eu magna vulputate luctus cum sociis natoque	f	t	2014-09-07
83	61	41	faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio	f	t	2002-05-07
84	59	98	consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus	f	f	2005-01-29
85	10	40	varius ut blandit non interdum in ante vestibulum ante ipsum	t	t	2017-02-16
86	60	1	ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere	f	t	2009-08-28
87	1	54	pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna	f	f	2002-10-21
88	66	79	vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus	t	f	2014-06-17
89	7	39	pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales	f	f	2013-11-30
90	56	98	curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor	f	f	2013-11-07
91	25	48	ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi	t	f	2020-08-07
92	53	67	etiam faucibus cursus urna ut tellus nulla ut erat id mauris	f	t	2016-09-14
93	17	15	nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla	f	f	2008-07-14
94	53	21	vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere	t	t	2018-02-04
95	53	86	nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique	t	t	2000-08-30
96	98	61	nam nulla integer pede justo lacinia eget tincidunt eget tempus	f	t	2021-10-28
97	93	9	eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut	f	f	2012-08-03
98	37	49	in porttitor pede justo eu massa donec dapibus duis at velit	t	f	2001-07-17
99	9	34	tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis	f	t	2008-09-08
100	93	1	sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod	t	f	2022-09-05
\.


--
-- TOC entry 3150 (class 0 OID 17153)
-- Dependencies: 224
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.news (id, is_read, is_unread, from_user_id, from_groups_id) FROM stdin;
1	f	f	23	37
2	f	t	39	58
3	t	t	8	38
4	f	f	75	96
5	f	t	70	78
6	f	f	88	87
7	t	f	49	75
8	t	f	5	3
9	f	t	68	3
10	f	t	20	96
11	f	t	40	58
12	f	t	56	5
13	f	f	84	55
14	t	f	32	27
15	t	f	79	19
16	t	f	49	59
17	f	f	66	46
18	t	t	70	38
19	f	t	89	61
20	t	f	5	97
21	f	f	15	3
22	f	t	56	9
23	f	f	88	14
24	f	t	96	61
25	t	t	26	60
26	f	t	20	62
27	f	f	78	2
28	t	t	42	16
29	t	t	52	24
30	t	t	93	52
31	t	t	99	27
32	t	f	35	96
33	t	f	1	38
34	t	f	94	89
35	t	t	39	66
36	f	f	54	11
37	t	t	20	2
38	t	t	49	8
39	f	t	90	35
40	t	f	28	9
41	t	t	92	49
42	t	t	55	99
43	t	f	10	52
44	f	t	78	61
45	f	f	25	22
46	t	t	27	64
47	f	t	69	55
48	f	f	59	46
49	t	f	74	47
50	f	f	46	43
51	t	t	45	43
52	f	f	8	16
53	t	f	42	17
54	t	f	60	86
55	t	t	38	43
56	t	f	34	57
57	t	t	26	7
58	f	f	89	20
59	t	f	15	50
60	t	f	94	31
61	t	t	86	31
62	f	t	90	91
63	f	f	81	98
64	f	f	20	6
65	f	t	19	67
66	f	t	35	39
67	t	t	9	46
68	f	t	39	31
69	t	f	93	62
70	t	t	89	41
71	t	t	91	30
72	f	t	84	80
73	t	f	49	23
74	f	f	2	62
75	f	f	18	93
76	t	t	75	72
77	t	t	16	33
78	t	t	55	83
79	f	t	2	28
80	f	t	81	33
81	f	f	72	72
82	f	f	86	81
83	t	t	16	55
84	t	t	35	6
85	f	t	54	8
86	f	f	12	20
87	t	t	51	96
88	t	t	91	38
89	f	t	2	77
90	t	f	69	66
91	t	t	72	59
92	t	t	89	94
93	t	f	34	57
94	t	f	87	22
95	t	f	29	95
96	f	f	71	88
97	f	t	19	29
98	f	t	79	72
99	t	f	43	81
100	f	t	38	42
\.


--
-- TOC entry 3158 (class 0 OID 17619)
-- Dependencies: 232
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.posts (id, post_title, body, creator_id, created_at) FROM stdin;
1	Leprocau3linus vipera	aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat	82	2021-10-02
2	A1lectura lathami	eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien	80	2022-04-26
3	Speermophilus lateralis	lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum	44	2021-10-31
4	Phadlaropus fulicarius	mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit	81	2022-06-17
5	Crocgodjylus niloticus	vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam	80	2021-12-25
6	Echimyjs chrysurus	vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit	33	2022-05-01
7	Pseudjalhopex gymnocercus	a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas	76	2021-11-20
8	qTiliqua scincoides	orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin	86	2022-06-29
9	Awrdea cinerea	cras in purus eu magna vulputate luctus cum sociis natoque	49	2022-06-22
10	Meungos mungo	nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in	15	2022-06-26
11	Crrotalus cerastes	sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac	95	2021-11-12
12	Ovits ammon	cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus	36	2022-05-25
13	Phasyianus colchicus	risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet	62	2022-03-25
14	Hyaenua brunnea	iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate	5	2021-12-12
15	Anas piunctata	a feugiat et eros vestibulum ac est lacinia nisi venenatis	48	2021-10-02
16	Amazonao sp.	quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam	53	2021-09-03
17	Bos taurous	lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc	71	2022-02-07
18	Dacelo nopvaeguineae	morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce	22	2022-04-20
19	Varanus sp[].	felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis	55	2022-05-17
20	aVulpes vulpes	nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel	72	2022-03-22
21	Vsaranus sp.	luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at	77	2021-10-22
22	Codrvus albicollis	ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium	91	2021-10-31
23	Pitfangus sulphuratus	non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis	91	2022-05-07
24	Cacagtua galerita	pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id	16	2021-11-11
25	Phoenhicopterus ruber	leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id	51	2022-07-02
26	Columbja palumbus	turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam	15	2022-02-22
27	Eubalaekna australis	congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo	32	2022-02-16
28	Merops blullockoides	nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi	42	2022-02-06
29	Carduelis; uropygialis	luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in	86	2022-04-10
30	Grus canaddensis	amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci	37	2021-11-15
31	zOreamnos americanus	nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac	85	2022-04-04
32	Zxenaida galapagoensis	aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus	35	2021-11-11
33	Phcoeniconaias minor	amet turpis elementum ligula vehicula consequat morbi a ipsum integer	11	2021-09-17
34	Aonvyx capensis	quis tortor id nulla ultrices aliquet maecenas leo odio condimentum	81	2022-02-24
35	Bugebranus caruncalatus	in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus	67	2022-06-23
36	Mirounnga angustirostris	venenatis non sodales sed tincidunt eu felis fusce posuere felis sed	13	2022-02-16
37	Sarcormhamphus papa	urna ut tellus nulla ut erat id mauris vulputate elementum nullam	87	2022-08-12
38	Nasua n,asua	vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero	98	2021-08-23
39	Colaptes. campestroides	proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis	8	2022-01-18
40	qAra macao	odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus	6	2022-03-09
41	Cwiconia episcopus	vestibulum sit amet cursus id turpis integer aliquet massa id lobortis	31	2022-04-19
42	Vuelpes vulpes	pellentesque eget nunc donec quis orci eget orci vehicula condimentum	25	2022-02-10
43	Haermatopus ater	accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor	53	2022-08-06
44	Cheltodina longicollis	morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat	75	2022-04-17
45	Ovis ycanadensis	nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper	7	2021-10-24
46	Vanelluus armatus	ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar	99	2021-10-26
47	Caiman ucrocodilus	rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede	86	2021-09-25
48	unavailaible	quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in	52	2022-04-27
49	Ovis canaodensis	lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate	94	2022-03-28
50	Pseudocheiprus peregrinus	libero nam dui proin leo odio porttitor id consequat in consequat	19	2022-01-15
51	Iguana igua[na	libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla	64	2022-08-17
52	1Eunectes sp.	tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac	35	2022-01-27
53	G2orilla gorilla	est quam pharetra magna ac consequat metus sapien ut nunc vestibulum	89	2021-11-22
54	La3ma pacos	eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit	21	2022-01-22
55	Phy4lurus milli	curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus	60	2022-01-22
56	Macr5opus robustus	justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante	39	2022-03-04
57	Cacat6ua tenuirostris	sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam	97	2022-03-11
58	Bubalu7s arnee	sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce	14	2021-09-12
59	Bassari7scus astutus	sapien non mi integer ac neque duis bibendum morbi non quam nec	53	2022-01-27
60	Centroce8rcus urophasianus	natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean	31	2022-02-27
61	Paroaria 9gularis	dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam	68	2021-12-06
62	Turtur cha0lcospilos	ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque	92	2021-12-29
63	Macaca radipata	id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque	76	2022-05-26
64	Nyctereutes oprocyonoides	pede lobortis ligula sit amet eleifend pede libero quis orci nullam	36	2022-03-17
65	Phascogale cailura	phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum	93	2022-03-29
66	Charadrius triucollaris	orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae	5	2022-02-20
67	Choriotis ktori	tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus	38	2022-07-10
68	lMorelia spilotes variegata	vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus	26	2022-08-07
69	Akgama sp.	bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel	99	2022-07-15
70	Bjison bison	ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac	76	2021-09-06
71	Psheudalopex gymnocercus	tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis	31	2022-01-16
72	Acrgobates pygmaeus	metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh	45	2022-05-04
73	Alopfochen aegyptiacus	volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea	62	2021-12-04
74	Phascdogale tapoatafa	suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae	46	2022-03-05
75	Lycosas godeffroyi	amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec	55	2021-08-29
76	Lepus taownsendii	ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et	6	2022-03-31
77	Cyrtodacmtylus louisiadensis	luctus et ultrices posuere cubilia curae nulla dapibus dolor vel	68	2021-10-26
78	unavailabnle	aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien	18	2022-08-06
79	Cynictis pbenicillata	nulla quisque arcu libero rutrum ac lobortis vel dapibus at	75	2022-03-10
80	Vulpes cinevreoargenteus	rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet	82	2022-03-24
81	Dendrohyrax cbrucel	rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi	51	2022-06-05
82	Oreamnos amerxicanus	ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor	60	2022-02-10
83	Centrocercus uxrophasianus	sagittis dui vel nisl duis ac nibh fusce lacus purus	32	2021-09-29
84	Paraxerus cepapzi	rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa	72	2021-09-26
85	Phacochoerus aetzhiopus	vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel	69	2022-01-15
86	kLepus townsendii	augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit	32	2022-03-27
87	Vjaranus salvator	sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim	94	2022-08-04
88	Dahcelo novaeguineae	amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla	94	2021-11-26
89	Aongyx capensis	sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris	92	2021-09-11
90	Tragfelaphus angasi	turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit	66	2022-05-29
91	Oncordhynchus nerka	posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui	32	2022-07-28
92	Pseudaslopex gymnocercus	vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo	41	2022-02-10
93	Choloepsus hoffmani	parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id	16	2021-08-23
94	Oryx gazaella	aenean sit amet justo morbi ut odio cras mi pede	13	2022-01-06
95	Macropus orufus	in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar	35	2022-04-29
96	Amphibolurius barbatus	arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor	63	2021-09-14
97	Columba livyia	quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu	67	2022-01-22
98	Pelecans onocratalus	habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent	37	2021-12-14
99	Phasianus corlchicus	in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat	14	2022-08-09
100	Fratercula ceorniculata	pede lobortis ligula sit amet eleifend pede libero quis orci	78	2022-02-11
\.


--
-- TOC entry 3132 (class 0 OID 17029)
-- Dependencies: 206
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, job_position, company, location, profile_photo_id, profile_url, visibility, created_at) FROM stdin;
1	Constanta	Luckey	cluckey0@bandcamp.com	Senior Developer	Plajo	Tajikistan	1	https://wired.com/consectetuer/adipiscing/elit.png	f	2022-09-19
2	Kimmy	Gasking	kgasking1@drupal.org	Geological Engineer	Aimbu	Philippines	2	http://reverbnation.com/neque/aenean/auctor/gravida.jsp	t	2021-12-12
3	Culley	Blagdon	cblagdon2@yellowpages.com	Media Manager III	Blogtags	Philippines	3	http://bloglovin.com/blandit/nam/nulla/integer/pede.jpg	f	2022-01-18
4	Syd	Kingsnorth	skingsnorth3@hugedomains.com	Chief Design Engineer	Shufflebeat	Peru	4	http://bloglovin.com/arcu/adipiscing.html	t	2021-09-11
5	Maxwell	Khidr	mkhidr4@geocities.com	Senior Developer	Realfire	China	5	http://4shared.com/donec/dapibus.json	t	2022-08-12
6	Aundrea	Yukhnevich	ayukhnevich5@samsung.com	Web Designer II	Yabox	Czech Republic	6	http://fastcompany.com/nisl/venenatis/lacinia/aenean/sit/amet/justo.aspx	t	2022-02-28
7	Maddie	Beagley	mbeagley6@mail.ru	VP Sales	Tazz	France	7	http://wix.com/ornare.jpg	f	2022-04-25
8	Maxwell	Ivey	mivey7@senate.gov	Safety Technician I	Mita	Portugal	8	https://dedecms.com/quam/sollicitudin/vitae/consectetuer/eget.jpg	t	2021-12-01
9	Moll	Forge	mforge8@networkadvertising.org	Speech Pathologist	Meemm	Brazil	9	http://usnews.com/vel.json	f	2022-05-13
10	Wylie	McCloid	wmccloid9@tuttocitta.it	GIS Technical Architect	Cogidoo	Saint Vincent and the Grenadines	10	https://ucsd.edu/justo/pellentesque/viverra.jsp	t	2021-12-03
11	Linet	Gurr	lgurra@google.nl	Professor	Trudoo	China	11	http://harvard.edu/nam/ultrices/libero/non/mattis.jpg	f	2022-04-23
12	Raimund	Curner	rcurnerb@tumblr.com	Senior Quality Engineer	Izio	Russia	12	https://chronoengine.com/neque/libero/convallis/eget/eleifend/luctus.jpg	t	2021-08-29
13	Carole	Denman	cdenmanc@blogger.com	Marketing Assistant	Skiptube	Sweden	13	http://washingtonpost.com/risus/dapibus/augue/vel/accumsan/tellus.jsp	f	2022-05-08
14	Magnum	O'Hartnedy	mohartnedyd@yellowpages.com	Executive Secretary	Yakitri	Honduras	14	https://cocolog-nifty.com/ut.js	f	2021-12-23
15	Barr	Esselen	besselene@skyrock.com	Human Resources Assistant IV	Innojam	Paraguay	15	https://typepad.com/nisi/nam/ultrices/libero.json	f	2022-04-17
16	Maybelle	Papis	mpapisf@cam.ac.uk	Chemical Engineer	Cogilith	South Africa	16	http://icq.com/nec/nisi/vulputate.jsp	t	2022-09-03
17	Jorrie	Churn	jchurng@deliciousdays.com	Paralegal	Pixoboo	France	17	http://facebook.com/ligula/suspendisse.aspx	t	2022-04-26
18	Andrej	Smallpeace	asmallpeaceh@cbsnews.com	Senior Quality Engineer	Photofeed	Indonesia	18	http://indiegogo.com/convallis/tortor/risus/dapibus/augue/vel.js	t	2021-10-27
19	Alford	Ivchenko	aivchenkoi@rambler.ru	Physical Therapy Assistant	Trudoo	United States	19	https://technorati.com/tortor.js	t	2022-02-05
20	Laverne	Checchetelli	lchecchetellij@homestead.com	Recruiting Manager	Fivebridge	Portugal	20	http://tuttocitta.it/ac/neque/duis.jsp	t	2021-08-05
21	Alley	Lowless	alowlessk@xing.com	Marketing Manager	Edgeclub	China	21	http://pbs.org/imperdiet.json	t	2022-03-31
22	Audy	Muddle	amuddlel@51.la	Director of Sales	Yacero	Indonesia	22	http://tripadvisor.com/phasellus/sit.xml	t	2021-10-16
23	Vonni	Pawlik	vpawlikm@histats.com	GIS Technical Architect	Jetpulse	France	23	http://admin.ch/parturient/montes/nascetur.jpg	f	2021-08-26
24	Pauletta	Conneely	pconneelyn@mapquest.com	Senior Quality Engineer	Flashpoint	China	24	https://wikia.com/ut/erat/curabitur/gravida/nisi.aspx	f	2022-06-20
25	Adora	Georgeon	ageorgeono@ameblo.jp	Sales Associate	Brainsphere	Indonesia	25	http://oakley.com/donec.aspx	f	2021-10-18
26	Sal	Currington	scurringtonp@is.gd	Geologist III	Myworks	Turkmenistan	26	https://imgur.com/vestibulum/ante/ipsum/primis/in.js	t	2021-11-13
27	Marcello	Kopke	mkopkeq@arstechnica.com	Research Associate	Photofeed	China	27	http://miitbeian.gov.cn/nunc/purus/phasellus/in/felis/donec.xml	t	2022-07-23
28	Marcello	Kirby	mkirbyr@alexa.com	Senior Cost Accountant	Plambee	Philippines	28	https://google.com/elit/ac/nulla/sed/vel.html	f	2021-11-05
29	Neils	Wortley	nwortleys@usa.gov	Physical Therapy Assistant	Meevee	China	29	http://ycombinator.com/donec/ut/mauris/eget/massa/tempor/convallis.aspx	f	2022-04-05
30	Kristina	Kinane	kkinanet@rambler.ru	Editor	Meembee	Russia	30	http://wunderground.com/mauris/viverra/diam.js	f	2022-08-31
31	Devy	Sarfass	dsarfassu@dion.ne.jp	Cost Accountant	Aimbo	Ukraine	31	https://ft.com/proin/interdum/mauris/non/ligula/pellentesque/ultrices.xml	t	2021-11-07
32	Wynn	Georgel	wgeorgelv@umn.edu	Senior Quality Engineer	Avavee	China	32	http://nytimes.com/imperdiet/sapien.png	f	2022-01-22
33	Benedikta	Brosetti	bbrosettiw@washingtonpost.com	Administrative Assistant III	Eayo	United States	33	http://yahoo.co.jp/quam.xml	t	2022-05-10
34	Darrel	Taleworth	dtaleworthx@uiuc.edu	Accountant IV	Voonder	Macedonia	34	https://alibaba.com/dui.jsp	f	2021-11-25
35	Luce	Maypole	lmaypoley@elpais.com	Account Executive	Npath	China	35	https://scribd.com/eu/massa.html	f	2022-06-04
36	Horton	Fruen	hfruenz@nps.gov	Data Coordiator	Skipstorm	Indonesia	36	http://cam.ac.uk/convallis/nunc/proin/at/turpis.js	f	2022-03-25
37	Lenee	Ewings	lewings10@globo.com	Analyst Programmer	Yakidoo	Philippines	37	http://umich.edu/porta/volutpat/erat/quisque/erat/eros.xml	f	2022-08-13
38	Vanna	Lambertazzi	vlambertazzi11@trellian.com	Quality Engineer	Skynoodle	El Salvador	38	http://unesco.org/eget.xml	t	2021-10-05
39	Rosmunda	Ducker	rducker12@yelp.com	Senior Developer	Riffwire	China	39	https://telegraph.co.uk/aliquam/erat/volutpat/in/congue.xml	t	2022-02-14
40	Myron	Havard	mhavard13@epa.gov	Paralegal	Topicblab	China	40	http://intel.com/euismod/scelerisque.png	t	2022-03-07
41	Anne-marie	Tremblett	atremblett14@edublogs.org	Assistant Manager	Gabspot	Russia	41	http://last.fm/aenean/fermentum/donec/ut/mauris.aspx	t	2021-11-10
42	Aleta	Keighley	akeighley15@dedecms.com	Sales Associate	Aimbu	Philippines	42	http://google.fr/pulvinar/nulla/pede.jpg	f	2022-06-06
43	Franni	Paolone	fpaolone16@nba.com	Recruiter	Podcat	Portugal	43	https://cdc.gov/aliquet/massa/id/lobortis/convallis.aspx	f	2022-06-25
44	Valentine	Pagelsen	vpagelsen17@github.io	Paralegal	Fadeo	China	44	https://domainmarket.com/donec/pharetra.xml	t	2021-09-07
45	Derrik	Philippart	dphilippart18@jigsy.com	Software Test Engineer IV	Livetube	Kyrgyzstan	45	http://noaa.gov/in/porttitor.aspx	t	2022-03-27
46	Tabby	Bleythin	tbleythin19@furl.net	Research Associate	Twinder	Thailand	46	http://bing.com/morbi/a/ipsum.js	t	2022-06-12
47	Lilian	Jaulmes	ljaulmes1a@arstechnica.com	Professor	Zooxo	Canada	47	https://blog.com/amet/lobortis/sapien/sapien/non/mi/integer.aspx	f	2022-01-02
48	Arlin	Wadwell	awadwell1b@gizmodo.com	Junior Executive	Agimba	Portugal	48	http://angelfire.com/arcu/sed/augue/aliquam/erat.png	f	2022-02-08
49	Shanie	Kears	skears1c@meetup.com	Technical Writer	Wordtune	Thailand	49	http://google.fr/turpis/sed/ante/vivamus/tortor.png	f	2021-11-22
50	Phaedra	O'Collopy	pocollopy1d@wordpress.org	Actuary	Edgeclub	Philippines	50	https://blogs.com/vulputate/nonummy.jsp	f	2022-08-18
51	Maxim	Bibb	mbibb1e@dyndns.org	Professor	Fatz	China	51	https://newsvine.com/lacinia.xml	t	2022-06-10
52	Clemmy	Pettko	cpettko1f@rediff.com	Quality Engineer	Katz	Brazil	52	https://mapquest.com/sed.js	f	2022-08-29
53	Egan	Lauridsen	elauridsen1g@sina.com.cn	Senior Cost Accountant	Buzzshare	Japan	53	https://cyberchimps.com/curabitur/in.aspx	t	2021-10-11
54	Vince	Lockyear	vlockyear1h@printfriendly.com	Teacher	Photofeed	Vietnam	54	https://forbes.com/ultrices/vel/augue/vestibulum.jpg	t	2022-08-27
55	Pansie	Jacquemet	pjacquemet1i@omniture.com	VP Marketing	Skivee	China	55	https://un.org/sed/augue/aliquam/erat/volutpat/in/congue.html	f	2022-07-03
56	Angelica	Danby	adanby1j@npr.org	Structural Analysis Engineer	InnoZ	Panama	56	https://wunderground.com/amet/sapien/dignissim/vestibulum.png	f	2022-05-02
57	Pen	Durkin	pdurkin1k@themeforest.net	Desktop Support Technician	Gabtune	China	57	https://unesco.org/odio/in/hac/habitasse/platea/dictumst/maecenas.png	t	2022-06-08
58	Aloise	De Antoni	adeantoni1l@technorati.com	Professor	Mydeo	Philippines	58	http://wiley.com/diam/id/ornare/imperdiet/sapien.html	t	2021-09-27
59	Ezequiel	Fawdry	efawdry1m@ustream.tv	Sales Representative	Eabox	Russia	59	http://ifeng.com/pulvinar/sed.html	t	2022-01-01
60	Shanda	Neilly	sneilly1n@studiopress.com	Budget/Accounting Analyst II	Dabfeed	Morocco	60	https://myspace.com/tellus/nulla/ut/erat.js	f	2022-07-26
61	Heda	Trethowan	htrethowan1o@newsvine.com	Social Worker	Realcube	Pakistan	61	https://ow.ly/nibh/in/lectus/pellentesque/at/nulla/suspendisse.jpg	t	2021-10-22
62	Krissy	Friedenbach	kfriedenbach1p@123-reg.co.uk	Developer I	Quinu	Palestinian Territory	62	https://columbia.edu/nibh/in.jpg	t	2022-01-08
63	Nero	Gaythwaite	ngaythwaite1q@craigslist.org	Electrical Engineer	Fivespan	Poland	63	http://spotify.com/arcu.jpg	t	2022-03-30
64	Gawen	Rossbrooke	grossbrooke1r@unicef.org	Health Coach IV	Skyvu	Uruguay	64	https://addthis.com/lectus/pellentesque/at/nulla/suspendisse/potenti/cras.html	f	2021-11-21
65	Blythe	Goodlett	bgoodlett1s@census.gov	Professor	Aimbu	France	65	https://nba.com/non/velit/nec/nisi.jpg	t	2021-11-04
66	Rockwell	Critchell	rcritchell1t@soup.io	Geological Engineer	Photolist	Russia	66	http://globo.com/potenti.html	f	2022-07-07
67	Stella	Ryce	sryce1u@elegantthemes.com	Senior Cost Accountant	Jayo	China	67	http://printfriendly.com/sed/vestibulum/sit/amet/cursus/id.png	t	2022-07-09
68	Roley	Dodgson	rdodgson1v@abc.net.au	Senior Editor	Voonder	Poland	68	https://usgs.gov/orci/nullam/molestie/nibh/in.json	t	2022-04-27
69	Merell	Wittke	mwittke1w@clickbank.net	Executive Secretary	Skidoo	Indonesia	69	https://redcross.org/lorem/ipsum/dolor/sit/amet.json	f	2022-02-09
70	Colette	Sachno	csachno1x@vinaora.com	Analyst Programmer	Dablist	France	70	http://nydailynews.com/arcu/sed.png	t	2022-05-08
71	Winona	Cleminson	wcleminson1y@google.co.jp	Registered Nurse	Shufflester	Russia	71	https://meetup.com/duis/faucibus/accumsan.html	f	2022-05-15
72	Sarge	Nozzolinii	snozzolinii1z@nydailynews.com	Nurse Practicioner	Vinder	Kazakhstan	72	http://weibo.com/nisl/nunc/nisl.html	f	2022-06-17
73	Lou	Cleife	lcleife20@bravesites.com	Internal Auditor	Cogilith	United States	73	http://ftc.gov/aliquam/non.js	t	2021-11-15
74	Carroll	Jailler	cjailler21@nature.com	Environmental Tech	Myworks	Brazil	74	http://wisc.edu/mus/etiam/vel.js	f	2022-09-25
75	Bessy	Boland	bboland22@jiathis.com	Safety Technician I	Quaxo	France	75	https://cornell.edu/semper/est.png	f	2022-06-06
76	Bale	Denecamp	bdenecamp23@ca.gov	Desktop Support Technician	Meevee	Philippines	76	http://fda.gov/id/pretium/iaculis/diam/erat/fermentum/justo.aspx	f	2022-01-15
77	Jordan	McRoberts	jmcroberts24@xing.com	Operator	Feedfish	Brazil	77	http://wikia.com/convallis/nulla/neque/libero.jsp	t	2022-03-30
78	Alexandro	Karran	akarran25@livejournal.com	Recruiting Manager	Devpulse	United States	78	https://apple.com/cras/mi.json	t	2022-09-06
79	Margarethe	Yurikov	myurikov26@t.co	Chemical Engineer	Shufflester	Thailand	79	http://clickbank.net/erat/volutpat/in.png	f	2022-05-22
80	Lammond	Cawthery	lcawthery27@360.cn	Software Consultant	Plambee	Sweden	80	http://mac.com/faucibus/orci.png	t	2021-11-19
81	Giulio	Davioud	gdavioud28@upenn.edu	Payment Adjustment Coordinator	Omba	China	81	https://nbcnews.com/quisque/arcu.html	f	2022-07-14
82	Erwin	Moyse	emoyse29@eventbrite.com	Administrative Officer	Dazzlesphere	Russia	82	https://techcrunch.com/a/nibh/in.jpg	f	2022-07-11
83	Cheslie	Cowthard	ccowthard2a@ovh.net	Speech Pathologist	Voonyx	Argentina	83	http://blog.com/faucibus/orci/luctus/et/ultrices/posuere/cubilia.json	t	2021-08-09
84	Ulric	Fairfull	ufairfull2b@zimbio.com	Clinical Specialist	Dabjam	Poland	84	http://seesaa.net/sed/sagittis/nam.json	t	2022-03-29
85	Lorraine	Abbay	labbay2c@pagesperso-orange.fr	Financial Advisor	Jazzy	China	85	http://unblog.fr/quis/libero/nullam/sit.aspx	f	2022-04-26
86	Mason	Brooke	mbrooke2d@goodreads.com	Quality Control Specialist	Livepath	Russia	86	http://opera.com/sed/tincidunt/eu/felis.xml	f	2022-09-18
87	Peg	Parlott	pparlott2e@cocolog-nifty.com	Cost Accountant	Mydeo	Cyprus	87	https://mapy.cz/pellentesque/at/nulla.jsp	f	2022-03-12
88	Crin	Mowsley	cmowsley2f@blogs.com	Professor	Leexo	Brazil	88	http://google.com.au/ac/leo.xml	f	2021-09-09
89	Gisela	Le Franc	glefranc2g@admin.ch	Legal Assistant	Demivee	Canada	89	https://illinois.edu/vulputate/ut/ultrices/vel.aspx	f	2022-05-11
90	Florella	Willbond	fwillbond2h@nasa.gov	Data Coordiator	Oyonder	Nicaragua	90	https://independent.co.uk/amet/turpis/elementum/ligula/vehicula.json	t	2022-03-06
91	Rand	Wilmington	rwilmington2i@phpbb.com	Human Resources Manager	Photojam	Indonesia	91	https://sciencedirect.com/ac/consequat/metus/sapien/ut.json	f	2022-01-20
92	Duke	Webb	dwebb2j@gnu.org	Tax Accountant	Wikizz	Mauritius	92	http://ning.com/tellus/in/sagittis.xml	f	2022-07-30
93	Rafe	Molohan	rmolohan2k@theguardian.com	Quality Control Specialist	Wikivu	Latvia	93	https://deviantart.com/aliquam/non/mauris/morbi.js	t	2022-08-06
94	Willis	Treen	wtreen2l@wired.com	Human Resources Manager	Dynava	Ukraine	94	http://devhub.com/porttitor/pede/justo/eu.jsp	f	2022-04-12
95	Susie	McClaughlin	smcclaughlin2m@omniture.com	Nuclear Power Engineer	Vitz	Russia	95	http://ezinearticles.com/id/luctus/nec/molestie/sed/justo.jsp	f	2022-01-07
96	Marysa	Boice	mboice2n@chicagotribune.com	Software Test Engineer II	Tagcat	Norway	96	https://paginegialle.it/luctus/et/ultrices.js	f	2022-05-07
97	Martie	Roache	mroache2o@ning.com	Web Developer III	Browsecat	Colombia	97	http://tamu.edu/tortor.json	t	2022-03-13
98	Karly	Mallinar	kmallinar2p@hostgator.com	Data Coordiator	Dabshots	Indonesia	98	http://google.it/sodales/sed/tincidunt/eu/felis.png	f	2022-01-21
99	Adore	Kermath	akermath2q@npr.org	Recruiter	Brainbox	Serbia	99	https://amazon.de/proin/at/turpis.json	t	2021-12-18
100	Juline	Maxworthy	jmaxworthy2r@jimdo.com	Statistician I	Wikizz	Portugal	100	http://flickr.com/ligula/sit/amet.png	t	2022-02-02
\.


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 229
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 217
-- Name: connections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.connections_id_seq', 1, false);


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 215
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 211
-- Name: docs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.docs_id_seq', 1, false);


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 209
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.educations_id_seq', 1, false);


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 221
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 207
-- Name: experiencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.experiencies_id_seq', 1, false);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 227
-- Name: learnings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.learnings_id_seq', 1, false);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 213
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 223
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 231
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 205
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 2976 (class 2606 OID 17206)
-- Name: companies companies_company_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_company_url_key UNIQUE (company_url);


--
-- TOC entry 2978 (class 2606 OID 17204)
-- Name: companies companies_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_email_key UNIQUE (email);


--
-- TOC entry 2980 (class 2606 OID 17202)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 17108)
-- Name: connections connections_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id);


--
-- TOC entry 2958 (class 2606 OID 17099)
-- Name: contacts contacts_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_email_key UNIQUE (email);


--
-- TOC entry 2960 (class 2606 OID 17097)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 2952 (class 2606 OID 17075)
-- Name: docs docs_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.docs
    ADD CONSTRAINT docs_pkey PRIMARY KEY (id);


--
-- TOC entry 2954 (class 2606 OID 17077)
-- Name: docs docs_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.docs
    ADD CONSTRAINT docs_url_key UNIQUE (url);


--
-- TOC entry 2950 (class 2606 OID 17063)
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- TOC entry 2968 (class 2606 OID 17150)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 17054)
-- Name: experiencies experiencies_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.experiencies
    ADD CONSTRAINT experiencies_pkey PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 17118)
-- Name: groups groups_group_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_group_name_key UNIQUE (group_name);


--
-- TOC entry 2966 (class 2606 OID 17116)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 17169)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2974 (class 2606 OID 17188)
-- Name: learnings learnings_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.learnings
    ADD CONSTRAINT learnings_pkey PRIMARY KEY (id);


--
-- TOC entry 2956 (class 2606 OID 17088)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 2970 (class 2606 OID 17158)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 2984 (class 2606 OID 17627)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 2986 (class 2606 OID 17629)
-- Name: posts posts_post_title_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_post_title_key UNIQUE (post_title);


--
-- TOC entry 2941 (class 2606 OID 17039)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2944 (class 2606 OID 17037)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2946 (class 2606 OID 17041)
-- Name: users users_profile_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_profile_url_key UNIQUE (profile_url);


--
-- TOC entry 2981 (class 1259 OID 17656)
-- Name: posts_created_at_fk; Type: INDEX; Schema: public; Owner: gb_user
--

CREATE INDEX posts_created_at_fk ON public.posts USING btree (created_at);


--
-- TOC entry 2982 (class 1259 OID 17655)
-- Name: posts_creator_id; Type: INDEX; Schema: public; Owner: gb_user
--

CREATE INDEX posts_creator_id ON public.posts USING btree (creator_id);


--
-- TOC entry 2942 (class 1259 OID 17657)
-- Name: users_id_fk; Type: INDEX; Schema: public; Owner: gb_user
--

CREATE INDEX users_id_fk ON public.users USING btree (id);


--
-- TOC entry 3002 (class 2606 OID 17589)
-- Name: companies companies_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_id FOREIGN KEY (id) REFERENCES public.jobs(id);


--
-- TOC entry 2994 (class 2606 OID 17544)
-- Name: connections connections_requested_by_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_requested_by_user_id FOREIGN KEY (requested_by_user_id) REFERENCES public.users(id);


--
-- TOC entry 2995 (class 2606 OID 17549)
-- Name: connections connections_requested_to_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_requested_to_user_id FOREIGN KEY (requested_to_user_id) REFERENCES public.users(id);


--
-- TOC entry 2993 (class 2606 OID 17539)
-- Name: contacts contacts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_id_fk FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 2990 (class 2606 OID 17524)
-- Name: docs docs_owner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.docs
    ADD CONSTRAINT docs_owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2989 (class 2606 OID 17519)
-- Name: educations educations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_id_fk FOREIGN KEY (id) REFERENCES public.experiencies(id);


--
-- TOC entry 2997 (class 2606 OID 17569)
-- Name: events events_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id FOREIGN KEY (id) REFERENCES public.groups(id);


--
-- TOC entry 2988 (class 2606 OID 17514)
-- Name: experiencies experiencies_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.experiencies
    ADD CONSTRAINT experiencies_id_fk FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 2996 (class 2606 OID 17554)
-- Name: groups groups_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_creator_id FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- TOC entry 3000 (class 2606 OID 17584)
-- Name: jobs jobs_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_id FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 3001 (class 2606 OID 17594)
-- Name: learnings learnings_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.learnings
    ADD CONSTRAINT learnings_id FOREIGN KEY (id) REFERENCES public.companies(id);


--
-- TOC entry 2991 (class 2606 OID 17529)
-- Name: messages messages_from_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_from_user_id_fk FOREIGN KEY (from_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2992 (class 2606 OID 17534)
-- Name: messages messages_to_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_to_user_id_fk FOREIGN KEY (to_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2999 (class 2606 OID 17579)
-- Name: news news_from_groups_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_from_groups_id FOREIGN KEY (from_groups_id) REFERENCES public.users(id);


--
-- TOC entry 2998 (class 2606 OID 17574)
-- Name: news news_from_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_from_user_id FOREIGN KEY (from_user_id) REFERENCES public.users(id);


--
-- TOC entry 3003 (class 2606 OID 17632)
-- Name: posts posts_id; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_id FOREIGN KEY (id) REFERENCES public.groups(id);


--
-- TOC entry 2987 (class 2606 OID 17509)
-- Name: users users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_fk FOREIGN KEY (id) REFERENCES public.companies(id);


-- Completed on 2022-08-30 08:10:53

--
-- PostgreSQL database dump complete
--

