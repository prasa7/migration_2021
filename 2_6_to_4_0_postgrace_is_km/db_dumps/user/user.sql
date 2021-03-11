--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.0

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
-- Name: reg_association_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_association_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_association_pk_seq OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: reg_association; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_association (
    reg_association_id integer DEFAULT nextval('public.reg_association_pk_seq'::regclass) NOT NULL,
    reg_sourcepath character varying(2000) NOT NULL,
    reg_targetpath character varying(2000) NOT NULL,
    reg_association_type character varying(2000) NOT NULL,
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_association OWNER TO root;

--
-- Name: reg_cluster_lock; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_cluster_lock (
    reg_lock_name character varying(20) NOT NULL,
    reg_lock_status character varying(20),
    reg_locked_time timestamp without time zone,
    reg_tenant_id integer DEFAULT 0
);


ALTER TABLE public.reg_cluster_lock OWNER TO root;

--
-- Name: reg_comment_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_comment_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_comment_pk_seq OWNER TO root;

--
-- Name: reg_comment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_comment (
    reg_id integer DEFAULT nextval('public.reg_comment_pk_seq'::regclass) NOT NULL,
    reg_comment_text character varying(500) NOT NULL,
    reg_user_id character varying(31) NOT NULL,
    reg_commented_time timestamp without time zone NOT NULL,
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_comment OWNER TO root;

--
-- Name: reg_content_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_content_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_content_pk_seq OWNER TO root;

--
-- Name: reg_content; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_content (
    reg_content_id integer DEFAULT nextval('public.reg_content_pk_seq'::regclass) NOT NULL,
    reg_content_data bytea,
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_content OWNER TO root;

--
-- Name: reg_content_history; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_content_history (
    reg_content_id integer NOT NULL,
    reg_content_data bytea,
    reg_deleted smallint,
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_content_history OWNER TO root;

--
-- Name: reg_log_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_log_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_log_pk_seq OWNER TO root;

--
-- Name: reg_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_log (
    reg_log_id integer DEFAULT nextval('public.reg_log_pk_seq'::regclass) NOT NULL,
    reg_path character varying(2000),
    reg_user_id character varying(31) NOT NULL,
    reg_logged_time timestamp without time zone NOT NULL,
    reg_action integer NOT NULL,
    reg_action_data character varying(500),
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_log OWNER TO root;

--
-- Name: reg_path_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_path_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_path_pk_seq OWNER TO root;

--
-- Name: reg_path; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_path (
    reg_path_id integer DEFAULT nextval('public.reg_path_pk_seq'::regclass) NOT NULL,
    reg_path_value character varying(2000) NOT NULL,
    reg_path_parent_id integer,
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_path OWNER TO root;

--
-- Name: reg_property_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_property_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_property_pk_seq OWNER TO root;

--
-- Name: reg_property; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_property (
    reg_id integer DEFAULT nextval('public.reg_property_pk_seq'::regclass) NOT NULL,
    reg_name character varying(100) NOT NULL,
    reg_value character varying(1000),
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_property OWNER TO root;

--
-- Name: reg_rating_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_rating_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_rating_pk_seq OWNER TO root;

--
-- Name: reg_rating; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_rating (
    reg_id integer DEFAULT nextval('public.reg_rating_pk_seq'::regclass) NOT NULL,
    reg_rating integer NOT NULL,
    reg_user_id character varying(31) NOT NULL,
    reg_rated_time timestamp without time zone NOT NULL,
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_rating OWNER TO root;

--
-- Name: reg_resource_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_resource_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_resource_pk_seq OWNER TO root;

--
-- Name: reg_resource; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_resource (
    reg_path_id integer NOT NULL,
    reg_name character varying(256),
    reg_version integer DEFAULT nextval('public.reg_resource_pk_seq'::regclass) NOT NULL,
    reg_media_type character varying(500),
    reg_creator character varying(31) NOT NULL,
    reg_created_time timestamp without time zone NOT NULL,
    reg_last_updator character varying(31),
    reg_last_updated_time timestamp without time zone NOT NULL,
    reg_description character varying(1000),
    reg_content_id integer,
    reg_tenant_id integer DEFAULT 0 NOT NULL,
    reg_uuid character varying(100) NOT NULL
);


ALTER TABLE public.reg_resource OWNER TO root;

--
-- Name: reg_resource_comment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_resource_comment (
    reg_comment_id integer NOT NULL,
    reg_version integer,
    reg_path_id integer,
    reg_resource_name character varying(256),
    reg_tenant_id integer DEFAULT 0
);


ALTER TABLE public.reg_resource_comment OWNER TO root;

--
-- Name: reg_resource_history; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_resource_history (
    reg_path_id integer NOT NULL,
    reg_name character varying(256),
    reg_version integer NOT NULL,
    reg_media_type character varying(500),
    reg_creator character varying(31) NOT NULL,
    reg_created_time timestamp without time zone NOT NULL,
    reg_last_updator character varying(31),
    reg_last_updated_time timestamp without time zone NOT NULL,
    reg_description character varying(1000),
    reg_content_id integer,
    reg_deleted smallint,
    reg_tenant_id integer DEFAULT 0 NOT NULL,
    reg_uuid character varying(100) NOT NULL
);


ALTER TABLE public.reg_resource_history OWNER TO root;

--
-- Name: reg_resource_property; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_resource_property (
    reg_property_id integer NOT NULL,
    reg_version integer,
    reg_path_id integer,
    reg_resource_name character varying(256),
    reg_tenant_id integer DEFAULT 0
);


ALTER TABLE public.reg_resource_property OWNER TO root;

--
-- Name: reg_resource_rating; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_resource_rating (
    reg_rating_id integer NOT NULL,
    reg_version integer,
    reg_path_id integer,
    reg_resource_name character varying(256),
    reg_tenant_id integer DEFAULT 0
);


ALTER TABLE public.reg_resource_rating OWNER TO root;

--
-- Name: reg_resource_tag; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_resource_tag (
    reg_tag_id integer NOT NULL,
    reg_version integer,
    reg_path_id integer,
    reg_resource_name character varying(256),
    reg_tenant_id integer DEFAULT 0
);


ALTER TABLE public.reg_resource_tag OWNER TO root;

--
-- Name: reg_snapshot_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_snapshot_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_snapshot_pk_seq OWNER TO root;

--
-- Name: reg_snapshot; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_snapshot (
    reg_snapshot_id integer DEFAULT nextval('public.reg_snapshot_pk_seq'::regclass) NOT NULL,
    reg_path_id integer NOT NULL,
    reg_resource_name character varying(255),
    reg_resource_vids bytea NOT NULL,
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_snapshot OWNER TO root;

--
-- Name: reg_tag_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reg_tag_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reg_tag_pk_seq OWNER TO root;

--
-- Name: reg_tag; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reg_tag (
    reg_id integer DEFAULT nextval('public.reg_tag_pk_seq'::regclass) NOT NULL,
    reg_tag_name character varying(500) NOT NULL,
    reg_user_id character varying(31) NOT NULL,
    reg_tagged_time timestamp without time zone NOT NULL,
    reg_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reg_tag OWNER TO root;

--
-- Name: um_account_mapping_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_account_mapping_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_account_mapping_seq OWNER TO root;

--
-- Name: um_account_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_account_mapping (
    um_id integer DEFAULT nextval('public.um_account_mapping_seq'::regclass) NOT NULL,
    um_user_name character varying(255) NOT NULL,
    um_tenant_id integer NOT NULL,
    um_user_store_domain character varying(100),
    um_acc_link_id integer NOT NULL
);


ALTER TABLE public.um_account_mapping OWNER TO root;

--
-- Name: um_claim_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_claim_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_claim_pk_seq OWNER TO root;

--
-- Name: um_claim; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_claim (
    um_id integer DEFAULT nextval('public.um_claim_pk_seq'::regclass) NOT NULL,
    um_dialect_id integer NOT NULL,
    um_claim_uri character varying(255) NOT NULL,
    um_display_tag character varying(255),
    um_description character varying(255),
    um_mapped_attribute_domain character varying(255),
    um_mapped_attribute character varying(255),
    um_reg_ex character varying(255),
    um_supported smallint,
    um_required smallint,
    um_display_order integer,
    um_checked_attribute smallint,
    um_read_only smallint,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_claim OWNER TO root;

--
-- Name: um_claim_behavior_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_claim_behavior_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_claim_behavior_pk_seq OWNER TO root;

--
-- Name: um_claim_behavior; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_claim_behavior (
    um_id integer DEFAULT nextval('public.um_claim_behavior_pk_seq'::regclass) NOT NULL,
    um_profile_id integer,
    um_claim_id integer,
    um_behaviour smallint,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_claim_behavior OWNER TO root;

--
-- Name: um_dialect_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_dialect_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_dialect_pk_seq OWNER TO root;

--
-- Name: um_dialect; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_dialect (
    um_id integer DEFAULT nextval('public.um_dialect_pk_seq'::regclass) NOT NULL,
    um_dialect_uri character varying(255) NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_dialect OWNER TO root;

--
-- Name: um_domain_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_domain_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_domain_pk_seq OWNER TO root;

--
-- Name: um_domain; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_domain (
    um_domain_id integer DEFAULT nextval('public.um_domain_pk_seq'::regclass) NOT NULL,
    um_domain_name character varying(255),
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_domain OWNER TO root;

--
-- Name: um_hybrid_remember_me_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_hybrid_remember_me_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_hybrid_remember_me_pk_seq OWNER TO root;

--
-- Name: um_hybrid_remember_me; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_hybrid_remember_me (
    um_id integer DEFAULT nextval('public.um_hybrid_remember_me_pk_seq'::regclass) NOT NULL,
    um_user_name character varying(255) NOT NULL,
    um_cookie_value character varying(1024),
    um_created_time timestamp without time zone,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_hybrid_remember_me OWNER TO root;

--
-- Name: um_hybrid_role_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_hybrid_role_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_hybrid_role_pk_seq OWNER TO root;

--
-- Name: um_hybrid_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_hybrid_role (
    um_id integer DEFAULT nextval('public.um_hybrid_role_pk_seq'::regclass) NOT NULL,
    um_role_name character varying(255),
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_hybrid_role OWNER TO root;

--
-- Name: um_hybrid_user_role_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_hybrid_user_role_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_hybrid_user_role_pk_seq OWNER TO root;

--
-- Name: um_hybrid_user_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_hybrid_user_role (
    um_id integer DEFAULT nextval('public.um_hybrid_user_role_pk_seq'::regclass) NOT NULL,
    um_user_name character varying(255),
    um_role_id integer NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL,
    um_domain_id integer
);


ALTER TABLE public.um_hybrid_user_role OWNER TO root;

--
-- Name: um_module_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_module_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_module_pk_seq OWNER TO root;

--
-- Name: um_module; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_module (
    um_id integer DEFAULT nextval('public.um_module_pk_seq'::regclass) NOT NULL,
    um_module_name character varying(100)
);


ALTER TABLE public.um_module OWNER TO root;

--
-- Name: um_module_actions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_module_actions (
    um_action character varying(255) NOT NULL,
    um_module_id integer NOT NULL
);


ALTER TABLE public.um_module_actions OWNER TO root;

--
-- Name: um_permission_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_permission_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_permission_pk_seq OWNER TO root;

--
-- Name: um_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_permission (
    um_id integer DEFAULT nextval('public.um_permission_pk_seq'::regclass) NOT NULL,
    um_resource_id character varying(255) NOT NULL,
    um_action character varying(255) NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL,
    um_module_id integer DEFAULT 0
);


ALTER TABLE public.um_permission OWNER TO root;

--
-- Name: um_profile_config_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_profile_config_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_profile_config_pk_seq OWNER TO root;

--
-- Name: um_profile_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_profile_config (
    um_id integer DEFAULT nextval('public.um_profile_config_pk_seq'::regclass) NOT NULL,
    um_dialect_id integer NOT NULL,
    um_profile_name character varying(255),
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_profile_config OWNER TO root;

--
-- Name: um_role_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_role_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_role_pk_seq OWNER TO root;

--
-- Name: um_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_role (
    um_id integer DEFAULT nextval('public.um_role_pk_seq'::regclass) NOT NULL,
    um_role_name character varying(255) NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL,
    um_shared_role boolean DEFAULT false
);


ALTER TABLE public.um_role OWNER TO root;

--
-- Name: um_role_permission_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_role_permission_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_role_permission_pk_seq OWNER TO root;

--
-- Name: um_role_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_role_permission (
    um_id integer DEFAULT nextval('public.um_role_permission_pk_seq'::regclass) NOT NULL,
    um_permission_id integer NOT NULL,
    um_role_name character varying(255) NOT NULL,
    um_is_allowed smallint NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL,
    um_domain_id integer
);


ALTER TABLE public.um_role_permission OWNER TO root;

--
-- Name: um_shared_user_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_shared_user_role (
    um_role_id integer NOT NULL,
    um_user_id integer NOT NULL,
    um_user_tenant_id integer NOT NULL,
    um_role_tenant_id integer NOT NULL
);


ALTER TABLE public.um_shared_user_role OWNER TO root;

--
-- Name: um_system_role_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_system_role_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_system_role_pk_seq OWNER TO root;

--
-- Name: um_system_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_system_role (
    um_id integer DEFAULT nextval('public.um_system_role_pk_seq'::regclass) NOT NULL,
    um_role_name character varying(255),
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_system_role OWNER TO root;

--
-- Name: um_system_user_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_system_user_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_system_user_pk_seq OWNER TO root;

--
-- Name: um_system_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_system_user (
    um_id integer DEFAULT nextval('public.um_system_user_pk_seq'::regclass) NOT NULL,
    um_user_name character varying(255) NOT NULL,
    um_user_password character varying(255) NOT NULL,
    um_salt_value character varying(31),
    um_require_change boolean DEFAULT false,
    um_changed_time timestamp without time zone NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_system_user OWNER TO root;

--
-- Name: um_system_user_role_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_system_user_role_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_system_user_role_pk_seq OWNER TO root;

--
-- Name: um_system_user_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_system_user_role (
    um_id integer DEFAULT nextval('public.um_system_user_role_pk_seq'::regclass) NOT NULL,
    um_user_name character varying(255),
    um_role_id integer NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_system_user_role OWNER TO root;

--
-- Name: um_tenant_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_tenant_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_tenant_pk_seq OWNER TO root;

--
-- Name: um_tenant; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_tenant (
    um_id integer DEFAULT nextval('public.um_tenant_pk_seq'::regclass) NOT NULL,
    um_domain_name character varying(255) NOT NULL,
    um_email character varying(255),
    um_active boolean DEFAULT false,
    um_created_date timestamp without time zone NOT NULL,
    um_user_config bytea
);


ALTER TABLE public.um_tenant OWNER TO root;

--
-- Name: um_user_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_user_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_user_pk_seq OWNER TO root;

--
-- Name: um_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_user (
    um_id integer DEFAULT nextval('public.um_user_pk_seq'::regclass) NOT NULL,
    um_user_name character varying(255) NOT NULL,
    um_user_password character varying(255) NOT NULL,
    um_salt_value character varying(31),
    um_require_change boolean DEFAULT false,
    um_changed_time timestamp without time zone NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_user OWNER TO root;

--
-- Name: um_user_attribute_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_user_attribute_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_user_attribute_pk_seq OWNER TO root;

--
-- Name: um_user_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_user_attribute (
    um_id integer DEFAULT nextval('public.um_user_attribute_pk_seq'::regclass) NOT NULL,
    um_attr_name character varying(255) NOT NULL,
    um_attr_value character varying(1024),
    um_profile_id character varying(255),
    um_user_id integer,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_user_attribute OWNER TO root;

--
-- Name: um_user_permission_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_user_permission_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_user_permission_pk_seq OWNER TO root;

--
-- Name: um_user_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_user_permission (
    um_id integer DEFAULT nextval('public.um_user_permission_pk_seq'::regclass) NOT NULL,
    um_permission_id integer NOT NULL,
    um_user_name character varying(255) NOT NULL,
    um_is_allowed smallint NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_user_permission OWNER TO root;

--
-- Name: um_user_role_pk_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.um_user_role_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.um_user_role_pk_seq OWNER TO root;

--
-- Name: um_user_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.um_user_role (
    um_id integer DEFAULT nextval('public.um_user_role_pk_seq'::regclass) NOT NULL,
    um_role_id integer NOT NULL,
    um_user_id integer NOT NULL,
    um_tenant_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.um_user_role OWNER TO root;

--
-- Data for Name: reg_association; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_association (reg_association_id, reg_sourcepath, reg_targetpath, reg_association_type, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_cluster_lock; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_cluster_lock (reg_lock_name, reg_lock_status, reg_locked_time, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_comment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_comment (reg_id, reg_comment_text, reg_user_id, reg_commented_time, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_content; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_content (reg_content_id, reg_content_data, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_content_history; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_content_history (reg_content_id, reg_content_data, reg_deleted, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_log (reg_log_id, reg_path, reg_user_id, reg_logged_time, reg_action, reg_action_data, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_path; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_path (reg_path_id, reg_path_value, reg_path_parent_id, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_property; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_property (reg_id, reg_name, reg_value, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_rating; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_rating (reg_id, reg_rating, reg_user_id, reg_rated_time, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_resource; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_resource (reg_path_id, reg_name, reg_version, reg_media_type, reg_creator, reg_created_time, reg_last_updator, reg_last_updated_time, reg_description, reg_content_id, reg_tenant_id, reg_uuid) FROM stdin;
\.


--
-- Data for Name: reg_resource_comment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_resource_comment (reg_comment_id, reg_version, reg_path_id, reg_resource_name, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_resource_history; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_resource_history (reg_path_id, reg_name, reg_version, reg_media_type, reg_creator, reg_created_time, reg_last_updator, reg_last_updated_time, reg_description, reg_content_id, reg_deleted, reg_tenant_id, reg_uuid) FROM stdin;
\.


--
-- Data for Name: reg_resource_property; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_resource_property (reg_property_id, reg_version, reg_path_id, reg_resource_name, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_resource_rating; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_resource_rating (reg_rating_id, reg_version, reg_path_id, reg_resource_name, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_resource_tag; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_resource_tag (reg_tag_id, reg_version, reg_path_id, reg_resource_name, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_snapshot; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_snapshot (reg_snapshot_id, reg_path_id, reg_resource_name, reg_resource_vids, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: reg_tag; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reg_tag (reg_id, reg_tag_name, reg_user_id, reg_tagged_time, reg_tenant_id) FROM stdin;
\.


--
-- Data for Name: um_account_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_account_mapping (um_id, um_user_name, um_tenant_id, um_user_store_domain, um_acc_link_id) FROM stdin;
\.


--
-- Data for Name: um_claim; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_claim (um_id, um_dialect_id, um_claim_uri, um_display_tag, um_description, um_mapped_attribute_domain, um_mapped_attribute, um_reg_ex, um_supported, um_required, um_display_order, um_checked_attribute, um_read_only, um_tenant_id) FROM stdin;
\.


--
-- Data for Name: um_claim_behavior; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_claim_behavior (um_id, um_profile_id, um_claim_id, um_behaviour, um_tenant_id) FROM stdin;
\.


--
-- Data for Name: um_dialect; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_dialect (um_id, um_dialect_uri, um_tenant_id) FROM stdin;
\.


--
-- Data for Name: um_domain; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_domain (um_domain_id, um_domain_name, um_tenant_id) FROM stdin;
1	PRIMARY	-1234
2	SYSTEM	-1234
3	INTERNAL	-1234
4	APPLICATION	-1234
5	WORKFLOW	-1234
6	PRIMARY	1
7	SYSTEM	1
8	INTERNAL	1
9	APPLICATION	1
10	WORKFLOW	1
\.


--
-- Data for Name: um_hybrid_remember_me; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_hybrid_remember_me (um_id, um_user_name, um_cookie_value, um_created_time, um_tenant_id) FROM stdin;
\.


--
-- Data for Name: um_hybrid_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_hybrid_role (um_id, um_role_name, um_tenant_id) FROM stdin;
1	everyone	-1234
2	publisher	-1234
3	creator	-1234
4	subscriber	-1234
5	system	-1234
6	Application/apicreator1_rest_api_creator	-1234
7	Application/apipublisher1_rest_api_publisher1	-1234
8	Application/apisubscriber_1_0_1_rest_api_subscriber1_0_1	-1234
9	Application/apisubscriber_1_0_1_application_1_0_1_PRODUCTION	-1234
10	Application/apisubscriber_1_0_2_rest_api_subscriber1_0_2	-1234
11	Application/apisubscriber_1_0_2_application_1_0_2_PRODUCTION	-1234
12	Application/apisubscriber_1_0_3_rest_api_subscriber1_0_3	-1234
13	Application/apisubscriber_1_0_3_application_1_0_3_PRODUCTION	-1234
14	Application/apisubscriber_1_0_4_rest_api_subscriber1_0_4	-1234
15	Application/apisubscriber_1_0_4_application_1_0_4_PRODUCTION	-1234
16	Application/apisubscriber_1_0_5_rest_api_subscriber1_0_5	-1234
17	Application/apisubscriber_1_0_5_application_1_0_5_PRODUCTION	-1234
18	Application/apisubscriber_1_1_6_rest_api_subscriber1_1_6	-1234
19	Application/apisubscriber_1_1_6_application_1_1_6_PRODUCTION	-1234
20	Application/apisubscriber_1_1_7_rest_api_subscriber1_1_7	-1234
21	Application/apisubscriber_1_1_7_application_1_1_7_PRODUCTION	-1234
22	Application/apisubscriber_1_1_8_rest_api_subscriber1_1_8	-1234
23	Application/apisubscriber_1_1_8_application_1_1_8_PRODUCTION	-1234
24	Application/apisubscriber_1_1_9_rest_api_subscriber1_1_9	-1234
25	Application/apisubscriber_1_1_9_application_1_1_9_PRODUCTION	-1234
26	Application/apisubscriber_1_1_10_rest_api_subscriber1_1_10	-1234
27	Application/apisubscriber_1_1_10_application_1_1_10_PRODUCTION	-1234
28	Application/apisubscriber_1_2_11_rest_api_subscriber1_2_11	-1234
29	Application/apisubscriber_1_2_11_application_1_2_11_PRODUCTION	-1234
30	Application/apisubscriber_1_2_12_rest_api_subscriber1_2_12	-1234
31	Application/apisubscriber_1_2_12_application_1_2_12_PRODUCTION	-1234
32	Application/apisubscriber_1_2_13_rest_api_subscriber1_2_13	-1234
33	Application/apisubscriber_1_2_13_application_1_2_13_PRODUCTION	-1234
34	Application/apisubscriber_1_2_14_rest_api_subscriber1_2_14	-1234
35	Application/apisubscriber_1_2_14_application_1_2_14_PRODUCTION	-1234
36	Application/apisubscriber_1_2_15_rest_api_subscriber1_2_15	-1234
37	Application/apisubscriber_1_2_15_application_1_2_15_PRODUCTION	-1234
38	Application/apisubscriber_1_3_16_rest_api_subscriber1_3_16	-1234
39	Application/apisubscriber_1_3_16_application_1_3_16_PRODUCTION	-1234
40	Application/apisubscriber_1_3_17_rest_api_subscriber1_3_17	-1234
41	Application/apisubscriber_1_3_17_application_1_3_17_PRODUCTION	-1234
42	Application/apisubscriber_1_3_18_rest_api_subscriber1_3_18	-1234
43	Application/apisubscriber_1_3_18_application_1_3_18_PRODUCTION	-1234
44	Application/apisubscriber_1_3_19_rest_api_subscriber1_3_19	-1234
45	Application/apisubscriber_1_3_19_application_1_3_19_PRODUCTION	-1234
46	Application/apisubscriber_1_3_20_rest_api_subscriber1_3_20	-1234
47	Application/apisubscriber_1_3_20_application_1_3_20_PRODUCTION	-1234
48	Application/apisubscriber_1_4_21_rest_api_subscriber1_4_21	-1234
49	Application/apisubscriber_1_4_21_application_1_4_21_PRODUCTION	-1234
50	Application/apisubscriber_1_4_22_rest_api_subscriber1_4_22	-1234
51	Application/apisubscriber_1_4_22_application_1_4_22_PRODUCTION	-1234
52	Application/apisubscriber_1_4_23_rest_api_subscriber1_4_23	-1234
53	Application/apisubscriber_1_4_23_application_1_4_23_PRODUCTION	-1234
54	Application/apisubscriber_1_4_24_rest_api_subscriber1_4_24	-1234
55	Application/apisubscriber_1_4_24_application_1_4_24_PRODUCTION	-1234
56	Application/apisubscriber_1_4_25_rest_api_subscriber1_4_25	-1234
57	Application/apisubscriber_1_4_25_application_1_4_25_PRODUCTION	-1234
58	Application/apisubscriber_1_5_26_rest_api_subscriber1_5_26	-1234
59	Application/apisubscriber_1_5_26_application_1_5_26_PRODUCTION	-1234
60	Application/apisubscriber_1_5_27_rest_api_subscriber1_5_27	-1234
61	Application/apisubscriber_1_5_27_application_1_5_27_PRODUCTION	-1234
62	Application/apisubscriber_1_5_28_rest_api_subscriber1_5_28	-1234
63	Application/apisubscriber_1_5_28_application_1_5_28_PRODUCTION	-1234
64	Application/apisubscriber_1_5_29_rest_api_subscriber1_5_29	-1234
65	Application/apisubscriber_1_5_29_application_1_5_29_PRODUCTION	-1234
66	Application/apisubscriber_1_5_30_rest_api_subscriber1_5_30	-1234
67	Application/apisubscriber_1_5_30_application_1_5_30_PRODUCTION	-1234
68	Application/apisubscriber_1_6_31_rest_api_subscriber1_6_31	-1234
69	Application/apisubscriber_1_6_31_application_1_6_31_PRODUCTION	-1234
70	Application/apisubscriber_1_6_32_rest_api_subscriber1_6_32	-1234
71	Application/apisubscriber_1_6_32_application_1_6_32_PRODUCTION	-1234
72	Application/apisubscriber_1_6_33_rest_api_subscriber1_6_33	-1234
73	Application/apisubscriber_1_6_33_application_1_6_33_PRODUCTION	-1234
74	Application/apisubscriber_1_6_34_rest_api_subscriber1_6_34	-1234
75	Application/apisubscriber_1_6_34_application_1_6_34_PRODUCTION	-1234
76	Application/apisubscriber_1_6_35_rest_api_subscriber1_6_35	-1234
77	Application/apisubscriber_1_6_35_application_1_6_35_PRODUCTION	-1234
78	Application/apisubscriber_1_7_36_rest_api_subscriber1_7_36	-1234
79	Application/apisubscriber_1_7_36_application_1_7_36_PRODUCTION	-1234
80	Application/apisubscriber_1_7_37_rest_api_subscriber1_7_37	-1234
81	Application/apisubscriber_1_7_37_application_1_7_37_PRODUCTION	-1234
82	Application/apisubscriber_1_7_38_rest_api_subscriber1_7_38	-1234
83	Application/apisubscriber_1_7_38_application_1_7_38_PRODUCTION	-1234
84	Application/apisubscriber_1_7_39_rest_api_subscriber1_7_39	-1234
85	Application/apisubscriber_1_7_39_application_1_7_39_PRODUCTION	-1234
87	Application/apisubscriber_1_7_40_application_1_7_40_PRODUCTION	-1234
89	Application/apisubscriber_1_8_41_application_1_8_41_PRODUCTION	-1234
91	Application/apisubscriber_1_8_42_application_1_8_42_PRODUCTION	-1234
93	Application/apisubscriber_1_8_43_application_1_8_43_PRODUCTION	-1234
95	Application/apisubscriber_1_8_44_application_1_8_44_PRODUCTION	-1234
97	Application/apisubscriber_1_8_45_application_1_8_45_PRODUCTION	-1234
99	Application/apisubscriber_1_9_46_application_1_9_46_PRODUCTION	-1234
101	Application/apisubscriber_1_9_47_application_1_9_47_PRODUCTION	-1234
103	Application/apisubscriber_1_9_48_application_1_9_48_PRODUCTION	-1234
105	Application/apisubscriber_1_9_49_application_1_9_49_PRODUCTION	-1234
107	Application/apisubscriber_1_9_50_application_1_9_50_PRODUCTION	-1234
109	Application/apisubscriber_1_10_51_application_1_10_51_PRODUCTION	-1234
111	Application/apisubscriber_1_10_52_application_1_10_52_PRODUCTION	-1234
113	Application/apisubscriber_1_10_53_application_1_10_53_PRODUCTION	-1234
115	Application/apisubscriber_1_10_54_application_1_10_54_PRODUCTION	-1234
117	Application/apisubscriber_1_10_55_application_1_10_55_PRODUCTION	-1234
119	Application/apisubscriber_1_11_56_application_1_11_56_PRODUCTION	-1234
121	Application/apisubscriber_1_11_57_application_1_11_57_PRODUCTION	-1234
123	Application/apisubscriber_1_11_58_application_1_11_58_PRODUCTION	-1234
125	Application/apisubscriber_1_11_59_application_1_11_59_PRODUCTION	-1234
127	Application/apisubscriber_1_11_60_application_1_11_60_PRODUCTION	-1234
86	Application/apisubscriber_1_7_40_rest_api_subscriber1_7_40	-1234
88	Application/apisubscriber_1_8_41_rest_api_subscriber1_8_41	-1234
90	Application/apisubscriber_1_8_42_rest_api_subscriber1_8_42	-1234
92	Application/apisubscriber_1_8_43_rest_api_subscriber1_8_43	-1234
94	Application/apisubscriber_1_8_44_rest_api_subscriber1_8_44	-1234
96	Application/apisubscriber_1_8_45_rest_api_subscriber1_8_45	-1234
98	Application/apisubscriber_1_9_46_rest_api_subscriber1_9_46	-1234
100	Application/apisubscriber_1_9_47_rest_api_subscriber1_9_47	-1234
102	Application/apisubscriber_1_9_48_rest_api_subscriber1_9_48	-1234
104	Application/apisubscriber_1_9_49_rest_api_subscriber1_9_49	-1234
106	Application/apisubscriber_1_9_50_rest_api_subscriber1_9_50	-1234
108	Application/apisubscriber_1_10_51_rest_api_subscriber1_10_51	-1234
110	Application/apisubscriber_1_10_52_rest_api_subscriber1_10_52	-1234
112	Application/apisubscriber_1_10_53_rest_api_subscriber1_10_53	-1234
114	Application/apisubscriber_1_10_54_rest_api_subscriber1_10_54	-1234
116	Application/apisubscriber_1_10_55_rest_api_subscriber1_10_55	-1234
118	Application/apisubscriber_1_11_56_rest_api_subscriber1_11_56	-1234
120	Application/apisubscriber_1_11_57_rest_api_subscriber1_11_57	-1234
122	Application/apisubscriber_1_11_58_rest_api_subscriber1_11_58	-1234
124	Application/apisubscriber_1_11_59_rest_api_subscriber1_11_59	-1234
126	Application/apisubscriber_1_11_60_rest_api_subscriber1_11_60	-1234
128	Application/apisubscriber_1_12_61_rest_api_subscriber1_12_61	-1234
129	Application/apisubscriber_1_12_61_application_1_12_61_PRODUCTION	-1234
130	Application/apisubscriber_1_12_62_rest_api_subscriber1_12_62	-1234
131	Application/apisubscriber_1_12_62_application_1_12_62_PRODUCTION	-1234
132	Application/apisubscriber_1_12_63_rest_api_subscriber1_12_63	-1234
133	Application/apisubscriber_1_12_63_application_1_12_63_PRODUCTION	-1234
134	Application/apisubscriber_1_12_64_rest_api_subscriber1_12_64	-1234
135	Application/apisubscriber_1_12_64_application_1_12_64_PRODUCTION	-1234
136	Application/apisubscriber_1_12_65_rest_api_subscriber1_12_65	-1234
137	Application/apisubscriber_1_12_65_application_1_12_65_PRODUCTION	-1234
138	Application/apisubscriber_1_13_66_rest_api_subscriber1_13_66	-1234
139	Application/apisubscriber_1_13_66_application_1_13_66_PRODUCTION	-1234
140	Application/apisubscriber_1_13_67_rest_api_subscriber1_13_67	-1234
141	Application/apisubscriber_1_13_67_application_1_13_67_PRODUCTION	-1234
142	Application/apisubscriber_1_13_68_rest_api_subscriber1_13_68	-1234
143	Application/apisubscriber_1_13_68_application_1_13_68_PRODUCTION	-1234
144	Application/apisubscriber_1_13_69_rest_api_subscriber1_13_69	-1234
145	Application/apisubscriber_1_13_69_application_1_13_69_PRODUCTION	-1234
146	Application/apisubscriber_1_13_70_rest_api_subscriber1_13_70	-1234
147	Application/apisubscriber_1_13_70_application_1_13_70_PRODUCTION	-1234
148	Application/apisubscriber_1_14_71_rest_api_subscriber1_14_71	-1234
149	Application/apisubscriber_1_14_71_application_1_14_71_PRODUCTION	-1234
150	Application/apisubscriber_1_14_72_rest_api_subscriber1_14_72	-1234
151	Application/apisubscriber_1_14_72_application_1_14_72_PRODUCTION	-1234
152	Application/apisubscriber_1_14_73_rest_api_subscriber1_14_73	-1234
153	Application/apisubscriber_1_14_73_application_1_14_73_PRODUCTION	-1234
154	Application/apisubscriber_1_14_74_rest_api_subscriber1_14_74	-1234
155	Application/apisubscriber_1_14_74_application_1_14_74_PRODUCTION	-1234
156	Application/apisubscriber_1_14_75_rest_api_subscriber1_14_75	-1234
157	Application/apisubscriber_1_14_75_application_1_14_75_PRODUCTION	-1234
158	Application/apisubscriber_1_15_76_rest_api_subscriber1_15_76	-1234
159	Application/apisubscriber_1_15_76_application_1_15_76_PRODUCTION	-1234
160	Application/apisubscriber_1_15_77_rest_api_subscriber1_15_77	-1234
161	Application/apisubscriber_1_15_77_application_1_15_77_PRODUCTION	-1234
162	Application/apisubscriber_1_15_78_rest_api_subscriber1_15_78	-1234
163	Application/apisubscriber_1_15_78_application_1_15_78_PRODUCTION	-1234
164	Application/apisubscriber_1_15_79_rest_api_subscriber1_15_79	-1234
165	Application/apisubscriber_1_15_79_application_1_15_79_PRODUCTION	-1234
166	Application/apisubscriber_1_15_80_rest_api_subscriber1_15_80	-1234
167	Application/apisubscriber_1_15_80_application_1_15_80_PRODUCTION	-1234
168	Application/apisubscriber_1_16_81_rest_api_subscriber1_16_81	-1234
169	Application/apisubscriber_1_16_81_application_1_16_81_PRODUCTION	-1234
170	Application/apisubscriber_1_16_82_rest_api_subscriber1_16_82	-1234
171	Application/apisubscriber_1_16_82_application_1_16_82_PRODUCTION	-1234
172	Application/apisubscriber_1_16_83_rest_api_subscriber1_16_83	-1234
173	Application/apisubscriber_1_16_83_application_1_16_83_PRODUCTION	-1234
174	Application/apisubscriber_1_16_84_rest_api_subscriber1_16_84	-1234
175	Application/apisubscriber_1_16_84_application_1_16_84_PRODUCTION	-1234
176	Application/apisubscriber_1_16_85_rest_api_subscriber1_16_85	-1234
177	Application/apisubscriber_1_16_85_application_1_16_85_PRODUCTION	-1234
178	Application/apisubscriber_1_17_86_rest_api_subscriber1_17_86	-1234
179	Application/apisubscriber_1_17_86_application_1_17_86_PRODUCTION	-1234
180	Application/apisubscriber_1_17_87_rest_api_subscriber1_17_87	-1234
181	Application/apisubscriber_1_17_87_application_1_17_87_PRODUCTION	-1234
182	Application/apisubscriber_1_17_88_rest_api_subscriber1_17_88	-1234
183	Application/apisubscriber_1_17_88_application_1_17_88_PRODUCTION	-1234
184	Application/apisubscriber_1_17_89_rest_api_subscriber1_17_89	-1234
185	Application/apisubscriber_1_17_89_application_1_17_89_PRODUCTION	-1234
186	Application/apisubscriber_1_17_90_rest_api_subscriber1_17_90	-1234
188	Application/apisubscriber_1_18_91_rest_api_subscriber1_18_91	-1234
190	Application/apisubscriber_1_18_92_rest_api_subscriber1_18_92	-1234
187	Application/apisubscriber_1_17_90_application_1_17_90_PRODUCTION	-1234
189	Application/apisubscriber_1_18_91_application_1_18_91_PRODUCTION	-1234
191	Application/apisubscriber_1_18_92_application_1_18_92_PRODUCTION	-1234
193	Application/apisubscriber_1_18_93_application_1_18_93_PRODUCTION	-1234
195	Application/apisubscriber_1_18_94_application_1_18_94_PRODUCTION	-1234
197	Application/apisubscriber_1_18_95_application_1_18_95_PRODUCTION	-1234
199	Application/apisubscriber_1_19_96_application_1_19_96_PRODUCTION	-1234
192	Application/apisubscriber_1_18_93_rest_api_subscriber1_18_93	-1234
194	Application/apisubscriber_1_18_94_rest_api_subscriber1_18_94	-1234
196	Application/apisubscriber_1_18_95_rest_api_subscriber1_18_95	-1234
198	Application/apisubscriber_1_19_96_rest_api_subscriber1_19_96	-1234
200	Application/apisubscriber_1_19_97_rest_api_subscriber1_19_97	-1234
201	Application/apisubscriber_1_19_97_application_1_19_97_PRODUCTION	-1234
202	Application/apisubscriber_1_19_98_rest_api_subscriber1_19_98	-1234
203	Application/apisubscriber_1_19_98_application_1_19_98_PRODUCTION	-1234
204	Application/apisubscriber_1_19_99_rest_api_subscriber1_19_99	-1234
205	Application/apisubscriber_1_19_99_application_1_19_99_PRODUCTION	-1234
206	Application/apisubscriber_1_19_100_rest_api_subscriber1_19_100	-1234
207	Application/apisubscriber_1_19_100_application_1_19_100_PRODUCTION	-1234
208	Application/apicreator2_rest_api_creator	-1234
209	Application/apipublisher2_rest_api_publisher2	-1234
210	Application/apisubscriber_2_20_101_rest_api_subscriber2_20_101	-1234
211	Application/apisubscriber_2_20_101_application_2_20_101_PRODUCTION	-1234
212	Application/apisubscriber_2_20_102_rest_api_subscriber2_20_102	-1234
213	Application/apisubscriber_2_20_102_application_2_20_102_PRODUCTION	-1234
214	Application/apisubscriber_2_20_103_rest_api_subscriber2_20_103	-1234
215	Application/apisubscriber_2_20_103_application_2_20_103_PRODUCTION	-1234
216	Application/apisubscriber_2_20_104_rest_api_subscriber2_20_104	-1234
217	Application/apisubscriber_2_20_104_application_2_20_104_PRODUCTION	-1234
218	Application/apisubscriber_2_20_105_rest_api_subscriber2_20_105	-1234
219	Application/apisubscriber_2_20_105_application_2_20_105_PRODUCTION	-1234
220	Application/apisubscriber_2_21_106_rest_api_subscriber2_21_106	-1234
221	Application/apisubscriber_2_21_106_application_2_21_106_PRODUCTION	-1234
222	Application/apisubscriber_2_21_107_rest_api_subscriber2_21_107	-1234
223	Application/apisubscriber_2_21_107_application_2_21_107_PRODUCTION	-1234
224	Application/apisubscriber_2_21_108_rest_api_subscriber2_21_108	-1234
225	Application/apisubscriber_2_21_108_application_2_21_108_PRODUCTION	-1234
226	Application/apisubscriber_2_21_109_rest_api_subscriber2_21_109	-1234
227	Application/apisubscriber_2_21_109_application_2_21_109_PRODUCTION	-1234
228	Application/apisubscriber_2_21_110_rest_api_subscriber2_21_110	-1234
229	Application/apisubscriber_2_21_110_application_2_21_110_PRODUCTION	-1234
230	Application/apisubscriber_2_22_111_rest_api_subscriber2_22_111	-1234
231	Application/apisubscriber_2_22_111_application_2_22_111_PRODUCTION	-1234
232	Application/apisubscriber_2_22_112_rest_api_subscriber2_22_112	-1234
233	Application/apisubscriber_2_22_112_application_2_22_112_PRODUCTION	-1234
234	Application/apisubscriber_2_22_113_rest_api_subscriber2_22_113	-1234
235	Application/apisubscriber_2_22_113_application_2_22_113_PRODUCTION	-1234
236	Application/apisubscriber_2_22_114_rest_api_subscriber2_22_114	-1234
237	Application/apisubscriber_2_22_114_application_2_22_114_PRODUCTION	-1234
238	Application/apisubscriber_2_22_115_rest_api_subscriber2_22_115	-1234
239	Application/apisubscriber_2_22_115_application_2_22_115_PRODUCTION	-1234
240	Application/apisubscriber_2_23_116_rest_api_subscriber2_23_116	-1234
241	Application/apisubscriber_2_23_116_application_2_23_116_PRODUCTION	-1234
242	Application/apisubscriber_2_23_117_rest_api_subscriber2_23_117	-1234
243	Application/apisubscriber_2_23_117_application_2_23_117_PRODUCTION	-1234
244	Application/apisubscriber_2_23_118_rest_api_subscriber2_23_118	-1234
245	Application/apisubscriber_2_23_118_application_2_23_118_PRODUCTION	-1234
246	Application/apisubscriber_2_23_119_rest_api_subscriber2_23_119	-1234
247	Application/apisubscriber_2_23_119_application_2_23_119_PRODUCTION	-1234
248	Application/apisubscriber_2_23_120_rest_api_subscriber2_23_120	-1234
249	Application/apisubscriber_2_23_120_application_2_23_120_PRODUCTION	-1234
250	Application/apisubscriber_2_24_121_rest_api_subscriber2_24_121	-1234
251	Application/apisubscriber_2_24_121_application_2_24_121_PRODUCTION	-1234
252	Application/apisubscriber_2_24_122_rest_api_subscriber2_24_122	-1234
253	Application/apisubscriber_2_24_122_application_2_24_122_PRODUCTION	-1234
254	Application/apisubscriber_2_24_123_rest_api_subscriber2_24_123	-1234
255	Application/apisubscriber_2_24_123_application_2_24_123_PRODUCTION	-1234
256	Application/apisubscriber_2_24_124_rest_api_subscriber2_24_124	-1234
257	Application/apisubscriber_2_24_124_application_2_24_124_PRODUCTION	-1234
258	Application/apisubscriber_2_24_125_rest_api_subscriber2_24_125	-1234
259	Application/apisubscriber_2_24_125_application_2_24_125_PRODUCTION	-1234
260	Application/apisubscriber_2_25_126_rest_api_subscriber2_25_126	-1234
261	Application/apisubscriber_2_25_126_application_2_25_126_PRODUCTION	-1234
262	Application/apisubscriber_2_25_127_rest_api_subscriber2_25_127	-1234
263	Application/apisubscriber_2_25_127_application_2_25_127_PRODUCTION	-1234
264	Application/apisubscriber_2_25_128_rest_api_subscriber2_25_128	-1234
265	Application/apisubscriber_2_25_128_application_2_25_128_PRODUCTION	-1234
266	Application/apisubscriber_2_25_129_rest_api_subscriber2_25_129	-1234
267	Application/apisubscriber_2_25_129_application_2_25_129_PRODUCTION	-1234
268	Application/apisubscriber_2_25_130_rest_api_subscriber2_25_130	-1234
269	Application/apisubscriber_2_25_130_application_2_25_130_PRODUCTION	-1234
270	Application/apisubscriber_2_26_131_rest_api_subscriber2_26_131	-1234
271	Application/apisubscriber_2_26_131_application_2_26_131_PRODUCTION	-1234
272	Application/apisubscriber_2_26_132_rest_api_subscriber2_26_132	-1234
273	Application/apisubscriber_2_26_132_application_2_26_132_PRODUCTION	-1234
274	Application/apisubscriber_2_26_133_rest_api_subscriber2_26_133	-1234
275	Application/apisubscriber_2_26_133_application_2_26_133_PRODUCTION	-1234
276	Application/apisubscriber_2_26_134_rest_api_subscriber2_26_134	-1234
277	Application/apisubscriber_2_26_134_application_2_26_134_PRODUCTION	-1234
278	Application/apisubscriber_2_26_135_rest_api_subscriber2_26_135	-1234
279	Application/apisubscriber_2_26_135_application_2_26_135_PRODUCTION	-1234
280	Application/apisubscriber_2_27_136_rest_api_subscriber2_27_136	-1234
281	Application/apisubscriber_2_27_136_application_2_27_136_PRODUCTION	-1234
282	Application/apisubscriber_2_27_137_rest_api_subscriber2_27_137	-1234
283	Application/apisubscriber_2_27_137_application_2_27_137_PRODUCTION	-1234
284	Application/apisubscriber_2_27_138_rest_api_subscriber2_27_138	-1234
285	Application/apisubscriber_2_27_138_application_2_27_138_PRODUCTION	-1234
286	Application/apisubscriber_2_27_139_rest_api_subscriber2_27_139	-1234
287	Application/apisubscriber_2_27_139_application_2_27_139_PRODUCTION	-1234
288	Application/apisubscriber_2_27_140_rest_api_subscriber2_27_140	-1234
289	Application/apisubscriber_2_27_140_application_2_27_140_PRODUCTION	-1234
290	Application/apisubscriber_2_28_141_rest_api_subscriber2_28_141	-1234
291	Application/apisubscriber_2_28_141_application_2_28_141_PRODUCTION	-1234
292	Application/apisubscriber_2_28_142_rest_api_subscriber2_28_142	-1234
293	Application/apisubscriber_2_28_142_application_2_28_142_PRODUCTION	-1234
294	Application/apisubscriber_2_28_143_rest_api_subscriber2_28_143	-1234
295	Application/apisubscriber_2_28_143_application_2_28_143_PRODUCTION	-1234
296	Application/apisubscriber_2_28_144_rest_api_subscriber2_28_144	-1234
297	Application/apisubscriber_2_28_144_application_2_28_144_PRODUCTION	-1234
298	Application/apisubscriber_2_28_145_rest_api_subscriber2_28_145	-1234
299	Application/apisubscriber_2_28_145_application_2_28_145_PRODUCTION	-1234
300	Application/apisubscriber_2_29_146_rest_api_subscriber2_29_146	-1234
301	Application/apisubscriber_2_29_146_application_2_29_146_PRODUCTION	-1234
302	Application/apisubscriber_2_29_147_rest_api_subscriber2_29_147	-1234
303	Application/apisubscriber_2_29_147_application_2_29_147_PRODUCTION	-1234
304	Application/apisubscriber_2_29_148_rest_api_subscriber2_29_148	-1234
305	Application/apisubscriber_2_29_148_application_2_29_148_PRODUCTION	-1234
306	Application/apisubscriber_2_29_149_rest_api_subscriber2_29_149	-1234
307	Application/apisubscriber_2_29_149_application_2_29_149_PRODUCTION	-1234
308	Application/apisubscriber_2_29_150_rest_api_subscriber2_29_150	-1234
309	Application/apisubscriber_2_29_150_application_2_29_150_PRODUCTION	-1234
310	Application/apisubscriber_2_30_151_rest_api_subscriber2_30_151	-1234
311	Application/apisubscriber_2_30_151_application_2_30_151_PRODUCTION	-1234
312	Application/apisubscriber_2_30_152_rest_api_subscriber2_30_152	-1234
313	Application/apisubscriber_2_30_152_application_2_30_152_PRODUCTION	-1234
314	Application/apisubscriber_2_30_153_rest_api_subscriber2_30_153	-1234
315	Application/apisubscriber_2_30_153_application_2_30_153_PRODUCTION	-1234
316	Application/apisubscriber_2_30_154_rest_api_subscriber2_30_154	-1234
317	Application/apisubscriber_2_30_154_application_2_30_154_PRODUCTION	-1234
318	Application/apisubscriber_2_30_155_rest_api_subscriber2_30_155	-1234
319	Application/apisubscriber_2_30_155_application_2_30_155_PRODUCTION	-1234
320	Application/apisubscriber_2_31_156_rest_api_subscriber2_31_156	-1234
321	Application/apisubscriber_2_31_156_application_2_31_156_PRODUCTION	-1234
322	Application/apisubscriber_2_31_157_rest_api_subscriber2_31_157	-1234
323	Application/apisubscriber_2_31_157_application_2_31_157_PRODUCTION	-1234
324	Application/apisubscriber_2_31_158_rest_api_subscriber2_31_158	-1234
325	Application/apisubscriber_2_31_158_application_2_31_158_PRODUCTION	-1234
326	Application/apisubscriber_2_31_159_rest_api_subscriber2_31_159	-1234
327	Application/apisubscriber_2_31_159_application_2_31_159_PRODUCTION	-1234
328	Application/apisubscriber_2_31_160_rest_api_subscriber2_31_160	-1234
329	Application/apisubscriber_2_31_160_application_2_31_160_PRODUCTION	-1234
330	Application/apisubscriber_2_32_161_rest_api_subscriber2_32_161	-1234
331	Application/apisubscriber_2_32_161_application_2_32_161_PRODUCTION	-1234
332	Application/apisubscriber_2_32_162_rest_api_subscriber2_32_162	-1234
333	Application/apisubscriber_2_32_162_application_2_32_162_PRODUCTION	-1234
334	Application/apisubscriber_2_32_163_rest_api_subscriber2_32_163	-1234
335	Application/apisubscriber_2_32_163_application_2_32_163_PRODUCTION	-1234
336	Application/apisubscriber_2_32_164_rest_api_subscriber2_32_164	-1234
337	Application/apisubscriber_2_32_164_application_2_32_164_PRODUCTION	-1234
338	Application/apisubscriber_2_32_165_rest_api_subscriber2_32_165	-1234
339	Application/apisubscriber_2_32_165_application_2_32_165_PRODUCTION	-1234
340	Application/apisubscriber_2_33_166_rest_api_subscriber2_33_166	-1234
341	Application/apisubscriber_2_33_166_application_2_33_166_PRODUCTION	-1234
342	Application/apisubscriber_2_33_167_rest_api_subscriber2_33_167	-1234
343	Application/apisubscriber_2_33_167_application_2_33_167_PRODUCTION	-1234
344	Application/apisubscriber_2_33_168_rest_api_subscriber2_33_168	-1234
345	Application/apisubscriber_2_33_168_application_2_33_168_PRODUCTION	-1234
346	Application/apisubscriber_2_33_169_rest_api_subscriber2_33_169	-1234
347	Application/apisubscriber_2_33_169_application_2_33_169_PRODUCTION	-1234
348	Application/apisubscriber_2_33_170_rest_api_subscriber2_33_170	-1234
349	Application/apisubscriber_2_33_170_application_2_33_170_PRODUCTION	-1234
350	Application/apisubscriber_2_34_171_rest_api_subscriber2_34_171	-1234
351	Application/apisubscriber_2_34_171_application_2_34_171_PRODUCTION	-1234
352	Application/apisubscriber_2_34_172_rest_api_subscriber2_34_172	-1234
353	Application/apisubscriber_2_34_172_application_2_34_172_PRODUCTION	-1234
355	Application/apisubscriber_2_34_173_application_2_34_173_PRODUCTION	-1234
357	Application/apisubscriber_2_34_174_application_2_34_174_PRODUCTION	-1234
359	Application/apisubscriber_2_34_175_application_2_34_175_PRODUCTION	-1234
354	Application/apisubscriber_2_34_173_rest_api_subscriber2_34_173	-1234
356	Application/apisubscriber_2_34_174_rest_api_subscriber2_34_174	-1234
358	Application/apisubscriber_2_34_175_rest_api_subscriber2_34_175	-1234
360	Application/apisubscriber_2_35_176_rest_api_subscriber2_35_176	-1234
361	Application/apisubscriber_2_35_176_application_2_35_176_PRODUCTION	-1234
362	Application/apisubscriber_2_35_177_rest_api_subscriber2_35_177	-1234
363	Application/apisubscriber_2_35_177_application_2_35_177_PRODUCTION	-1234
364	Application/apisubscriber_2_35_178_rest_api_subscriber2_35_178	-1234
365	Application/apisubscriber_2_35_178_application_2_35_178_PRODUCTION	-1234
366	Application/apisubscriber_2_35_179_rest_api_subscriber2_35_179	-1234
367	Application/apisubscriber_2_35_179_application_2_35_179_PRODUCTION	-1234
368	Application/apisubscriber_2_35_180_rest_api_subscriber2_35_180	-1234
369	Application/apisubscriber_2_35_180_application_2_35_180_PRODUCTION	-1234
370	Application/apisubscriber_2_36_181_rest_api_subscriber2_36_181	-1234
371	Application/apisubscriber_2_36_181_application_2_36_181_PRODUCTION	-1234
372	Application/apisubscriber_2_36_182_rest_api_subscriber2_36_182	-1234
373	Application/apisubscriber_2_36_182_application_2_36_182_PRODUCTION	-1234
374	Application/apisubscriber_2_36_183_rest_api_subscriber2_36_183	-1234
375	Application/apisubscriber_2_36_183_application_2_36_183_PRODUCTION	-1234
376	Application/apisubscriber_2_36_184_rest_api_subscriber2_36_184	-1234
377	Application/apisubscriber_2_36_184_application_2_36_184_PRODUCTION	-1234
378	Application/apisubscriber_2_36_185_rest_api_subscriber2_36_185	-1234
379	Application/apisubscriber_2_36_185_application_2_36_185_PRODUCTION	-1234
380	Application/apisubscriber_2_37_186_rest_api_subscriber2_37_186	-1234
381	Application/apisubscriber_2_37_186_application_2_37_186_PRODUCTION	-1234
382	Application/apisubscriber_2_37_187_rest_api_subscriber2_37_187	-1234
383	Application/apisubscriber_2_37_187_application_2_37_187_PRODUCTION	-1234
384	Application/apisubscriber_2_37_188_rest_api_subscriber2_37_188	-1234
385	Application/apisubscriber_2_37_188_application_2_37_188_PRODUCTION	-1234
386	Application/apisubscriber_2_37_189_rest_api_subscriber2_37_189	-1234
387	Application/apisubscriber_2_37_189_application_2_37_189_PRODUCTION	-1234
388	Application/apisubscriber_2_37_190_rest_api_subscriber2_37_190	-1234
389	Application/apisubscriber_2_37_190_application_2_37_190_PRODUCTION	-1234
390	Application/apisubscriber_2_38_191_rest_api_subscriber2_38_191	-1234
391	Application/apisubscriber_2_38_191_application_2_38_191_PRODUCTION	-1234
392	Application/apisubscriber_2_38_192_rest_api_subscriber2_38_192	-1234
393	Application/apisubscriber_2_38_192_application_2_38_192_PRODUCTION	-1234
394	Application/apisubscriber_2_38_193_rest_api_subscriber2_38_193	-1234
395	Application/apisubscriber_2_38_193_application_2_38_193_PRODUCTION	-1234
396	Application/apisubscriber_2_38_194_rest_api_subscriber2_38_194	-1234
397	Application/apisubscriber_2_38_194_application_2_38_194_PRODUCTION	-1234
398	Application/apisubscriber_2_38_195_rest_api_subscriber2_38_195	-1234
399	Application/apisubscriber_2_38_195_application_2_38_195_PRODUCTION	-1234
400	Application/apisubscriber_2_39_196_rest_api_subscriber2_39_196	-1234
401	Application/apisubscriber_2_39_196_application_2_39_196_PRODUCTION	-1234
402	Application/apisubscriber_2_39_197_rest_api_subscriber2_39_197	-1234
403	Application/apisubscriber_2_39_197_application_2_39_197_PRODUCTION	-1234
404	Application/apisubscriber_2_39_198_rest_api_subscriber2_39_198	-1234
405	Application/apisubscriber_2_39_198_application_2_39_198_PRODUCTION	-1234
406	Application/apisubscriber_2_39_199_rest_api_subscriber2_39_199	-1234
407	Application/apisubscriber_2_39_199_application_2_39_199_PRODUCTION	-1234
408	Application/apisubscriber_2_39_200_rest_api_subscriber2_39_200	-1234
409	Application/apisubscriber_2_39_200_application_2_39_200_PRODUCTION	-1234
410	everyone	1
411	publisher	1
412	creator	1
413	subscriber	1
414	Application/eric_NewAPplication_PRODUCTION	1
415	Application/admin_NewSUperTenantAPp_PRODUCTION	-1234
\.


--
-- Data for Name: um_hybrid_user_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_hybrid_user_role (um_id, um_user_name, um_role_id, um_tenant_id, um_domain_id) FROM stdin;
1	admin	2	-1234	1
2	admin	3	-1234	1
3	admin	4	-1234	1
4	apicreator1	3	-1234	1
5	apipublisher1	2	-1234	1
6	apicreator1	6	-1234	1
7	apipublisher1	7	-1234	1
8	apisubscriber_1_0_1	4	-1234	1
9	apisubscriber_1_0_1	8	-1234	1
10	apisubscriber_1_0_1	9	-1234	1
11	apisubscriber_1_0_2	4	-1234	1
12	apisubscriber_1_0_2	10	-1234	1
13	apisubscriber_1_0_2	11	-1234	1
14	apisubscriber_1_0_3	4	-1234	1
15	apisubscriber_1_0_3	12	-1234	1
16	apisubscriber_1_0_3	13	-1234	1
17	apisubscriber_1_0_4	4	-1234	1
18	apisubscriber_1_0_4	14	-1234	1
19	apisubscriber_1_0_4	15	-1234	1
20	apisubscriber_1_0_5	4	-1234	1
21	apisubscriber_1_0_5	16	-1234	1
22	apisubscriber_1_0_5	17	-1234	1
23	apisubscriber_1_1_6	4	-1234	1
24	apisubscriber_1_1_6	18	-1234	1
25	apisubscriber_1_1_6	19	-1234	1
26	apisubscriber_1_1_7	4	-1234	1
27	apisubscriber_1_1_7	20	-1234	1
28	apisubscriber_1_1_7	21	-1234	1
29	apisubscriber_1_1_8	4	-1234	1
30	apisubscriber_1_1_8	22	-1234	1
31	apisubscriber_1_1_8	23	-1234	1
32	apisubscriber_1_1_9	4	-1234	1
33	apisubscriber_1_1_9	24	-1234	1
34	apisubscriber_1_1_9	25	-1234	1
35	apisubscriber_1_1_10	4	-1234	1
36	apisubscriber_1_1_10	26	-1234	1
37	apisubscriber_1_1_10	27	-1234	1
38	apisubscriber_1_2_11	4	-1234	1
39	apisubscriber_1_2_11	28	-1234	1
40	apisubscriber_1_2_11	29	-1234	1
41	apisubscriber_1_2_12	4	-1234	1
42	apisubscriber_1_2_12	30	-1234	1
43	apisubscriber_1_2_12	31	-1234	1
44	apisubscriber_1_2_13	4	-1234	1
45	apisubscriber_1_2_13	32	-1234	1
46	apisubscriber_1_2_13	33	-1234	1
47	apisubscriber_1_2_14	4	-1234	1
48	apisubscriber_1_2_14	34	-1234	1
49	apisubscriber_1_2_14	35	-1234	1
50	apisubscriber_1_2_15	4	-1234	1
51	apisubscriber_1_2_15	36	-1234	1
52	apisubscriber_1_2_15	37	-1234	1
53	apisubscriber_1_3_16	4	-1234	1
54	apisubscriber_1_3_16	38	-1234	1
55	apisubscriber_1_3_16	39	-1234	1
56	apisubscriber_1_3_17	4	-1234	1
57	apisubscriber_1_3_17	40	-1234	1
58	apisubscriber_1_3_17	41	-1234	1
59	apisubscriber_1_3_18	4	-1234	1
60	apisubscriber_1_3_18	42	-1234	1
61	apisubscriber_1_3_18	43	-1234	1
62	apisubscriber_1_3_19	4	-1234	1
63	apisubscriber_1_3_19	44	-1234	1
64	apisubscriber_1_3_19	45	-1234	1
65	apisubscriber_1_3_20	4	-1234	1
66	apisubscriber_1_3_20	46	-1234	1
67	apisubscriber_1_3_20	47	-1234	1
68	apisubscriber_1_4_21	4	-1234	1
69	apisubscriber_1_4_21	48	-1234	1
70	apisubscriber_1_4_21	49	-1234	1
71	apisubscriber_1_4_22	4	-1234	1
72	apisubscriber_1_4_22	50	-1234	1
73	apisubscriber_1_4_22	51	-1234	1
74	apisubscriber_1_4_23	4	-1234	1
75	apisubscriber_1_4_23	52	-1234	1
76	apisubscriber_1_4_23	53	-1234	1
77	apisubscriber_1_4_24	4	-1234	1
78	apisubscriber_1_4_24	54	-1234	1
79	apisubscriber_1_4_24	55	-1234	1
80	apisubscriber_1_4_25	4	-1234	1
81	apisubscriber_1_4_25	56	-1234	1
82	apisubscriber_1_4_25	57	-1234	1
83	apisubscriber_1_5_26	4	-1234	1
84	apisubscriber_1_5_26	58	-1234	1
85	apisubscriber_1_5_26	59	-1234	1
86	apisubscriber_1_5_27	4	-1234	1
87	apisubscriber_1_5_27	60	-1234	1
88	apisubscriber_1_5_27	61	-1234	1
89	apisubscriber_1_5_28	4	-1234	1
90	apisubscriber_1_5_28	62	-1234	1
91	apisubscriber_1_5_28	63	-1234	1
92	apisubscriber_1_5_29	4	-1234	1
93	apisubscriber_1_5_29	64	-1234	1
94	apisubscriber_1_5_29	65	-1234	1
95	apisubscriber_1_5_30	4	-1234	1
96	apisubscriber_1_5_30	66	-1234	1
97	apisubscriber_1_5_30	67	-1234	1
98	apisubscriber_1_6_31	4	-1234	1
99	apisubscriber_1_6_31	68	-1234	1
100	apisubscriber_1_6_31	69	-1234	1
101	apisubscriber_1_6_32	4	-1234	1
102	apisubscriber_1_6_32	70	-1234	1
103	apisubscriber_1_6_32	71	-1234	1
104	apisubscriber_1_6_33	4	-1234	1
105	apisubscriber_1_6_33	72	-1234	1
106	apisubscriber_1_6_33	73	-1234	1
107	apisubscriber_1_6_34	4	-1234	1
108	apisubscriber_1_6_34	74	-1234	1
109	apisubscriber_1_6_34	75	-1234	1
110	apisubscriber_1_6_35	4	-1234	1
111	apisubscriber_1_6_35	76	-1234	1
112	apisubscriber_1_6_35	77	-1234	1
113	apisubscriber_1_7_36	4	-1234	1
114	apisubscriber_1_7_36	78	-1234	1
115	apisubscriber_1_7_36	79	-1234	1
116	apisubscriber_1_7_37	4	-1234	1
117	apisubscriber_1_7_37	80	-1234	1
118	apisubscriber_1_7_37	81	-1234	1
119	apisubscriber_1_7_38	4	-1234	1
120	apisubscriber_1_7_38	82	-1234	1
121	apisubscriber_1_7_38	83	-1234	1
122	apisubscriber_1_7_39	4	-1234	1
123	apisubscriber_1_7_39	84	-1234	1
125	apisubscriber_1_7_40	4	-1234	1
126	apisubscriber_1_7_40	86	-1234	1
128	apisubscriber_1_8_41	4	-1234	1
129	apisubscriber_1_8_41	88	-1234	1
131	apisubscriber_1_8_42	4	-1234	1
132	apisubscriber_1_8_42	90	-1234	1
134	apisubscriber_1_8_43	4	-1234	1
135	apisubscriber_1_8_43	92	-1234	1
137	apisubscriber_1_8_44	4	-1234	1
138	apisubscriber_1_8_44	94	-1234	1
140	apisubscriber_1_8_45	4	-1234	1
124	apisubscriber_1_7_39	85	-1234	1
127	apisubscriber_1_7_40	87	-1234	1
130	apisubscriber_1_8_41	89	-1234	1
133	apisubscriber_1_8_42	91	-1234	1
136	apisubscriber_1_8_43	93	-1234	1
139	apisubscriber_1_8_44	95	-1234	1
141	apisubscriber_1_8_45	96	-1234	1
142	apisubscriber_1_8_45	97	-1234	1
143	apisubscriber_1_9_46	4	-1234	1
144	apisubscriber_1_9_46	98	-1234	1
145	apisubscriber_1_9_46	99	-1234	1
146	apisubscriber_1_9_47	4	-1234	1
147	apisubscriber_1_9_47	100	-1234	1
148	apisubscriber_1_9_47	101	-1234	1
149	apisubscriber_1_9_48	4	-1234	1
150	apisubscriber_1_9_48	102	-1234	1
151	apisubscriber_1_9_48	103	-1234	1
152	apisubscriber_1_9_49	4	-1234	1
153	apisubscriber_1_9_49	104	-1234	1
154	apisubscriber_1_9_49	105	-1234	1
155	apisubscriber_1_9_50	4	-1234	1
156	apisubscriber_1_9_50	106	-1234	1
157	apisubscriber_1_9_50	107	-1234	1
158	apisubscriber_1_10_51	4	-1234	1
159	apisubscriber_1_10_51	108	-1234	1
160	apisubscriber_1_10_51	109	-1234	1
161	apisubscriber_1_10_52	4	-1234	1
162	apisubscriber_1_10_52	110	-1234	1
163	apisubscriber_1_10_52	111	-1234	1
164	apisubscriber_1_10_53	4	-1234	1
165	apisubscriber_1_10_53	112	-1234	1
166	apisubscriber_1_10_53	113	-1234	1
167	apisubscriber_1_10_54	4	-1234	1
168	apisubscriber_1_10_54	114	-1234	1
169	apisubscriber_1_10_54	115	-1234	1
170	apisubscriber_1_10_55	4	-1234	1
171	apisubscriber_1_10_55	116	-1234	1
172	apisubscriber_1_10_55	117	-1234	1
173	apisubscriber_1_11_56	4	-1234	1
174	apisubscriber_1_11_56	118	-1234	1
175	apisubscriber_1_11_56	119	-1234	1
176	apisubscriber_1_11_57	4	-1234	1
177	apisubscriber_1_11_57	120	-1234	1
178	apisubscriber_1_11_57	121	-1234	1
179	apisubscriber_1_11_58	4	-1234	1
180	apisubscriber_1_11_58	122	-1234	1
181	apisubscriber_1_11_58	123	-1234	1
182	apisubscriber_1_11_59	4	-1234	1
183	apisubscriber_1_11_59	124	-1234	1
184	apisubscriber_1_11_59	125	-1234	1
185	apisubscriber_1_11_60	4	-1234	1
186	apisubscriber_1_11_60	126	-1234	1
187	apisubscriber_1_11_60	127	-1234	1
188	apisubscriber_1_12_61	4	-1234	1
189	apisubscriber_1_12_61	128	-1234	1
190	apisubscriber_1_12_61	129	-1234	1
191	apisubscriber_1_12_62	4	-1234	1
192	apisubscriber_1_12_62	130	-1234	1
193	apisubscriber_1_12_62	131	-1234	1
194	apisubscriber_1_12_63	4	-1234	1
195	apisubscriber_1_12_63	132	-1234	1
196	apisubscriber_1_12_63	133	-1234	1
197	apisubscriber_1_12_64	4	-1234	1
198	apisubscriber_1_12_64	134	-1234	1
199	apisubscriber_1_12_64	135	-1234	1
200	apisubscriber_1_12_65	4	-1234	1
201	apisubscriber_1_12_65	136	-1234	1
202	apisubscriber_1_12_65	137	-1234	1
203	apisubscriber_1_13_66	4	-1234	1
204	apisubscriber_1_13_66	138	-1234	1
205	apisubscriber_1_13_66	139	-1234	1
206	apisubscriber_1_13_67	4	-1234	1
207	apisubscriber_1_13_67	140	-1234	1
208	apisubscriber_1_13_67	141	-1234	1
209	apisubscriber_1_13_68	4	-1234	1
210	apisubscriber_1_13_68	142	-1234	1
211	apisubscriber_1_13_68	143	-1234	1
212	apisubscriber_1_13_69	4	-1234	1
213	apisubscriber_1_13_69	144	-1234	1
214	apisubscriber_1_13_69	145	-1234	1
215	apisubscriber_1_13_70	4	-1234	1
216	apisubscriber_1_13_70	146	-1234	1
217	apisubscriber_1_13_70	147	-1234	1
218	apisubscriber_1_14_71	4	-1234	1
219	apisubscriber_1_14_71	148	-1234	1
220	apisubscriber_1_14_71	149	-1234	1
221	apisubscriber_1_14_72	4	-1234	1
222	apisubscriber_1_14_72	150	-1234	1
223	apisubscriber_1_14_72	151	-1234	1
224	apisubscriber_1_14_73	4	-1234	1
225	apisubscriber_1_14_73	152	-1234	1
226	apisubscriber_1_14_73	153	-1234	1
227	apisubscriber_1_14_74	4	-1234	1
228	apisubscriber_1_14_74	154	-1234	1
229	apisubscriber_1_14_74	155	-1234	1
230	apisubscriber_1_14_75	4	-1234	1
231	apisubscriber_1_14_75	156	-1234	1
232	apisubscriber_1_14_75	157	-1234	1
233	apisubscriber_1_15_76	4	-1234	1
234	apisubscriber_1_15_76	158	-1234	1
235	apisubscriber_1_15_76	159	-1234	1
236	apisubscriber_1_15_77	4	-1234	1
237	apisubscriber_1_15_77	160	-1234	1
238	apisubscriber_1_15_77	161	-1234	1
239	apisubscriber_1_15_78	4	-1234	1
240	apisubscriber_1_15_78	162	-1234	1
241	apisubscriber_1_15_78	163	-1234	1
242	apisubscriber_1_15_79	4	-1234	1
243	apisubscriber_1_15_79	164	-1234	1
244	apisubscriber_1_15_79	165	-1234	1
245	apisubscriber_1_15_80	4	-1234	1
246	apisubscriber_1_15_80	166	-1234	1
247	apisubscriber_1_15_80	167	-1234	1
248	apisubscriber_1_16_81	4	-1234	1
249	apisubscriber_1_16_81	168	-1234	1
250	apisubscriber_1_16_81	169	-1234	1
251	apisubscriber_1_16_82	4	-1234	1
252	apisubscriber_1_16_82	170	-1234	1
253	apisubscriber_1_16_82	171	-1234	1
254	apisubscriber_1_16_83	4	-1234	1
255	apisubscriber_1_16_83	172	-1234	1
257	apisubscriber_1_16_84	4	-1234	1
258	apisubscriber_1_16_84	174	-1234	1
260	apisubscriber_1_16_85	4	-1234	1
261	apisubscriber_1_16_85	176	-1234	1
275	apisubscriber_1_17_90	4	-1234	1
276	apisubscriber_1_17_90	186	-1234	1
278	apisubscriber_1_18_91	4	-1234	1
279	apisubscriber_1_18_91	188	-1234	1
281	apisubscriber_1_18_92	4	-1234	1
282	apisubscriber_1_18_92	190	-1234	1
284	apisubscriber_1_18_93	4	-1234	1
256	apisubscriber_1_16_83	173	-1234	1
259	apisubscriber_1_16_84	175	-1234	1
262	apisubscriber_1_16_85	177	-1234	1
265	apisubscriber_1_17_86	179	-1234	1
268	apisubscriber_1_17_87	181	-1234	1
271	apisubscriber_1_17_88	183	-1234	1
274	apisubscriber_1_17_89	185	-1234	1
277	apisubscriber_1_17_90	187	-1234	1
280	apisubscriber_1_18_91	189	-1234	1
283	apisubscriber_1_18_92	191	-1234	1
286	apisubscriber_1_18_93	193	-1234	1
289	apisubscriber_1_18_94	195	-1234	1
292	apisubscriber_1_18_95	197	-1234	1
295	apisubscriber_1_19_96	199	-1234	1
263	apisubscriber_1_17_86	4	-1234	1
264	apisubscriber_1_17_86	178	-1234	1
266	apisubscriber_1_17_87	4	-1234	1
267	apisubscriber_1_17_87	180	-1234	1
269	apisubscriber_1_17_88	4	-1234	1
270	apisubscriber_1_17_88	182	-1234	1
272	apisubscriber_1_17_89	4	-1234	1
273	apisubscriber_1_17_89	184	-1234	1
285	apisubscriber_1_18_93	192	-1234	1
287	apisubscriber_1_18_94	4	-1234	1
288	apisubscriber_1_18_94	194	-1234	1
290	apisubscriber_1_18_95	4	-1234	1
291	apisubscriber_1_18_95	196	-1234	1
293	apisubscriber_1_19_96	4	-1234	1
294	apisubscriber_1_19_96	198	-1234	1
296	apisubscriber_1_19_97	4	-1234	1
297	apisubscriber_1_19_97	200	-1234	1
298	apisubscriber_1_19_97	201	-1234	1
299	apisubscriber_1_19_98	4	-1234	1
300	apisubscriber_1_19_98	202	-1234	1
301	apisubscriber_1_19_98	203	-1234	1
302	apisubscriber_1_19_99	4	-1234	1
303	apisubscriber_1_19_99	204	-1234	1
304	apisubscriber_1_19_99	205	-1234	1
305	apisubscriber_1_19_100	4	-1234	1
306	apisubscriber_1_19_100	206	-1234	1
307	apisubscriber_1_19_100	207	-1234	1
308	apicreator2	3	-1234	1
309	apipublisher2	2	-1234	1
310	apicreator2	208	-1234	1
311	apipublisher2	209	-1234	1
312	apisubscriber_2_20_101	4	-1234	1
313	apisubscriber_2_20_101	210	-1234	1
314	apisubscriber_2_20_101	211	-1234	1
315	apisubscriber_2_20_102	4	-1234	1
316	apisubscriber_2_20_102	212	-1234	1
317	apisubscriber_2_20_102	213	-1234	1
318	apisubscriber_2_20_103	4	-1234	1
319	apisubscriber_2_20_103	214	-1234	1
320	apisubscriber_2_20_103	215	-1234	1
321	apisubscriber_2_20_104	4	-1234	1
322	apisubscriber_2_20_104	216	-1234	1
323	apisubscriber_2_20_104	217	-1234	1
324	apisubscriber_2_20_105	4	-1234	1
325	apisubscriber_2_20_105	218	-1234	1
326	apisubscriber_2_20_105	219	-1234	1
327	apisubscriber_2_21_106	4	-1234	1
328	apisubscriber_2_21_106	220	-1234	1
329	apisubscriber_2_21_106	221	-1234	1
330	apisubscriber_2_21_107	4	-1234	1
331	apisubscriber_2_21_107	222	-1234	1
332	apisubscriber_2_21_107	223	-1234	1
333	apisubscriber_2_21_108	4	-1234	1
334	apisubscriber_2_21_108	224	-1234	1
335	apisubscriber_2_21_108	225	-1234	1
336	apisubscriber_2_21_109	4	-1234	1
337	apisubscriber_2_21_109	226	-1234	1
338	apisubscriber_2_21_109	227	-1234	1
339	apisubscriber_2_21_110	4	-1234	1
340	apisubscriber_2_21_110	228	-1234	1
341	apisubscriber_2_21_110	229	-1234	1
342	apisubscriber_2_22_111	4	-1234	1
343	apisubscriber_2_22_111	230	-1234	1
344	apisubscriber_2_22_111	231	-1234	1
345	apisubscriber_2_22_112	4	-1234	1
346	apisubscriber_2_22_112	232	-1234	1
347	apisubscriber_2_22_112	233	-1234	1
348	apisubscriber_2_22_113	4	-1234	1
349	apisubscriber_2_22_113	234	-1234	1
350	apisubscriber_2_22_113	235	-1234	1
351	apisubscriber_2_22_114	4	-1234	1
352	apisubscriber_2_22_114	236	-1234	1
353	apisubscriber_2_22_114	237	-1234	1
354	apisubscriber_2_22_115	4	-1234	1
355	apisubscriber_2_22_115	238	-1234	1
356	apisubscriber_2_22_115	239	-1234	1
357	apisubscriber_2_23_116	4	-1234	1
358	apisubscriber_2_23_116	240	-1234	1
359	apisubscriber_2_23_116	241	-1234	1
360	apisubscriber_2_23_117	4	-1234	1
361	apisubscriber_2_23_117	242	-1234	1
362	apisubscriber_2_23_117	243	-1234	1
363	apisubscriber_2_23_118	4	-1234	1
364	apisubscriber_2_23_118	244	-1234	1
365	apisubscriber_2_23_118	245	-1234	1
366	apisubscriber_2_23_119	4	-1234	1
367	apisubscriber_2_23_119	246	-1234	1
368	apisubscriber_2_23_119	247	-1234	1
369	apisubscriber_2_23_120	4	-1234	1
370	apisubscriber_2_23_120	248	-1234	1
371	apisubscriber_2_23_120	249	-1234	1
372	apisubscriber_2_24_121	4	-1234	1
373	apisubscriber_2_24_121	250	-1234	1
374	apisubscriber_2_24_121	251	-1234	1
375	apisubscriber_2_24_122	4	-1234	1
376	apisubscriber_2_24_122	252	-1234	1
377	apisubscriber_2_24_122	253	-1234	1
378	apisubscriber_2_24_123	4	-1234	1
379	apisubscriber_2_24_123	254	-1234	1
380	apisubscriber_2_24_123	255	-1234	1
381	apisubscriber_2_24_124	4	-1234	1
382	apisubscriber_2_24_124	256	-1234	1
383	apisubscriber_2_24_124	257	-1234	1
384	apisubscriber_2_24_125	4	-1234	1
385	apisubscriber_2_24_125	258	-1234	1
386	apisubscriber_2_24_125	259	-1234	1
387	apisubscriber_2_25_126	4	-1234	1
388	apisubscriber_2_25_126	260	-1234	1
389	apisubscriber_2_25_126	261	-1234	1
390	apisubscriber_2_25_127	4	-1234	1
391	apisubscriber_2_25_127	262	-1234	1
392	apisubscriber_2_25_127	263	-1234	1
393	apisubscriber_2_25_128	4	-1234	1
394	apisubscriber_2_25_128	264	-1234	1
395	apisubscriber_2_25_128	265	-1234	1
396	apisubscriber_2_25_129	4	-1234	1
397	apisubscriber_2_25_129	266	-1234	1
398	apisubscriber_2_25_129	267	-1234	1
399	apisubscriber_2_25_130	4	-1234	1
400	apisubscriber_2_25_130	268	-1234	1
401	apisubscriber_2_25_130	269	-1234	1
402	apisubscriber_2_26_131	4	-1234	1
403	apisubscriber_2_26_131	270	-1234	1
404	apisubscriber_2_26_131	271	-1234	1
405	apisubscriber_2_26_132	4	-1234	1
406	apisubscriber_2_26_132	272	-1234	1
407	apisubscriber_2_26_132	273	-1234	1
408	apisubscriber_2_26_133	4	-1234	1
409	apisubscriber_2_26_133	274	-1234	1
411	apisubscriber_2_26_134	4	-1234	1
412	apisubscriber_2_26_134	276	-1234	1
414	apisubscriber_2_26_135	4	-1234	1
415	apisubscriber_2_26_135	278	-1234	1
427	apisubscriber_2_27_139	286	-1234	1
429	apisubscriber_2_27_140	4	-1234	1
430	apisubscriber_2_27_140	288	-1234	1
432	apisubscriber_2_28_141	4	-1234	1
433	apisubscriber_2_28_141	290	-1234	1
435	apisubscriber_2_28_142	4	-1234	1
436	apisubscriber_2_28_142	292	-1234	1
438	apisubscriber_2_28_143	4	-1234	1
439	apisubscriber_2_28_143	294	-1234	1
441	apisubscriber_2_28_144	4	-1234	1
442	apisubscriber_2_28_144	296	-1234	1
444	apisubscriber_2_28_145	4	-1234	1
445	apisubscriber_2_28_145	298	-1234	1
447	apisubscriber_2_29_146	4	-1234	1
448	apisubscriber_2_29_146	300	-1234	1
450	apisubscriber_2_29_147	4	-1234	1
451	apisubscriber_2_29_147	302	-1234	1
453	apisubscriber_2_29_148	4	-1234	1
454	apisubscriber_2_29_148	304	-1234	1
456	apisubscriber_2_29_149	4	-1234	1
457	apisubscriber_2_29_149	306	-1234	1
459	apisubscriber_2_29_150	4	-1234	1
460	apisubscriber_2_29_150	308	-1234	1
462	apisubscriber_2_30_151	4	-1234	1
463	apisubscriber_2_30_151	310	-1234	1
465	apisubscriber_2_30_152	4	-1234	1
466	apisubscriber_2_30_152	312	-1234	1
468	apisubscriber_2_30_153	4	-1234	1
469	apisubscriber_2_30_153	314	-1234	1
471	apisubscriber_2_30_154	4	-1234	1
472	apisubscriber_2_30_154	316	-1234	1
474	apisubscriber_2_30_155	4	-1234	1
475	apisubscriber_2_30_155	318	-1234	1
477	apisubscriber_2_31_156	4	-1234	1
478	apisubscriber_2_31_156	320	-1234	1
410	apisubscriber_2_26_133	275	-1234	1
413	apisubscriber_2_26_134	277	-1234	1
416	apisubscriber_2_26_135	279	-1234	1
417	apisubscriber_2_27_136	4	-1234	1
418	apisubscriber_2_27_136	280	-1234	1
419	apisubscriber_2_27_136	281	-1234	1
420	apisubscriber_2_27_137	4	-1234	1
421	apisubscriber_2_27_137	282	-1234	1
422	apisubscriber_2_27_137	283	-1234	1
423	apisubscriber_2_27_138	4	-1234	1
424	apisubscriber_2_27_138	284	-1234	1
425	apisubscriber_2_27_138	285	-1234	1
426	apisubscriber_2_27_139	4	-1234	1
428	apisubscriber_2_27_139	287	-1234	1
431	apisubscriber_2_27_140	289	-1234	1
434	apisubscriber_2_28_141	291	-1234	1
437	apisubscriber_2_28_142	293	-1234	1
440	apisubscriber_2_28_143	295	-1234	1
443	apisubscriber_2_28_144	297	-1234	1
446	apisubscriber_2_28_145	299	-1234	1
449	apisubscriber_2_29_146	301	-1234	1
452	apisubscriber_2_29_147	303	-1234	1
455	apisubscriber_2_29_148	305	-1234	1
458	apisubscriber_2_29_149	307	-1234	1
461	apisubscriber_2_29_150	309	-1234	1
464	apisubscriber_2_30_151	311	-1234	1
467	apisubscriber_2_30_152	313	-1234	1
470	apisubscriber_2_30_153	315	-1234	1
473	apisubscriber_2_30_154	317	-1234	1
476	apisubscriber_2_30_155	319	-1234	1
479	apisubscriber_2_31_156	321	-1234	1
480	apisubscriber_2_31_157	4	-1234	1
481	apisubscriber_2_31_157	322	-1234	1
482	apisubscriber_2_31_157	323	-1234	1
483	apisubscriber_2_31_158	4	-1234	1
484	apisubscriber_2_31_158	324	-1234	1
485	apisubscriber_2_31_158	325	-1234	1
486	apisubscriber_2_31_159	4	-1234	1
487	apisubscriber_2_31_159	326	-1234	1
488	apisubscriber_2_31_159	327	-1234	1
489	apisubscriber_2_31_160	4	-1234	1
490	apisubscriber_2_31_160	328	-1234	1
491	apisubscriber_2_31_160	329	-1234	1
492	apisubscriber_2_32_161	4	-1234	1
493	apisubscriber_2_32_161	330	-1234	1
494	apisubscriber_2_32_161	331	-1234	1
495	apisubscriber_2_32_162	4	-1234	1
496	apisubscriber_2_32_162	332	-1234	1
497	apisubscriber_2_32_162	333	-1234	1
498	apisubscriber_2_32_163	4	-1234	1
499	apisubscriber_2_32_163	334	-1234	1
500	apisubscriber_2_32_163	335	-1234	1
501	apisubscriber_2_32_164	4	-1234	1
502	apisubscriber_2_32_164	336	-1234	1
503	apisubscriber_2_32_164	337	-1234	1
504	apisubscriber_2_32_165	4	-1234	1
505	apisubscriber_2_32_165	338	-1234	1
506	apisubscriber_2_32_165	339	-1234	1
507	apisubscriber_2_33_166	4	-1234	1
508	apisubscriber_2_33_166	340	-1234	1
509	apisubscriber_2_33_166	341	-1234	1
510	apisubscriber_2_33_167	4	-1234	1
511	apisubscriber_2_33_167	342	-1234	1
512	apisubscriber_2_33_167	343	-1234	1
513	apisubscriber_2_33_168	4	-1234	1
514	apisubscriber_2_33_168	344	-1234	1
515	apisubscriber_2_33_168	345	-1234	1
516	apisubscriber_2_33_169	4	-1234	1
517	apisubscriber_2_33_169	346	-1234	1
518	apisubscriber_2_33_169	347	-1234	1
519	apisubscriber_2_33_170	4	-1234	1
520	apisubscriber_2_33_170	348	-1234	1
521	apisubscriber_2_33_170	349	-1234	1
522	apisubscriber_2_34_171	4	-1234	1
523	apisubscriber_2_34_171	350	-1234	1
524	apisubscriber_2_34_171	351	-1234	1
525	apisubscriber_2_34_172	4	-1234	1
526	apisubscriber_2_34_172	352	-1234	1
527	apisubscriber_2_34_172	353	-1234	1
528	apisubscriber_2_34_173	4	-1234	1
529	apisubscriber_2_34_173	354	-1234	1
530	apisubscriber_2_34_173	355	-1234	1
531	apisubscriber_2_34_174	4	-1234	1
532	apisubscriber_2_34_174	356	-1234	1
533	apisubscriber_2_34_174	357	-1234	1
534	apisubscriber_2_34_175	4	-1234	1
535	apisubscriber_2_34_175	358	-1234	1
536	apisubscriber_2_34_175	359	-1234	1
537	apisubscriber_2_35_176	4	-1234	1
538	apisubscriber_2_35_176	360	-1234	1
539	apisubscriber_2_35_176	361	-1234	1
540	apisubscriber_2_35_177	4	-1234	1
541	apisubscriber_2_35_177	362	-1234	1
542	apisubscriber_2_35_177	363	-1234	1
543	apisubscriber_2_35_178	4	-1234	1
544	apisubscriber_2_35_178	364	-1234	1
545	apisubscriber_2_35_178	365	-1234	1
546	apisubscriber_2_35_179	4	-1234	1
547	apisubscriber_2_35_179	366	-1234	1
548	apisubscriber_2_35_179	367	-1234	1
549	apisubscriber_2_35_180	4	-1234	1
550	apisubscriber_2_35_180	368	-1234	1
551	apisubscriber_2_35_180	369	-1234	1
552	apisubscriber_2_36_181	4	-1234	1
553	apisubscriber_2_36_181	370	-1234	1
554	apisubscriber_2_36_181	371	-1234	1
555	apisubscriber_2_36_182	4	-1234	1
556	apisubscriber_2_36_182	372	-1234	1
557	apisubscriber_2_36_182	373	-1234	1
558	apisubscriber_2_36_183	4	-1234	1
559	apisubscriber_2_36_183	374	-1234	1
560	apisubscriber_2_36_183	375	-1234	1
561	apisubscriber_2_36_184	4	-1234	1
562	apisubscriber_2_36_184	376	-1234	1
563	apisubscriber_2_36_184	377	-1234	1
564	apisubscriber_2_36_185	4	-1234	1
565	apisubscriber_2_36_185	378	-1234	1
566	apisubscriber_2_36_185	379	-1234	1
567	apisubscriber_2_37_186	4	-1234	1
568	apisubscriber_2_37_186	380	-1234	1
569	apisubscriber_2_37_186	381	-1234	1
572	apisubscriber_2_37_187	383	-1234	1
575	apisubscriber_2_37_188	385	-1234	1
578	apisubscriber_2_37_189	387	-1234	1
581	apisubscriber_2_37_190	389	-1234	1
584	apisubscriber_2_38_191	391	-1234	1
587	apisubscriber_2_38_192	393	-1234	1
590	apisubscriber_2_38_193	395	-1234	1
593	apisubscriber_2_38_194	397	-1234	1
596	apisubscriber_2_38_195	399	-1234	1
599	apisubscriber_2_39_196	401	-1234	1
602	apisubscriber_2_39_197	403	-1234	1
570	apisubscriber_2_37_187	4	-1234	1
571	apisubscriber_2_37_187	382	-1234	1
573	apisubscriber_2_37_188	4	-1234	1
574	apisubscriber_2_37_188	384	-1234	1
576	apisubscriber_2_37_189	4	-1234	1
577	apisubscriber_2_37_189	386	-1234	1
579	apisubscriber_2_37_190	4	-1234	1
580	apisubscriber_2_37_190	388	-1234	1
582	apisubscriber_2_38_191	4	-1234	1
583	apisubscriber_2_38_191	390	-1234	1
585	apisubscriber_2_38_192	4	-1234	1
586	apisubscriber_2_38_192	392	-1234	1
588	apisubscriber_2_38_193	4	-1234	1
589	apisubscriber_2_38_193	394	-1234	1
591	apisubscriber_2_38_194	4	-1234	1
592	apisubscriber_2_38_194	396	-1234	1
594	apisubscriber_2_38_195	4	-1234	1
595	apisubscriber_2_38_195	398	-1234	1
597	apisubscriber_2_39_196	4	-1234	1
598	apisubscriber_2_39_196	400	-1234	1
600	apisubscriber_2_39_197	4	-1234	1
601	apisubscriber_2_39_197	402	-1234	1
603	apisubscriber_2_39_198	4	-1234	1
604	apisubscriber_2_39_198	404	-1234	1
605	apisubscriber_2_39_198	405	-1234	1
606	apisubscriber_2_39_199	4	-1234	1
607	apisubscriber_2_39_199	406	-1234	1
608	apisubscriber_2_39_199	407	-1234	1
609	apisubscriber_2_39_200	4	-1234	1
610	apisubscriber_2_39_200	408	-1234	1
611	apisubscriber_2_39_200	409	-1234	1
612	prasanna	411	1	6
613	prasanna	412	1	6
614	prasanna	413	1	6
615	john	412	1	6
616	smith	412	1	6
617	smith	411	1	6
618	eric	413	1	6
619	eric	414	1	6
620	admin	415	-1234	1
\.


--
-- Data for Name: um_module; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_module (um_id, um_module_name) FROM stdin;
\.


--
-- Data for Name: um_module_actions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_module_actions (um_action, um_module_id) FROM stdin;
\.


--
-- Data for Name: um_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_permission (um_id, um_resource_id, um_action, um_tenant_id, um_module_id) FROM stdin;
1	/permission	ui.execute	-1234	0
2	/	http://www.wso2.org/projects/registry/actions/get	-1234	0
3	/	http://www.wso2.org/projects/registry/actions/add	-1234	0
4	/	http://www.wso2.org/projects/registry/actions/delete	-1234	0
5	/	authorize	-1234	0
6	/_system/governance/apimgt/externalstores/external-api-stores.xml	http://www.wso2.org/projects/registry/actions/get	-1234	0
7	/_system/governance/apimgt/statistics/ga-config.xml	http://www.wso2.org/projects/registry/actions/get	-1234	0
8	/_system/governance/apimgt/applicationdata/icons	http://www.wso2.org/projects/registry/actions/get	-1234	0
9	/permission/admin/login	ui.execute	-1234	0
10	/permission/admin/manage/api/publish	ui.execute	-1234	0
11	/_system/governance/repository/components/org.wso2.carbon.governance/lifecycles/history	http://www.wso2.org/projects/registry/actions/get	-1234	0
12	/_system/governance/repository/components/org.wso2.carbon.governance/lifecycles/history	http://www.wso2.org/projects/registry/actions/add	-1234	0
13	/_system/governance/repository/components/org.wso2.carbon.governance/lifecycles/history	http://www.wso2.org/projects/registry/actions/delete	-1234	0
14	/_system/governance/apimgt/applicationdata	http://www.wso2.org/projects/registry/actions/get	-1234	0
15	/_system/governance/apimgt/applicationdata	http://www.wso2.org/projects/registry/actions/add	-1234	0
16	/_system/governance/apimgt/applicationdata	http://www.wso2.org/projects/registry/actions/delete	-1234	0
17	/permission/admin/manage/api/create	ui.execute	-1234	0
18	/_system/governance/trunk	http://www.wso2.org/projects/registry/actions/get	-1234	0
19	/_system/governance/trunk	http://www.wso2.org/projects/registry/actions/add	-1234	0
20	/_system/governance/trunk	http://www.wso2.org/projects/registry/actions/delete	-1234	0
21	/permission/admin/configure/governance	ui.execute	-1234	0
22	/permission/admin/manage/resources/govern	ui.execute	-1234	0
23	/permission/admin/manage/api/subscribe	ui.execute	-1234	0
24	/_system/apim/config/repository/components/org.wso2.carbon.captcha-images	http://www.wso2.org/projects/registry/actions/get	-1234	0
25	/_system/apim/config/repository/components/org.wso2.carbon.captcha-images	http://www.wso2.org/projects/registry/actions/add	-1234	0
26	/_system/apim/config/repository/components/org.wso2.carbon.captcha-images	http://www.wso2.org/projects/registry/actions/delete	-1234	0
27	/_system/apim/config/repository/components/org.wso2.carbon.captcha-images	authorize	-1234	0
28	/_system/governance/forumtopics	http://www.wso2.org/projects/registry/actions/get	-1234	0
29	/_system/governance/forumtopics	http://www.wso2.org/projects/registry/actions/add	-1234	0
30	/_system/governance/repository/components/org.wso2.carbon.all-themes	http://www.wso2.org/projects/registry/actions/get	-1234	0
31	/_system/governance/repository/components/org.wso2.carbon.all-themes	http://www.wso2.org/projects/registry/actions/add	-1234	0
32	/_system/governance/repository/components/org.wso2.carbon.all-themes	http://www.wso2.org/projects/registry/actions/delete	-1234	0
33	/_system/governance/repository/components/org.wso2.carbon.all-themes	authorize	-1234	0
34	event/topics/throttledata	subscribe	-1234	0
35	event/topics/throttledata	publish	-1234	0
36	event/topics/throttledata	changePermission	-1234	0
37	event/topics/tokenrevocation	subscribe	-1234	0
38	event/topics/tokenrevocation	publish	-1234	0
39	event/topics/tokenrevocation	changePermission	-1234	0
40	/_system/governance/repository/components/org.wso2.carbon.governance/types/provider.rxt	http://www.wso2.org/projects/registry/actions/get	-1234	0
41	/_system/governance/repository/components/org.wso2.carbon.governance/types/api.rxt	http://www.wso2.org/projects/registry/actions/get	-1234	0
42	/_system/governance/repository/components/org.wso2.carbon.governance/types/documentation.rxt	http://www.wso2.org/projects/registry/actions/get	-1234	0
43	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_0/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
44	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_0/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
45	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_1/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
46	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_1/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
47	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_2/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
48	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_2/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
49	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_3/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
50	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_3/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
51	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_4/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
52	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_4/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
53	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_5/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
54	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_5/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
55	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_6/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
56	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_6/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
57	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_7/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
58	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_7/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
59	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_8/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
60	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_8/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
61	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_9/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
62	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_9/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
63	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_10/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
64	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_10/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
65	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_11/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
66	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_11/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
67	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_12/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
68	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_12/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
69	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_13/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
70	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_13/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
71	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_14/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
72	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_14/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
73	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_15/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
74	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_15/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
75	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_16/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
76	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_16/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
77	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_17/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
78	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_17/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
79	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_18/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
80	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_18/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
81	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_19/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
82	/_system/governance/apimgt/applicationdata/provider/apicreator1/PizzaShackAPI_1_19/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
83	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_20/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
84	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_20/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
85	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_21/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
86	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_21/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
87	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_22/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
88	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_22/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
89	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_23/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
90	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_23/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
91	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_24/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
92	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_24/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
93	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_25/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
94	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_25/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
95	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_26/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
96	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_26/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
97	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_27/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
98	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_27/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
99	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_28/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
100	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_28/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
101	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_29/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
102	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_29/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
103	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_30/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
104	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_30/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
105	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_31/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
106	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_31/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
107	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_32/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
108	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_32/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
109	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_33/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
110	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_33/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
111	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_34/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
112	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_34/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
113	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_35/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
114	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_35/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
115	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_36/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
116	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_36/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
117	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_37/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
118	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_37/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
119	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_38/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
120	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_38/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
121	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_39/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
122	/_system/governance/apimgt/applicationdata/provider/apicreator2/PizzaShackAPI_2_39/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
123	/permission/admin	ui.execute	1	0
124	/_system/governance/repository/components/org.wso2.carbon.governance/lifecycles/history	http://www.wso2.org/projects/registry/actions/get	1	0
125	/_system/governance/repository/components/org.wso2.carbon.governance/lifecycles/history	http://www.wso2.org/projects/registry/actions/add	1	0
126	/_system/governance/repository/components/org.wso2.carbon.governance/lifecycles/history	http://www.wso2.org/projects/registry/actions/delete	1	0
127	/_system/governance/apimgt/applicationdata	http://www.wso2.org/projects/registry/actions/get	1	0
128	/_system/governance/apimgt/applicationdata	http://www.wso2.org/projects/registry/actions/add	1	0
129	/_system/governance/apimgt/applicationdata	http://www.wso2.org/projects/registry/actions/delete	1	0
130	/_system/governance/trunk	http://www.wso2.org/projects/registry/actions/get	1	0
131	/_system/governance/trunk	http://www.wso2.org/projects/registry/actions/add	1	0
132	/_system/governance/trunk	http://www.wso2.org/projects/registry/actions/delete	1	0
133	/	http://www.wso2.org/projects/registry/actions/get	1	0
134	/	http://www.wso2.org/projects/registry/actions/add	1	0
135	/	http://www.wso2.org/projects/registry/actions/delete	1	0
136	/	authorize	1	0
137	/_system/governance/repository/theme	http://www.wso2.org/projects/registry/actions/get	1	0
138	/_system/governance/repository/theme	http://www.wso2.org/projects/registry/actions/add	1	0
139	/_system/governance/repository/theme	http://www.wso2.org/projects/registry/actions/delete	1	0
140	/_system/governance/repository/theme	authorize	1	0
141	/_system/governance/repository/components/org.wso2.carbon.all-themes	http://www.wso2.org/projects/registry/actions/get	1	0
142	/_system/governance/repository/components/org.wso2.carbon.all-themes	http://www.wso2.org/projects/registry/actions/add	1	0
143	/_system/governance/repository/components/org.wso2.carbon.all-themes	http://www.wso2.org/projects/registry/actions/delete	1	0
144	/_system/governance/repository/components/org.wso2.carbon.all-themes	authorize	1	0
145	/repository/components/org.wso2.carbon.theme-page-token/9427e0c3-89a9-411e-b079-5def3b7d4843	http://www.wso2.org/projects/registry/actions/get	-1234	0
146	/repository/components/org.wso2.carbon.theme-page-token/9427e0c3-89a9-411e-b079-5def3b7d4843	http://www.wso2.org/projects/registry/actions/add	-1234	0
147	/repository/components/org.wso2.carbon.theme-page-token/9427e0c3-89a9-411e-b079-5def3b7d4843	http://www.wso2.org/projects/registry/actions/delete	-1234	0
148	/repository/components/org.wso2.carbon.theme-page-token/9427e0c3-89a9-411e-b079-5def3b7d4843	authorize	-1234	0
149	/_system/governance/apimgt/externalstores/external-api-stores.xml	http://www.wso2.org/projects/registry/actions/get	1	0
150	/_system/governance/apimgt/statistics/ga-config.xml	http://www.wso2.org/projects/registry/actions/get	1	0
151	/permission/admin/login	ui.execute	1	0
152	/permission/admin/manage/api/publish	ui.execute	1	0
153	/permission/admin/manage/api/create	ui.execute	1	0
154	/permission/admin/configure/governance	ui.execute	1	0
155	/permission/admin/manage/resources/govern	ui.execute	1	0
156	/permission/admin/manage/api/subscribe	ui.execute	1	0
157	/_system/governance/repository/components/org.wso2.carbon.governance/types/provider.rxt	http://www.wso2.org/projects/registry/actions/get	1	0
158	/_system/governance/repository/components/org.wso2.carbon.governance/types/api.rxt	http://www.wso2.org/projects/registry/actions/get	1	0
159	/_system/governance/repository/components/org.wso2.carbon.governance/types/documentation.rxt	http://www.wso2.org/projects/registry/actions/get	1	0
160	/_system/governance/repository/components/org.wso2.carbon.governance	http://www.wso2.org/projects/registry/actions/get	1	0
161	/_system/governance/apimgt/applicationdata/provider/john-AT-abc.com/PizzaShackAPI/1.0.0/api	http://www.wso2.org/projects/registry/actions/get	1	0
163	/_system/governance/apimgt/applicationdata/icons/john-AT-abc.com/PizzaShackAPI/1.0.0/icon	http://www.wso2.org/projects/registry/actions/get	1	0
165	/_system/governance/apimgt/applicationdata/provider/john-AT-abc.com/PizzaShackAPI/1.0.0/swagger.json	http://www.wso2.org/projects/registry/actions/get	1	0
166	/_system/governance/apimgt/applicationdata/provider/john-AT-abc.com/PizzaShackAPI/1.0.0/documentation/files/PizzaShackAPIDoc.pdf	http://www.wso2.org/projects/registry/actions/get	1	0
167	/apimgt/applicationdata/provider/john-AT-abc.com/PizzaShackAPI/1.0.0/documentation/files/PizzaShackAPIDoc.pdf	http://www.wso2.org/projects/registry/actions/get	-1234	0
168	/_system/governance/apimgt/applicationdata/provider/john-AT-abc.com/PizzaShackAPI/1.0.0/documentation/PizzaShack API Documentation	http://www.wso2.org/projects/registry/actions/get	1	0
169	/_system/governance/apimgt/applicationdata/provider/john-AT-abc.com/NewAPI/5.4.4/api	http://www.wso2.org/projects/registry/actions/get	1	0
172	/_system/governance/apimgt/applicationdata/provider/john-AT-abc.com/NewAPI/5.4.4/swagger.json	http://www.wso2.org/projects/registry/actions/get	1	0
173	/_system/governance/repository/components/org.wso2.carbon.governance	http://www.wso2.org/projects/registry/actions/get	-1234	0
174	/_system/governance/apimgt/applicationdata/provider/admin/NewAPI8/4.4.4/api	http://www.wso2.org/projects/registry/actions/get	-1234	0
177	/_system/governance/apimgt/applicationdata/provider/admin/NewAPI8/4.4.4/swagger.json	http://www.wso2.org/projects/registry/actions/get	-1234	0
\.


--
-- Data for Name: um_profile_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_profile_config (um_id, um_dialect_id, um_profile_name, um_tenant_id) FROM stdin;
\.


--
-- Data for Name: um_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_role (um_id, um_role_name, um_tenant_id, um_shared_role) FROM stdin;
1	admin	-1234	f
2	creator	-1234	f
3	publisher	-1234	f
4	subscriber	-1234	f
5	admin	1	f
\.


--
-- Data for Name: um_role_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_role_permission (um_id, um_permission_id, um_role_name, um_is_allowed, um_tenant_id, um_domain_id) FROM stdin;
1	1	admin	1	-1234	1
2	2	admin	1	-1234	1
3	3	admin	1	-1234	1
4	4	admin	1	-1234	1
5	5	admin	1	-1234	1
6	2	everyone	1	-1234	3
7	6	everyone	0	-1234	3
8	7	everyone	0	-1234	3
9	8	wso2.anonymous.role	1	-1234	2
10	9	publisher	1	-1234	3
11	10	publisher	1	-1234	3
12	11	publisher	1	-1234	3
13	12	publisher	1	-1234	3
14	13	publisher	1	-1234	3
15	14	publisher	1	-1234	3
16	15	publisher	1	-1234	3
17	16	publisher	1	-1234	3
18	9	creator	1	-1234	3
19	17	creator	1	-1234	3
20	11	creator	1	-1234	3
21	12	creator	1	-1234	3
22	13	creator	1	-1234	3
23	18	creator	1	-1234	3
24	19	creator	1	-1234	3
25	20	creator	1	-1234	3
26	14	creator	1	-1234	3
27	15	creator	1	-1234	3
28	16	creator	1	-1234	3
29	21	creator	1	-1234	3
30	22	creator	1	-1234	3
31	9	subscriber	1	-1234	3
32	23	subscriber	1	-1234	3
33	24	wso2.anonymous.role	1	-1234	2
34	25	wso2.anonymous.role	0	-1234	2
35	26	wso2.anonymous.role	0	-1234	2
36	27	wso2.anonymous.role	0	-1234	2
37	28	wso2.anonymous.role	1	-1234	2
38	28	everyone	1	-1234	3
39	29	everyone	1	-1234	3
40	30	wso2.anonymous.role	1	-1234	2
41	31	wso2.anonymous.role	0	-1234	2
42	32	wso2.anonymous.role	0	-1234	2
43	33	wso2.anonymous.role	0	-1234	2
44	34	admin	1	-1234	1
45	35	admin	1	-1234	1
46	36	admin	1	-1234	1
47	37	admin	1	-1234	1
48	38	admin	1	-1234	1
49	39	admin	1	-1234	1
50	21	creator	1	-1234	1
51	9	creator	1	-1234	1
52	17	creator	1	-1234	1
53	11	creator	1	-1234	1
54	12	creator	1	-1234	1
55	13	creator	1	-1234	1
56	18	creator	1	-1234	1
57	19	creator	1	-1234	1
58	20	creator	1	-1234	1
59	14	creator	1	-1234	1
60	15	creator	1	-1234	1
61	16	creator	1	-1234	1
62	22	creator	1	-1234	1
63	9	publisher	1	-1234	1
64	10	publisher	1	-1234	1
65	11	publisher	1	-1234	1
66	12	publisher	1	-1234	1
67	13	publisher	1	-1234	1
68	14	publisher	1	-1234	1
69	15	publisher	1	-1234	1
70	16	publisher	1	-1234	1
71	9	subscriber	1	-1234	1
72	23	subscriber	1	-1234	1
73	40	wso2.anonymous.role	1	-1234	2
74	41	wso2.anonymous.role	1	-1234	2
75	42	wso2.anonymous.role	1	-1234	2
76	43	everyone	1	-1234	3
77	43	wso2.anonymous.role	1	-1234	2
78	44	everyone	1	-1234	3
79	44	wso2.anonymous.role	1	-1234	2
80	45	everyone	1	-1234	3
81	45	wso2.anonymous.role	1	-1234	2
82	46	everyone	1	-1234	3
83	46	wso2.anonymous.role	1	-1234	2
84	47	everyone	1	-1234	3
85	47	wso2.anonymous.role	1	-1234	2
86	48	everyone	1	-1234	3
87	48	wso2.anonymous.role	1	-1234	2
88	49	everyone	1	-1234	3
89	49	wso2.anonymous.role	1	-1234	2
90	50	everyone	1	-1234	3
91	50	wso2.anonymous.role	1	-1234	2
92	51	everyone	1	-1234	3
93	51	wso2.anonymous.role	1	-1234	2
94	52	everyone	1	-1234	3
95	52	wso2.anonymous.role	1	-1234	2
96	53	everyone	1	-1234	3
97	53	wso2.anonymous.role	1	-1234	2
98	54	everyone	1	-1234	3
99	54	wso2.anonymous.role	1	-1234	2
100	55	everyone	1	-1234	3
101	55	wso2.anonymous.role	1	-1234	2
102	56	everyone	1	-1234	3
103	56	wso2.anonymous.role	1	-1234	2
104	57	everyone	1	-1234	3
105	57	wso2.anonymous.role	1	-1234	2
106	58	everyone	1	-1234	3
107	58	wso2.anonymous.role	1	-1234	2
108	59	everyone	1	-1234	3
109	59	wso2.anonymous.role	1	-1234	2
110	60	everyone	1	-1234	3
111	60	wso2.anonymous.role	1	-1234	2
112	61	everyone	1	-1234	3
113	61	wso2.anonymous.role	1	-1234	2
114	62	everyone	1	-1234	3
115	62	wso2.anonymous.role	1	-1234	2
116	63	everyone	1	-1234	3
117	63	wso2.anonymous.role	1	-1234	2
118	64	everyone	1	-1234	3
119	64	wso2.anonymous.role	1	-1234	2
120	65	everyone	1	-1234	3
121	65	wso2.anonymous.role	1	-1234	2
122	66	everyone	1	-1234	3
123	66	wso2.anonymous.role	1	-1234	2
124	67	everyone	1	-1234	3
125	67	wso2.anonymous.role	1	-1234	2
126	68	everyone	1	-1234	3
127	68	wso2.anonymous.role	1	-1234	2
128	69	everyone	1	-1234	3
129	69	wso2.anonymous.role	1	-1234	2
130	70	everyone	1	-1234	3
131	70	wso2.anonymous.role	1	-1234	2
132	71	everyone	1	-1234	3
133	71	wso2.anonymous.role	1	-1234	2
134	72	everyone	1	-1234	3
135	72	wso2.anonymous.role	1	-1234	2
136	73	everyone	1	-1234	3
137	73	wso2.anonymous.role	1	-1234	2
138	74	everyone	1	-1234	3
139	74	wso2.anonymous.role	1	-1234	2
140	75	everyone	1	-1234	3
141	75	wso2.anonymous.role	1	-1234	2
142	76	everyone	1	-1234	3
143	76	wso2.anonymous.role	1	-1234	2
144	77	everyone	1	-1234	3
145	77	wso2.anonymous.role	1	-1234	2
146	78	everyone	1	-1234	3
147	78	wso2.anonymous.role	1	-1234	2
148	79	everyone	1	-1234	3
149	79	wso2.anonymous.role	1	-1234	2
150	80	everyone	1	-1234	3
151	80	wso2.anonymous.role	1	-1234	2
152	81	everyone	1	-1234	3
153	81	wso2.anonymous.role	1	-1234	2
154	82	everyone	1	-1234	3
155	82	wso2.anonymous.role	1	-1234	2
156	83	everyone	1	-1234	3
157	83	wso2.anonymous.role	1	-1234	2
158	84	everyone	1	-1234	3
159	84	wso2.anonymous.role	1	-1234	2
160	85	everyone	1	-1234	3
161	85	wso2.anonymous.role	1	-1234	2
162	86	everyone	1	-1234	3
163	86	wso2.anonymous.role	1	-1234	2
164	87	everyone	1	-1234	3
165	87	wso2.anonymous.role	1	-1234	2
166	88	everyone	1	-1234	3
167	88	wso2.anonymous.role	1	-1234	2
168	89	everyone	1	-1234	3
169	89	wso2.anonymous.role	1	-1234	2
170	90	everyone	1	-1234	3
171	90	wso2.anonymous.role	1	-1234	2
172	91	everyone	1	-1234	3
173	91	wso2.anonymous.role	1	-1234	2
174	92	everyone	1	-1234	3
175	92	wso2.anonymous.role	1	-1234	2
176	93	everyone	1	-1234	3
177	93	wso2.anonymous.role	1	-1234	2
178	94	everyone	1	-1234	3
179	94	wso2.anonymous.role	1	-1234	2
180	95	everyone	1	-1234	3
181	95	wso2.anonymous.role	1	-1234	2
182	96	everyone	1	-1234	3
183	96	wso2.anonymous.role	1	-1234	2
184	97	everyone	1	-1234	3
185	97	wso2.anonymous.role	1	-1234	2
186	98	everyone	1	-1234	3
187	98	wso2.anonymous.role	1	-1234	2
188	99	everyone	1	-1234	3
189	99	wso2.anonymous.role	1	-1234	2
190	100	everyone	1	-1234	3
191	100	wso2.anonymous.role	1	-1234	2
192	101	everyone	1	-1234	3
193	101	wso2.anonymous.role	1	-1234	2
194	102	everyone	1	-1234	3
195	102	wso2.anonymous.role	1	-1234	2
196	103	everyone	1	-1234	3
197	103	wso2.anonymous.role	1	-1234	2
198	104	everyone	1	-1234	3
199	104	wso2.anonymous.role	1	-1234	2
200	105	everyone	1	-1234	3
201	105	wso2.anonymous.role	1	-1234	2
202	106	everyone	1	-1234	3
203	106	wso2.anonymous.role	1	-1234	2
204	107	everyone	1	-1234	3
205	107	wso2.anonymous.role	1	-1234	2
206	108	everyone	1	-1234	3
207	108	wso2.anonymous.role	1	-1234	2
208	109	everyone	1	-1234	3
209	109	wso2.anonymous.role	1	-1234	2
210	110	everyone	1	-1234	3
211	110	wso2.anonymous.role	1	-1234	2
212	111	everyone	1	-1234	3
213	111	wso2.anonymous.role	1	-1234	2
214	112	everyone	1	-1234	3
215	112	wso2.anonymous.role	1	-1234	2
216	113	everyone	1	-1234	3
217	113	wso2.anonymous.role	1	-1234	2
218	114	everyone	1	-1234	3
219	114	wso2.anonymous.role	1	-1234	2
220	115	everyone	1	-1234	3
221	115	wso2.anonymous.role	1	-1234	2
222	116	everyone	1	-1234	3
223	116	wso2.anonymous.role	1	-1234	2
224	117	everyone	1	-1234	3
225	117	wso2.anonymous.role	1	-1234	2
226	118	everyone	1	-1234	3
227	118	wso2.anonymous.role	1	-1234	2
228	119	everyone	1	-1234	3
229	119	wso2.anonymous.role	1	-1234	2
230	120	everyone	1	-1234	3
231	120	wso2.anonymous.role	1	-1234	2
232	121	everyone	1	-1234	3
233	121	wso2.anonymous.role	1	-1234	2
234	122	everyone	1	-1234	3
235	122	wso2.anonymous.role	1	-1234	2
236	123	admin	1	1	6
237	124	admin	1	1	6
238	125	admin	1	1	6
239	126	admin	1	1	6
240	127	admin	1	1	6
241	128	admin	1	1	6
242	129	admin	1	1	6
243	130	admin	1	1	6
244	131	admin	1	1	6
245	132	admin	1	1	6
246	133	admin	1	1	6
247	134	admin	1	1	6
248	135	admin	1	1	6
249	136	admin	1	1	6
250	133	everyone	1	1	8
251	137	wso2.anonymous.role	1	1	7
252	138	wso2.anonymous.role	0	1	7
253	139	wso2.anonymous.role	0	1	7
254	140	wso2.anonymous.role	0	1	7
255	141	wso2.anonymous.role	1	1	7
256	142	wso2.anonymous.role	0	1	7
257	143	wso2.anonymous.role	0	1	7
258	144	wso2.anonymous.role	0	1	7
259	145	everyone	0	-1234	3
260	146	everyone	0	-1234	3
261	147	everyone	0	-1234	3
262	148	everyone	0	-1234	3
263	149	everyone	0	1	8
264	150	everyone	0	1	8
265	151	publisher	1	1	8
266	152	publisher	1	1	8
267	124	publisher	1	1	8
268	125	publisher	1	1	8
269	126	publisher	1	1	8
270	127	publisher	1	1	8
271	128	publisher	1	1	8
272	129	publisher	1	1	8
273	151	creator	1	1	8
274	153	creator	1	1	8
275	124	creator	1	1	8
276	125	creator	1	1	8
277	126	creator	1	1	8
278	130	creator	1	1	8
279	131	creator	1	1	8
280	132	creator	1	1	8
281	127	creator	1	1	8
282	128	creator	1	1	8
283	129	creator	1	1	8
284	154	creator	1	1	8
285	155	creator	1	1	8
286	151	subscriber	1	1	8
287	156	subscriber	1	1	8
288	157	wso2.anonymous.role	1	1	7
289	158	wso2.anonymous.role	1	1	7
290	159	wso2.anonymous.role	1	1	7
291	160	wso2.anonymous.role	1	1	7
292	161	everyone	1	1	8
293	161	wso2.anonymous.role	1	1	7
296	163	everyone	1	1	8
297	163	wso2.anonymous.role	1	1	7
300	165	everyone	1	1	8
301	165	wso2.anonymous.role	1	1	7
302	166	everyone	1	1	8
303	166	wso2.anonymous.role	1	1	7
304	167	wso2.anonymous.role	1	-1234	2
305	168	everyone	1	1	8
306	168	wso2.anonymous.role	1	1	7
307	169	everyone	1	1	8
308	169	wso2.anonymous.role	1	1	7
313	172	everyone	1	1	8
314	172	wso2.anonymous.role	1	1	7
315	173	wso2.anonymous.role	1	-1234	2
316	174	everyone	1	-1234	3
317	174	wso2.anonymous.role	1	-1234	2
322	177	everyone	1	-1234	3
323	177	wso2.anonymous.role	1	-1234	2
\.


--
-- Data for Name: um_shared_user_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_shared_user_role (um_role_id, um_user_id, um_user_tenant_id, um_role_tenant_id) FROM stdin;
\.


--
-- Data for Name: um_system_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_system_role (um_id, um_role_name, um_tenant_id) FROM stdin;
1	wso2.anonymous.role	-1234
2	wso2.anonymous.role	1
\.


--
-- Data for Name: um_system_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_system_user (um_id, um_user_name, um_user_password, um_salt_value, um_require_change, um_changed_time, um_tenant_id) FROM stdin;
1	wso2.anonymous.user	B+uIWxaEIGa5bTMhrtrUDX5N9v5kgOTwSyAvywFbd/w=	PcHTazESwWxkLpbiTiDtmg==	f	2021-03-11 16:47:19.291	-1234
2	wso2.anonymous.user	889ZvA1x5JGn1AQkNG0Ps4UnuGsPfLjU1GjHs0cgjiE=	6iLI4cJq9NzSDsY4xDixfg==	f	2021-03-11 17:34:50.421	1
\.


--
-- Data for Name: um_system_user_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_system_user_role (um_id, um_user_name, um_role_id, um_tenant_id) FROM stdin;
1	wso2.anonymous.user	1	-1234
2	wso2.anonymous.user	2	1
\.


--
-- Data for Name: um_tenant; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_tenant (um_id, um_domain_name, um_email, um_active, um_created_date, um_user_config) FROM stdin;
1	abc.com	prasannadangalla@gmail.com	t	2021-03-11 17:34:47.919	\\x3c557365724d616e616765723e3c5265616c6d206e616d653d226f72672e77736f322e636172626f6e2e757365722e636f72652e636f6d6d6f6e2e44656661756c745265616c6d223e3c436f6e66696775726174696f6e3e3c41646441646d696e3e747275653c2f41646441646d696e3e3c41646d696e557365723e3c557365724e616d653e70726173616e6e613c2f557365724e616d653e3c50617373776f72643e64756d6d793138373639353c2f50617373776f72643e3c2f41646d696e557365723e3c41646d696e526f6c653e61646d696e3c2f41646d696e526f6c653e3c53797374656d557365724e616d652f3e3c416e6f6e796d6f7573557365723e3c557365724e616d652f3e3c50617373776f72642f3e3c2f416e6f6e796d6f7573557365723e3c45766572794f6e65526f6c654e616d653e65766572796f6e653c2f45766572794f6e65526f6c654e616d653e3c2f436f6e66696775726174696f6e3e3c5573657253746f72654d616e6167657220636c6173733d226f72672e77736f322e636172626f6e2e757365722e636f72652e6a6462632e4a4442435573657253746f72654d616e61676572223e3c50726f7065727479206e616d653d2247657455736572494446726f6d557365724e616d6553514c43617365496e73656e736974697665223e53454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22416464526f6c65546f5573657253514c43617365496e73656e7369746976652d6d7373716c223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f524f4c455f49442c20554d5f555345525f49442c20554d5f54454e414e545f4944292053454c454354202853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f292c20283f293c2f50726f70657274793e3c50726f7065727479206e616d653d22476574557365727350726f70657274696573466f7250726f66696c6553514c223e53454c45435420554d5f555345525f4e414d452c554d5f415454525f4e414d452c20554d5f415454525f56414c55452046524f4d20554d5f555345525f4154545249425554452c20554d5f5553455220574845524520554d5f555345522e554d5f4944203d20554d5f555345525f4154545249425554452e554d5f555345525f494420414e4420554d5f555345522e554d5f555345525f4e414d4520494e20283f2920414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d45204c494b45203f20414e4420554d5f54454e414e545f49443d3f204f5244455220425920554d5f555345525f4e414d4520415343204c494d4954203f204f4646534554203f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574506167696e61746564557365724c6973466f7250726f706572747953514c2d6d7373716c223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420554d5f555345525f4e414d452c524f575f4e554d4245522829204f56455220284f5244455220425920554d5f555345525f4e414d452920415320526f774e756d2046524f4d20554d5f555345522c554d5f555345525f41545452494255544520574845524520554d5f555345525f4154545249425554452e554d5f555345525f4944203d20554d5f555345522e554d5f494420414e4420554d5f555345525f4154545249425554452e554d5f415454525f4e414d453d3f20414e4420554d5f555345525f4154545249425554452e554d5f415454525f56414c5545204c494b45203f20414e4420554d5f555345525f4154545249425554452e554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f29204153205020574845524520502e526f774e756d204245545745454e203f20414e44203f3c2f50726f70657274793e3c50726f7065727479206e616d653d224f6e44656c6574655573657252656d6f766555736572526f6c654d617070696e6753514c223e44454c4554452046524f4d20554d5f555345525f524f4c4520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2250617373776f72644a6176615363726970745265674578223e5e5b5c535d7b352c33307d243c2f50726f70657274793e3c50726f7065727479206e616d653d224d6178557365724e616d654c6973744c656e677468223e3130303c2f50726f70657274793e3c50726f7065727479206e616d653d2241646455736572546f526f6c6553514c223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f555345525f49442c20554d5f524f4c455f49442c20554d5f54454e414e545f4944292056414c55455320282853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d22476574557365724c6973744f66536861726564526f6c6546696c74657253514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f5348415245445f555345525f524f4c4520494e4e4552204a4f494e20554d5f55534552204f4e20554d5f5348415245445f555345525f524f4c452e554d5f555345525f4944203d20554d5f555345522e554d5f494420494e4e4552204a4f494e20554d5f524f4c45204f4e20554d5f5348415245445f555345525f524f4c452e554d5f524f4c455f4944203d20554d5f524f4c452e554d5f494420574845524520554d5f555345522e554d5f555345525f4e414d45204c494b45203f20414e4420554d5f524f4c452e554d5f524f4c455f4e414d453d203f20414e4420554d5f5348415245445f555345525f524f4c452e554d5f555345525f54454e414e545f4944203d20554d5f555345522e554d5f54454e414e545f494420414e4420554d5f5348415245445f555345525f524f4c452e554d5f524f4c455f54454e414e545f4944203d20554d5f524f4c452e554d5f54454e414e545f49443c2f50726f70657274793e3c50726f7065727479206e616d653d224765745573657250726f70657274696573466f7250726f66696c6553514c43617365496e73656e736974697665223e53454c45435420554d5f415454525f4e414d452c20554d5f415454525f56414c55452046524f4d20554d5f555345525f4154545249425554452c20554d5f5553455220574845524520554d5f555345522e554d5f4944203d20554d5f555345525f4154545249425554452e554d5f555345525f494420414e44204c4f57455228554d5f555345522e554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2241646455736572546f526f6c6553514c2d6f70656e65646765223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f555345525f49442c20554d5f524f4c455f49442c20554d5f54454e414e545f4944292053454c4543542055552e554d5f49442c2055522e554d5f49442c203f2046524f4d20554d5f555345522055552c20554d5f524f4c452055522057484552452055552e554d5f555345525f4e414d453d3f20414e442055552e554d5f54454e414e545f49443d3f20414e442055522e554d5f524f4c455f4e414d453d3f20414e442055522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c74657253514c43617365496e73656e73697469766557697468457363617065223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d4529204c494b45204c4f574552283f2920455343415045203f20414e4420554d5f54454e414e545f49443d3f204f5244455220425920554d5f555345525f4e414d453c2f50726f70657274793e3c50726f7065727479206e616d653d224765745573657250726f66696c654e616d657353514c43617365496e73656e736974697665223e53454c4543542044495354494e435420554d5f50524f46494c455f49442046524f4d20554d5f555345525f41545452494255544520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22416464526f6c6553514c223e494e5345525420494e544f20554d5f524f4c452028554d5f524f4c455f4e414d452c20554d5f54454e414e545f4944292056414c55455320283f2c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d224d6178526f6c654e616d654c6973744c656e677468223e3130303c2f50726f70657274793e3c50726f7065727479206e616d653d224164645573657250726f706572747953514c2d6d7373716c223e494e5345525420494e544f20554d5f555345525f4154545249425554452028554d5f555345525f49442c20554d5f415454525f4e414d452c20554d5f415454525f56414c55452c20554d5f50524f46494c455f49442c20554d5f54454e414e545f4944292053454c454354202853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c20283f292c20283f292c20283f292c20283f293c2f50726f70657274793e3c50726f7065727479206e616d653d22476574506167696e6174656455736572436f756e74466f7250726f706572747953514c223e53454c45435420434f554e542028554d5f555345525f4e414d45292046524f4d20554d5f555345522c20554d5f555345525f41545452494255544520574845524520554d5f555345525f4154545249425554452e554d5f555345525f4944203d20554d5f555345522e554d5f494420414e4420554d5f555345525f4154545249425554452e554d5f415454525f4e414d45203d3f20414e4420554d5f555345525f4154545249425554452e554d5f415454525f56414c5545204c494b45203f20414e4420554d5f555345525f4154545249425554452e554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d224f6e44656c657465526f6c6552656d6f766555736572526f6c654d617070696e6753514c223e44454c4554452046524f4d20554d5f555345525f524f4c4520574845524520554d5f524f4c455f49443d2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2254656e616e744d616e61676572223e6f72672e77736f322e636172626f6e2e757365722e636f72652e74656e616e742e4a44424354656e616e744d616e616765723c2f50726f70657274793e3c50726f7065727479206e616d653d2244656c6574655573657253514c223e44454c4554452046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d45203d203f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d224164645573657250726f706572747953514c43617365496e73656e7369746976652d6f70656e65646765223e494e5345525420494e544f20554d5f555345525f4154545249425554452028554d5f555345525f49442c20554d5f415454525f4e414d452c20554d5f415454525f56414c55452c20554d5f50524f46494c455f49442c20554d5f54454e414e545f4944292053454c45435420554d5f49442c203f2c203f2c203f2c203f2046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22416464526f6c65546f5573657253514c2d6f70656e65646765223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f524f4c455f49442c20554d5f555345525f49442c20554d5f54454e414e545f4944292053454c4543542055522e554d5f49442c2055552e554d5f49442c203f2046524f4d20554d5f524f4c452055522c20554d5f555345522055552057484552452055522e554d5f524f4c455f4e414d453d3f20414e442055522e554d5f54454e414e545f49443d3f20414e442055552e554d5f555345525f4e414d453d3f20414e442055552e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22497342756c6b496d706f7274537570706f72746564223e747275653c2f50726f70657274793e3c50726f7065727479206e616d653d22446f6d61696e4e616d65223e5052494d4152593c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c43617365496e73656e736974697665223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d4529204c494b45204c4f574552283f2920414e4420554d5f54454e414e545f49443d3f204f5244455220425920554d5f555345525f4e414d4520415343204c494d4954203f204f4646534554203f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574557365724c6973744f66526f6c6546696c74657253514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f555345525f524f4c452c20554d5f524f4c452c20554d5f5553455220574845524520554d5f555345522e554d5f555345525f4e414d45204c494b45203f20414e4420554d5f524f4c452e554d5f524f4c455f4e414d453d3f20414e4420554d5f555345522e554d5f49443d554d5f555345525f524f4c452e554d5f555345525f494420414e4420554d5f524f4c452e554d5f49443d554d5f555345525f524f4c452e554d5f524f4c455f494420414e4420554d5f555345525f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2247657454656e616e74494446726f6d557365724e616d6553514c223e53454c45435420554d5f54454e414e545f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c74657253514c57697468457363617065223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d45204c494b45203f20455343415045203f20414e4420554d5f54454e414e545f49443d3f204f5244455220425920554d5f555345525f4e414d453c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c74657253514c43617365496e73656e736974697665223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d4529204c494b45204c4f574552283f2920414e4420554d5f54454e414e545f49443d3f204f5244455220425920554d5f555345525f4e414d453c2f50726f70657274793e3c50726f7065727479206e616d653d22557365726e616d654a6176615363726970745265674578223e5e5b5c535d7b332c33307d243c2f50726f70657274793e3c50726f7065727479206e616d653d2252656d6f76655573657246726f6d526f6c6553514c43617365496e73656e736974697665223e44454c4554452046524f4d20554d5f555345525f524f4c4520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f524f4c455f49443d2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2255736572526f6c65457869737453514c223e53454c45435420554d5f524f4c455f4e414d452046524f4d20554d5f555345525f524f4c452c20554d5f524f4c452c20554d5f5553455220574845524520554d5f555345522e554d5f555345525f4e414d453d3f20414e4420554d5f555345522e554d5f49443d554d5f555345525f524f4c452e554d5f555345525f494420414e4420554d5f524f4c452e554d5f49443d554d5f555345525f524f4c452e554d5f524f4c455f494420414e4420554d5f555345525f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c455f4e414d45204c494b45203f3c2f50726f70657274793e3c50726f7065727479206e616d653d225265616447726f757073223e747275653c2f50726f70657274793e3c50726f7065727479206e616d653d2241646455736572546f526f6c6553514c43617365496e73656e7369746976652d6d7373716c223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f555345525f49442c20554d5f524f4c455f49442c20554d5f54454e414e545f4944292053454c454354202853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c283f293c2f50726f70657274793e3c50726f7065727479206e616d653d224765745573657250726f7065727479466f7250726f66696c6553514c223e53454c45435420554d5f415454525f56414c55452046524f4d20554d5f555345525f4154545249425554452c20554d5f5553455220574845524520554d5f555345522e554d5f4944203d20554d5f555345525f4154545249425554452e554d5f555345525f494420414e4420554d5f555345522e554d5f555345525f4e414d453d3f20414e4420554d5f415454525f4e414d453d3f20414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2244656c6574655573657253514c43617365496e73656e736974697665223e44454c4554452046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d4529203d204c4f574552283f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225570646174655573657250726f706572747953514c223e55504441544520554d5f555345525f4154545249425554452053455420554d5f415454525f56414c55453d3f20574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f415454525f4e414d453d3f20414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657273526f6c6553514c43617365496e73656e736974697665223e53454c45435420554d5f555345525f4e414d452c554d5f524f4c455f4e414d452046524f4d20554d5f555345525f524f4c452c20554d5f524f4c452c554d5f55534552205748455245204c4f57455228554d5f555345522e554d5f555345525f4e414d452920494e283f2920414e4420554d5f555345522e554d5f49443d554d5f555345525f524f4c452e554d5f555345525f494420414e4420554d5f524f4c452e554d5f49443d554d5f555345525f524f4c452e554d5f524f4c455f494420414e4420554d5f555345525f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2244656c657465526f6c6553514c223e44454c4554452046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d45203d203f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22497355736572526f6c65457869737453514c43617365496e73656e736974697665223e53454c45435420554d5f524f4c455f4e414d452046524f4d20554d5f555345525f524f4c452c20554d5f524f4c452c20554d5f55534552205748455245204c4f57455228554d5f555345522e554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f555345522e554d5f49443d554d5f555345525f524f4c452e554d5f555345525f494420414e4420554d5f524f4c452e554d5f49443d554d5f555345525f524f4c452e554d5f524f4c455f494420414e4420554d5f555345525f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c455f4e414d45204c494b45203f3c2f50726f70657274793e3c50726f7065727479206e616d653d22557064617465526f6c654e616d6553514c223e55504441544520554d5f524f4c452073657420554d5f524f4c455f4e414d453d3f20574845524520554d5f524f4c455f4e414d45203d203f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c2d646232223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420524f575f4e554d4245522829204f56455220284f5244455220425920554d5f555345525f4e414d452920415320726e2c20552e2a202046524f4d20554d5f5553455220415320552920574845524520554d5f555345525f4e414d45204c494b45203f20414e4420554d5f54454e414e545f4944203d203f20414e4420726e204245545745454e203f20414e44203f3c2f50726f70657274793e3c50726f7065727479206e616d653d2241646455736572546f526f6c6553514c43617365496e73656e736974697665223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f555345525f49442c20554d5f524f4c455f49442c20554d5f54454e414e545f4944292056414c55455320282853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d2252656d6f76655573657246726f6d536861726564526f6c6553514c43617365496e73656e736974697665223e44454c4554452046524f4d20554d5f5348415245445f555345525f524f4c4520574845524520554d5f524f4c455f49443d2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f555345525f54454e414e545f49443d3f20414e4420554d5f524f4c455f54454e414e545f4944203d203f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574557365724c6973744f66526f6c6553514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f555345525f524f4c452c20554d5f524f4c452c20554d5f5553455220574845524520554d5f524f4c452e554d5f524f4c455f4e414d453d3f20414e4420554d5f555345522e554d5f49443d554d5f555345525f524f4c452e554d5f555345525f494420414e4420554d5f524f4c452e554d5f49443d554d5f555345525f524f4c452e554d5f524f4c455f494420414e4420554d5f555345525f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d224f6e44656c6574655573657252656d6f76655573657241747472696275746553514c43617365496e73656e736974697665223e44454c4554452046524f4d20554d5f555345525f41545452494255544520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574506167696e61746564557365724c6973466f7250726f706572747953514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f555345522c20554d5f555345525f41545452494255544520574845524520554d5f555345525f4154545249425554452e554d5f555345525f4944203d20554d5f555345522e554d5f494420414e4420554d5f555345525f4154545249425554452e554d5f415454525f4e414d45203d3f20414e4420554d5f555345525f4154545249425554452e554d5f415454525f56414c5545204c494b45203f20414e4420554d5f555345525f4154545249425554452e554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f204f5244455220425920554d5f555345525f4e414d4520415343204c494d4954203f204f4646534554203f3c2f50726f70657274793e3c50726f7065727479206e616d653d22526f6c656e616d654a6176615265674578223e5e5b5c535d7b332c33307d243c2f50726f70657274793e3c50726f7065727479206e616d653d22476574506167696e61746564557365724c6973466f7250726f706572747953514c2d6f7261636c65223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420554d5f555345525f4e414d452c20726f776e756d20415320726e756d2046524f4d202853454c4543542044495354494e435420554d5f555345525f4e414d452046524f4d20554d5f555345522c20554d5f555345525f41545452494255544520574845524520554d5f555345525f4154545249425554452e554d5f555345525f4944203d20554d5f555345522e554d5f494420414e4420554d5f555345525f4154545249425554452e554d5f415454525f4e414d45203d3f20414e4420554d5f555345525f4154545249425554452e554d5f415454525f56414c5545204c494b45203f20414e4420554d5f555345525f4154545249425554452e554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f204f5244455220425920554d5f555345525f4e414d452029574845524520726f776e756d20266c743b3d203f292057484552452020726e756d203e203f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574506167696e61746564557365724c6973466f7250726f706572747953514c2d646232223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420524f575f4e554d4245522829204f56455220284f5244455220425920554d5f555345525f4e414d452920415320726e2c20554d5f555345525f4e414d452046524f4d20554d5f555345522c20554d5f555345525f41545452494255544520574845524520554d5f555345525f4154545249425554452e554d5f555345525f4944203d20554d5f555345522e554d5f494420414e4420554d5f555345525f4154545249425554452e554d5f415454525f4e414d45203d3f20414e4420554d5f555345525f4154545249425554452e554d5f415454525f56414c5545204c494b45203f20414e4420554d5f555345525f4154545249425554452e554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f202920574845524520726e204245545745454e203f20414e44203f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c43617365496e73656e7369746976652d6f7261636c65223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420554d5f555345525f4e414d452c554d5f54454e414e545f49442c20726f776e756d20415320726e756d2046524f4d202853454c45435420554d5f555345525f4e414d452c20554d5f54454e414e545f49442046524f4d20554d5f55534552204f524445522042592020554d5f555345525f4e414d452920574845524520554d5f555345525f4e414d45204c494b45204c4f574552283f2920414e4420554d5f54454e414e545f49443d3f20414e4420726f776e756d20266c743b3d203f292057484552452020726e756d203e203f3c2f50726f70657274793e3c50726f7065727479206e616d653d22416464526f6c65546f5573657253514c223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f524f4c455f49442c20554d5f555345525f49442c20554d5f54454e414e545f4944292056414c55455320282853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c43617365496e73656e7369746976652d646232223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420524f575f4e554d4245522829204f56455220284f5244455220425920554d5f555345525f4e414d452920415320726e2c20552e2a202046524f4d20554d5f5553455220415320552920574845524520554d5f555345525f4e414d45204c494b45204c4f574552283f2920414e4420554d5f54454e414e545f4944203d203f20414e4420726e204245545745454e203f20414e44203f3c2f50726f70657274793e3c50726f7065727479206e616d653d225570646174655573657250617373776f726453514c223e55504441544520554d5f555345522053455420554d5f555345525f50415353574f52443d203f2c20554d5f53414c545f56414c55453d3f2c20554d5f524551554952455f4348414e47453d3f2c20554d5f4348414e4745445f54494d453d3f20574845524520554d5f555345525f4e414d453d203f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2255736572526f6c6553514c223e53454c45435420554d5f524f4c455f4e414d452046524f4d20554d5f555345525f524f4c452c20554d5f524f4c452c20554d5f5553455220574845524520554d5f555345522e554d5f555345525f4e414d453d3f20414e4420554d5f555345522e554d5f49443d554d5f555345525f524f4c452e554d5f555345525f494420414e4420554d5f524f4c452e554d5f49443d554d5f555345525f524f4c452e554d5f524f4c455f494420414e4420554d5f555345525f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c43617365496e73656e7369746976652d6d7373716c223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420554d5f555345525f4e414d452c554d5f54454e414e545f49442c20524f575f4e554d4245522829204f56455220284f5244455220425920554d5f555345525f4e414d452920415320526f774e756d2046524f4d20554d5f5553455229204153205020574845524520502e554d5f555345525f4e414d45204c494b45204c4f574552283f2920414e4420502e554d5f54454e414e545f49443d203f20414e4420502e526f774e756d204245545745454e203f20414e44203f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574526f6c654c69737453514c223e53454c45435420554d5f524f4c455f4e414d452c20554d5f54454e414e545f49442c20554d5f5348415245445f524f4c452046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d45204c494b45203f20414e4420554d5f54454e414e545f49443d3f20414e4420554d5f5348415245445f524f4c45203d273027204f5244455220425920554d5f524f4c455f4e414d453c2f50726f70657274793e3c50726f7065727479206e616d653d224f6e44656c6574655573657252656d6f76655573657241747472696275746553514c223e44454c4554452046524f4d20554d5f555345525f41545452494255544520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225570646174655573657250726f706572747953514c43617365496e73656e736974697665223e55504441544520554d5f555345525f4154545249425554452053455420554d5f415454525f56414c55453d3f20574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f415454525f4e414d453d3f20414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574557365727350726f70657274696573466f7250726f66696c6553514c43617365496e73656e736974697665223e53454c45435420554d5f555345525f4e414d452c554d5f415454525f4e414d452c20554d5f415454525f56414c55452046524f4d20554d5f555345525f4154545249425554452c20554d5f5553455220574845524520554d5f555345522e554d5f4944203d20554d5f555345525f4154545249425554452e554d5f555345525f494420414e44204c4f57455228554d5f555345522e554d5f555345525f4e414d452920494e20283f2920414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574557365724c6973744f66536861726564526f6c6553514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f5348415245445f555345525f524f4c4520494e4e4552204a4f494e20554d5f55534552204f4e20554d5f5348415245445f555345525f524f4c452e554d5f555345525f4944203d20554d5f555345522e554d5f494420494e4e4552204a4f494e20554d5f524f4c45204f4e20554d5f5348415245445f555345525f524f4c452e554d5f524f4c455f4944203d20554d5f524f4c452e554d5f494420574845524520554d5f524f4c452e554d5f524f4c455f4e414d453d203f20414e4420554d5f5348415245445f555345525f524f4c452e554d5f555345525f54454e414e545f4944203d20554d5f555345522e554d5f54454e414e545f494420414e4420554d5f5348415245445f555345525f524f4c452e554d5f524f4c455f54454e414e545f4944203d20554d5f524f4c452e554d5f54454e414e545f49443c2f50726f70657274793e3c50726f7065727479206e616d653d2250617373776f72644a617661526567457856696f6c6174696f6e4572726f724d7367223e50617373776f7264206c656e6774682073686f756c642062652077697468696e203520746f20333020636861726163746572733c2f50726f70657274793e3c50726f7065727479206e616d653d22416464536861726564526f6c65546f5573657253514c223e494e5345525420494e544f20554d5f5348415245445f555345525f524f4c452028554d5f524f4c455f49442c20554d5f555345525f49442c20554d5f555345525f54454e414e545f49442c20554d5f524f4c455f54454e414e545f4944292056414c55455320282853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c203f2c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d2244656c6574655573657250726f706572747953514c43617365496e73656e736974697665223e44454c4554452046524f4d20554d5f555345525f41545452494255544520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f415454525f4e414d453d3f20414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2252656d6f76655573657246726f6d536861726564526f6c6553514c223e44454c4554452046524f4d20554d5f5348415245445f555345525f524f4c45205748455245202020554d5f524f4c455f49443d2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f555345525f54454e414e545f49443d3f20414e4420554d5f524f4c455f54454e414e545f4944203d203f3c2f50726f70657274793e3c50726f7065727479206e616d653d2252656d6f76655573657246726f6d526f6c6553514c223e44454c4554452046524f4d20554d5f555345525f524f4c4520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f524f4c455f49443d2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d224973557365724578697374696e6753514c223e53454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22416464526f6c655065726d697373696f6e53514c223e416464526f6c655065726d697373696f6e53514c3c2f50726f70657274793e3c50726f7065727479206e616d653d224f6e44656c6574655573657252656d6f76655065726d697373696f6e7353514c223e4f6e44656c6574655573657252656d6f76655065726d697373696f6e7353514c3c2f50726f70657274793e3c50726f7065727479206e616d653d224164645573657253514c223e494e5345525420494e544f20554d5f555345522028554d5f555345525f4e414d452c20554d5f555345525f50415353574f52442c20554d5f53414c545f56414c55452c20554d5f524551554952455f4348414e47452c20554d5f4348414e4745445f54494d452c20554d5f54454e414e545f4944292056414c55455320283f2c203f2c203f2c203f2c203f2c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d225570646174655573657250617373776f726453514c43617365496e73656e736974697665223e55504441544520554d5f555345522053455420554d5f555345525f50415353574f52443d203f2c20554d5f53414c545f56414c55453d3f2c20554d5f524551554952455f4348414e47453d3f2c20554d5f4348414e4745445f54494d453d3f205748455245204c4f57455228554d5f555345525f4e414d45293d204c4f574552283f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22577269746547726f757073223e747275653c2f50726f70657274793e3c50726f7065727479206e616d653d224973526f6c654578697374696e6753514c223e53454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2255736572526f6c6553514c43617365496e73656e736974697665223e53454c45435420554d5f524f4c455f4e414d452046524f4d20554d5f555345525f524f4c452c20554d5f524f4c452c20554d5f55534552205748455245204c4f57455228554d5f555345522e554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f555345522e554d5f49443d554d5f555345525f524f4c452e554d5f555345525f494420414e4420554d5f524f4c452e554d5f49443d554d5f555345525f524f4c452e554d5f524f4c455f494420414e4420554d5f555345525f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2247657454656e616e74494446726f6d557365724e616d6553514c43617365496e73656e736974697665223e53454c45435420554d5f54454e414e545f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f293c2f50726f70657274793e3c50726f7065727479206e616d653d224f6e44656c657465526f6c6552656d6f76655065726d697373696f6e7353514c223e4f6e44656c657465526f6c6552656d6f76655065726d697373696f6e7353514c3c2f50726f70657274793e3c50726f7065727479206e616d653d22557365724e616d65556e697175654163726f737354656e616e7473223e66616c73653c2f50726f70657274793e3c50726f7065727479206e616d653d224d756c7469417474726962757465536570617261746f72223e2c3c2f50726f70657274793e3c50726f7065727479206e616d653d2250617373776f72644a6176615265674578223e5e5b5c535d7b352c33307d243c2f50726f70657274793e3c50726f7065727479206e616d653d22526561644f6e6c79223e66616c73653c2f50726f70657274793e3c50726f7065727479206e616d653d22557365726e616d654a6176615265674578223e5e5b5c535d7b332c33307d243c2f50726f70657274793e3c50726f7065727479206e616d653d2255736572526f6c65734361636865456e61626c6564223e747275653c2f50726f70657274793e3c50726f7065727479206e616d653d2255736572536861726564526f6c6553514c223e53454c45435420554d5f524f4c455f4e414d452c20554d5f524f4c452e554d5f54454e414e545f49442c20554d5f5348415245445f524f4c452046524f4d20554d5f5348415245445f555345525f524f4c4520494e4e4552204a4f494e20554d5f55534552204f4e20554d5f5348415245445f555345525f524f4c452e554d5f555345525f4944203d20554d5f555345522e554d5f494420494e4e4552204a4f494e20554d5f524f4c45204f4e20554d5f5348415245445f555345525f524f4c452e554d5f524f4c455f4944203d20554d5f524f4c452e554d5f494420574845524520554d5f555345522e554d5f555345525f4e414d45203d203f20414e4420554d5f5348415245445f555345525f524f4c452e554d5f555345525f54454e414e545f4944203d20554d5f555345522e554d5f54454e414e545f494420414e4420554d5f5348415245445f555345525f524f4c452e554d5f524f4c455f54454e414e545f4944203d20554d5f524f4c452e554d5f54454e414e545f494420414e4420554d5f5348415245445f555345525f524f4c452e554d5f555345525f54454e414e545f4944203d203f203c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c2d6f7261636c65223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420554d5f555345525f4e414d452c20554d5f54454e414e545f49442c20726f776e756d20415320726e756d2046524f4d202853454c45435420554d5f555345525f4e414d452c20554d5f54454e414e545f49442046524f4d20554d5f55534552204f5244455220425920554d5f555345525f4e414d452920574845524520554d5f555345525f4e414d45204c494b45203f20414e4420554d5f54454e414e545f49443d3f20414e4420726f776e756d20266c743b3d203f292057484552452020726e756d203e203f3c2f50726f70657274793e3c50726f7065727479206e616d653d224765745573657250726f70657274696573466f7250726f66696c6553514c223e53454c45435420554d5f415454525f4e414d452c20554d5f415454525f56414c55452046524f4d20554d5f555345525f4154545249425554452c20554d5f5553455220574845524520554d5f555345522e554d5f4944203d20554d5f555345525f4154545249425554452e554d5f555345525f494420414e4420554d5f555345522e554d5f555345525f4e414d453d3f20414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c74657253514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d45204c494b45203f20414e4420554d5f54454e414e545f49443d3f204f5244455220425920554d5f555345525f4e414d453c2f50726f70657274793e3c50726f7065727479206e616d653d2244656c6574655573657250726f706572747953514c223e44454c4554452046524f4d20554d5f555345525f41545452494255544520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f415454525f4e414d453d3f20414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d224765745573657250726f7065727479466f7250726f66696c6553514c43617365496e73656e736974697665223e53454c45435420554d5f415454525f56414c55452046524f4d20554d5f555345525f4154545249425554452c20554d5f5553455220574845524520554d5f555345522e554d5f4944203d20554d5f555345525f4154545249425554452e554d5f555345525f494420414e44204c4f57455228554d5f555345522e554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f415454525f4e414d453d3f20414e4420554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22416464526f6c65546f5573657253514c43617365496e73656e7369746976652d6f70656e65646765223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f524f4c455f49442c20554d5f555345525f49442c20554d5f54454e414e545f4944292053454c4543542055522e554d5f49442c2055552e554d5f49442c203f2046524f4d20554d5f524f4c452055522c20554d5f555345522055552057484552452055522e554d5f524f4c455f4e414d453d3f20414e442055522e554d5f54454e414e545f49443d3f20414e44204c4f5745522855552e554d5f555345525f4e414d45293d4c4f574552283f2920414e442055552e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2243617365496e73656e736974697665557365726e616d65223e747275653c2f50726f70657274793e3c50726f7065727479206e616d653d2241646455736572546f526f6c6553514c43617365496e73656e7369746976652d6f70656e65646765223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f555345525f49442c20554d5f524f4c455f49442c20554d5f54454e414e545f4944292053454c4543542055552e554d5f49442c2055522e554d5f49442c203f2046524f4d20554d5f555345522055552c20554d5f524f4c45205552205748455245204c4f5745522855552e554d5f555345525f4e414d45293d4c4f574552283f2920414e442055552e554d5f54454e414e545f49443d3f20414e442055522e554d5f524f4c455f4e414d453d3f20414e442055522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574557365724c6973466f7250726f706572747953514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f555345522c20554d5f555345525f41545452494255544520574845524520554d5f555345525f4154545249425554452e554d5f555345525f4944203d20554d5f555345522e554d5f494420414e4420554d5f555345525f4154545249425554452e554d5f415454525f4e414d45203d3f20414e4420554d5f555345525f4154545249425554452e554d5f415454525f56414c5545204c494b45203f20414e4420554d5f555345525f4154545249425554452e554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2255736572536861726564526f6c6553514c43617365496e73656e736974697665223e53454c45435420554d5f524f4c455f4e414d452c20554d5f524f4c452e554d5f54454e414e545f49442c20554d5f5348415245445f524f4c452046524f4d20554d5f5348415245445f555345525f524f4c4520494e4e4552204a4f494e20554d5f55534552204f4e20554d5f5348415245445f555345525f524f4c452e554d5f555345525f4944203d20554d5f555345522e554d5f494420494e4e4552204a4f494e20554d5f524f4c45204f4e20554d5f5348415245445f555345525f524f4c452e554d5f524f4c455f4944203d20554d5f524f4c452e554d5f4944205748455245204c4f57455228554d5f555345522e554d5f555345525f4e414d4529203d204c4f574552283f2920414e4420554d5f5348415245445f555345525f524f4c452e554d5f555345525f54454e414e545f4944203d20554d5f555345522e554d5f54454e414e545f494420414e4420554d5f5348415245445f555345525f524f4c452e554d5f524f4c455f54454e414e545f4944203d20554d5f524f4c452e554d5f54454e414e545f494420414e4420554d5f5348415245445f555345525f524f4c452e554d5f555345525f54454e414e545f4944203d203f203c2f50726f70657274793e3c50726f7065727479206e616d653d22416464536861726564526f6c65546f5573657253514c43617365496e73656e736974697665223e494e5345525420494e544f20554d5f5348415245445f555345525f524f4c452028554d5f524f4c455f49442c20554d5f555345525f49442c20554d5f555345525f54454e414e545f49442c20554d5f524f4c455f54454e414e545f4944292056414c55455320282853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c202853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f292c203f2c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d2252656d6f7665526f6c6546726f6d5573657253514c43617365496e73656e736974697665223e44454c4554452046524f4d20554d5f555345525f524f4c4520574845524520554d5f524f4c455f49443d2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2253656c6563745573657253514c223e53454c454354202a2046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225343494d456e61626c6564223e66616c73653c2f50726f70657274793e3c50726f7065727479206e616d653d22557365724e616d65556e697175654163726f737354656e616e747353514c43617365496e73656e736974697665223e53454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f293c2f50726f70657274793e3c50726f7065727479206e616d653d224164645573657250726f706572747953514c223e494e5345525420494e544f20554d5f555345525f4154545249425554452028554d5f555345525f49442c20554d5f415454525f4e414d452c20554d5f415454525f56414c55452c20554d5f50524f46494c455f49442c20554d5f54454e414e545f4944292056414c55455320282853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c203f2c203f2c203f2c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d224164645573657250726f706572747953514c2d6f70656e65646765223e494e5345525420494e544f20554d5f555345525f4154545249425554452028554d5f555345525f49442c20554d5f415454525f4e414d452c20554d5f415454525f56414c55452c20554d5f50524f46494c455f49442c20554d5f54454e414e545f4944292053454c45435420554d5f49442c203f2c203f2c203f2c203f2046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e61746564436f756e7453514c223e53454c45435420434f554e5428554d5f555345525f4e414d45292046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d45204c494b45203f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2252656d6f7665526f6c6546726f6d5573657253514c223e44454c4554452046524f4d20554d5f555345525f524f4c4520574845524520554d5f524f4c455f49443d2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2253656c6563745573657253514c43617365496e73656e736974697665223e53454c454354202a2046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22476574536861726564526f6c654c69737453514c223e53454c45435420554d5f524f4c455f4e414d452c20554d5f54454e414e545f49442c20554d5f5348415245445f524f4c452046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d45204c494b45203f20414e4420554d5f5348415245445f524f4c45203d273127204f5244455220425920554d5f524f4c455f4e414d453c2f50726f70657274793e3c50726f7065727479206e616d653d22416464557365725065726d697373696f6e53514c223e416464557365725065726d697373696f6e3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c43617365496e73656e736974697665436f756e74223e53454c45435420434f554e542028554d5f555345525f4e414d45292046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d4529204c494b45204c4f574552283f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2250617373776f7264446967657374223e5348412d3235363c2f50726f70657274793e3c50726f7065727479206e616d653d22476574557365724c697374466f72436c61696d56616c756553514c223e53454c45435420554d5f555345525f4e414d452046524f4d20554d5f555345522c20554d5f555345525f41545452494255544520574845524520554d5f555345525f4154545249425554452e554d5f555345525f4944203d20554d5f555345522e554d5f494420414e4420554d5f555345525f4154545249425554452e554d5f415454525f4e414d45203d3f20414e4420554d5f555345525f4154545249425554452e554d5f415454525f56414c5545203d3f20414e4420554d5f555345525f4154545249425554452e554d5f50524f46494c455f49443d3f20414e4420554d5f555345525f4154545249425554452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22557365724e616d65556e697175654163726f737354656e616e747353514c223e53454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d224973557365724578697374696e6753514c43617365496e73656e736974697665223e53454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d224765745573657250726f66696c654e616d657353514c223e53454c4543542044495354494e435420554d5f50524f46494c455f49442046524f4d20554d5f555345525f41545452494255544520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d224f6e44656c6574655573657252656d6f766555736572526f6c654d617070696e6753514c43617365496e73656e736974697665223e44454c4554452046524f4d20554d5f555345525f524f4c4520574845524520554d5f555345525f49443d2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f2920414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225374617469635573657253746f7265223e747275653c2f50726f70657274793e3c50726f7065727479206e616d653d2247657455736572494446726f6d557365724e616d6553514c223e53454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d2241646455736572546f526f6c6553514c2d6d7373716c223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f555345525f49442c20554d5f524f4c455f49442c20554d5f54454e414e545f4944292053454c454354202853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c283f293c2f50726f70657274793e3c50726f7065727479206e616d653d22416464526f6c65546f5573657253514c2d6d7373716c223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f524f4c455f49442c20554d5f555345525f49442c20554d5f54454e414e545f4944292053454c454354202853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f5553455220574845524520554d5f555345525f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c20283f293c2f50726f70657274793e3c50726f7065727479206e616d653d22416464526f6c65546f5573657253514c43617365496e73656e736974697665223e494e5345525420494e544f20554d5f555345525f524f4c452028554d5f524f4c455f49442c20554d5f555345525f49442c20554d5f54454e414e545f4944292056414c55455320282853454c45435420554d5f49442046524f4d20554d5f524f4c4520574845524520554d5f524f4c455f4e414d453d3f20414e4420554d5f54454e414e545f49443d3f292c2853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f292c203f293c2f50726f70657274793e3c50726f7065727479206e616d653d225573657273526f6c6553514c223e53454c45435420554d5f555345525f4e414d452c554d5f524f4c455f4e414d452046524f4d20554d5f555345525f524f4c452c20554d5f524f4c452c20554d5f5553455220574845524520554d5f555345522e554d5f555345525f4e414d4520494e20283f2920414e4420554d5f555345522e554d5f49443d554d5f555345525f524f4c452e554d5f555345525f494420414e4420554d5f524f4c452e554d5f49443d554d5f555345525f524f4c452e554d5f524f4c455f494420414e4420554d5f555345525f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f524f4c452e554d5f54454e414e545f49443d3f20414e4420554d5f555345522e554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d225573657246696c746572506167696e6174656453514c2d6d7373716c223e53454c45435420554d5f555345525f4e414d452046524f4d202853454c45435420554d5f555345525f4e414d452c554d5f54454e414e545f49442c20524f575f4e554d4245522829204f56455220284f5244455220425920554d5f555345525f4e414d452920415320526f774e756d2046524f4d20554d5f5553455229204153205020574845524520502e554d5f555345525f4e414d45204c494b45203f20414e4420502e554d5f54454e414e545f49443d203f20414e4420502e526f774e756d204245545745454e203f20414e44203f3c2f50726f70657274793e3c50726f7065727479206e616d653d2253746f726553616c74656450617373776f7264223e747275653c2f50726f70657274793e3c50726f7065727479206e616d653d224164645573657250726f706572747953514c43617365496e73656e7369746976652d6d7373716c223e494e5345525420494e544f20554d5f555345525f4154545249425554452028554d5f555345525f49442c20554d5f415454525f4e414d452c20554d5f415454525f56414c55452c20554d5f50524f46494c455f49442c20554d5f54454e414e545f4944292053454c454354202853454c45435420554d5f49442046524f4d20554d5f55534552205748455245204c4f57455228554d5f555345525f4e414d45293d4c4f574552283f2920414e4420554d5f54454e414e545f49443d3f292c20283f292c20283f292c20283f292c20283f293c2f50726f70657274793e3c50726f7065727479206e616d653d22526f6c656e616d654a6176615363726970745265674578223e5e5b5c535d7b332c33307d243c2f50726f70657274793e3c50726f7065727479206e616d653d22416464536861726564526f6c6553514c223e55504441544520554d5f524f4c452053455420554d5f5348415245445f524f4c45203d203f20574845524520554d5f524f4c455f4e414d45203d203f20414e4420554d5f54454e414e545f4944203d203f3c2f50726f70657274793e3c50726f7065727479206e616d653d2247657450726f66696c654e616d657353514c223e53454c4543542044495354494e435420554d5f50524f46494c455f49442046524f4d20554d5f555345525f41545452494255544520574845524520554d5f54454e414e545f49443d3f3c2f50726f70657274793e3c50726f7065727479206e616d653d22557365726e616d654a617661526567457856696f6c6174696f6e4572726f724d7367223e557365726e616d65207061747465726e20706f6c6963792076696f6c617465643c2f50726f70657274793e3c2f5573657253746f72654d616e616765723e3c417574686f72697a6174696f6e4d616e6167657220636c6173733d226f72672e77736f322e636172626f6e2e757365722e636f72652e617574686f72697a6174696f6e2e4a444243417574686f72697a6174696f6e4d616e61676572222f3e3c2f5265616c6d3e3c2f557365724d616e616765723e
\.


--
-- Data for Name: um_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_user (um_id, um_user_name, um_user_password, um_salt_value, um_require_change, um_changed_time, um_tenant_id) FROM stdin;
1	admin	n8cXCqlbnVguDBJU2qrUkE2ZZvM64TPpTOmNF7ndL/k=	Sqc83fHpmVy5XaSrbHmuaQ==	f	2021-03-11 16:47:19.215	-1234
2	apicreator1	Pq4H+4n7F0HPRZFyAeec8gvJAFS/dFx9gnl9i54XkRg=	8vJ6K1F1SUJKEgRBZADcbQ==	f	2021-03-11 16:52:43.447	-1234
3	apipublisher1	k//+6ncrjtaG1HFFK8J0/Bf2/LMR/4L3VxlK/O5izz4=	RKO6cJVHhrAp0US15f/QUw==	f	2021-03-11 16:52:43.546	-1234
4	apisubscriber_1_0_1	2Cvg1wPZ4e6jZPZKX7+sTgUOl1cA/hNcXnk5G25A43k=	YogRtnMZAvVp1b9S9ur09w==	f	2021-03-11 16:53:09.974	-1234
5	apisubscriber_1_0_2	VWDczx6nGkiy1A1iojpEo6R7FXdlhjn16bE3y2M67Hk=	PzqzoJq5erQeUwRsMYVJ0w==	f	2021-03-11 16:53:19.915	-1234
6	apisubscriber_1_0_3	+4PZFEzOhZFlilOFt15HQ10dk08tRSaKH2m3NLHqXQA=	Br+R6UZf+gCTegJARATjlg==	f	2021-03-11 16:53:24.865	-1234
7	apisubscriber_1_0_4	GhLiLJgRxb2jMgIVIqPnBe5uCzEAJSro/8MzUN9o8eg=	2eT6hjLx0XDt+sAPci/l/g==	f	2021-03-11 16:53:28.862	-1234
8	apisubscriber_1_0_5	977SiqErpYqtnv6clShhXJbxBsJ8HX3SMarCIHx9WCA=	QFk3H2voOXSabuprSFaCgQ==	f	2021-03-11 16:53:32.837	-1234
9	apisubscriber_1_1_6	tOFwd/mu50QpXQuLsZWV6BuAD3jJyvLD0khz1Hubl54=	16OAajwwPhQWqKPWdaJWdg==	f	2021-03-11 16:53:47.407	-1234
10	apisubscriber_1_1_7	irG7HdrieO8Lm8CD47sE3XMvl0dq+0ew+un/tt+nho0=	E9j6Plg+qGcJnmtZeedXhQ==	f	2021-03-11 16:53:52.629	-1234
11	apisubscriber_1_1_8	DbIr48SXO4rLVI1bkydyIlUznoz8G6PxLObpWgIeXUE=	0hWCS7IQ5B7p+rZfBfgoCw==	f	2021-03-11 16:53:56.288	-1234
12	apisubscriber_1_1_9	QiwpT8jaFMksF0f5SC2NdLsoumCTYFSstRrBGApvUKA=	dl23Hxql2OUwdNA+fy3qKw==	f	2021-03-11 16:54:00.375	-1234
13	apisubscriber_1_1_10	5emhxRIBCl7biLF7Hak3CR4VIgPkMphHmOn7K8eEZVo=	nDXadCmJdXIUch1zoF1hLA==	f	2021-03-11 16:54:05.603	-1234
14	apisubscriber_1_2_11	2ZyRlFyxYLc8hMY1qOWWP55b3F0tr75NBLeTxhw6ju4=	GDMN6Nc22y4KlDQANYTA3A==	f	2021-03-11 16:54:16.645	-1234
15	apisubscriber_1_2_12	dqrORceVlLflCGmFk9N6S4ZoFEvYbcE0SLfTpH5d1hM=	nJjPs++s91fOIFwA8twJ3w==	f	2021-03-11 16:54:21.272	-1234
16	apisubscriber_1_2_13	hktvLeEpmF1spToyTKTMRNdvMlvV+uZG5TjYwkIwsY8=	B0MYZrby69OLWPLEpSu9pQ==	f	2021-03-11 16:54:25.259	-1234
17	apisubscriber_1_2_14	L/IicU8H31lSNlJWhdd9qUyFpHT9AxFrNZoi/RvPWiA=	dvIRc30qIQAEmLTz0ZxjSA==	f	2021-03-11 16:54:28.962	-1234
18	apisubscriber_1_2_15	+YWKmuCBOUty5FsL6NC3YglyNsUtiv7IWoEQebs2A3M=	830XJ+Rq6FFWvEEEMDEzgg==	f	2021-03-11 16:54:33.207	-1234
19	apisubscriber_1_3_16	q9c7lrh8mqpjW1cXeO0t74TMZ0vH7VtJecAvgx+sn2k=	xHXmg/hvpclWTtuV29xk6w==	f	2021-03-11 16:54:44.902	-1234
20	apisubscriber_1_3_17	GamIlrMiKSwrFhPCRDZi9svJwZInJf6czkrtqHkgaow=	Wu/qObZq/py45UHaEzVCYg==	f	2021-03-11 16:54:49.558	-1234
21	apisubscriber_1_3_18	Rlew1GFPC063xyv6YNESB1xYsNCdAbm7+sxfUqFJcD4=	SUPeSITPtezegCpUQ+Y4tg==	f	2021-03-11 16:54:57.661	-1234
22	apisubscriber_1_3_19	8+2J+lUQv2Eesgb+gaT5uLCAiLXFbIc6JradEGGOl3k=	2HY64OM7UAIMbSpsY++Ouw==	f	2021-03-11 16:55:03.533	-1234
23	apisubscriber_1_3_20	TA/n9bIAd7hBtvAwXvTZimBvBMMHG6tOxeMTa44VP/M=	dA80Z13Glcuhhj7RYva5Zg==	f	2021-03-11 16:55:10.712	-1234
24	apisubscriber_1_4_21	Cs7+uzL4ZUmP7adzuclwl+oyaHxWYpY1aSJ59mPlFGs=	4aA9xYK3uN54CloeOfVORg==	f	2021-03-11 16:55:26.431	-1234
25	apisubscriber_1_4_22	gBHzAG6iGmKLPH+YNrIQI2+tZYXaSTTG8we5b3iM5Xw=	+73Jts6kPncuiVboKuu8pQ==	f	2021-03-11 16:55:31.142	-1234
26	apisubscriber_1_4_23	orePcXwqywcsXgGNfHkKhUbewmO6kvbccMS8ttVDmHc=	Z0DsdH2KChdV01/tS/SPzg==	f	2021-03-11 16:55:37.225	-1234
27	apisubscriber_1_4_24	bTt7fkkfKBPOhLKbHo1FFr1ntQg0nyAmnZJt+ASdXRo=	PtfuxGZ1TnfhtvhlnD/Wtg==	f	2021-03-11 16:55:43.871	-1234
28	apisubscriber_1_4_25	FSdh0YuRbFLupU8Pu+wrD0EjEcAceyo/t7U4m4j0Mzw=	V8hwydzgSyFQmlChZEUFgg==	f	2021-03-11 16:55:48.916	-1234
29	apisubscriber_1_5_26	MddqjUNUx20y9XaclaC4KfjCzqX41P5gEsN74ANRb6Q=	E/J9Bfu4qrXIgV6n/XX+ng==	f	2021-03-11 16:56:02.798	-1234
30	apisubscriber_1_5_27	qSJp0hAE0zm4IoKkF9Gz0RDDKFGqH++8wDloVhFNzFk=	MclzHFbR/jsY0yHu1gYHYA==	f	2021-03-11 16:56:08.094	-1234
31	apisubscriber_1_5_28	jTUltl+scpv4RL9gtwElLmgk6+8fnoGsKJEaa8hMHxM=	/+J16QsFmNmi4Zzjpe2W+Q==	f	2021-03-11 16:56:12.911	-1234
32	apisubscriber_1_5_29	l4gDlYPCEeuFGaeRuwwpViJbFZxMdXOPG5Rgjsorbu0=	G3T1sddXm93LbtwTtRJ5Rw==	f	2021-03-11 16:56:18.481	-1234
33	apisubscriber_1_5_30	D7zlrzKML6Ikwnb6VJkRgu8ovK5qntDhXx3ZLOLLHQM=	/UOjsRVhVvUaWAZUG1UtQw==	f	2021-03-11 16:56:24.181	-1234
34	apisubscriber_1_6_31	0WMv6R31XXyTymba+tqSMj8WZOpt65nDMCKo/6QgUx8=	s9YU10zJZnb0kJOUNUrt/g==	f	2021-03-11 16:56:37.6	-1234
35	apisubscriber_1_6_32	wZS7j3OkDJliMbP7kZPLw3vSWMvd3Iy28DvMHkMK9ac=	bagre0gGnJzsg9ccFjrBqA==	f	2021-03-11 16:56:42.622	-1234
36	apisubscriber_1_6_33	x7kty2nvmsapB31boIIRiRyxi7iX8m5/eOJiCz0Hk1k=	OXY17f2KJpCDivvczlbBKw==	f	2021-03-11 16:56:47.868	-1234
37	apisubscriber_1_6_34	DLIvU5RMoVCD8EWX3yEQ1V4U5gNazySAlQ5jadGTPGY=	tZZn/QGqZrhVGM5BfbJtPQ==	f	2021-03-11 16:56:52.702	-1234
38	apisubscriber_1_6_35	8ZH3cjFXiv20phEv45Eq2HCdVwy7wK0G+H1oXhUP+cc=	e/v0rXWfqgX7XGflJpL0Hw==	f	2021-03-11 16:56:57.754	-1234
39	apisubscriber_1_7_36	G7YBDIB3dwhlhokFLRdEYRvmakS+fTJ6X/aENq+CBTU=	gqIOXMYmolJABQWSk8jMPA==	f	2021-03-11 16:57:13.689	-1234
40	apisubscriber_1_7_37	q7b74ikST+0rNcid64Hyrj58/D0Vl3nauXm3S2mUJrI=	Ej2PHdOnYlEUgZWPiXCoaA==	f	2021-03-11 16:57:20.129	-1234
41	apisubscriber_1_7_38	GssVsv6DF7JKwEp73dLKSsVasqnI4OGvoPsjoGsZePU=	nvXBfeez1aBnseu4dZtQOg==	f	2021-03-11 16:57:26.42	-1234
42	apisubscriber_1_7_39	JRNDntwvpH3gukn5mRyIH9H+xnpgucsI3Bc5KU5jHSI=	YBfBL8SuHEZF4+9NoFe/LQ==	f	2021-03-11 16:57:32.874	-1234
43	apisubscriber_1_7_40	yNdU07b21kRZANTvsEIIU8/eHgN+wrlTqXG6yF3iIZE=	qtp5Kk52j9OeiQ9C7ul1IA==	f	2021-03-11 16:57:38.971	-1234
44	apisubscriber_1_8_41	7aCHtaiau/MrWU5PLsAjDkzrgRGWnnET8Cl8qrrC854=	pkV+DV+To/nIOTbbFsN3jg==	f	2021-03-11 16:57:54.734	-1234
45	apisubscriber_1_8_42	x0R1zcPmZw/vpCRGkGXA2S6uCB2hiW3p8G7H6wN7+fk=	ozAJ6IGcgnksqRWqUc+x5g==	f	2021-03-11 16:58:01.43	-1234
46	apisubscriber_1_8_43	F5Vrebygx8E5r9KrvpJ0g4/6Mi1Z1vCtOSmXZJhEcFo=	fdPnOHAUwRb4Wikg42eC8w==	f	2021-03-11 16:58:07.216	-1234
47	apisubscriber_1_8_44	pYPaJRnJwQhS2t5zQv57zq7+J+GSLvU3v2xsr8fnHv4=	pcWHSZb7GGc9j0DHnaBJvQ==	f	2021-03-11 16:58:14.526	-1234
48	apisubscriber_1_8_45	ZP0HujfetLWjpjQDpZBFkste+gSGpThBIh1+h8WgmOc=	fZIq05bOu8IUcEp7JeK1xg==	f	2021-03-11 16:58:19.712	-1234
49	apisubscriber_1_9_46	OIfQN3efpDHHSpTRWZd1KFNLOvrQTP3QPA0nKCoIqO0=	v6srOOdVBv63xE75ujvEug==	f	2021-03-11 16:58:33.436	-1234
50	apisubscriber_1_9_47	RO4B8umQA+W6BWklfbY7exNy8lQyUcUfHKu30mZUOWI=	ppFDY4iDoqn6AgYtBe0a9w==	f	2021-03-11 16:58:39.504	-1234
51	apisubscriber_1_9_48	Jsl8xgyxIdQhJsp4IoG7pRRa6JyE/Z2/O3Q7aKz9AEg=	dYUh4t5z2GH0Mr2M3f7gqA==	f	2021-03-11 16:58:44.483	-1234
52	apisubscriber_1_9_49	7u4Uo72+BKNwP7sqlt4ZRewFwx7T2z4JNjzdy6ofYrU=	KdzcWJxCydT9ffMwUnO/qg==	f	2021-03-11 16:58:50.337	-1234
53	apisubscriber_1_9_50	y07cfqC3+8kXsO+Oh//Ao+Ar+wuYR18xYFJVcpPMePk=	gOFtCf4vqZJSxTsB1qECBw==	f	2021-03-11 16:58:55.042	-1234
54	apisubscriber_1_10_51	vQDVybskmv5F6oCgMQOFrXq327GesnAuXtCKdwpVIPc=	E0eXM4rewRBUf5EIM9CGXQ==	f	2021-03-11 16:59:08.846	-1234
55	apisubscriber_1_10_52	03eUz7T3PbMZ8wBE0eYPttfho71O8/GvT08kJ8NK8V0=	FCOCW8ICqMfBGp6kCtQSFw==	f	2021-03-11 16:59:14.324	-1234
56	apisubscriber_1_10_53	GNr4nHPKEIYT/74fs2lz/4lGc+UXVFafmQCuU/caHuI=	ehkIOhVDHGUdKaktqr536A==	f	2021-03-11 16:59:19.526	-1234
57	apisubscriber_1_10_54	zJnb1JRYMoIkD1qEYKIQZhen5HLxRm5xQVZhDmiBO2w=	z4iFlrfJNgf1a14BIDafqA==	f	2021-03-11 16:59:25.193	-1234
58	apisubscriber_1_10_55	aBCAbBSH1gAc7Kpbq5m3Qmo6RixIkWftnZ4ueXLGW+A=	C4sMc71/1t4TnZ+tl8YNLQ==	f	2021-03-11 16:59:30.836	-1234
59	apisubscriber_1_11_56	qnWtukldSEL/nAgc3h10XcHFb7zDEEOxfe/v/iXMqyQ=	U+0AV2dJD60SYYNubofCTg==	f	2021-03-11 16:59:45.387	-1234
60	apisubscriber_1_11_57	1f2rs/vEDAW+ja+vt+/4spMd2BHFEBAK1mMx4KI+Wfg=	45vWLZmPzAVcW1QS4vwaJQ==	f	2021-03-11 16:59:50.716	-1234
61	apisubscriber_1_11_58	KPoz1gK3rB2HRaMRlUmQ2V5I278KHkXA0AHkeC1ixI4=	COZsf9YlVXFQn7NjQZOTKg==	f	2021-03-11 16:59:55.846	-1234
62	apisubscriber_1_11_59	myEC4KaFGYzwbFMRfeDDzSg0zFviNItsjb86eTLe84s=	VIMN7Mnru8B2m/0SuSgOmQ==	f	2021-03-11 17:00:01.57	-1234
63	apisubscriber_1_11_60	wBOg22dOjVL19tYw8ixau6ml2Lsmz1UmvjyPCh79rbk=	S8JyJh1WiPs4+mZSYq25OA==	f	2021-03-11 17:00:07.946	-1234
64	apisubscriber_1_12_61	NxZ6haXOLnP0ImewMUdKk/fRdTk59VOZ9GSA7udUtNE=	c6woH/bFPabR3IXx9l4HIQ==	f	2021-03-11 17:00:22.94	-1234
65	apisubscriber_1_12_62	J5EoJ3k0UaMz/e02SZwp3MeLr2BYeJmV4i/F08ft73s=	nNFVJ6rLmFnrHPG7ePziwQ==	f	2021-03-11 17:00:30.098	-1234
66	apisubscriber_1_12_63	nOhcQsGDbozAQWgUbSw4YBWc1FsDnLF3kOMa1a72W3k=	+65irOuWoglWufRHDUtRfA==	f	2021-03-11 17:00:36.097	-1234
67	apisubscriber_1_12_64	3zpav3XlamJMiX5N3FiR0v2/MLmcST5dYPWX9qS1R74=	73w/4Ya19Tmk0moIHrTBiQ==	f	2021-03-11 17:00:42.113	-1234
68	apisubscriber_1_12_65	NSTH4LP8iPNemmBKm4RCVYRttX6fbBUx3hoTezGXk8g=	WPXJDbOzGksUVrlMd6GscQ==	f	2021-03-11 17:00:48.776	-1234
69	apisubscriber_1_13_66	CeixhXU2pCfSRSF/gNkdGuA9EpKiWEJC36qoF5xjSc4=	rEZw8COaXrqtKvSbIIoiqA==	f	2021-03-11 17:01:02.869	-1234
70	apisubscriber_1_13_67	lA+QXIrezZvzRzKCPOCwBb5Xbujtk3jQB3VEo17qXWA=	F6PlaUp7o4Zhjt3Og/UruA==	f	2021-03-11 17:01:08.947	-1234
71	apisubscriber_1_13_68	FSk0lEhznUvXugJeV1bKmxGpy80KOE+8Q+h1OhG1dFg=	NBhf/u9kl8LlnAaOD3WO4g==	f	2021-03-11 17:01:14.088	-1234
72	apisubscriber_1_13_69	ztuGs6gAM7hUOj9kpuOwFixUR6VV0ejzXarv7rhZBJs=	cBgFtJ1tudxMFU+qAFGdQw==	f	2021-03-11 17:01:20.934	-1234
73	apisubscriber_1_13_70	MXnxZi1FUV8MuKvRq33sa63pM85xByjdju0aer4jMFY=	bkJ0c5E2ieOKBt1DbffEmw==	f	2021-03-11 17:01:27.142	-1234
74	apisubscriber_1_14_71	7W1k+D87/Jb6iLBvHSccNoqwsLDN6sGxrWYZd7GijMA=	uE8HgAc2baR35woPVBpSmw==	f	2021-03-11 17:01:46.741	-1234
75	apisubscriber_1_14_72	hYIVuz1PytduU4xfwUtkw+f3hiii2REQahDTmO1dcIM=	pBVQhbt9C37+TUtqrOKsCA==	f	2021-03-11 17:01:54.322	-1234
76	apisubscriber_1_14_73	NJgxBIrXtKFeEsrQoTWFMHFuh1iCsQew3UlMG2DID+Y=	B3IyyIJm3zgyaXmlVMS7Gg==	f	2021-03-11 17:02:00.922	-1234
77	apisubscriber_1_14_74	x90TQhP0h13/8ZWXKKeUzzJauAoECnNGWPdLUB98INA=	gytjVQDzmREt0D1GoJBrxw==	f	2021-03-11 17:02:09.687	-1234
78	apisubscriber_1_14_75	GE+ALnux1Xuz8d1RQyw0dDAArqAo42yiuwgfvDvUb0U=	kKZXPFc923mvAGBkpWgL4g==	f	2021-03-11 17:02:17.107	-1234
79	apisubscriber_1_15_76	Xuhxnm3MKjwxN57KD6sMNR1sj4/uPl/WZIV5BcXBpe8=	pTI0iEyTE0CBiuzZOO1e+Q==	f	2021-03-11 17:02:38.725	-1234
80	apisubscriber_1_15_77	vCSR/TOWZA4aEyj4L6nnmk5PDGcni9o7rJy0QsRlE0I=	FJlrreKHVL5GXKrmNSU9aA==	f	2021-03-11 17:02:45.042	-1234
81	apisubscriber_1_15_78	dJczbi11/kheQpcib/Cm4N7kYMO0WLJRmRjZGDveG/I=	817z0aT6ztWbAKprtx8iyQ==	f	2021-03-11 17:02:50.817	-1234
82	apisubscriber_1_15_79	Mk2axFooENjCin8lEhJwPX4yDbGk6R8Xa2AFdJ4m+pg=	RHd4h6KFp37IyWBjGW1Oqg==	f	2021-03-11 17:03:00.674	-1234
83	apisubscriber_1_15_80	uxz/J/q3ETT8Pl/B4+7LPp7rvElTJ7BmEdRaeSyiGLQ=	SjSm8Wz08cYB/MVn0Skm0g==	f	2021-03-11 17:03:08.967	-1234
84	apisubscriber_1_16_81	Nm2pqXCXTxJq1IxNnWfXeR3gJjfDSTdJ07kKngi11MI=	S07AX8Wc0j5j1cF9NeYlPw==	f	2021-03-11 17:03:28.143	-1234
85	apisubscriber_1_16_82	adCxgzsS2+Glc9bbpKGX7n9TDoqOnkmaNp7ieGD4QAw=	qUbXIT/7R0keKsLfW8HiVA==	f	2021-03-11 17:03:36.435	-1234
86	apisubscriber_1_16_83	qqRecp2fuzbv0t0PFzBrtXiu+2sEPO0UPiJP9LWjcW8=	WDTcv/wtxXJrpqQzWZPHdQ==	f	2021-03-11 17:03:44.068	-1234
87	apisubscriber_1_16_84	uy19gAQDCVvy/D3yAXMtBWkOGQt/Lt1pexGGL5TLHDA=	qtCgl5CqeXEwsB9jOWUZCQ==	f	2021-03-11 17:03:52.891	-1234
88	apisubscriber_1_16_85	31ewdnNj7b7L7mmi6v/rYELgXwtch6L4I/r2UdBWcmg=	lOAHEJ2F3kMqK+QmIOUopw==	f	2021-03-11 17:04:00.142	-1234
89	apisubscriber_1_17_86	MDFNHKyFJH4G9ES8+hobM55OHJ2fJ/vYyvcmvBmqDqk=	Fd9M1UgtGbheH5RE7fSnUg==	f	2021-03-11 17:04:27.212	-1234
90	apisubscriber_1_17_87	oRoMty0uJmkatARPfT0HOlTMGq8yDCXG1z5GUxlZg34=	RLPmDmblK9rzoQm/msoA1w==	f	2021-03-11 17:04:36.241	-1234
91	apisubscriber_1_17_88	PPDk09EYxqnZswlr4Tb9cyvU6gzPUXtObg1bf12pv6U=	y1OECHuMgy25hfLtYjyBSw==	f	2021-03-11 17:04:42.62	-1234
92	apisubscriber_1_17_89	vY5B1RtXWR1feCLnBZUHIG4W3aU2afZe7LXuuhoiDZE=	+L9rvdET/b4RY/H+68Z9Gw==	f	2021-03-11 17:04:50.825	-1234
93	apisubscriber_1_17_90	P9tfDOx0lTsWiCSCZPHfObBbV7NcKU5iBkRUj0IKSdM=	WafykGIhbKo8PRw0xFt5zg==	f	2021-03-11 17:04:58.873	-1234
94	apisubscriber_1_18_91	JtSgOFeJMuoE5EMNMGDjCCcnzajjubssAb4bzOi5UTg=	1F6GAVFfPYCMemoo1b+rBw==	f	2021-03-11 17:05:27.525	-1234
95	apisubscriber_1_18_92	JrGV3dp02Th22tFM3njdBXfdwZNSJVns5Iej+H6P+G0=	uh+U4e59K1Luu9vSVtdurw==	f	2021-03-11 17:05:34.563	-1234
96	apisubscriber_1_18_93	xS51Yvu8QVLgRYJ5/wH0uEn5S6PnyBGhx/IaRYjniJk=	X/d7AbrwFZ3asDcc40lxzg==	f	2021-03-11 17:05:41.875	-1234
97	apisubscriber_1_18_94	XzOkuechrFJ16oDqZLEMaOeJcpiT1espGmF/bMcoukg=	FLTyS01ouCjXSRjmdQEjTg==	f	2021-03-11 17:05:49.099	-1234
98	apisubscriber_1_18_95	+RcuWqyTRiTnpLWofjVS1fv/IxfhicNEeMRZmNIFXtI=	DbG/uccl1xnGyN8GKmCqAw==	f	2021-03-11 17:05:56.409	-1234
99	apisubscriber_1_19_96	lOd+0ZM2qHYdIdZJLaPY6p3uuNo6OFmTBEq+H4YYXrs=	qTYiwH8ZspZPKnDL6JCwDg==	f	2021-03-11 17:06:12.443	-1234
100	apisubscriber_1_19_97	FatGgQ1pCXZwou/iCmiz2puNHA1rVArr2D8EyTdr7LY=	rwdfm7R5GY9LIZ/ScPso1w==	f	2021-03-11 17:06:19.154	-1234
101	apisubscriber_1_19_98	/BCLQ32k95oQb+wvz5Bv0IuT1wJiI2uVT6A0E/mF19g=	pshMtz/3mzQx1rv3OMmc7g==	f	2021-03-11 17:06:26.38	-1234
102	apisubscriber_1_19_99	6m5MpIxAttYN6jb5kMURuskRi7cEG5I8NT9ifKpEvGw=	NMO6SEaRVi9iyb8bs3dPpg==	f	2021-03-11 17:06:34.219	-1234
103	apisubscriber_1_19_100	Gb6Jt0f6adSi9SuE7H7byqQ9/3JVyLjF5r4YwrnhGEI=	qWZUi9IAvG3brhMq0jY7EA==	f	2021-03-11 17:06:41.607	-1234
104	apicreator2	Hw6mc5knxH920btWYSNKw9YFEFyxx6Gzi5RDX2ugoX4=	gYE53JphAjDOv9Wzr5cu9g==	f	2021-03-11 17:06:47.848	-1234
105	apipublisher2	uPYM+OgPFjq2XFujbEaeR4a1z4DOf/y2Ats98dw+5r0=	sck1+JdRuv1gic+kQQxSLA==	f	2021-03-11 17:06:48.582	-1234
106	apisubscriber_2_20_101	2T/NmJpDimh1vApHqJYYZpSAxfTFtdhu/WETHaHf7d8=	BL9uA+hYtlQfUg+TYqhrXA==	f	2021-03-11 17:07:00.862	-1234
107	apisubscriber_2_20_102	1WBjxhGG7z0Tu7vWI7kCdF42XDr3eDu4txHlDrpYKz8=	58DizMPvatgpgxSkb8GlXg==	f	2021-03-11 17:07:06.842	-1234
108	apisubscriber_2_20_103	JqB+W8rz2T9S8HvG32nqEdVPCQ99A7ok9n6VR7Gvm4E=	W3Q0WTMD4Kn7UX+F/feWdQ==	f	2021-03-11 17:07:12.182	-1234
109	apisubscriber_2_20_104	cxUpFWmJbgu/4tRsmF1PuBWARiERv+8ZOokILCVNr8E=	nDzhMQktKE8kknTbCDoq6g==	f	2021-03-11 17:07:19.284	-1234
110	apisubscriber_2_20_105	qDHEAjeLSSJDbxrbL7YVt+ce9OuZfG6rLGHUYehXrdg=	rYbhgDeryUr5TvoA0Su2ZA==	f	2021-03-11 17:07:30.237	-1234
111	apisubscriber_2_21_106	3/12yVVXkvhUoZyuMeJmzSJYPLBGIWbRXKxi2KRAjuY=	hWqkTBHqj/uhQOSBAQJtUA==	f	2021-03-11 17:07:45.555	-1234
112	apisubscriber_2_21_107	A/g9E9PQJr9pDRKSTBlFXRVMfHgUwDxbLPS7EX8PGac=	mWxITYR33UIMSFcNjTjY3Q==	f	2021-03-11 17:07:52.705	-1234
113	apisubscriber_2_21_108	HxAQiYGOqXSm/R89Otf5ypcaPut9xM4NCLG41O69S5w=	KXA6uTPL4YaXbnRHInIIpA==	f	2021-03-11 17:07:58.966	-1234
114	apisubscriber_2_21_109	wD3LpTWjYv7Vts8BghlHSy8st9SzZGaKgfbZirCFrEQ=	k5SPPDV05378BlrYN9vYzg==	f	2021-03-11 17:08:05.364	-1234
115	apisubscriber_2_21_110	Qs4cvG8yo8ZhoJT0X3HHm+Uh0IdxMRtqgWGs+5WDUE0=	wq2MVoLSXBqhKu/Ju1fB/g==	f	2021-03-11 17:08:12.17	-1234
116	apisubscriber_2_22_111	9487OktEF7++tO3BIZ1dRjmiNJhJkWdJsiN+xFpMR8g=	dBwKt8vd5MXXS7//OfGwJQ==	f	2021-03-11 17:08:27.191	-1234
117	apisubscriber_2_22_112	EOO0XZKF+x6ewv5MN0pSgjzpt1CwkrFhe3KPeoE939U=	VzRGYwdDf9JUVj7rVYL+wA==	f	2021-03-11 17:08:33.599	-1234
118	apisubscriber_2_22_113	o4aRRO7PCVoZXVwGKz7TyVZMIUD9nhw0xIZ5bfeVwSs=	UOjgrxl+KqoVQYnePRIcGQ==	f	2021-03-11 17:08:40.819	-1234
119	apisubscriber_2_22_114	WvFEF3eUGOe1JODl1zZCfXUzLIlRhi+pjaTdCCx5334=	9tvr/HfhJZJegmiGO5Lg1Q==	f	2021-03-11 17:08:47.391	-1234
120	apisubscriber_2_22_115	KVS1RnpnGTLJz6AdfwAXH4kTijGFAfHiXyrEg7VGpzQ=	OvEbgjABf89wAXW/klwn9A==	f	2021-03-11 17:08:54.384	-1234
121	apisubscriber_2_23_116	IcEO20UeXi8IgtzRcPq6MVEgNmanZZ83vud8R2K9vKc=	aca9VkQUVCYB9Sy4n4j11A==	f	2021-03-11 17:09:07.436	-1234
122	apisubscriber_2_23_117	k1cfQtJkYFl7GLMr131cX5mFmQWGQbXgsPGZd5GoAw0=	/8Hbvc7NT5KXwZHE8NSbWg==	f	2021-03-11 17:09:13.5	-1234
123	apisubscriber_2_23_118	4tnddKlwkzhiVP6/NWmGaYDVxeJ0MnQr/Mca+I+xeSM=	XeuWuHZ5SNQcvcna9NzAbw==	f	2021-03-11 17:09:19.46	-1234
124	apisubscriber_2_23_119	hitHYSdIYduKzsTCuPxEjTVQ4OXsFP18W4roadQ/s/4=	7U0GbHDKffu9zHj8OEYoCA==	f	2021-03-11 17:09:30.119	-1234
125	apisubscriber_2_23_120	QhSYMmeHK3lemJvyaFqD3kCZU9fxweJXeL6116tXVN8=	EvERWBfkADO0KyG2e+DeuA==	f	2021-03-11 17:09:36.022	-1234
126	apisubscriber_2_24_121	QTCRfs1cVrtjakJQZe4kzi9YRZbeUH0Kl0K8PBzZflQ=	GMAAQhpI890yzOoippRAgA==	f	2021-03-11 17:09:49.414	-1234
127	apisubscriber_2_24_122	SU317ywkKkGCtVj6K17i8Ej8s5YSwZnKCU3S5NP8rEo=	qdze3WTRfKvzwgkVSPbIbw==	f	2021-03-11 17:09:55.463	-1234
128	apisubscriber_2_24_123	8ih16q9gL3Q3wnYKhQsEPfwHpU00bVrtscBuSaD8qEM=	8bajrOnho0eAi64c+gwZRA==	f	2021-03-11 17:10:01.041	-1234
129	apisubscriber_2_24_124	Nm7M76ugtJ7TyM8qQ2zt/3p0mcfw3bXvbL2BdS4Y2Z8=	AkMTfV/kCWZEw6sJtctbPA==	f	2021-03-11 17:10:07.027	-1234
130	apisubscriber_2_24_125	Cj7sK07zc/9geZlGq4Juf9np3mgvjxfdOtzkq6zku3E=	ud0vCQK2hfCd/AaLYuTdnQ==	f	2021-03-11 17:10:13.101	-1234
131	apisubscriber_2_25_126	+VxB5azYtdfQS69YQGV3Zu8XJTQLdBdZdUvccFwuCew=	m38eO0zpufgI8qcODqH+Fw==	f	2021-03-11 17:10:26.643	-1234
132	apisubscriber_2_25_127	EOxqJx2UxIF+qWmO3eZa0OsmgLicdXJm4WIMI3lIA+c=	ef0nUTu/+cB3ZSkDc71IMA==	f	2021-03-11 17:10:31.965	-1234
133	apisubscriber_2_25_128	RHqJ4/vPNGkbczCrVc5yKnXgzvwFcB5ujfY78ttmldY=	LC87PVIYYhWpFTtuao9Beg==	f	2021-03-11 17:10:38.359	-1234
134	apisubscriber_2_25_129	HZ2YVWGrkreKSVbl515+h/qqg2wHyRRGDqSl25eCi20=	w4gzh69hfxxCLZilw2b4yw==	f	2021-03-11 17:10:43.953	-1234
135	apisubscriber_2_25_130	8uqLzHbG4HI1KwiykeCGPoPhX54AWUPXky9aZHZ+GUU=	cmjeKALm0Y/cd9b6QdgpXA==	f	2021-03-11 17:10:49.972	-1234
136	apisubscriber_2_26_131	5ucbKq2wh11o/8MQhakiNTnHW4KJPWRQBT2q71NX1is=	Dgg37GoSNudbeuYF4agdaQ==	f	2021-03-11 17:11:03.213	-1234
137	apisubscriber_2_26_132	XPWAMxYgyaJ6TisQtU6XuuCGBKpOnsolLQuUyp9EI1U=	vO3m5/VdOIEXgzTNQb3I7g==	f	2021-03-11 17:11:10.304	-1234
138	apisubscriber_2_26_133	EOceAx32L0N9qma5gXdlBrWnhob7/uY+qFDhjm1TYNg=	V7ciAtFNYaJUWvTBolMuhw==	f	2021-03-11 17:11:16.269	-1234
139	apisubscriber_2_26_134	YqWUAkNWKFCL5lp1C1NOrpsoE9ZDSYxXDrq5hAQZHLU=	hbWs1HvaZNF9PG21EKrWEg==	f	2021-03-11 17:11:25.325	-1234
140	apisubscriber_2_26_135	JXDAfGYkqusu7NCfI2Zc45nB8IKS0lE15nFcMqKL4lE=	fc+rvt83+Ezb8wrAJPxa6Q==	f	2021-03-11 17:11:31.247	-1234
141	apisubscriber_2_27_136	tzwmlAXwx3hmrnJgHtEzAxwi4iTfcnWDcuKdPSMwHzk=	MiJ8jTgNzb35EX3qvQjQJg==	f	2021-03-11 17:11:47.534	-1234
142	apisubscriber_2_27_137	qoA01Yr+p2JBhBYoouCCIEJcyqJrS/N5NlS9VHyId8I=	TI2YUcY+00uLfHVvb+UHjg==	f	2021-03-11 17:11:54.663	-1234
143	apisubscriber_2_27_138	4X1DAjRMuDwo6VacqMAgJd3mA0xNTVvvdpugO7ibHjI=	b4fsz/cTawPDw0p7uH8Utw==	f	2021-03-11 17:12:01.777	-1234
144	apisubscriber_2_27_139	f2IMjVsBfVqS2V56eb6GEOKsL0ufTy2UIXZoKLhM6n8=	ZCOyxYsoAmiusUUIp3atwA==	f	2021-03-11 17:12:07.747	-1234
145	apisubscriber_2_27_140	M2G7FJKaxdU2kgaf0tNu5Biks/z0tD1YYa0RcjwZlfU=	EtZ5A12VpN7FBlIUz2ibdQ==	f	2021-03-11 17:12:13.15	-1234
146	apisubscriber_2_28_141	cRM3LNkn4Pl+ovk+ll28qcr9KFf/NjqW2/UeRHAoL8s=	IrfhO/dgBSznzbp3FGSubg==	f	2021-03-11 17:12:28.531	-1234
147	apisubscriber_2_28_142	RB7DQH3RlUuvFzXfiWZXpSe3W1DpkncrMRLXDQ+XFdA=	0saXXzL9bXR+qOpZJWIf9A==	f	2021-03-11 17:12:35.286	-1234
148	apisubscriber_2_28_143	nilVPw6INUc3xzBw3BtFL2VsQ+8AeDMVpbP3tgLLu18=	uHPto3OsxPEfrdY4K/CqiQ==	f	2021-03-11 17:12:40.697	-1234
149	apisubscriber_2_28_144	qlBXJWC4bojfJgYeV7hQdPQRoqShhSrYufkC5rI+WVI=	yWntlKS02hvNgf4+xXXS5g==	f	2021-03-11 17:12:47.133	-1234
150	apisubscriber_2_28_145	hRsspwAzJURQaxNofV6dUCfAn9a7tW+reAAl2bT6O70=	b1tEwTbv8aiAvtN+Wm++Iw==	f	2021-03-11 17:12:54.293	-1234
151	apisubscriber_2_29_146	/pgMeE/c3X5NYZZiUyeYwIUkDEHQ8UPLK4gDr0aWNSM=	vmeItEIRPob6kRqLCZDbOQ==	f	2021-03-11 17:13:13.762	-1234
152	apisubscriber_2_29_147	xCTWZWChUv3Si8wHUv/1OOYLYiaclAdKckKsTyfpYWA=	mwObUq9OztuZ4omSWCW9Lw==	f	2021-03-11 17:13:21.739	-1234
153	apisubscriber_2_29_148	iazNvqEuel3ZF6sveDA/PMSbuh89GuecKMh7DNRSPig=	wmdQMAONmbZvwk3mPCIXkg==	f	2021-03-11 17:13:28.357	-1234
154	apisubscriber_2_29_149	aQCilyTPWy7g8IXp37+g41JUNGhcTLeapZROiUHN2QA=	Igm1pYzZA2UGjW4IvOO3gQ==	f	2021-03-11 17:13:34.176	-1234
155	apisubscriber_2_29_150	x29m9Qqy4VlGR3HlT72XkmiDirTSsPcs0xiwCQ3h5iA=	+mP2WvJ3FAE8rCpN/Xk/Gg==	f	2021-03-11 17:13:39.506	-1234
156	apisubscriber_2_30_151	3vPR9zapdv8EPEsRJZB/mj2avpAMTiY90LA87t5Hcy0=	QpZwBJq78PWJ2BrxsSiT4A==	f	2021-03-11 17:13:49.116	-1234
157	apisubscriber_2_30_152	HJJ1W+s0M3qObC/oGPcjxMRSB3snGAt1AM569iPLfs8=	SsVpe8KIDPWfpmTKTOM2qw==	f	2021-03-11 17:13:54.345	-1234
158	apisubscriber_2_30_153	Ue4odz/SOWmbCd+xlz2Xuu2L+CVA+B1rhnpnEa1xwqs=	vj5cpb2RgqIXrYZRbArWkg==	f	2021-03-11 17:13:58.715	-1234
159	apisubscriber_2_30_154	zGPIAjalIO3P9z41fNVOVw0xy3ELnqkPXWy8OMkMhIk=	vS5Pr7hDL7mrPNrXqddXdw==	f	2021-03-11 17:14:04.458	-1234
160	apisubscriber_2_30_155	sRgkG0KAhqPIsrMXG4FPtNzMyMoXlEHIVj3x25hFPdE=	tDAakBkGtVaoCrEDhEyRCQ==	f	2021-03-11 17:14:09.492	-1234
161	apisubscriber_2_31_156	dJojluzHzNsu9AeiTFFFx7RUSqMlW9AVaSso8yXDpFw=	tMEdSrz1+ajK5wTq50ldeA==	f	2021-03-11 17:14:19.388	-1234
162	apisubscriber_2_31_157	RnVhm+UVEZFK9QyXhcHB45gKXh7Ttti1k5pex7ZyTPU=	xD9FyPF8lhHQ51L9CtxlQQ==	f	2021-03-11 17:14:24.639	-1234
163	apisubscriber_2_31_158	d9TEuSilFKTIYtTZ9rpkHYp5L9+3A2IIpVKOOJAIvZ8=	wt5kF+KyJjyHfe56RtkRiw==	f	2021-03-11 17:14:29.074	-1234
164	apisubscriber_2_31_159	pIY8vEGYN8puRAUHOrMvSCYlNDFN+VYWhiqo4q+fvK0=	vc8IbytpLIPJCsVj8CXbxw==	f	2021-03-11 17:14:33.942	-1234
165	apisubscriber_2_31_160	MMpINl3xhnKhuWiO7SYOtWWM/UWgGKPUXwKC+Ps9SFU=	eAbn/8kw8A5jnRdIGsScbg==	f	2021-03-11 17:14:37.999	-1234
166	apisubscriber_2_32_161	hIPEKkI//SXoxDTf8ChwHGZH6op2e34fPqUybb/GtWQ=	+eLwOUFVKr3O/O6fXG9aUw==	f	2021-03-11 17:14:48.91	-1234
167	apisubscriber_2_32_162	m4sOU+OGgJX7ac9hEyXE1K90UWEdnb3ynZmJZuNrNUk=	pgp1kUWuh2jcMQ2C8EZW9g==	f	2021-03-11 17:14:53.754	-1234
168	apisubscriber_2_32_163	ojwbrnzqGnNuqtnq9+PbO87n4gYOXz7upxEsguvJmus=	ITqHg6q6AjBFBGfDPreg6A==	f	2021-03-11 17:14:58.67	-1234
169	apisubscriber_2_32_164	tL/Ip3iplWfxgcPwqiSCYIZr4B4opXTfmtkNByrW+DM=	3CRxtK7m3mO8pA9NlWs7yg==	f	2021-03-11 17:15:05.126	-1234
170	apisubscriber_2_32_165	EI4YtBt1sNxVHSL8mLIWz+TK3Ob1FjwiTDANk3oQVhg=	PY6Nng2UtV/NoEEVmuXsMA==	f	2021-03-11 17:15:10.647	-1234
173	apisubscriber_2_33_168	T6L8EZz6L6wBc8Dvg13D364/n9L3Olvy3oDxdRDhD0s=	vEm+KLBShhH9a8wtZLzf/w==	f	2021-03-11 17:15:35.078	-1234
174	apisubscriber_2_33_169	aMMez07I/1E3CwuJl2DhZ7p+IlVf6mvx6cijOG1K8zQ=	rcm9L7QddNSpjCalADPwUQ==	f	2021-03-11 17:15:40.687	-1234
175	apisubscriber_2_33_170	ORnzHcikxmanalRbjk0sPhvdVPJMhFMG1g5nMK21Slg=	mbSGgcvuud97LXeQOLCR2A==	f	2021-03-11 17:15:45.473	-1234
176	apisubscriber_2_34_171	ow3ohqY7iICrcXE0kra2w1tdsmtXj/G6zJPvkBrqKf0=	ISHS5Ts5juT5yL9iiV+HqA==	f	2021-03-11 17:15:54.275	-1234
177	apisubscriber_2_34_172	7LBdddhVgU45BauaqEVs1hQS4ddPh1PgxTF+hNxYES8=	f8GzDNb40O0yq1bgTZkBKA==	f	2021-03-11 17:15:59.278	-1234
178	apisubscriber_2_34_173	F5BzwrD1BpoqJQscDxkKA9FVyrmAViYA/wNa8iKCSTM=	ERP0wZJZKKLsNGtFXWNccQ==	f	2021-03-11 17:16:04.108	-1234
179	apisubscriber_2_34_174	uOJyqn88FH3jSpGYtoVDSsr9nbjAYN3cFStuJrU5nGU=	1Xj3WY4B44UAj0StFw8M0w==	f	2021-03-11 17:16:09.596	-1234
180	apisubscriber_2_34_175	7+V/ujdUl5TmnX3iXIJbSPsqlIRzaMrd/Om5gOmhJ3w=	8BoSikVR6UTATR1FCYA/oA==	f	2021-03-11 17:16:14.323	-1234
171	apisubscriber_2_33_166	0qisJDbHoW1RP6YfzQoYwXvuMRqkKJfMOymj4Qxrz7o=	ustILKLWbyTsiq7kVErOsQ==	f	2021-03-11 17:15:24.781	-1234
172	apisubscriber_2_33_167	i11lvr6axlKwjsNsFmcioHmdf1PYMCEsJx0USQhZ0qo=	RGxtuUpewl65Q0sC8Zqhog==	f	2021-03-11 17:15:30.669	-1234
181	apisubscriber_2_35_176	aIIngcqNmi/v9tsVD27JiWW3/NdesFkbMWcxSfmi9EU=	xs6OMBTQQZY1Ze48jfteYg==	f	2021-03-11 17:16:23.333	-1234
182	apisubscriber_2_35_177	ptzh6WrsUjBAX9QLVZuM2/Zpz27LcwywUo9o58575Ac=	4UDeH33La6lKbRaBN6meSg==	f	2021-03-11 17:16:27.65	-1234
183	apisubscriber_2_35_178	wUJ9rpQDIgctxQk0sUZzkWWzxbIG2OsijYY8E2ARWME=	yIuZaGTPkGVUwvbB3VxmXg==	f	2021-03-11 17:16:32.62	-1234
184	apisubscriber_2_35_179	Sd70IWvnCYYOyJc/7nEcj4w+lHOGN6RN52IzOn4/pa0=	GvxFZg0GdH1FT71JQa9coA==	f	2021-03-11 17:16:37.045	-1234
185	apisubscriber_2_35_180	bbDbCM5qdSfOE/AQwpxZgaF6J8zANfP/LtkuJ/Vmpy0=	tlMItN3OEuRaaKmagwMp6A==	f	2021-03-11 17:16:41.246	-1234
186	apisubscriber_2_36_181	S3j5Bfy8KqtBKflTRe1irdresvacwdCL08F91emRbCQ=	48ZpRS10Zp+uVxkFUyFioA==	f	2021-03-11 17:16:51.802	-1234
187	apisubscriber_2_36_182	70Uviz4mZLaRW+e+550eR2Bc4GNHKskN9rPO6aYW2Po=	dpmFIzXJemg5Ddw5gIhnYg==	f	2021-03-11 17:16:57.371	-1234
188	apisubscriber_2_36_183	/dlXRd0XicdDRzgpuG0hG8LQI2Lsgqyqh+QHJkT3rcQ=	PZu4a50l8IwtApg7o5/EAw==	f	2021-03-11 17:17:01.673	-1234
189	apisubscriber_2_36_184	EJrg/g6t9aKNebaAsp/HDxd5t2SeO/RcqDhMUmcJy9Y=	MvB+S/Ym2UH6svF8RuUBWg==	f	2021-03-11 17:17:05.929	-1234
190	apisubscriber_2_36_185	cEd4Q+hARmKIEv3FSl8bCXbpFT/9FJJUKGZLQdQRGY8=	3Bha/BeyTEgJts37s1qESw==	f	2021-03-11 17:17:10.33	-1234
191	apisubscriber_2_37_186	9+PuGB0lY9xI/yawE5vTonT46+gM/BDBsiB+VyJAt7I=	NsIWk3W+zircArSclEVeEw==	f	2021-03-11 17:17:18.767	-1234
192	apisubscriber_2_37_187	nATi5xtHW9dBwuhRdnMsWRQSwYojZ1/MBbp8ZGKoHoA=	vLKc8JoPRKtoOXhb/HPW9Q==	f	2021-03-11 17:17:23.706	-1234
193	apisubscriber_2_37_188	s6kQxhp5/E6yStpzMHmakrzCD2hAPA2HkjIAMlMFx2Q=	nC2MPzHC7//zhX9WwJTlIA==	f	2021-03-11 17:17:28.211	-1234
194	apisubscriber_2_37_189	BE+wX67A8y06fB2BNd7uVeB8YOZoNCJ5l30xxo89eQc=	eCV7bznxRoozVqJQgBMqfA==	f	2021-03-11 17:17:32.503	-1234
195	apisubscriber_2_37_190	ihBIHHWxe42BngdvrFWTJl66qXhf/A2A2K6BMcFkZTk=	ojk1DYO7AK1o5pJMbYqbow==	f	2021-03-11 17:17:36.833	-1234
196	apisubscriber_2_38_191	ugFoNlviikxYFya22UgliO5vNpqTaxkt5nBEM+xPKdI=	qoVIK4FNW4+UbNGhmCr9BA==	f	2021-03-11 17:17:44.85	-1234
197	apisubscriber_2_38_192	aPEy8OYUuMkF89EUew2wnKySnKjFQzHgeCmAMCDkoSE=	O2xlSHXjKJg0OxM6yRyKGA==	f	2021-03-11 17:17:50.182	-1234
198	apisubscriber_2_38_193	HtxpTFDMZglWQn43bzjd63FTv9l+TPyS3AG+yollEf4=	BtlvjX6zcdCjW2F4Hnks6A==	f	2021-03-11 17:17:54.549	-1234
199	apisubscriber_2_38_194	/K1Lgs/TT+cP4+Ob5okTFgBKJ2tVl9qjB2J7LSZ1KgU=	E0J5sqcy1isJzw4Ng7Mc/A==	f	2021-03-11 17:17:58.592	-1234
200	apisubscriber_2_38_195	DV4Yamk7DiBsxeDNFwbpBqOfn40reQaGPb2uf20eTbk=	XUcJDqD3ytntboALM5t/bw==	f	2021-03-11 17:18:02.852	-1234
201	apisubscriber_2_39_196	7uDcXMtSfjBFF2PInWAJSvCFD22zW1nwu7SIkuJOXAk=	ants323/jGrC6iiOyToqPA==	f	2021-03-11 17:18:10.993	-1234
202	apisubscriber_2_39_197	nQuCja/XLYrx2TjPiqR29Qk+OVGlKuZgyEGUc0yBcXg=	OB6DIARPdsqKE+oec6/SBQ==	f	2021-03-11 17:18:15.978	-1234
203	apisubscriber_2_39_198	xLRoVN42doWjHtkoUXL27KQ24SP3uRikmjHfN1GRafU=	u7q4gHZvD1pvoBqLPDN8OA==	f	2021-03-11 17:18:20.512	-1234
204	apisubscriber_2_39_199	gHHlEtLK4Pc36L+lfRNc4rtJykPuY2GyqGeYJEciwn4=	TAv56LmBfQVVU8CC7qh8tg==	f	2021-03-11 17:18:24.725	-1234
205	apisubscriber_2_39_200	MqEs0YDUC9ou6kDyCa84zPg1/Gn1xa7Vj7sUr8q2LN4=	9nA0K0O1JGAb7ORajniAxw==	f	2021-03-11 17:18:28.777	-1234
206	prasanna	0cIFjPWXdUTDxfUVD7GxvJkagRjRVHQhF67pJdxwqHU=	fvy2xb+IxT8wDXBYpmCiug==	f	2021-03-11 17:34:50.41	1
207	john	MRIFoXczH/GucRehYxuHdmCUg+5nvSqjTiudTo4Vqbw=	ZbVeDO02AUar8oo3aIQQtg==	f	2021-03-11 17:35:43.877	1
208	smith	6BUu4660Z8IUP2zL0So+hYGQ6lcwiQ6OF9HkS1b+Tu8=	Ct7xsakOM2f5GiD4udRWog==	f	2021-03-11 17:35:57.283	1
209	eric	b1hK8GO7NQ7bmo1JaSnZjJtsUCPI2xWFyVjTVdczXHU=	6w/4H1gk/tF5hLzMAXKjhA==	f	2021-03-11 17:36:10.641	1
\.


--
-- Data for Name: um_user_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_user_attribute (um_id, um_attr_name, um_attr_value, um_profile_id, um_user_id, um_tenant_id) FROM stdin;
1	mail	prasannadangalla@gmail.com	default	206	1
2	profileConfiguration	default	default	206	1
3	sn	Dangalla	default	206	1
4	givenName	Prasanna	default	206	1
\.


--
-- Data for Name: um_user_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_user_permission (um_id, um_permission_id, um_user_name, um_is_allowed, um_tenant_id) FROM stdin;
\.


--
-- Data for Name: um_user_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.um_user_role (um_id, um_role_id, um_user_id, um_tenant_id) FROM stdin;
1	1	1	-1234
2	2	2	-1234
3	3	3	-1234
4	4	4	-1234
5	4	5	-1234
6	4	6	-1234
7	4	7	-1234
8	4	8	-1234
9	4	9	-1234
10	4	10	-1234
11	4	11	-1234
12	4	12	-1234
13	4	13	-1234
14	4	14	-1234
15	4	15	-1234
16	4	16	-1234
17	4	17	-1234
18	4	18	-1234
19	4	19	-1234
20	4	20	-1234
21	4	21	-1234
22	4	22	-1234
23	4	23	-1234
24	4	24	-1234
25	4	25	-1234
26	4	26	-1234
27	4	27	-1234
28	4	28	-1234
29	4	29	-1234
30	4	30	-1234
31	4	31	-1234
32	4	32	-1234
33	4	33	-1234
34	4	34	-1234
35	4	35	-1234
36	4	36	-1234
37	4	37	-1234
38	4	38	-1234
39	4	39	-1234
40	4	40	-1234
41	4	41	-1234
42	4	42	-1234
43	4	43	-1234
44	4	44	-1234
45	4	45	-1234
46	4	46	-1234
47	4	47	-1234
48	4	48	-1234
49	4	49	-1234
50	4	50	-1234
51	4	51	-1234
52	4	52	-1234
53	4	53	-1234
54	4	54	-1234
55	4	55	-1234
56	4	56	-1234
57	4	57	-1234
58	4	58	-1234
59	4	59	-1234
60	4	60	-1234
61	4	61	-1234
62	4	62	-1234
63	4	63	-1234
64	4	64	-1234
65	4	65	-1234
66	4	66	-1234
67	4	67	-1234
68	4	68	-1234
69	4	69	-1234
70	4	70	-1234
71	4	71	-1234
72	4	72	-1234
73	4	73	-1234
74	4	74	-1234
75	4	75	-1234
76	4	76	-1234
77	4	77	-1234
78	4	78	-1234
79	4	79	-1234
80	4	80	-1234
81	4	81	-1234
82	4	82	-1234
83	4	83	-1234
84	4	84	-1234
85	4	85	-1234
86	4	86	-1234
87	4	87	-1234
88	4	88	-1234
89	4	89	-1234
90	4	90	-1234
91	4	91	-1234
92	4	92	-1234
93	4	93	-1234
94	4	94	-1234
95	4	95	-1234
96	4	96	-1234
97	4	97	-1234
98	4	98	-1234
99	4	99	-1234
100	4	100	-1234
101	4	101	-1234
102	4	102	-1234
103	4	103	-1234
104	2	104	-1234
105	3	105	-1234
106	4	106	-1234
107	4	107	-1234
108	4	108	-1234
109	4	109	-1234
110	4	110	-1234
111	4	111	-1234
112	4	112	-1234
113	4	113	-1234
114	4	114	-1234
115	4	115	-1234
116	4	116	-1234
117	4	117	-1234
118	4	118	-1234
119	4	119	-1234
120	4	120	-1234
121	4	121	-1234
122	4	122	-1234
123	4	123	-1234
124	4	124	-1234
125	4	125	-1234
126	4	126	-1234
127	4	127	-1234
128	4	128	-1234
129	4	129	-1234
130	4	130	-1234
131	4	131	-1234
132	4	132	-1234
133	4	133	-1234
134	4	134	-1234
135	4	135	-1234
136	4	136	-1234
137	4	137	-1234
138	4	138	-1234
139	4	139	-1234
140	4	140	-1234
141	4	141	-1234
142	4	142	-1234
143	4	143	-1234
144	4	144	-1234
145	4	145	-1234
146	4	146	-1234
147	4	147	-1234
148	4	148	-1234
149	4	149	-1234
150	4	150	-1234
151	4	151	-1234
152	4	152	-1234
153	4	153	-1234
154	4	154	-1234
155	4	155	-1234
156	4	156	-1234
157	4	157	-1234
158	4	158	-1234
159	4	159	-1234
160	4	160	-1234
161	4	161	-1234
162	4	162	-1234
163	4	163	-1234
164	4	164	-1234
165	4	165	-1234
166	4	166	-1234
167	4	167	-1234
168	4	168	-1234
169	4	169	-1234
170	4	170	-1234
171	4	171	-1234
172	4	172	-1234
173	4	173	-1234
174	4	174	-1234
175	4	175	-1234
176	4	176	-1234
177	4	177	-1234
178	4	178	-1234
179	4	179	-1234
180	4	180	-1234
181	4	181	-1234
182	4	182	-1234
183	4	183	-1234
184	4	184	-1234
185	4	185	-1234
186	4	186	-1234
187	4	187	-1234
188	4	188	-1234
189	4	189	-1234
190	4	190	-1234
191	4	191	-1234
192	4	192	-1234
193	4	193	-1234
194	4	194	-1234
195	4	195	-1234
196	4	196	-1234
197	4	197	-1234
198	4	198	-1234
199	4	199	-1234
200	4	200	-1234
201	4	201	-1234
202	4	202	-1234
203	4	203	-1234
204	4	204	-1234
205	4	205	-1234
206	5	206	1
\.


--
-- Name: reg_association_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_association_pk_seq', 1, false);


--
-- Name: reg_comment_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_comment_pk_seq', 1, false);


--
-- Name: reg_content_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_content_pk_seq', 1, false);


--
-- Name: reg_log_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_log_pk_seq', 1, false);


--
-- Name: reg_path_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_path_pk_seq', 1, false);


--
-- Name: reg_property_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_property_pk_seq', 1, false);


--
-- Name: reg_rating_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_rating_pk_seq', 1, false);


--
-- Name: reg_resource_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_resource_pk_seq', 1, false);


--
-- Name: reg_snapshot_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_snapshot_pk_seq', 1, false);


--
-- Name: reg_tag_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reg_tag_pk_seq', 1, false);


--
-- Name: um_account_mapping_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_account_mapping_seq', 1, false);


--
-- Name: um_claim_behavior_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_claim_behavior_pk_seq', 1, false);


--
-- Name: um_claim_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_claim_pk_seq', 1, false);


--
-- Name: um_dialect_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_dialect_pk_seq', 1, false);


--
-- Name: um_domain_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_domain_pk_seq', 10, true);


--
-- Name: um_hybrid_remember_me_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_hybrid_remember_me_pk_seq', 1, false);


--
-- Name: um_hybrid_role_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_hybrid_role_pk_seq', 415, true);


--
-- Name: um_hybrid_user_role_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_hybrid_user_role_pk_seq', 620, true);


--
-- Name: um_module_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_module_pk_seq', 1, false);


--
-- Name: um_permission_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_permission_pk_seq', 177, true);


--
-- Name: um_profile_config_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_profile_config_pk_seq', 1, false);


--
-- Name: um_role_permission_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_role_permission_pk_seq', 323, true);


--
-- Name: um_role_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_role_pk_seq', 5, true);


--
-- Name: um_system_role_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_system_role_pk_seq', 2, true);


--
-- Name: um_system_user_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_system_user_pk_seq', 2, true);


--
-- Name: um_system_user_role_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_system_user_role_pk_seq', 2, true);


--
-- Name: um_tenant_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_tenant_pk_seq', 1, true);


--
-- Name: um_user_attribute_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_user_attribute_pk_seq', 4, true);


--
-- Name: um_user_permission_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_user_permission_pk_seq', 1, false);


--
-- Name: um_user_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_user_pk_seq', 209, true);


--
-- Name: um_user_role_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.um_user_role_pk_seq', 206, true);


--
-- Name: reg_comment pk_reg_comment; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_comment
    ADD CONSTRAINT pk_reg_comment PRIMARY KEY (reg_id, reg_tenant_id);


--
-- Name: reg_content pk_reg_content; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_content
    ADD CONSTRAINT pk_reg_content PRIMARY KEY (reg_content_id, reg_tenant_id);


--
-- Name: reg_content_history pk_reg_content_history; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_content_history
    ADD CONSTRAINT pk_reg_content_history PRIMARY KEY (reg_content_id, reg_tenant_id);


--
-- Name: reg_path pk_reg_path; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_path
    ADD CONSTRAINT pk_reg_path PRIMARY KEY (reg_path_id, reg_tenant_id);


--
-- Name: reg_property pk_reg_property; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_property
    ADD CONSTRAINT pk_reg_property PRIMARY KEY (reg_id, reg_tenant_id);


--
-- Name: reg_rating pk_reg_rating; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_rating
    ADD CONSTRAINT pk_reg_rating PRIMARY KEY (reg_id, reg_tenant_id);


--
-- Name: reg_resource pk_reg_resource; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource
    ADD CONSTRAINT pk_reg_resource PRIMARY KEY (reg_version, reg_tenant_id);


--
-- Name: reg_resource_history pk_reg_resource_history; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_history
    ADD CONSTRAINT pk_reg_resource_history PRIMARY KEY (reg_version, reg_tenant_id);


--
-- Name: reg_snapshot pk_reg_snapshot; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_snapshot
    ADD CONSTRAINT pk_reg_snapshot PRIMARY KEY (reg_snapshot_id, reg_tenant_id);


--
-- Name: reg_tag pk_reg_tag; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_tag
    ADD CONSTRAINT pk_reg_tag PRIMARY KEY (reg_id, reg_tenant_id);


--
-- Name: reg_association reg_association_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_association
    ADD CONSTRAINT reg_association_pkey PRIMARY KEY (reg_association_id, reg_tenant_id);


--
-- Name: reg_cluster_lock reg_cluster_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_cluster_lock
    ADD CONSTRAINT reg_cluster_lock_pkey PRIMARY KEY (reg_lock_name);


--
-- Name: reg_log reg_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_log
    ADD CONSTRAINT reg_log_pkey PRIMARY KEY (reg_log_id, reg_tenant_id);


--
-- Name: um_account_mapping um_account_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_account_mapping
    ADD CONSTRAINT um_account_mapping_pkey PRIMARY KEY (um_id);


--
-- Name: um_account_mapping um_account_mapping_um_user_name_um_tenant_id_um_user_store__key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_account_mapping
    ADD CONSTRAINT um_account_mapping_um_user_name_um_tenant_id_um_user_store__key UNIQUE (um_user_name, um_tenant_id, um_user_store_domain, um_acc_link_id);


--
-- Name: um_claim_behavior um_claim_behavior_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_claim_behavior
    ADD CONSTRAINT um_claim_behavior_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_claim um_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_claim
    ADD CONSTRAINT um_claim_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_claim um_claim_um_dialect_id_um_claim_uri_um_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_claim
    ADD CONSTRAINT um_claim_um_dialect_id_um_claim_uri_um_tenant_id_key UNIQUE (um_dialect_id, um_claim_uri, um_tenant_id);


--
-- Name: um_dialect um_dialect_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_dialect
    ADD CONSTRAINT um_dialect_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_dialect um_dialect_um_dialect_uri_um_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_dialect
    ADD CONSTRAINT um_dialect_um_dialect_uri_um_tenant_id_key UNIQUE (um_dialect_uri, um_tenant_id);


--
-- Name: um_domain um_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_domain
    ADD CONSTRAINT um_domain_pkey PRIMARY KEY (um_domain_id, um_tenant_id);


--
-- Name: um_hybrid_remember_me um_hybrid_remember_me_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_hybrid_remember_me
    ADD CONSTRAINT um_hybrid_remember_me_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_hybrid_role um_hybrid_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_hybrid_role
    ADD CONSTRAINT um_hybrid_role_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_hybrid_user_role um_hybrid_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_hybrid_user_role
    ADD CONSTRAINT um_hybrid_user_role_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_hybrid_user_role um_hybrid_user_role_um_user_name_um_role_id_um_tenant_id_um_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_hybrid_user_role
    ADD CONSTRAINT um_hybrid_user_role_um_user_name_um_role_id_um_tenant_id_um_key UNIQUE (um_user_name, um_role_id, um_tenant_id, um_domain_id);


--
-- Name: um_module_actions um_module_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_module_actions
    ADD CONSTRAINT um_module_actions_pkey PRIMARY KEY (um_action, um_module_id);


--
-- Name: um_module um_module_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_module
    ADD CONSTRAINT um_module_pkey PRIMARY KEY (um_id);


--
-- Name: um_module um_module_um_module_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_module
    ADD CONSTRAINT um_module_um_module_name_key UNIQUE (um_module_name);


--
-- Name: um_permission um_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_permission
    ADD CONSTRAINT um_permission_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_permission um_permission_um_resource_id_um_action_um_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_permission
    ADD CONSTRAINT um_permission_um_resource_id_um_action_um_tenant_id_key UNIQUE (um_resource_id, um_action, um_tenant_id);


--
-- Name: um_profile_config um_profile_config_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_profile_config
    ADD CONSTRAINT um_profile_config_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_role_permission um_role_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_role_permission
    ADD CONSTRAINT um_role_permission_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_role um_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_role
    ADD CONSTRAINT um_role_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_role um_role_um_role_name_um_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_role
    ADD CONSTRAINT um_role_um_role_name_um_tenant_id_key UNIQUE (um_role_name, um_tenant_id);


--
-- Name: um_shared_user_role um_shared_user_role_um_user_id_um_role_id_um_user_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_shared_user_role
    ADD CONSTRAINT um_shared_user_role_um_user_id_um_role_id_um_user_tenant_id_key UNIQUE (um_user_id, um_role_id, um_user_tenant_id, um_role_tenant_id);


--
-- Name: um_system_role um_system_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_system_role
    ADD CONSTRAINT um_system_role_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_system_user um_system_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_system_user
    ADD CONSTRAINT um_system_user_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_system_user_role um_system_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_system_user_role
    ADD CONSTRAINT um_system_user_role_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_system_user_role um_system_user_role_um_user_name_um_role_id_um_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_system_user_role
    ADD CONSTRAINT um_system_user_role_um_user_name_um_role_id_um_tenant_id_key UNIQUE (um_user_name, um_role_id, um_tenant_id);


--
-- Name: um_system_user um_system_user_um_user_name_um_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_system_user
    ADD CONSTRAINT um_system_user_um_user_name_um_tenant_id_key UNIQUE (um_user_name, um_tenant_id);


--
-- Name: um_tenant um_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_tenant
    ADD CONSTRAINT um_tenant_pkey PRIMARY KEY (um_id);


--
-- Name: um_tenant um_tenant_um_domain_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_tenant
    ADD CONSTRAINT um_tenant_um_domain_name_key UNIQUE (um_domain_name);


--
-- Name: um_user_attribute um_user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user_attribute
    ADD CONSTRAINT um_user_attribute_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_user_permission um_user_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user_permission
    ADD CONSTRAINT um_user_permission_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_user um_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user
    ADD CONSTRAINT um_user_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_user_role um_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user_role
    ADD CONSTRAINT um_user_role_pkey PRIMARY KEY (um_id, um_tenant_id);


--
-- Name: um_user_role um_user_role_um_user_id_um_role_id_um_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user_role
    ADD CONSTRAINT um_user_role_um_user_id_um_role_id_um_tenant_id_key UNIQUE (um_user_id, um_role_id, um_tenant_id);


--
-- Name: um_user um_user_um_user_name_um_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user
    ADD CONSTRAINT um_user_um_user_name_um_tenant_id_key UNIQUE (um_user_name, um_tenant_id);


--
-- Name: index_um_permission_um_resource_id_um_action; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_um_permission_um_resource_id_um_action ON public.um_permission USING btree (um_resource_id, um_action, um_tenant_id);


--
-- Name: index_um_tenant_um_domain_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_um_tenant_um_domain_name ON public.um_tenant USING btree (um_domain_name);


--
-- Name: reg_log_ind_by_reg_logtime; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_log_ind_by_reg_logtime ON public.reg_log USING btree (reg_logged_time, reg_tenant_id);


--
-- Name: reg_path_ind_by_path_parent_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_path_ind_by_path_parent_id ON public.reg_path USING btree (reg_path_parent_id, reg_tenant_id);


--
-- Name: reg_path_ind_by_path_value; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_path_ind_by_path_value ON public.reg_path USING btree (reg_path_value, reg_tenant_id);


--
-- Name: reg_resource_comment_ind_by_path_id_and_resource_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_comment_ind_by_path_id_and_resource_name ON public.reg_resource_comment USING btree (reg_path_id, reg_resource_name, reg_tenant_id);


--
-- Name: reg_resource_comment_ind_by_version; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_comment_ind_by_version ON public.reg_resource_comment USING btree (reg_version, reg_tenant_id);


--
-- Name: reg_resource_history_ind_by_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_history_ind_by_name ON public.reg_resource_history USING btree (reg_name, reg_tenant_id);


--
-- Name: reg_resource_history_ind_by_path_id_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_history_ind_by_path_id_name ON public.reg_resource USING btree (reg_path_id, reg_name, reg_tenant_id);


--
-- Name: reg_resource_ind_by_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_ind_by_name ON public.reg_resource USING btree (reg_name, reg_tenant_id);


--
-- Name: reg_resource_ind_by_path_id_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_ind_by_path_id_name ON public.reg_resource USING btree (reg_path_id, reg_name, reg_tenant_id);


--
-- Name: reg_resource_ind_by_tenant; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_ind_by_tenant ON public.reg_resource USING btree (reg_tenant_id, reg_uuid);


--
-- Name: reg_resource_ind_by_type; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_ind_by_type ON public.reg_resource USING btree (reg_tenant_id, reg_media_type);


--
-- Name: reg_resource_ind_by_uuid; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_ind_by_uuid ON public.reg_resource USING btree (reg_uuid);


--
-- Name: reg_resource_property_ind_by_path_id_and_resource_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_property_ind_by_path_id_and_resource_name ON public.reg_resource_property USING btree (reg_path_id, reg_resource_name, reg_tenant_id);


--
-- Name: reg_resource_property_ind_by_version; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_property_ind_by_version ON public.reg_resource_property USING btree (reg_version, reg_tenant_id);


--
-- Name: reg_resource_rating_ind_by_path_id_and_resource_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_rating_ind_by_path_id_and_resource_name ON public.reg_resource_rating USING btree (reg_path_id, reg_resource_name, reg_tenant_id);


--
-- Name: reg_resource_rating_ind_by_version; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_rating_ind_by_version ON public.reg_resource_rating USING btree (reg_version, reg_tenant_id);


--
-- Name: reg_resource_tag_ind_by_path_id_and_resource_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_tag_ind_by_path_id_and_resource_name ON public.reg_resource_tag USING btree (reg_path_id, reg_resource_name, reg_tenant_id);


--
-- Name: reg_resource_tag_ind_by_version; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_resource_tag_ind_by_version ON public.reg_resource_tag USING btree (reg_version, reg_tenant_id);


--
-- Name: reg_snapshot_ind_by_path_id_and_resource_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reg_snapshot_ind_by_path_id_and_resource_name ON public.reg_snapshot USING btree (reg_path_id, reg_resource_name, reg_tenant_id);


--
-- Name: system_role_ind_by_rn_ti; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX system_role_ind_by_rn_ti ON public.um_system_role USING btree (um_role_name, um_tenant_id);


--
-- Name: um_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX um_user_id_index ON public.um_user_attribute USING btree (um_user_id);


--
-- Name: reg_resource_comment reg_resource_comment_fk_by_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_comment
    ADD CONSTRAINT reg_resource_comment_fk_by_comment_id FOREIGN KEY (reg_comment_id, reg_tenant_id) REFERENCES public.reg_comment(reg_id, reg_tenant_id);


--
-- Name: reg_resource_comment reg_resource_comment_fk_by_path_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_comment
    ADD CONSTRAINT reg_resource_comment_fk_by_path_id FOREIGN KEY (reg_path_id, reg_tenant_id) REFERENCES public.reg_path(reg_path_id, reg_tenant_id);


--
-- Name: reg_resource reg_resource_fk_by_content_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource
    ADD CONSTRAINT reg_resource_fk_by_content_id FOREIGN KEY (reg_content_id, reg_tenant_id) REFERENCES public.reg_content(reg_content_id, reg_tenant_id);


--
-- Name: reg_resource reg_resource_fk_by_path_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource
    ADD CONSTRAINT reg_resource_fk_by_path_id FOREIGN KEY (reg_path_id, reg_tenant_id) REFERENCES public.reg_path(reg_path_id, reg_tenant_id);


--
-- Name: reg_resource_history reg_resource_hist_fk_by_content_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_history
    ADD CONSTRAINT reg_resource_hist_fk_by_content_id FOREIGN KEY (reg_content_id, reg_tenant_id) REFERENCES public.reg_content_history(reg_content_id, reg_tenant_id);


--
-- Name: reg_resource_history reg_resource_hist_fk_by_pathid; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_history
    ADD CONSTRAINT reg_resource_hist_fk_by_pathid FOREIGN KEY (reg_path_id, reg_tenant_id) REFERENCES public.reg_path(reg_path_id, reg_tenant_id);


--
-- Name: reg_resource_property reg_resource_property_fk_by_path_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_property
    ADD CONSTRAINT reg_resource_property_fk_by_path_id FOREIGN KEY (reg_path_id, reg_tenant_id) REFERENCES public.reg_path(reg_path_id, reg_tenant_id);


--
-- Name: reg_resource_property reg_resource_property_fk_by_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_property
    ADD CONSTRAINT reg_resource_property_fk_by_tag_id FOREIGN KEY (reg_property_id, reg_tenant_id) REFERENCES public.reg_property(reg_id, reg_tenant_id);


--
-- Name: reg_resource_rating reg_resource_rating_fk_by_path_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_rating
    ADD CONSTRAINT reg_resource_rating_fk_by_path_id FOREIGN KEY (reg_path_id, reg_tenant_id) REFERENCES public.reg_path(reg_path_id, reg_tenant_id);


--
-- Name: reg_resource_rating reg_resource_rating_fk_by_rating_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_rating
    ADD CONSTRAINT reg_resource_rating_fk_by_rating_id FOREIGN KEY (reg_rating_id, reg_tenant_id) REFERENCES public.reg_rating(reg_id, reg_tenant_id);


--
-- Name: reg_resource_tag reg_resource_tag_fk_by_path_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_tag
    ADD CONSTRAINT reg_resource_tag_fk_by_path_id FOREIGN KEY (reg_path_id, reg_tenant_id) REFERENCES public.reg_path(reg_path_id, reg_tenant_id);


--
-- Name: reg_resource_tag reg_resource_tag_fk_by_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_resource_tag
    ADD CONSTRAINT reg_resource_tag_fk_by_tag_id FOREIGN KEY (reg_tag_id, reg_tenant_id) REFERENCES public.reg_tag(reg_id, reg_tenant_id);


--
-- Name: reg_snapshot reg_snapshot_fk_by_path_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reg_snapshot
    ADD CONSTRAINT reg_snapshot_fk_by_path_id FOREIGN KEY (reg_path_id, reg_tenant_id) REFERENCES public.reg_path(reg_path_id, reg_tenant_id);


--
-- Name: um_account_mapping um_account_mapping_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_account_mapping
    ADD CONSTRAINT um_account_mapping_um_tenant_id_fkey FOREIGN KEY (um_tenant_id) REFERENCES public.um_tenant(um_id) ON DELETE CASCADE;


--
-- Name: um_claim_behavior um_claim_behavior_um_claim_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_claim_behavior
    ADD CONSTRAINT um_claim_behavior_um_claim_id_um_tenant_id_fkey FOREIGN KEY (um_claim_id, um_tenant_id) REFERENCES public.um_claim(um_id, um_tenant_id);


--
-- Name: um_claim_behavior um_claim_behavior_um_profile_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_claim_behavior
    ADD CONSTRAINT um_claim_behavior_um_profile_id_um_tenant_id_fkey FOREIGN KEY (um_profile_id, um_tenant_id) REFERENCES public.um_profile_config(um_id, um_tenant_id);


--
-- Name: um_claim um_claim_um_dialect_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_claim
    ADD CONSTRAINT um_claim_um_dialect_id_um_tenant_id_fkey FOREIGN KEY (um_dialect_id, um_tenant_id) REFERENCES public.um_dialect(um_id, um_tenant_id);


--
-- Name: um_hybrid_user_role um_hybrid_user_role_um_domain_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_hybrid_user_role
    ADD CONSTRAINT um_hybrid_user_role_um_domain_id_um_tenant_id_fkey FOREIGN KEY (um_domain_id, um_tenant_id) REFERENCES public.um_domain(um_domain_id, um_tenant_id) ON DELETE CASCADE;


--
-- Name: um_hybrid_user_role um_hybrid_user_role_um_role_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_hybrid_user_role
    ADD CONSTRAINT um_hybrid_user_role_um_role_id_um_tenant_id_fkey FOREIGN KEY (um_role_id, um_tenant_id) REFERENCES public.um_hybrid_role(um_id, um_tenant_id) ON DELETE CASCADE;


--
-- Name: um_module_actions um_module_actions_um_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_module_actions
    ADD CONSTRAINT um_module_actions_um_module_id_fkey FOREIGN KEY (um_module_id) REFERENCES public.um_module(um_id) ON DELETE CASCADE;


--
-- Name: um_profile_config um_profile_config_um_dialect_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_profile_config
    ADD CONSTRAINT um_profile_config_um_dialect_id_um_tenant_id_fkey FOREIGN KEY (um_dialect_id, um_tenant_id) REFERENCES public.um_dialect(um_id, um_tenant_id);


--
-- Name: um_role_permission um_role_permission_um_domain_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_role_permission
    ADD CONSTRAINT um_role_permission_um_domain_id_um_tenant_id_fkey FOREIGN KEY (um_domain_id, um_tenant_id) REFERENCES public.um_domain(um_domain_id, um_tenant_id) ON DELETE CASCADE;


--
-- Name: um_role_permission um_role_permission_um_permission_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_role_permission
    ADD CONSTRAINT um_role_permission_um_permission_id_um_tenant_id_fkey FOREIGN KEY (um_permission_id, um_tenant_id) REFERENCES public.um_permission(um_id, um_tenant_id) ON DELETE CASCADE;


--
-- Name: um_shared_user_role um_shared_user_role_um_role_id_um_role_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_shared_user_role
    ADD CONSTRAINT um_shared_user_role_um_role_id_um_role_tenant_id_fkey FOREIGN KEY (um_role_id, um_role_tenant_id) REFERENCES public.um_role(um_id, um_tenant_id) ON DELETE CASCADE;


--
-- Name: um_shared_user_role um_shared_user_role_um_user_id_um_user_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_shared_user_role
    ADD CONSTRAINT um_shared_user_role_um_user_id_um_user_tenant_id_fkey FOREIGN KEY (um_user_id, um_user_tenant_id) REFERENCES public.um_user(um_id, um_tenant_id) ON DELETE CASCADE;


--
-- Name: um_system_user_role um_system_user_role_um_role_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_system_user_role
    ADD CONSTRAINT um_system_user_role_um_role_id_um_tenant_id_fkey FOREIGN KEY (um_role_id, um_tenant_id) REFERENCES public.um_system_role(um_id, um_tenant_id);


--
-- Name: um_user_attribute um_user_attribute_um_user_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user_attribute
    ADD CONSTRAINT um_user_attribute_um_user_id_um_tenant_id_fkey FOREIGN KEY (um_user_id, um_tenant_id) REFERENCES public.um_user(um_id, um_tenant_id);


--
-- Name: um_user_permission um_user_permission_um_permission_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user_permission
    ADD CONSTRAINT um_user_permission_um_permission_id_um_tenant_id_fkey FOREIGN KEY (um_permission_id, um_tenant_id) REFERENCES public.um_permission(um_id, um_tenant_id) ON DELETE CASCADE;


--
-- Name: um_user_role um_user_role_um_role_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user_role
    ADD CONSTRAINT um_user_role_um_role_id_um_tenant_id_fkey FOREIGN KEY (um_role_id, um_tenant_id) REFERENCES public.um_role(um_id, um_tenant_id);


--
-- Name: um_user_role um_user_role_um_user_id_um_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.um_user_role
    ADD CONSTRAINT um_user_role_um_user_id_um_tenant_id_fkey FOREIGN KEY (um_user_id, um_tenant_id) REFERENCES public.um_user(um_id, um_tenant_id);


--
-- PostgreSQL database dump complete
--

