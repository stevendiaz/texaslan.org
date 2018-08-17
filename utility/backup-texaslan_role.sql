--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE texaslan; Type: COMMENT; Schema: -; Owner: texaslan_role
--

COMMENT ON DATABASE texaslan IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO texaslan_role;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO texaslan_role;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO texaslan_role;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO texaslan_role;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: applications_application; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.applications_application (
    id integer NOT NULL,
    question_1 text,
    question_2 text,
    question_3 text,
    question_4 text,
    question_5 text,
    question_6 text,
    question_7 text,
    applicant_user_id integer,
    is_submitted boolean NOT NULL
);


ALTER TABLE public.applications_application OWNER TO texaslan_role;

--
-- Name: applications_application_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.applications_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applications_application_id_seq OWNER TO texaslan_role;

--
-- Name: applications_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.applications_application_id_seq OWNED BY public.applications_application.id;


--
-- Name: applications_review; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.applications_review (
    id integer NOT NULL,
    comment text,
    rating smallint,
    application_id integer,
    reviewer_user_id integer
);


ALTER TABLE public.applications_review OWNER TO texaslan_role;

--
-- Name: applications_review_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.applications_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applications_review_id_seq OWNER TO texaslan_role;

--
-- Name: applications_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.applications_review_id_seq OWNED BY public.applications_review.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO texaslan_role;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO texaslan_role;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO texaslan_role;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO texaslan_role;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO texaslan_role;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO texaslan_role;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: comments_comment; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.comments_comment (
    id integer NOT NULL,
    message text,
    is_open boolean NOT NULL
);


ALTER TABLE public.comments_comment OWNER TO texaslan_role;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_comment_id_seq OWNER TO texaslan_role;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments_comment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO texaslan_role;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO texaslan_role;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO texaslan_role;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO texaslan_role;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO texaslan_role;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO texaslan_role;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO texaslan_role;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO texaslan_role;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO texaslan_role;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: django_slack_oauth_slackoauthrequest; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.django_slack_oauth_slackoauthrequest (
    id integer NOT NULL,
    access_token character varying(128),
    extras text,
    ip inet,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    associated_user_id integer
);


ALTER TABLE public.django_slack_oauth_slackoauthrequest OWNER TO texaslan_role;

--
-- Name: django_slack_oauth_slackoauthrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.django_slack_oauth_slackoauthrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_slack_oauth_slackoauthrequest_id_seq OWNER TO texaslan_role;

--
-- Name: django_slack_oauth_slackoauthrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.django_slack_oauth_slackoauthrequest_id_seq OWNED BY public.django_slack_oauth_slackoauthrequest.id;


--
-- Name: events_event; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.events_event (
    id integer NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    title character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    description text,
    image_url character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    creator_id integer,
    presented_by character varying(256),
    speaker character varying(256),
    speaker_bio text
);


ALTER TABLE public.events_event OWNER TO texaslan_role;

--
-- Name: events_event_attendees; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.events_event_attendees (
    id integer NOT NULL,
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.events_event_attendees OWNER TO texaslan_role;

--
-- Name: events_event_attendees_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.events_event_attendees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_attendees_id_seq OWNER TO texaslan_role;

--
-- Name: events_event_attendees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.events_event_attendees_id_seq OWNED BY public.events_event_attendees.id;


--
-- Name: events_event_event_tags; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.events_event_event_tags (
    id integer NOT NULL,
    event_id integer NOT NULL,
    eventtag_id integer NOT NULL
);


ALTER TABLE public.events_event_event_tags OWNER TO texaslan_role;

--
-- Name: events_event_event_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.events_event_event_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_event_tags_id_seq OWNER TO texaslan_role;

--
-- Name: events_event_event_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.events_event_event_tags_id_seq OWNED BY public.events_event_event_tags.id;


--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_id_seq OWNER TO texaslan_role;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events_event.id;


--
-- Name: events_eventtag; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.events_eventtag (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.events_eventtag OWNER TO texaslan_role;

--
-- Name: events_eventtag_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.events_eventtag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_eventtag_id_seq OWNER TO texaslan_role;

--
-- Name: events_eventtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.events_eventtag_id_seq OWNED BY public.events_eventtag.id;


--
-- Name: go_go; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.go_go (
    id character varying(255) NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE public.go_go OWNER TO texaslan_role;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO texaslan_role;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO texaslan_role;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNED BY public.oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.oauth2_provider_application (
    id integer NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO texaslan_role;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO texaslan_role;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNED BY public.oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.oauth2_provider_grant (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO texaslan_role;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO texaslan_role;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNED BY public.oauth2_provider_grant.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id integer NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO texaslan_role;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO texaslan_role;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNED BY public.oauth2_provider_refreshtoken.id;


--
-- Name: semester; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.semester (
    id integer NOT NULL,
    semester character varying(255) NOT NULL
);


ALTER TABLE public.semester OWNER TO texaslan_role;

--
-- Name: semester_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.semester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.semester_id_seq OWNER TO texaslan_role;

--
-- Name: semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.semester_id_seq OWNED BY public.semester.id;


--
-- Name: site_settings_sitesettings; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.site_settings_sitesettings (
    id integer NOT NULL,
    is_rush_open boolean NOT NULL,
    voting_status character varying(1) NOT NULL
);


ALTER TABLE public.site_settings_sitesettings OWNER TO texaslan_role;

--
-- Name: site_settings_sitesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.site_settings_sitesettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_settings_sitesettings_id_seq OWNER TO texaslan_role;

--
-- Name: site_settings_sitesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.site_settings_sitesettings_id_seq OWNED BY public.site_settings_sitesettings.id;


--
-- Name: slack_user; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.slack_user (
    slacker_id integer NOT NULL,
    access_token character varying(128),
    extras text
);


ALTER TABLE public.slack_user OWNER TO texaslan_role;

--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO texaslan_role;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO texaslan_role;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO texaslan_role;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO texaslan_role;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO texaslan_role;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO texaslan_role;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO texaslan_role;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO texaslan_role;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    full_name character varying(255) NOT NULL,
    nick_name character varying(255) NOT NULL,
    graduation_date date NOT NULL,
    concentration character varying(3) NOT NULL,
    gender character varying(1) NOT NULL,
    phone_number character varying(255) NOT NULL,
    lan_class character varying(3)
);


ALTER TABLE public.users_user OWNER TO texaslan_role;

--
-- Name: users_user_active_semesters; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.users_user_active_semesters (
    id integer NOT NULL,
    user_id integer NOT NULL,
    activesemester_id integer NOT NULL
);


ALTER TABLE public.users_user_active_semesters OWNER TO texaslan_role;

--
-- Name: users_user_active_semesters_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.users_user_active_semesters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_active_semesters_id_seq OWNER TO texaslan_role;

--
-- Name: users_user_active_semesters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.users_user_active_semesters_id_seq OWNED BY public.users_user_active_semesters.id;


--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO texaslan_role;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO texaslan_role;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO texaslan_role;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO texaslan_role;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO texaslan_role;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: voting_candidate; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.voting_candidate (
    id integer NOT NULL,
    "position" character varying(1) NOT NULL,
    description text NOT NULL,
    has_won boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.voting_candidate OWNER TO texaslan_role;

--
-- Name: voting_candidate_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.voting_candidate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voting_candidate_id_seq OWNER TO texaslan_role;

--
-- Name: voting_candidate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.voting_candidate_id_seq OWNED BY public.voting_candidate.id;


--
-- Name: voting_voteballot; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.voting_voteballot (
    id integer NOT NULL,
    "position" character varying(1) NOT NULL,
    candidates_json text NOT NULL
);


ALTER TABLE public.voting_voteballot OWNER TO texaslan_role;

--
-- Name: voting_voteballot_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.voting_voteballot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voting_voteballot_id_seq OWNER TO texaslan_role;

--
-- Name: voting_voteballot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.voting_voteballot_id_seq OWNED BY public.voting_voteballot.id;


--
-- Name: voting_votestatus; Type: TABLE; Schema: public; Owner: texaslan_role
--

CREATE TABLE public.voting_votestatus (
    id integer NOT NULL,
    has_voted boolean NOT NULL,
    voter_id integer NOT NULL
);


ALTER TABLE public.voting_votestatus OWNER TO texaslan_role;

--
-- Name: voting_votestatus_id_seq; Type: SEQUENCE; Schema: public; Owner: texaslan_role
--

CREATE SEQUENCE public.voting_votestatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voting_votestatus_id_seq OWNER TO texaslan_role;

--
-- Name: voting_votestatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: texaslan_role
--

ALTER SEQUENCE public.voting_votestatus_id_seq OWNED BY public.voting_votestatus.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: applications_application id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.applications_application ALTER COLUMN id SET DEFAULT nextval('public.applications_application_id_seq'::regclass);


--
-- Name: applications_review id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.applications_review ALTER COLUMN id SET DEFAULT nextval('public.applications_review_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: comments_comment id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.comments_comment ALTER COLUMN id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: django_slack_oauth_slackoauthrequest id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_slack_oauth_slackoauthrequest ALTER COLUMN id SET DEFAULT nextval('public.django_slack_oauth_slackoauthrequest_id_seq'::regclass);


--
-- Name: events_event id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event ALTER COLUMN id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: events_event_attendees id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_attendees ALTER COLUMN id SET DEFAULT nextval('public.events_event_attendees_id_seq'::regclass);


--
-- Name: events_event_event_tags id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_event_tags ALTER COLUMN id SET DEFAULT nextval('public.events_event_event_tags_id_seq'::regclass);


--
-- Name: events_eventtag id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_eventtag ALTER COLUMN id SET DEFAULT nextval('public.events_eventtag_id_seq'::regclass);


--
-- Name: oauth2_provider_accesstoken id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: oauth2_provider_application id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass);


--
-- Name: oauth2_provider_grant id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass);


--
-- Name: oauth2_provider_refreshtoken id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: semester id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.semester ALTER COLUMN id SET DEFAULT nextval('public.semester_id_seq'::regclass);


--
-- Name: site_settings_sitesettings id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.site_settings_sitesettings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_sitesettings_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_active_semesters id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_active_semesters ALTER COLUMN id SET DEFAULT nextval('public.users_user_active_semesters_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Name: voting_candidate id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.voting_candidate ALTER COLUMN id SET DEFAULT nextval('public.voting_candidate_id_seq'::regclass);


--
-- Name: voting_voteballot id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.voting_voteballot ALTER COLUMN id SET DEFAULT nextval('public.voting_voteballot_id_seq'::regclass);


--
-- Name: voting_votestatus id; Type: DEFAULT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.voting_votestatus ALTER COLUMN id SET DEFAULT nextval('public.voting_votestatus_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	testing@testo.test	t	t	12
2	officer_super@test.com	t	t	1
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: applications_application; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.applications_application (id, question_1, question_2, question_3, question_4, question_5, question_6, question_7, applicant_user_id, is_submitted) FROM stdin;
\.


--
-- Data for Name: applications_review; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.applications_review (id, comment, rating, application_id, reviewer_user_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.auth_group (id, name) FROM stdin;
0	Open Rushie
1	Closed Rushie
2	Pledge
4	Officer
5	Board
6	Inactive
7	Alumni
3	Active
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add content type	3	add_contenttype
8	Can change content type	3	change_contenttype
9	Can delete content type	3	delete_contenttype
10	Can add session	4	add_session
11	Can change session	4	change_session
12	Can delete session	4	delete_session
13	Can add site	5	add_site
14	Can change site	5	change_site
15	Can delete site	5	delete_site
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add email confirmation	7	add_emailconfirmation
20	Can change email confirmation	7	change_emailconfirmation
21	Can delete email confirmation	7	delete_emailconfirmation
22	Can add email address	8	add_emailaddress
23	Can change email address	8	change_emailaddress
24	Can delete email address	8	delete_emailaddress
25	Can add social account	9	add_socialaccount
26	Can change social account	9	change_socialaccount
27	Can delete social account	9	delete_socialaccount
28	Can add social application token	10	add_socialtoken
29	Can change social application token	10	change_socialtoken
30	Can delete social application token	10	delete_socialtoken
31	Can add social application	11	add_socialapp
32	Can change social application	11	change_socialapp
33	Can delete social application	11	delete_socialapp
34	Can add application	12	add_application
35	Can change application	12	change_application
36	Can delete application	12	delete_application
37	Can add refresh token	13	add_refreshtoken
38	Can change refresh token	13	change_refreshtoken
39	Can delete refresh token	13	delete_refreshtoken
40	Can add access token	14	add_accesstoken
41	Can change access token	14	change_accesstoken
42	Can delete access token	14	delete_accesstoken
43	Can add grant	15	add_grant
44	Can change grant	15	change_grant
45	Can delete grant	15	delete_grant
46	Can add slack user	16	add_slackuser
47	Can change slack user	16	change_slackuser
48	Can delete slack user	16	delete_slackuser
49	Can add Slack OAuth Request	17	add_slackoauthrequest
50	Can change Slack OAuth Request	17	change_slackoauthrequest
51	Can delete Slack OAuth Request	17	delete_slackoauthrequest
52	Can add user	18	add_user
53	Can change user	18	change_user
54	Can delete user	18	delete_user
55	Can add event tag	19	add_eventtag
56	Can change event tag	19	change_eventtag
57	Can delete event tag	19	delete_eventtag
58	Can add event	20	add_event
59	Can change event	20	change_event
60	Can delete event	20	delete_event
61	Can add go	21	add_go
62	Can change go	21	change_go
63	Can delete go	21	delete_go
64	Can add comment	22	add_comment
65	Can change comment	22	change_comment
66	Can delete comment	22	delete_comment
67	Can add review	23	add_review
68	Can change review	23	change_review
69	Can delete review	23	delete_review
70	Can add application	24	add_application
71	Can change application	24	change_application
72	Can delete application	24	delete_application
73	Can add vote ballot	25	add_voteballot
74	Can change vote ballot	25	change_voteballot
75	Can delete vote ballot	25	delete_voteballot
76	Can add candidate	26	add_candidate
77	Can change candidate	26	change_candidate
78	Can delete candidate	26	delete_candidate
79	Can add vote status	27	add_votestatus
80	Can change vote status	27	change_votestatus
81	Can delete vote status	27	delete_votestatus
82	Can add site settings	28	add_sitesettings
83	Can change site settings	28	change_sitesettings
84	Can delete site settings	28	delete_sitesettings
85	Can add active semester	29	add_activesemester
86	Can change active semester	29	change_activesemester
87	Can delete active semester	29	delete_activesemester
\.


--
-- Data for Name: comments_comment; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.comments_comment (id, message, is_open) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-08-03 21:59:28.344536+00	3	Active	2	[]	2	1
2	2018-08-03 23:03:46.815364+00	12	testing@testo.test	2	[{"changed": {"fields": ["nick_name"]}}]	18	1
3	2018-08-03 23:10:40.831901+00	2	officer_super@test.com (officer)	1	[{"added": {}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	account	emailconfirmation
8	account	emailaddress
9	socialaccount	socialaccount
10	socialaccount	socialtoken
11	socialaccount	socialapp
12	oauth2_provider	application
13	oauth2_provider	refreshtoken
14	oauth2_provider	accesstoken
15	oauth2_provider	grant
16	django_slack_oauth	slackuser
17	django_slack_oauth	slackoauthrequest
18	users	user
19	events	eventtag
20	events	event
21	go	go
22	comments	comment
23	applications	review
24	applications	application
25	voting	voteballot
26	voting	candidate
27	voting	votestatus
28	site_settings	sitesettings
29	users	activesemester
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-07-06 21:54:39.938785+00
2	contenttypes	0002_remove_content_type_name	2018-07-06 21:54:39.957452+00
3	auth	0001_initial	2018-07-06 21:54:40.089516+00
4	auth	0002_alter_permission_name_max_length	2018-07-06 21:54:40.101411+00
5	auth	0003_alter_user_email_max_length	2018-07-06 21:54:40.113575+00
6	auth	0004_alter_user_username_opts	2018-07-06 21:54:40.123752+00
7	auth	0005_alter_user_last_login_null	2018-07-06 21:54:40.132802+00
8	auth	0006_require_contenttypes_0002	2018-07-06 21:54:40.137447+00
9	users	0001_initial	2018-07-06 21:54:40.262174+00
10	account	0001_initial	2018-07-06 21:54:40.353255+00
11	account	0002_email_max_length	2018-07-06 21:54:40.369626+00
12	admin	0001_initial	2018-07-06 21:54:40.424611+00
13	admin	0002_logentry_remove_auto_add	2018-07-06 21:54:40.438728+00
14	applications	0001_initial	2018-07-06 21:54:40.541789+00
15	applications	0002_auto_20170222_1747	2018-07-06 21:54:40.682947+00
16	applications	0003_auto_20170222_1930	2018-07-06 21:54:40.698498+00
17	applications	0004_auto_20170308_0949	2018-07-06 21:54:40.724306+00
18	applications	0005_auto_20170308_1032	2018-07-06 21:54:40.739326+00
19	auth	0007_alter_validators_add_error_messages	2018-07-06 21:54:40.757199+00
20	auth	0008_alter_user_username_max_length	2018-07-06 21:54:40.773597+00
21	comments	0001_initial	2018-07-06 21:54:40.795889+00
22	django_slack_oauth	0001_initial	2018-07-06 21:54:40.825059+00
23	django_slack_oauth	0002_slackuser_extras	2018-07-06 21:54:40.849834+00
24	django_slack_oauth	0003_slackuser_accesstoken_length	2018-07-06 21:54:40.867626+00
25	django_slack_oauth	0004_auto_20161226_1937	2018-07-06 21:54:40.915601+00
26	django_slack_oauth	0005_auto_20161228_2055	2018-07-06 21:54:40.931786+00
27	events	0001_initial	2018-07-06 21:54:40.982526+00
28	events	0002_auto_20160815_0119	2018-07-06 21:54:41.012586+00
29	events	0003_auto_20160815_2210	2018-07-06 21:54:41.159937+00
30	events	0004_auto_20170117_1717	2018-07-06 21:54:41.203516+00
31	events	0005_auto_20170125_1921	2018-07-06 21:54:41.298522+00
32	go	0001_initial	2018-07-06 21:54:41.325922+00
33	go	0002_auto_20160731_1747	2018-07-06 21:54:41.335788+00
34	go	0003_auto_20160731_1747	2018-07-06 21:54:41.34185+00
35	go	0004_auto_20160731_1756	2018-07-06 21:54:41.350405+00
36	oauth2_provider	0001_initial	2018-07-06 21:54:41.625912+00
37	oauth2_provider	0002_08_updates	2018-07-06 21:54:41.884701+00
38	oauth2_provider	0003_auto_20160316_1503	2018-07-06 21:54:41.978184+00
39	oauth2_provider	0004_auto_20160525_1623	2018-07-06 21:54:42.240197+00
40	sessions	0001_initial	2018-07-06 21:54:42.271263+00
41	site_settings	0001_initial	2018-07-06 21:54:42.288573+00
42	site_settings	0002_auto_20170223_1056	2018-07-06 21:54:42.295901+00
43	site_settings	0003_auto_20170223_1107	2018-07-06 21:54:42.303774+00
44	sites	0001_initial	2018-07-06 21:54:42.321256+00
45	sites	0002_set_site_domain_and_name	2018-07-06 21:54:42.333163+00
46	sites	0003_auto_20160731_1740	2018-07-06 21:54:42.356901+00
47	socialaccount	0001_initial	2018-07-06 21:54:42.619908+00
48	socialaccount	0002_token_max_lengths	2018-07-06 21:54:42.761193+00
49	socialaccount	0003_extra_data_default_dict	2018-07-06 21:54:42.789483+00
50	users	0002_auto_20160731_1740	2018-07-06 21:54:42.832213+00
51	users	0003_auto_20160731_1837	2018-07-06 21:54:43.04763+00
52	users	0004_auto_20160731_1858	2018-07-06 21:54:43.13105+00
53	users	0005_user_resume	2018-07-06 21:54:43.161236+00
54	users	0006_auto_20160822_0840	2018-07-06 21:54:43.191539+00
55	users	0007_auto_20170115_1721	2018-07-06 21:54:43.370185+00
56	users	0008_auto_20170118_0955	2018-07-06 21:54:43.418309+00
57	users	0009_auto_20170221_0755	2018-07-06 21:54:43.55882+00
58	users	0010_user_lan_class	2018-07-06 21:54:43.584512+00
59	users	0011_auto_20170222_1402	2018-07-06 21:54:43.610482+00
60	voting	0001_initial	2018-07-06 21:54:43.750045+00
61	voting	0002_auto_20170223_1054	2018-07-06 21:54:43.797239+00
62	voting	0003_auto_20170223_1207	2018-07-06 21:54:43.976274+00
63	voting	0004_auto_20170223_1216	2018-07-06 21:54:44.049024+00
64	voting	0005_auto_20170312_2239	2018-07-06 21:54:44.078001+00
65	users	0012_auto_20180706_1743	2018-07-06 22:43:18.126845+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
jw2g19up8ps5ur34vjm9xxq22v4mlx4e	MmFlZTM0OTJkNzUwOGE2ZGY1YzdjOGE3OWIwNTEyYjM4YThkZjE4OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzY4NTFhZTU1NmIyYjk4MzZiMTgyYjg3ZjNmYjkxY2YwZjNhYzM2In0=	2018-08-17 21:56:11.668016+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.django_site (id, domain, name) FROM stdin;
1	www.texaslan.org	Texas LAN
\.


--
-- Data for Name: django_slack_oauth_slackoauthrequest; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.django_slack_oauth_slackoauthrequest (id, access_token, extras, ip, created, modified, associated_user_id) FROM stdin;
\.


--
-- Data for Name: events_event; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.events_event (id, start_time, end_time, title, location, description, image_url, created_on, creator_id, presented_by, speaker, speaker_bio) FROM stdin;
1	2018-08-20 23:05:00+00	2018-08-20 23:05:00+00	Test	test	No description provided.		2018-08-03 23:10:53.919763+00	1	\N	\N	\N
\.


--
-- Data for Name: events_event_attendees; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.events_event_attendees (id, event_id, user_id) FROM stdin;
\.


--
-- Data for Name: events_event_event_tags; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.events_event_event_tags (id, event_id, eventtag_id) FROM stdin;
\.


--
-- Data for Name: events_eventtag; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.events_eventtag (id, name) FROM stdin;
0	Open Rush
1	Closed Rush
2	Officer Meeting
3	General Meeting
4	Pledge
5	Service
6	Special LAN
7	Other
\.


--
-- Data for Name: go_go; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.go_go (id, url) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: semester; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.semester (id, semester) FROM stdin;
\.


--
-- Data for Name: site_settings_sitesettings; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.site_settings_sitesettings (id, is_rush_open, voting_status) FROM stdin;
1	f	C
\.


--
-- Data for Name: slack_user; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.slack_user (slacker_id, access_token, extras) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, full_name, nick_name, graduation_date, concentration, gender, phone_number, lan_class) FROM stdin;
1	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	2018-08-03 21:56:11.664251+00	t	officer			officer_super@test.com	t	t	2018-07-20 16:53:03.41133+00	Administrator	Admin	2018-05-01	O	P	000-000-0000	\N
12	pbkdf2_sha256$30000$Uo96mEI5fZSu$z9hWKWMVij6rqY4ZZofFZWsnikVnR4ymHAQTP5AhVyA=	\N	f	testing@testo.test			testing@testo.test	f	t	2018-08-03 18:21:39+00	Steven Diaz	test	2018-08-05	CS	P		\N
0	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user			test@test.com	f	t	2018-07-20 16:53:03.395445+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
2	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	pledge			pledge@test.com	f	t	2018-07-20 16:53:03.415856+00	Pledge Pledgie	Pledge	2018-05-01	O	P	000-000-0000	\N
3	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user1			test@test.com	f	t	2018-07-20 16:53:03.420351+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
4	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user2			test@test.com	f	t	2018-07-20 16:53:03.425362+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
5	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user3			test@test.com	f	t	2018-07-20 16:53:03.430244+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
6	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user4			test@test.com	f	t	2018-07-20 16:53:03.434904+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
7	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user5			test@test.com	f	t	2018-07-20 16:53:03.439211+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
8	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user6			test@test.com	f	t	2018-07-20 16:53:03.444116+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
9	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user7			test@test.com	f	t	2018-07-20 16:53:03.448721+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
10	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user8			test@test.com	f	t	2018-07-20 16:53:03.453803+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
11	pbkdf2_sha256$30000$g3Tlhvl16iMu$7to0F+PC+HhMe66Jg9bhGhCab4pQw1Jo+gUZyq/WEQA=	\N	f	user9			test@test.com	f	t	2018-07-20 16:53:03.458774+00	Johny Appleseed	John	2018-05-01	O	P	000-000-0000	\N
\.


--
-- Data for Name: users_user_active_semesters; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.users_user_active_semesters (id, user_id, activesemester_id) FROM stdin;
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
1	0	3
2	1	3
3	1	4
4	2	2
5	3	3
6	4	3
7	5	3
8	6	3
9	7	3
10	8	3
11	9	3
12	10	3
13	11	3
14	12	0
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: voting_candidate; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.voting_candidate (id, "position", description, has_won, user_id) FROM stdin;
\.


--
-- Data for Name: voting_voteballot; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.voting_voteballot (id, "position", candidates_json) FROM stdin;
\.


--
-- Data for Name: voting_votestatus; Type: TABLE DATA; Schema: public; Owner: texaslan_role
--

COPY public.voting_votestatus (id, has_voted, voter_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 2, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: applications_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.applications_application_id_seq', 1, false);


--
-- Name: applications_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.applications_review_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 7, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 87, true);


--
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.comments_comment_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 29, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 65, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, false);


--
-- Name: django_slack_oauth_slackoauthrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.django_slack_oauth_slackoauthrequest_id_seq', 1, false);


--
-- Name: events_event_attendees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.events_event_attendees_id_seq', 1, false);


--
-- Name: events_event_event_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.events_event_event_tags_id_seq', 1, false);


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.events_event_id_seq', 1, true);


--
-- Name: events_eventtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.events_eventtag_id_seq', 7, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.semester_id_seq', 1, false);


--
-- Name: site_settings_sitesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.site_settings_sitesettings_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: users_user_active_semesters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.users_user_active_semesters_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 14, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: voting_candidate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.voting_candidate_id_seq', 1, false);


--
-- Name: voting_voteballot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.voting_voteballot_id_seq', 1, false);


--
-- Name: voting_votestatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: texaslan_role
--

SELECT pg_catalog.setval('public.voting_votestatus_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: applications_application applications_application_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.applications_application
    ADD CONSTRAINT applications_application_pkey PRIMARY KEY (id);


--
-- Name: applications_review applications_review_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.applications_review
    ADD CONSTRAINT applications_review_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: comments_comment comments_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.comments_comment
    ADD CONSTRAINT comments_comment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: django_slack_oauth_slackoauthrequest django_slack_oauth_slackoauthrequest_associated_user_id_key; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_slack_oauth_slackoauthrequest
    ADD CONSTRAINT django_slack_oauth_slackoauthrequest_associated_user_id_key UNIQUE (associated_user_id);


--
-- Name: django_slack_oauth_slackoauthrequest django_slack_oauth_slackoauthrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_slack_oauth_slackoauthrequest
    ADD CONSTRAINT django_slack_oauth_slackoauthrequest_pkey PRIMARY KEY (id);


--
-- Name: events_event_attendees events_event_attendees_event_id_3e9e4bca_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_attendees
    ADD CONSTRAINT events_event_attendees_event_id_3e9e4bca_uniq UNIQUE (event_id, user_id);


--
-- Name: events_event_attendees events_event_attendees_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_attendees
    ADD CONSTRAINT events_event_attendees_pkey PRIMARY KEY (id);


--
-- Name: events_event_event_tags events_event_event_tags_event_id_37fa3cfa_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_event_tags
    ADD CONSTRAINT events_event_event_tags_event_id_37fa3cfa_uniq UNIQUE (event_id, eventtag_id);


--
-- Name: events_event_event_tags events_event_event_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_event_tags
    ADD CONSTRAINT events_event_event_tags_pkey PRIMARY KEY (id);


--
-- Name: events_event events_event_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event
    ADD CONSTRAINT events_event_pkey PRIMARY KEY (id);


--
-- Name: events_eventtag events_eventtag_name_key; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_eventtag
    ADD CONSTRAINT events_eventtag_name_key UNIQUE (name);


--
-- Name: events_eventtag events_eventtag_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_eventtag
    ADD CONSTRAINT events_eventtag_pkey PRIMARY KEY (id);


--
-- Name: go_go go_go_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.go_go
    ADD CONSTRAINT go_go_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_d090daa4_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq UNIQUE (token);


--
-- Name: semester semester_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.semester
    ADD CONSTRAINT semester_pkey PRIMARY KEY (id);


--
-- Name: site_settings_sitesettings site_settings_sitesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.site_settings_sitesettings
    ADD CONSTRAINT site_settings_sitesettings_pkey PRIMARY KEY (id);


--
-- Name: slack_user slack_user_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.slack_user
    ADD CONSTRAINT slack_user_pkey PRIMARY KEY (slacker_id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: users_user_active_semesters users_user_active_semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_active_semesters
    ADD CONSTRAINT users_user_active_semesters_pkey PRIMARY KEY (id);


--
-- Name: users_user_active_semesters users_user_active_semesters_user_id_bf467d46_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_active_semesters
    ADD CONSTRAINT users_user_active_semesters_user_id_bf467d46_uniq UNIQUE (user_id, activesemester_id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: voting_candidate voting_candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.voting_candidate
    ADD CONSTRAINT voting_candidate_pkey PRIMARY KEY (id);


--
-- Name: voting_voteballot voting_voteballot_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.voting_voteballot
    ADD CONSTRAINT voting_voteballot_pkey PRIMARY KEY (id);


--
-- Name: voting_votestatus voting_votestatus_pkey; Type: CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.voting_votestatus
    ADD CONSTRAINT voting_votestatus_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX account_emailaddress_e8701ad4 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailconfirmation_6f1edeac; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX account_emailconfirmation_6f1edeac ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: applications_application_e10d62c8; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX applications_application_e10d62c8 ON public.applications_application USING btree (applicant_user_id);


--
-- Name: applications_review_6bc0a4eb; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX applications_review_6bc0a4eb ON public.applications_review USING btree (application_id);


--
-- Name: applications_review_f60d40d7; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX applications_review_f60d40d7 ON public.applications_review USING btree (reviewer_user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: events_event_3700153c; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX events_event_3700153c ON public.events_event USING btree (creator_id);


--
-- Name: events_event_attendees_4437cfac; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX events_event_attendees_4437cfac ON public.events_event_attendees USING btree (event_id);


--
-- Name: events_event_attendees_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX events_event_attendees_e8701ad4 ON public.events_event_attendees USING btree (user_id);


--
-- Name: events_event_event_tags_4437cfac; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX events_event_event_tags_4437cfac ON public.events_event_event_tags USING btree (event_id);


--
-- Name: events_event_event_tags_ec1f97cd; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX events_event_event_tags_ec1f97cd ON public.events_event_event_tags USING btree (eventtag_id);


--
-- Name: events_eventtag_name_163fdefe_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX events_eventtag_name_163fdefe_like ON public.events_eventtag USING btree (name varchar_pattern_ops);


--
-- Name: go_go_id_05a93a55_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX go_go_id_05a93a55_like ON public.go_go USING btree (id varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_accesstoken_6bc0a4eb ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_accesstoken_e8701ad4 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_9d667c2b; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_application_9d667c2b ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_application_e8701ad4 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_6bc0a4eb; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_grant_6bc0a4eb ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_grant_e8701ad4 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_refreshtoken_6bc0a4eb ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX oauth2_provider_refreshtoken_e8701ad4 ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: socialaccount_socialaccount_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX socialaccount_socialaccount_e8701ad4 ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_9365d6e7; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX socialaccount_socialapp_sites_9365d6e7 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_fe95b0a0; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX socialaccount_socialapp_sites_fe95b0a0 ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_8a089c2a; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX socialaccount_socialtoken_8a089c2a ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_f382adfe; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX socialaccount_socialtoken_f382adfe ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: users_user_active_semesters_7ccb5226; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX users_user_active_semesters_7ccb5226 ON public.users_user_active_semesters USING btree (activesemester_id);


--
-- Name: users_user_active_semesters_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX users_user_active_semesters_e8701ad4 ON public.users_user_active_semesters USING btree (user_id);


--
-- Name: users_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX users_user_groups_0e939a4f ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX users_user_groups_e8701ad4 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX users_user_user_permissions_8373b171 ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX users_user_user_permissions_e8701ad4 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: voting_candidate_e8701ad4; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX voting_candidate_e8701ad4 ON public.voting_candidate USING btree (user_id);


--
-- Name: voting_votestatus_49fb0f8b; Type: INDEX; Schema: public; Owner: texaslan_role
--

CREATE INDEX voting_votestatus_49fb0f8b ON public.voting_votestatus USING btree (voter_id);


--
-- Name: account_emailconfirmation account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: applications_review applicat_application_id_b43ce63d_fk_applications_application_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.applications_review
    ADD CONSTRAINT applicat_application_id_b43ce63d_fk_applications_application_id FOREIGN KEY (application_id) REFERENCES public.applications_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: applications_application applications_applic_applicant_user_id_c1aab1eb_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.applications_application
    ADD CONSTRAINT applications_applic_applicant_user_id_c1aab1eb_fk_users_user_id FOREIGN KEY (applicant_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: applications_review applications_review_reviewer_user_id_f3debdf1_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.applications_review
    ADD CONSTRAINT applications_review_reviewer_user_id_f3debdf1_fk_users_user_id FOREIGN KEY (reviewer_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_slack_oauth_slackoauthrequest django_slack_oauth_associated_user_id_56b4dd02_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.django_slack_oauth_slackoauthrequest
    ADD CONSTRAINT django_slack_oauth_associated_user_id_56b4dd02_fk_users_user_id FOREIGN KEY (associated_user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event_attendees events_event_attendees_event_id_45694efb_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_attendees
    ADD CONSTRAINT events_event_attendees_event_id_45694efb_fk_events_event_id FOREIGN KEY (event_id) REFERENCES public.events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event_attendees events_event_attendees_user_id_c1b6cee2_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_attendees
    ADD CONSTRAINT events_event_attendees_user_id_c1b6cee2_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event events_event_creator_id_13bb3d46_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event
    ADD CONSTRAINT events_event_creator_id_13bb3d46_fk_users_user_id FOREIGN KEY (creator_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event_event_tags events_event_event_t_eventtag_id_d9a7ee83_fk_events_eventtag_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_event_tags
    ADD CONSTRAINT events_event_event_t_eventtag_id_d9a7ee83_fk_events_eventtag_id FOREIGN KEY (eventtag_id) REFERENCES public.events_eventtag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_event_event_tags events_event_event_tags_event_id_154ff95c_fk_events_event_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.events_event_event_tags
    ADD CONSTRAINT events_event_event_tags_event_id_154ff95c_fk_events_event_id FOREIGN KEY (event_id) REFERENCES public.events_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oaut_access_token_id_775e84e8_fk_oauth2_provider_accesstoken_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oaut_access_token_id_775e84e8_fk_oauth2_provider_accesstoken_id FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth_application_id_2d1c311b_fk_oauth2_provider_application_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth_application_id_2d1c311b_fk_oauth2_provider_application_id FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth_application_id_81923564_fk_oauth2_provider_application_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth_application_id_81923564_fk_oauth2_provider_application_id FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth_application_id_b22886e1_fk_oauth2_provider_application_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth_application_id_b22886e1_fk_oauth2_provider_application_id FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: slack_user slack_user_slacker_id_4dcf3c41_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.slack_user
    ADD CONSTRAINT slack_user_slacker_id_4dcf3c41_fk_users_user_id FOREIGN KEY (slacker_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_active_semesters users_user_active_sem_activesemester_id_3ffd2a56_fk_semester_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_active_semesters
    ADD CONSTRAINT users_user_active_sem_activesemester_id_3ffd2a56_fk_semester_id FOREIGN KEY (activesemester_id) REFERENCES public.semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_active_semesters users_user_active_semesters_user_id_955917db_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_active_semesters
    ADD CONSTRAINT users_user_active_semesters_user_id_955917db_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_pe_permission_id_0b93982e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_pe_permission_id_0b93982e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voting_candidate voting_candidate_user_id_8569d3cd_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.voting_candidate
    ADD CONSTRAINT voting_candidate_user_id_8569d3cd_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voting_votestatus voting_votestatus_voter_id_37644b8b_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: texaslan_role
--

ALTER TABLE ONLY public.voting_votestatus
    ADD CONSTRAINT voting_votestatus_voter_id_37644b8b_fk_users_user_id FOREIGN KEY (voter_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- texaslan_roleQL database dump complete
--

