--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.class OWNER TO postgres;

--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    location character varying NOT NULL,
    description character varying NOT NULL,
    start text NOT NULL,
    "end" text NOT NULL,
    recurrence text[] NOT NULL,
    "extendedProperties" text NOT NULL,
    reminders text NOT NULL,
    "summaryId" uuid,
    "scheduleId" uuid
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    email text,
    display_name text,
    google_id text,
    public_key text,
    private_key text
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- Name: visitList; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."visitList" (
    id integer NOT NULL,
    student_id integer,
    visit_time double precision,
    event_id uuid
);


ALTER TABLE public."visitList" OWNER TO postgres;

--
-- Name: visit_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visit_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visit_list_id_seq OWNER TO postgres;

--
-- Name: visit_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visit_list_id_seq OWNED BY public."visitList".id;


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Name: visitList id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."visitList" ALTER COLUMN id SET DEFAULT nextval('public.visit_list_id_seq'::regclass);


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class (id, name) FROM stdin;
a1329338-8498-4793-8b38-d249f98cdc11	╨Я╤А╨╛╨│╤А╨░╨╝╨╝╨╜╨░╤П ╨╕╨╜╨╢
0a274a06-2719-4148-a32e-def8375c0cc8	╨Р╨╗╨│╨╛╤А╨╕╤В╨╝╤Л ╨╕ ╤Б╤В╤А╤Г╨║╤В ╨┤╨░╨╜╨╜╨╜╤Л╤Е
d4cc007a-7d06-40d2-af8a-d1f5f79387b1	╨а╨░╨╖╤А╨░╨▒╨╛╤В╨║╨░ ╤Б╨╡╤А╨▓ ╨┐╤А╨╕╨╗╨╛╨╢
6fcc02dd-8206-4275-9691-f664be5dcc02	╨Р╨╗╨│ ╨╕ ╤Б╤В╤А╤Г╨║╤В ╨┤╨░╨╜
6977d693-4392-4c1a-8a5d-a84471e616ef	╨Я╤А╨╛╨│╤А╨░╨╝╨╝╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╨╕ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨║╨░ ╨▓╨╡╨▒-╨┐╤А╨╕╨╗╨╛╨╢╨╡╨╜╨╕╨╣
1ef1cb17-dda9-4462-ba34-78d88e3ee412	╨Ь╨╡╨╜╨╡╨┤╨╢╨╝╨╡╨╜╤В
efeef846-dde6-4ce3-8dae-d11adfe8ce4f	╨Ш╨╜╨╛╤Б╤В╤А ╤П╨╖(╨б╨╡╤В╤В╨░╤А╨╛╨▓╨░ ╨Ь.╨Ф.)
0eb034ff-ac1b-4686-84d0-79929271bd67	╨Р╨╜╨░╨╗╨╕╨╖ ╨┤╨░╨╜╨╜╤Л╤Е
1bd874b1-1b03-433a-a977-e6c8a01e634d	╨Ь╨╛╨┤╨╡╨╗╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╤Б╨╛╤Ж-╤Н╨║╨╛╨╜╨╛╨╝╨╕╤З╨╡╤Б╨║╨╕╤Е ╨╕ ╨┐╨╛╨╗╨╕╤В ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╨▓
14e9f7c0-9727-40a3-a596-bb9cbb50f3bf	╨Я╨░╤А╨░╨╗╨╗╨╡╨╗╤М╨╜╤Л╨╡ ╨╕ ╤А╨░╤Б╨┐╤А╨╡╨┤╨╡╨╗ ╨▓╤Л╤З╨╕╤Б╨╗
9e5af538-21e0-40e0-ba57-4936d4fbecc4	╨Р╨╗╨│╨╛╤А╨╕╤В╨╝╤Л ╨╕ ╤Б╤В╤А╤Г╨║╤В ╨┤╨░╨╜╨╜╤Л╤Е
28d58068-cc1e-4c1c-a542-dcd4e08162f3	╨Ь╨░╤И╨╕╨╜╨╜╨╛╨╡ ╨╛╨▒╤Г╤З(╨┤╨╛╤Ж ╨Р╨▒╨╗╨░╨╡╨▓╨░ ╨Ы.╨Э)
ab0e7a60-1bdd-4387-a8d9-7ea14f44a74a	╨Р╨╗╨│╨╛╤А╨╕╤В╨╝╤Л ╨╕ ╤Б╤В╤А╤Г╨║╤В╤Г╤А╤Л ╨┤╨░╨╜╨╜╤Л╤Е
3088681f-4e11-453c-9be5-5b5cd387f00b	╨Ь╨░╤И╨╕╨╜╨╜╨╛╨╡ ╨╛╨▒╤Г╤З╨╡╨╜╨╕╨╡(╨║.╤В.╨╜ ╨┤╨╛╤Ж ╨Р╨▒╨╗╨░╨╡╨▓╨░ ╨Ы.╨Э.)
46f601a9-df40-462a-9da1-4631ab11ea52	╨Я╤А╨╛╨╡╨║╤В╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╨╕╨╜╤Д╨╛╤А╨╝╨░╤Ж╨╕╨╛╨╜╨╜╤Л╤Е ╤Б╨╕╤Б╤В╨╡╨╝
7ff77551-a8a9-4911-b744-9b4e52705333	╨Я╤А╨╛╨╡╨║╤В╨╜╤Л╨╣ ╨┐╤А╨░╨║╤В╨╕╨║╤Г╨╝
c002be7f-c246-47db-9c25-2726324cad04	╨Р╨╗╨│╨╛╤А╨╕╤В╨╝╤Л ╨║╨╛╨╝╨┐ ╨░╨╜╨╕╨╝╨░╤Ж╨╕╨╕
6976774b-f4cf-4afc-8991-a261448d0ff6	╨Ь╨░╤В╨╡╨╝╨░╤В╨╕╤З╨╡╤Б╨║╨░╤П ╨╗╨╛╨│╨╕╨║╨░ ╨╕ ╤В╨╡╨╛╤А╨╕╤П ╨░╨╗╨│╨╛╤А╨╕╤В╨╝╨╛╨▓
c98ebbb1-2968-4f97-9fdd-234751ab8814	╨Ю╨▒╤А╨░╨▒╨╛╤В╨║╨░ ╨╕╨╖╨╛╨▒╤А╨░╨╢╨╡╨╜╨╕╨╣ ╨╕ ╨╝╤Г╨╗╤М╤В╨╕╨╝╨╡╨┤╨╕╨░
713b820a-a7f3-4fa4-9241-6804d0734f1d	╨Ь╨░╤В╨╡╨╝╨░╤В╨╕╤З╨╡╤Б╨║╨░╤П ╨╗╨╛╨│╨╕╨║╨░╨╕ ╤В╨╡╨╛╤А╨╕╤П ╨░╨╗╨│╨╛╤А╨╕╤В╨╝╨╛╨▓
22576feb-a002-4935-a156-727d119d7a47	╨Я╤А╨╛╨│╤А╨░╨╝╨╝╨╕╤А╨╛╨▓ ╨╕ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨║╨░ ╨▓╨╡╨▒-╨┐╤А╨╕╨╗╨╛╨╢╨╡╨╜╨╕╨╣ ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э
171802c6-6883-4dfb-853d-7fb571ca7622	╨Ш╨╜╨╛╤Б╤В╤А ╤П╨╖(╨Ч╨╕╤П╨┤╨╕╨╜╨╛╨▓╨░ ╨Ф.╨Р.)
9100f68e-7975-43ac-9aa2-632859e72a8c	╨Ш╨╜╨╛╤Б╤В╤А ╤П╨╖(╨Э╨░╤Б╨╕╨▒╤Г╨╗╨╗╨░╨╡╨▓╨░ ╨н.╨а)
4d02839a-48ba-4783-a23d-5b0cc601c1c1	╨Я╨░╤А╨░╨╗╨╗╨╡╨╗╤М╨╜╤Л╨╡ ╨╕ ╤А╨░╤Б╨┐╤А╨╡╨┤╨╡╨╗╨╡╨╜╨╜╤Л╨╡ ╨▓╤Л╤З╨╕╤Б╨╗╨╡╨╜╨╕╤П
db0e6068-cc2b-4283-ad37-db35b19c41cd	╨Р╨╗╨│╨╛╤А╨╕╤В╨╝╤Л ╨║╨╛╨╝╨┐╤М╤О╤В╨╡╤А╨╜╨╛╨╣ ╨░╨╜╨╕╨╝╨░╤Ж╨╕╨╕
bebfe66e-fef8-4bc7-bddc-9a5bb571000f	╨а╨░╨╖╤А╨░╨▒╨╛╤В╨║╨░ ╤Б╨╡╤А╨▓╨╡╤А╨╜╤Л╤Е ╨┐╤А╨╕╨╗╨╛╨╢╨╡╨╜╨╕╨╣
562836f0-4476-47b3-a2c8-46d15ee46970	╨Я╤А╨╛╨│╤А╨░╨╝╨╝╨╜╨░╤П ╨╕╨╜╨╢╨╡╨╜╨╡╤А╨╕╤П
25ce4721-f09e-489d-a9a5-7c011d0e4944	╨Я╤А╨╛╨│╤А╨░╨╝╨╝ ╨╕ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨║╨░ ╨▓╨╡╨▒-╨┐╤А╨╕╨╗╨╛╨╢
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (id, location, description, start, "end", recurrence, "extendedProperties", reminders, "summaryId", "scheduleId") FROM stdin;
671a4b9e-6f34-4313-a2bf-3d99fd7940b5	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б	{"dateTime":"2023-01-30T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	a1329338-8498-4793-8b38-d249f98cdc11	39c1d3d4-26eb-42ff-bec8-589625d199e3
de582ebc-5c50-4bde-8163-b79c51c47bed	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Р╨▒╨╗╤П╨╡╨▓ ╨Ь.╨а	{"dateTime":"2023-01-30T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	0a274a06-2719-4148-a32e-def8375c0cc8	39c1d3d4-26eb-42ff-bec8-589625d199e3
8cf5d2d8-971e-4314-848b-9d10c1c3daae	238╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.	{"dateTime":"2023-01-30T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	d4cc007a-7d06-40d2-af8a-d1f5f79387b1	39c1d3d4-26eb-42ff-bec8-589625d199e3
4995c234-0b68-44fc-b351-39d948a5f619	237, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б	{"dateTime":"2023-01-30T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	a1329338-8498-4793-8b38-d249f98cdc11	39c1d3d4-26eb-42ff-bec8-589625d199e3
3c32430d-2886-41c3-b1e8-30ca73b8f981	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨в╨░╨╜╨╕╤И╨╡╨▓╨░  ╨б.╨б.	{"dateTime":"2023-01-30T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	6fcc02dd-8206-4275-9691-f664be5dcc02	39c1d3d4-26eb-42ff-bec8-589625d199e3
43e68a59-76cc-410c-a498-4dbe6fb438ff	233╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤В.╨╜.╨┤╨╛╤Ж ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.	{"dateTime":"2023-01-30T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	6977d693-4392-4c1a-8a5d-a84471e616ef	39c1d3d4-26eb-42ff-bec8-589625d199e3
c933479e-2a61-4736-92a3-dd50a2102132	239, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤Н.╨╜.╨┤╨╛╤Ж ╨Р╨┤╨╡╨╗╤М╤Б╨╡╨╕╤В╨╛╨▓╨░ ╨н.╨С.	{"dateTime":"2023-01-30T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	1ef1cb17-dda9-4462-ba34-78d88e3ee412	39c1d3d4-26eb-42ff-bec8-589625d199e3
82e88544-f5d1-4432-9491-0c7e2942ad5c	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: 	{"dateTime":"2023-01-30T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	efeef846-dde6-4ce3-8dae-d11adfe8ce4f	39c1d3d4-26eb-42ff-bec8-589625d199e3
45fa24ee-c0bf-4f2b-b878-dcfd54ec1671	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┤╨╛╤Ж ╨Я╨╡╤А╨▓╤Г╨╜ ╨Ю.╨Х	{"dateTime":"2023-01-30T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	0eb034ff-ac1b-4686-84d0-79929271bd67	39c1d3d4-26eb-42ff-bec8-589625d199e3
ed8ea774-8a18-42e5-a0a9-f76acc0d3fa8	238╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨н╨╝╨╕╤А╨╛╨▓╨░ ╨н.╨б	{"dateTime":"2023-01-30T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	a1329338-8498-4793-8b38-d249f98cdc11	39c1d3d4-26eb-42ff-bec8-589625d199e3
336be38e-9a90-4b4d-a0d6-60f53986f3b9	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤Д-╨╝.╨╜.╨┤╨╛╤Ж ╨г╨╝╨╡╤А╨╛╨▓ ╨н.╨Р.	{"dateTime":"2023-01-30T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	1bd874b1-1b03-433a-a977-e6c8a01e634d	39c1d3d4-26eb-42ff-bec8-589625d199e3
6a1089e4-475a-4677-8b57-1ff00c0aca43	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б	{"dateTime":"2023-01-30T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	14e9f7c0-9727-40a3-a596-bb9cbb50f3bf	39c1d3d4-26eb-42ff-bec8-589625d199e3
1d667cfb-2314-4018-9297-d62cca005b44	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤Н.╨╜.╨┤╨╛╤Ж ╨Р╨┤╨╡╨╗╤М╤Б╨╡╨╕╤В╨╛╨▓╨░ ╨н.╨С.	{"dateTime":"2023-01-30T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	1ef1cb17-dda9-4462-ba34-78d88e3ee412	39c1d3d4-26eb-42ff-bec8-589625d199e3
cfbd9510-f327-446d-8c78-79fbab98ca5c	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б	{"dateTime":"2023-01-30T16:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T18:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	14e9f7c0-9727-40a3-a596-bb9cbb50f3bf	39c1d3d4-26eb-42ff-bec8-589625d199e3
6fda61eb-c12f-454f-8a6e-56a10db295d3	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤Д-╨╝.╨╜.╨┤╨╛╤Ж ╨г╨╝╨╡╤А╨╛╨▓ ╨н.╨Р.	{"dateTime":"2023-01-30T16:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-30T18:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=MO;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	1bd874b1-1b03-433a-a977-e6c8a01e634d	39c1d3d4-26eb-42ff-bec8-589625d199e3
8d795dd7-d91b-44c8-90e2-8f7f6ac65565	239, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨н╨╝╨╕╤А╨╛╨▓╨░ ╨н.╨б	{"dateTime":"2023-01-31T09:40:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T11:10:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	a1329338-8498-4793-8b38-d249f98cdc11	39c1d3d4-26eb-42ff-bec8-589625d199e3
77d91f38-2f93-43a6-b146-70a379aced7c	237, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.	{"dateTime":"2023-01-31T09:40:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T11:10:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	d4cc007a-7d06-40d2-af8a-d1f5f79387b1	39c1d3d4-26eb-42ff-bec8-589625d199e3
a32a14ca-5fc2-49d4-9bf8-c80f32285ea1	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┤╨╛╤Ж ╨Я╨╡╤А╨▓╤Г╨╜ ╨Ю.╨Х	{"dateTime":"2023-01-31T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	0eb034ff-ac1b-4686-84d0-79929271bd67	39c1d3d4-26eb-42ff-bec8-589625d199e3
2899f79b-58a4-4747-81ff-240fbfc2de4c	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨в╨░╨╜╨╕╤И╨╡╨▓╨░  ╨б.╨б.	{"dateTime":"2023-01-31T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	9e5af538-21e0-40e0-ba57-4936d4fbecc4	39c1d3d4-26eb-42ff-bec8-589625d199e3
eb6fab31-683b-4efd-b8dd-c1ff3401ec31	233╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: Machine Learning	{"dateTime":"2023-01-31T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	28d58068-cc1e-4c1c-a542-dcd4e08162f3	39c1d3d4-26eb-42ff-bec8-589625d199e3
8b8d28cb-76b3-487b-b2e0-9473daad786f	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┤.╨┐.╨╜.╨┐╤А╨╛╤Д ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓╨░ ╨Ч.╨б.	{"dateTime":"2023-01-31T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	ab0e7a60-1bdd-4387-a8d9-7ea14f44a74a	39c1d3d4-26eb-42ff-bec8-589625d199e3
c3908b07-f0d2-4daa-8cd1-fa6e8b487142	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: Machine Learning	{"dateTime":"2023-01-31T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	3088681f-4e11-453c-9be5-5b5cd387f00b	39c1d3d4-26eb-42ff-bec8-589625d199e3
3964816e-ff2e-4768-b25d-2d12125a4dc3	239, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: 	{"dateTime":"2023-01-31T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	efeef846-dde6-4ce3-8dae-d11adfe8ce4f	39c1d3d4-26eb-42ff-bec8-589625d199e3
92d2ce91-cd0e-4dc9-bd6d-6b28851b91d8	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤Н.╨╜.╨┤╨╛╤Ж ╨Р╨┤╨╡╨╗╤М╤Б╨╡╨╕╤В╨╛╨▓╨░ ╨н.╨С.	{"dateTime":"2023-01-31T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	1ef1cb17-dda9-4462-ba34-78d88e3ee412	39c1d3d4-26eb-42ff-bec8-589625d199e3
ed71afed-d87b-4af1-ac4f-e1dc7e390319	239, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: Machine Learning	{"dateTime":"2023-01-31T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	3088681f-4e11-453c-9be5-5b5cd387f00b	39c1d3d4-26eb-42ff-bec8-589625d199e3
0064d51c-0de4-432d-8d12-41febcf90a2d	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╤Б╤В.╨┐╤А╨╡╨┐ ╨Р╨▒╨┤╤Г╤А╨░╨╝╨░╨╜╨╛╨▓ ╨Ч.╨и.	{"dateTime":"2023-01-31T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	46f601a9-df40-462a-9da1-4631ab11ea52	39c1d3d4-26eb-42ff-bec8-589625d199e3
2d93cd7d-4d46-44ed-af15-f454289e9ba9	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Р╨▒╨┤╤Г╤А╨░╨╝╨░╨╜╨╛╨▓ ╨Ч.╨и	{"dateTime":"2023-01-31T16:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-01-31T18:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TU;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	46f601a9-df40-462a-9da1-4631ab11ea52	39c1d3d4-26eb-42ff-bec8-589625d199e3
491c2f6e-3586-414d-840f-386e31997bb4	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓ ╨У.╨б	{"dateTime":"2023-02-01T09:40:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T11:10:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	46f601a9-df40-462a-9da1-4631ab11ea52	39c1d3d4-26eb-42ff-bec8-589625d199e3
691b6c46-9c57-4b88-ab4f-d7f9f6f8e500	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨┐.╨╜.╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.	{"dateTime":"2023-02-01T09:40:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T11:10:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	7ff77551-a8a9-4911-b744-9b4e52705333	39c1d3d4-26eb-42ff-bec8-589625d199e3
a64dcf73-c7a3-4b0b-a890-d47a9bdbf29d	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨┐.╨╜.╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.	{"dateTime":"2023-02-01T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	c002be7f-c246-47db-9c25-2726324cad04	39c1d3d4-26eb-42ff-bec8-589625d199e3
90d95409-e520-4747-b3c7-bcef2977ae7d	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓ ╨У.╨б	{"dateTime":"2023-02-01T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	46f601a9-df40-462a-9da1-4631ab11ea52	39c1d3d4-26eb-42ff-bec8-589625d199e3
26ed1bf1-3d4e-48fb-a0ea-812934ff3b69	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.	{"dateTime":"2023-02-01T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	d4cc007a-7d06-40d2-af8a-d1f5f79387b1	39c1d3d4-26eb-42ff-bec8-589625d199e3
f667a36f-af32-4b68-88f4-62535d6ef412	235╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┐╤А╨╡╨┐ ╨Р╨╝╨╡╤В╨╛╨▓ ╨Ю.╨Ь.	{"dateTime":"2023-02-01T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	7ff77551-a8a9-4911-b744-9b4e52705333	39c1d3d4-26eb-42ff-bec8-589625d199e3
52fa3483-bc3e-4fc7-af06-2d913761de9f	238╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨▒.╨╜.╨┤╨╛╤Ж  ╨Ъ╤А╤Л╨╗╨╛╨▓ ╨Т.╨б.	{"dateTime":"2023-02-01T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	6976774b-f4cf-4afc-8991-a261448d0ff6	39c1d3d4-26eb-42ff-bec8-589625d199e3
f6964498-eb83-44e8-b71c-4a7c6430de98	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╤Б╤В ╨┐╨╡╤А╨╡╨┐ ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓ ╨У.╨б.	{"dateTime":"2023-02-01T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	c98ebbb1-2968-4f97-9fdd-234751ab8814	39c1d3d4-26eb-42ff-bec8-589625d199e3
46bba204-a859-4b32-ac02-208d5c1b0d36	239, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨▒.╨╜.╨┤╨╛╤Ж ╨Ъ╤А╤Л╨╗╨╛╨▓ ╨Т.╨б.	{"dateTime":"2023-02-01T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	713b820a-a7f3-4fa4-9241-6804d0734f1d	39c1d3d4-26eb-42ff-bec8-589625d199e3
b4b96878-578d-4bfc-b958-680dc11513a2	2, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Р╨▒╨┤╤Г╤А╨░╨╝╨░╨╜╨╛╨▓ ╨Ч.╨и	{"dateTime":"2023-02-01T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	46f601a9-df40-462a-9da1-4631ab11ea52	39c1d3d4-26eb-42ff-bec8-589625d199e3
c2bbf5d9-bd37-4155-8557-db184ba0cbce	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨┐.╨╜.╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.	{"dateTime":"2023-02-01T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	c002be7f-c246-47db-9c25-2726324cad04	39c1d3d4-26eb-42ff-bec8-589625d199e3
5205a0d3-2bac-44d9-b578-7b6d1f7cf410	233╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: Machine Learning	{"dateTime":"2023-02-01T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	28d58068-cc1e-4c1c-a542-dcd4e08162f3	39c1d3d4-26eb-42ff-bec8-589625d199e3
5e9af018-51a6-4dec-be3c-04c3c5ba2f46	238╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╤Б╤В ╨┐╨╡╤А╨╡╨┐ ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓ ╨У.╨б.	{"dateTime":"2023-02-01T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	c98ebbb1-2968-4f97-9fdd-234751ab8814	39c1d3d4-26eb-42ff-bec8-589625d199e3
b4504966-c97e-49ab-b6cf-2dbefa43c8b4	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М:    .	{"dateTime":"2023-02-01T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	7ff77551-a8a9-4911-b744-9b4e52705333	39c1d3d4-26eb-42ff-bec8-589625d199e3
da421678-1ac4-422b-81a7-7fdc0e8d6bbc	237, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨▒.╨╜.╨┤╨╛╤Ж ╨Ъ╤А╤Л╨╗╨╛╨▓ ╨Т.╨б.	{"dateTime":"2023-02-01T16:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-01T18:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	713b820a-a7f3-4fa4-9241-6804d0734f1d	39c1d3d4-26eb-42ff-bec8-589625d199e3
efa34e76-4a6a-443c-968c-a6f30bf8127e	239, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: 	{"dateTime":"2023-02-02T09:40:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T11:10:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	22576feb-a002-4935-a156-727d119d7a47	39c1d3d4-26eb-42ff-bec8-589625d199e3
95350734-0b06-47b3-90e4-469072604634	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓ ╨У.╨б	{"dateTime":"2023-02-02T09:40:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T11:10:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	c98ebbb1-2968-4f97-9fdd-234751ab8814	39c1d3d4-26eb-42ff-bec8-589625d199e3
ed3f5b7a-eab3-4bfc-9a73-b78cda129ff1	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: 	{"dateTime":"2023-02-02T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	171802c6-6883-4dfb-853d-7fb571ca7622	39c1d3d4-26eb-42ff-bec8-589625d199e3
425b5da3-0738-4a8c-90a6-529706755076	237, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: 	{"dateTime":"2023-02-02T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	9100f68e-7975-43ac-9aa2-632859e72a8c	39c1d3d4-26eb-42ff-bec8-589625d199e3
54ce1f32-882f-4c8e-98ec-7b96b1abfca0	179, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: 	{"dateTime":"2023-02-02T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	171802c6-6883-4dfb-853d-7fb571ca7622	39c1d3d4-26eb-42ff-bec8-589625d199e3
b2b9fd2a-c763-4966-8259-80c72b8f671a	237, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓ ╨У.╨б	{"dateTime":"2023-02-02T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	c98ebbb1-2968-4f97-9fdd-234751ab8814	39c1d3d4-26eb-42ff-bec8-589625d199e3
0162ea8d-9ac8-4716-8e89-586f6fad80f1	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨┐.╨╜.╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.	{"dateTime":"2023-02-02T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	4d02839a-48ba-4783-a23d-5b0cc601c1c1	39c1d3d4-26eb-42ff-bec8-589625d199e3
9dba052e-e4c9-460b-bac0-9e6d54d78262	238╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: 	{"dateTime":"2023-02-02T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	22576feb-a002-4935-a156-727d119d7a47	39c1d3d4-26eb-42ff-bec8-589625d199e3
348b1277-f286-4236-a52b-b4ac15d5c51e	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨┐.╨╜.╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.	{"dateTime":"2023-02-02T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	db0e6068-cc2b-4283-ad37-db35b19c41cd	39c1d3d4-26eb-42ff-bec8-589625d199e3
1bc75018-e2c3-4942-977e-d256582e5e0d	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤В.╨╜.╨┤╨╛╤Ж ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.	{"dateTime":"2023-02-02T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	bebfe66e-fef8-4bc7-bddc-9a5bb571000f	39c1d3d4-26eb-42ff-bec8-589625d199e3
fc438358-9288-4890-a8f1-fd037123a47c	239, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨┐.╨╜.╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.	{"dateTime":"2023-02-02T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	7ff77551-a8a9-4911-b744-9b4e52705333	39c1d3d4-26eb-42ff-bec8-589625d199e3
751b713b-2190-402a-a1ef-cde0b7491bf2	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨┐.╨╜.,╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.	{"dateTime":"2023-02-02T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	562836f0-4476-47b3-a2c8-46d15ee46970	39c1d3d4-26eb-42ff-bec8-589625d199e3
24072363-6222-4bf9-acba-bbdd57aa1bbe	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤В.╨╜.╨┤╨╛╤Ж ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.	{"dateTime":"2023-02-02T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-02T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	bebfe66e-fef8-4bc7-bddc-9a5bb571000f	39c1d3d4-26eb-42ff-bec8-589625d199e3
68f37bf3-21c6-43a1-81ac-842024b8e278	233╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б	{"dateTime":"2023-02-03T09:40:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T11:10:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	db0e6068-cc2b-4283-ad37-db35b19c41cd	39c1d3d4-26eb-42ff-bec8-589625d199e3
98e3fc13-4af3-42cb-8180-2121c2e02adf	237, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┤╨╛╤Ж ╨Я╨╡╤А╨▓╤Г╨╜ ╨Ю.╨Х	{"dateTime":"2023-02-03T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	0eb034ff-ac1b-4686-84d0-79929271bd67	39c1d3d4-26eb-42ff-bec8-589625d199e3
e595c798-9143-468e-9e01-a176f3ba28ca	238╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б	{"dateTime":"2023-02-03T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	db0e6068-cc2b-4283-ad37-db35b19c41cd	39c1d3d4-26eb-42ff-bec8-589625d199e3
6f399788-5ebf-4c28-b6cb-b4c9f9ba3bc4	237, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨в╨░╨╜╨╕╤И╨╡╨▓╨░  ╨б.╨б.	{"dateTime":"2023-02-03T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	6fcc02dd-8206-4275-9691-f664be5dcc02	39c1d3d4-26eb-42ff-bec8-589625d199e3
dcb6a6e9-d2c8-4c09-b38c-6790d5af5c04	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤В.╨╜.╨┤╨╛╤Ж ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.	{"dateTime":"2023-02-03T11:30:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T13:00:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	25ce4721-f09e-489d-a9a5-7c011d0e4944	39c1d3d4-26eb-42ff-bec8-589625d199e3
b4f1f4dc-3913-47b7-895e-1bcfd7e0a236	235╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┤╨╛╤Ж ╨Я╨╡╤А╨▓╤Г╨╜ ╨Ю.╨Х	{"dateTime":"2023-02-03T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	0eb034ff-ac1b-4686-84d0-79929271bd67	39c1d3d4-26eb-42ff-bec8-589625d199e3
701d7eaf-a435-4e3c-9ab6-2da35f2dd582	236, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤Д-╨╝.╨╜.╨┤╨╛╤Ж ╨г╨╝╨╡╤А╨╛╨▓ ╨н.╨Р.	{"dateTime":"2023-02-03T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	1bd874b1-1b03-433a-a977-e6c8a01e634d	39c1d3d4-26eb-42ff-bec8-589625d199e3
de8554cd-91db-4a91-8a41-1279c5836646	223, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╤В.╨╜.╨┤╨╛╤Ж ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.	{"dateTime":"2023-02-03T13:10:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T14:40:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	25ce4721-f09e-489d-a9a5-7c011d0e4944	39c1d3d4-26eb-42ff-bec8-589625d199e3
901ed949-1290-43a6-988a-e0f3e4f7069a	235╨▒, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨в╨░╨╜╨╕╤И╨╡╨▓╨░  ╨б.╨б.	{"dateTime":"2023-02-03T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	9e5af538-21e0-40e0-ba57-4936d4fbecc4	39c1d3d4-26eb-42ff-bec8-589625d199e3
09345b9f-e0ac-488f-836a-51c1161103e2	238╨░, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨┤╨╛╤Ж ╨Я╨╡╤А╨▓╤Г╨╜ ╨Ю.╨Х	{"dateTime":"2023-02-03T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	0eb034ff-ac1b-4686-84d0-79929271bd67	39c1d3d4-26eb-42ff-bec8-589625d199e3
fb9388bb-9ef0-41af-9e63-c11290d93726	237, ╨Ъ╨Ш╨Я╨г	╨Я╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤М: ╨║.╨┐.╨╜.╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.	{"dateTime":"2023-02-03T14:50:42+03:00","timeZone":"Europe/Simferopol"}	{"dateTime":"2023-02-03T16:20:42+03:00","timeZone":"Europe/Simferopol"}	{RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=FR;UNTIL=20230730T210000Z}	{"shared":{"weekType":"both"}}	{"useDefault":false,"overrides":[{"method":"popup","minutes":10}]}	4d02839a-48ba-4783-a23d-5b0cc601c1c1	39c1d3d4-26eb-42ff-bec8-589625d199e3
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule (id, name) FROM stdin;
39c1d3d4-26eb-42ff-bec8-589625d199e3	schedule.xls
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, email, display_name, google_id, public_key, private_key) FROM stdin;
1	abkerimov.e.i20@gmail.com	╨н╨╗╤М╨╝╨╕╤А ╨Р╨▒╨║╨╡╤А╨╕╨╝╨╛╨▓	106769220227267884323	-----BEGIN RSA PUBLIC KEY-----\nMIGJAoGBAIYicVY1+mXB+2uw+KEUrTLDmh431DQLdPoTkkyqBqycCzGBasFPT3g5\nVvMqVm4lS9MYqSITRZlPy0v1V8/gdtAG+VP6sEzLYVG35dpvFJr9tGD26E0kp9HV\nQg4IaSnS7tB0DjIDB/p3j6OW8UmxYSdZlT6+IwjMgetq9NXeEURDAgMBAAE=\n-----END RSA PUBLIC KEY-----\n	-----BEGIN RSA PRIVATE KEY-----\nMIICYAIBAAKBgQCGInFWNfplwftrsPihFK0yw5oeN9Q0C3T6E5JMqgasnAsxgWrB\nT094OVbzKlZuJUvTGKkiE0WZT8tL9VfP4HbQBvlT+rBMy2FRt+XabxSa/bRg9uhN\nJKfR1UIOCGkp0u7QdA4yAwf6d4+jlvFJsWEnWZU+viMIzIHravTV3hFEQwIDAQAB\nAoGADL2eyFKOOzYmvH7tztcY8HZ14CLrbBoefVZ4kgGgaqrTwVsKmdv/r2q64JQH\n66RtRFrWTd9IwBw9MjTWlLza5EJlpOGUMF0Suw6kTc2TT5+XNDnEKzcnREew5+ME\n/EwcfmWPvuvRvK4BC5mueDA8YGe7lrAJBwLZTLdVfTaJ8pECRQDE1mdi3va5yquI\nBL4+2rIKEFMeAYKxEKekCeG5TW2EQB3oE/mCku9EGyGxZRHaFIgEiGkXkh1PsmXP\nBm6MXGi7v+i4KQI9AK5zYThZqkaB3lG+qj10zgOXaGWkG97rQCLRg2CeRoco+oB7\nVkadRUweRLRtNaQqnA6G4yNN7Eg5XwvWiwJFALtmkVnNg0MR1MuUEHiRCC6Sqj+I\nGqBvhdukWNZuBBWEYbTBx6xsLgY+eo6E9kEViQYfxUZeoy9sXoeCzR8vH7uYk305\nAjxBd0casHt37jCSGK0mVvkg2+bvjcBvzXTKHDnjPkJVYolvQdnEsixZPlqmIv2o\nV90sjm4ax5lOGUmT1bUCRBYcYllrc9Y/GBfCsQhREdRYtJX2g9qu7iA99OJjHP4s\n+ttgjmKi+I6CE2/6qAuKWdwGFKz+ds8n3+sq9ScyEuc+r1BK\n-----END RSA PRIVATE KEY-----\n
2	narutonaruto8127@gmail.com	Fiuud	110176579685046678368	-----BEGIN RSA PUBLIC KEY-----\nMIGJAoGBAJPttV1ri2q2NrrlEa6rVMN11q1a5BfMAXihP/kZaYCND3N4nmuwp9Ig\nG0+QJM+2fq62Y6dxxFWwU9h9drfgrW/llu7iEqKtm2EMU2Ex1exLN5rocGj/I8Og\ncYl/h07eoiiqkNH8TCQELYVbeZwBGKcktASEs6DQftkk+FjQx+A3AgMBAAE=\n-----END RSA PUBLIC KEY-----\n	-----BEGIN RSA PRIVATE KEY-----\nMIICYQIBAAKBgQCT7bVda4tqtja65RGuq1TDddatWuQXzAF4oT/5GWmAjQ9zeJ5r\nsKfSIBtPkCTPtn6utmOnccRVsFPYfXa34K1v5Zbu4hKirZthDFNhMdXsSzea6HBo\n/yPDoHGJf4dO3qIoqpDR/EwkBC2FW3mcARinJLQEhLOg0H7ZJPhY0MfgNwIDAQAB\nAoGAE1EhM9fNVtwAfZtYGcUJxpRmujB6RJlBP+1emzq0SjMhZ2TC2zEwWQIUTul1\nxSIBnPL4RG9Ywg/KgySu/T9pw4PuOPGaOQ4lJCiUyvcUXfjg7kjLWrwT1+awHYuI\nlnuVovk8QBTzPkSTp9mgeyuftde9ipzhyDB1OWE7RVsDLnECRQCfKDNNYsFxqqpz\nJ+iQpBoQIz0TF91DD04ZNJda3jZmO644GxIpiXiZbpaK6JbKPSyzMYkGWIYCX7kA\niRg9m55KKDy72wI9AO3wdBp8PR61CCfdDVXw5N7141wCf5VKSGQREz+h1TKBYxKn\nDYgez8wjQjkiVu/ltsQIIargBl7yDXSp1QJFAJDULyMLa8a4rBTQSyRcAE+REYGv\nZKwiYEo1fkm1DkGnq1jo4XUk4LaWWK2dC6KLWoLR38QDiCbe3mWrW4CsfLU0ulej\nAj0A1GBLQVijNUVggjRMMulRX7EZvoZ8WkRzWN3k0GciZHIYfA2fhl/6Gbte4KBF\n+NqQx2h6pIpRJW3nlLoBAkQ6mB5Gr0ToXQPech+rb4kXZkkEgzli1dwECRdhrHnH\nwVIv2uSOkMwzRJzeGA+NmfR76z20qht1Z5BE6ZD/HpXPThBAvQ==\n-----END RSA PRIVATE KEY-----\n
3	elmirabkerimov@gmail.com	Fiarjot	117396774355586943983	-----BEGIN RSA PUBLIC KEY-----\nMIGJAoGBAJ5ArmDbxrKCnnioR6JNq4ijYu0uVvFGs3/w1n+O+1TMq8qYF445EVig\nn5bIwiq5KcCQud9m9gi8qnLGBPa7suAftPihhg5VhzYH1qNd8KvCXH4uQB9jftBU\n5hsrGLKrFFcQHTB9Cx1eGM8DOES+Ln2CyrLshOYwRM8WH/t1rWh1AgMBAAE=\n-----END RSA PUBLIC KEY-----\n	-----BEGIN RSA PRIVATE KEY-----\nMIICXwIBAAKBgQCeQK5g28aygp54qEeiTauIo2LtLlbxRrN/8NZ/jvtUzKvKmBeO\nORFYoJ+WyMIquSnAkLnfZvYIvKpyxgT2u7LgH7T4oYYOVYc2B9ajXfCrwlx+LkAf\nY37QVOYbKxiyqxRXEB0wfQsdXhjPAzhEvi59gsqy7ITmMETPFh/7da1odQIDAQAB\nAoGANG90GA3aSX20KoB/s8yOgKi6d6I6Fpn5kfPn7r4ektt6NJeufmZ0U+xs1JZS\nl7tglTifDeHctcplo7/u29TATTwvgF95qRWhhPm+LSg6LM8XQBdIHeVAjNwPCAEi\nWoXgyVyb+M7Gva/2jMfVpihYIJwr3+dfF5X5LxRIGIbnYSECRQCy7U4+d1aa0m+X\nmH4dki2jz5lYH9luCj3pjfH/s6qxJ4+nZ4gUj9JbUVfI5ZV+YkcoKij9edrpj8l6\nO6Zd4TD4epZFiQI9AOJrkhq2jFQqSWUGctMMw0DO6T6OxNAV5ZAxNc9ZP9lnrTiB\nfCcppkDvhTkK5SCjwIzkA8tPlCz0KXU8jQJEdcQJTsX/Q5GkDzQ4NcBjt8DI3h7A\nXlPxYgqiMDmR7F3siDN1dose2inUzI6HcZK/4Oi25/bPJhEUfBZMrtesAq+0vnkC\nPDj6MO4f+fhEG+wcT1Dk6U2pw/BGJSjoGbjLaWsgXnzrJiAOFZwVUw0MOU49e6NX\nEeFij8Hd6L/XQYeLEQJEFapmvsIY/2kX4uxjiJMcirme1MsS2Ljv56JoIDQuhk5R\n8HnMwGaXQKcTIFC+9fvPUF/xceWIXjlqGVH5DM3BVNWN53o=\n-----END RSA PRIVATE KEY-----\n
4	mamutpov.e@gmisssafasfsaf.com	safas	google	-----BEGIN RSA PUBLIC KEY-----\nMIGJAoGBAKAMfrzpg5ENrtYTL/d2ZSd/TO+/5gClnRochQbNWwr6e1HkooefdbZq\n1qbam1sqCSmNFQwAeWWpg+9P0XdRtGA6tJxqRrjzC3QPZ1csQ39iTJ5jjdo9gqYc\nE5gwekoE/VkPoMYXa149DiYNTYmp5Kkrd/RS9Whvgo0lej4Vrjy9AgMBAAE=\n-----END RSA PUBLIC KEY-----\n	-----BEGIN RSA PRIVATE KEY-----\nMIICXwIBAAKBgQCgDH686YORDa7WEy/3dmUnf0zvv+YApZ0aHIUGzVsK+ntR5KKH\nn3W2atam2ptbKgkpjRUMAHllqYPvT9F3UbRgOrScaka48wt0D2dXLEN/YkyeY43a\nPYKmHBOYMHpKBP1ZD6DGF2tePQ4mDU2JqeSpK3f0UvVob4KNJXo+Fa48vQIDAQAB\nAoGABZhKOepj2gdDbGJhU+JEqPvPQbZQoQcpFceXcuRs4VZeRz+Z2undIJJdjJmp\nwqcWiOhQqwm9NKuXXB9LKNrJH0S6MKJVjNvi8hkuvyUfh09eZylVPvgbNpET6U95\npjYqTawuySHXCoGp9YXyVwX8o5WfhUiKx54ztaQg90Ltk9UCRQDT9YU3A3Q1GrkF\njTSACI0ira8Zl7ZPR3B52Rc4B0oYn4ssPop6kiNnqhtyJcRqnhHemDZDlmX1UJEz\ndUcXVIXjY/XutwI9AMFNxqE1C8lLo7bgm1o+mgCDcJRAkeJfkJpzgHDgOUaxKFko\nduMFTmV2g5VqImljdUE2xHKtl+YB+7X8KwJEPBnXLzU8gz5Tjl5ur4s9McMb7l7V\nY/92xiYnbkyq1vaOSPpm28CKZ3+VjrVkz3KI0JxKbrm7qWax9Wxgvx3JZSPX/VsC\nPB0NjX8JM/5LKg4AcBj+M7NEDhWaJtL5PgiYt4M/kBw54DCWTlgMoh3J1DkOvKFO\nW38ztg7uXFgrkCNoBQJEPsIg5ctWVAimiF58z9DwLFA6pkMKINMgh+G2Mlq5emzJ\npRIrLgjQ6SO3RZDGTj9M4eoUwvjIDIajwkZXlddvO42zIjM=\n-----END RSA PRIVATE KEY-----\n
\.


--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher (id, name) FROM stdin;
ed10ccd9-11a1-462b-b7e4-a7374eddf296	╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б
94715913-343d-4221-b360-344b748ebd0b	╨Р╨▒╨╗╤П╨╡╨▓ ╨Ь.╨а
13a42b17-34a7-4e07-b278-411f0e670701	╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.
b77f32e2-d1f1-4cdb-80b4-a0fd9760cc15	╨в╨░╨╜╨╕╤И╨╡╨▓╨░  ╨б.╨б.
fb8015cb-6979-4211-98cc-1bf686787da0	╨║.╤В.╨╜.╨┤╨╛╤Ж ╨Р╨▒╨┤╤Г╤А╨░╨╣╨╕╨╝╨╛╨▓ ╨Ы.╨Э.
5c196255-7571-4ac1-ab7f-645836710e7d	╨║.╤Н.╨╜.╨┤╨╛╤Ж ╨Р╨┤╨╡╨╗╤М╤Б╨╡╨╕╤В╨╛╨▓╨░ ╨н.╨С.
f591fa0d-728d-4b73-b7d5-73a8b9d83910	╨┤╨╛╤Ж ╨Я╨╡╤А╨▓╤Г╨╜ ╨Ю.╨Х
e9bf5d48-ed2e-4460-b561-8c0486f70ba1	╨н╨╝╨╕╤А╨╛╨▓╨░ ╨н.╨б
e4b902ef-3611-4302-a3e5-2c4ca4d1db8b	╨║.╤Д-╨╝.╨╜.╨┤╨╛╤Ж ╨г╨╝╨╡╤А╨╛╨▓ ╨н.╨Р.
ee9d3733-814a-461f-a758-6f2d2f16bd49	╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б
f7105308-a125-43cb-ad94-3a18d52c8286	Machine Learning
1b05e189-aca1-45fa-a041-8ca04c1cb947	╨┤.╨┐.╨╜.╨┐╤А╨╛╤Д ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓╨░ ╨Ч.╨б.
46d22f70-5952-45b9-83c3-4896a8e07037	╤Б╤В.╨┐╤А╨╡╨┐ ╨Р╨▒╨┤╤Г╤А╨░╨╝╨░╨╜╨╛╨▓ ╨Ч.╨и.
482183c3-f995-4a85-8c5a-a7a92f7e24a7	╨Р╨▒╨┤╤Г╤А╨░╨╝╨░╨╜╨╛╨▓ ╨Ч.╨и
e164c1d7-2c41-4b74-9f6c-4c80a714564b	╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓ ╨У.╨б
a92c9aed-6cfd-4e49-8d89-5889c274944a	╨║.╨┐.╨╜.╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.
384bf303-f738-448d-a71e-ad31c60905bb	╨┐╤А╨╡╨┐ ╨Р╨╝╨╡╤В╨╛╨▓ ╨Ю.╨Ь.
3f9c32dd-32dd-4dad-9027-0a375f600309	╨║.╨▒.╨╜.╨┤╨╛╤Ж  ╨Ъ╤А╤Л╨╗╨╛╨▓ ╨Т.╨б.
6e690e26-e698-4c28-9132-ad1571643075	╤Б╤В ╨┐╨╡╤А╨╡╨┐ ╨б╨╡╨╣╨┤╨░╨╝╨╡╤В╨╛╨▓ ╨У.╨б.
774abb35-9d7a-431a-830b-1193bf08137f	╨║.╨▒.╨╜.╨┤╨╛╤Ж ╨Ъ╤А╤Л╨╗╨╛╨▓ ╨Т.╨б.
e392cff0-d107-49eb-9b19-62214a73249f	   .
362a880d-ec99-40dd-947a-798e792cab3c	╨║.╨┐.╨╜.,╨┤╨╛╤Ж ╨Ь╨╡╨╝╨╡╤В╨╛╨▓╨░ ╨д.╨б.
\.


--
-- Data for Name: visitList; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."visitList" (id, student_id, visit_time, event_id) FROM stdin;
35	1	1678996306.0237942	24072363-6222-4bf9-acba-bbdd57aa1bbe
36	1	1678998132.898101	24072363-6222-4bf9-acba-bbdd57aa1bbe
37	1	1679068959.9753559	24072363-6222-4bf9-acba-bbdd57aa1bbe
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 1, false);


--
-- Name: visit_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visit_list_id_seq', 37, true);


--
-- Name: class PK_0b9024d21bdfba8b1bd1c300eae; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT "PK_0b9024d21bdfba8b1bd1c300eae" PRIMARY KEY (id);


--
-- Name: schedule PK_1c05e42aec7371641193e180046; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT "PK_1c05e42aec7371641193e180046" PRIMARY KEY (id);


--
-- Name: teacher PK_2f807294148612a9751dacf1026; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT "PK_2f807294148612a9751dacf1026" PRIMARY KEY (id);


--
-- Name: event PK_30c2f3bbaf6d34a55f8ae6e4614; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "PK_30c2f3bbaf6d34a55f8ae6e4614" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: teacher UQ_55be152c2c710d5939dae9a86aa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT "UQ_55be152c2c710d5939dae9a86aa" UNIQUE (name);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: visitList visit_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."visitList"
    ADD CONSTRAINT visit_list_pkey PRIMARY KEY (id);


--
-- Name: event FK_78f4792105a2ed6013b3c063f8e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "FK_78f4792105a2ed6013b3c063f8e" FOREIGN KEY ("scheduleId") REFERENCES public.schedule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event FK_ff5ab74c1163077d30bcdeb80fd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "FK_ff5ab74c1163077d30bcdeb80fd" FOREIGN KEY ("summaryId") REFERENCES public.class(id);


--
-- PostgreSQL database dump complete
--

