SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 25520)
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    id uuid NOT NULL,
    symbol character varying(3) NOT NULL,
    name character varying(25) NOT NULL,
    priority integer
);



--
-- TOC entry 198 (class 1259 OID 25523)
-- Name: currency_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency_rates (
    symbol character varying(3) NOT NULL,
    rate numeric(11,4) NOT NULL
);



--
-- TOC entry 199 (class 1259 OID 25526)
-- Name: deals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deals (
    id uuid NOT NULL,
    offer_id uuid NOT NULL,
    taker_id uuid NOT NULL,
    without_qty boolean NOT NULL,
    qty numeric(11,2),
    "timestamp" timestamp with time zone NOT NULL
);



--
-- TOC entry 209 (class 1259 OID 25663)
-- Name: firebase_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firebase_tokens (
    user_id uuid NOT NULL,
    token text NOT NULL
);



--
-- TOC entry 200 (class 1259 OID 25529)
-- Name: friendships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendships (
    user1_id uuid NOT NULL,
    user2_id uuid NOT NULL,
    status character varying(25),
    "timestamp" timestamp with time zone NOT NULL
);



--
-- TOC entry 201 (class 1259 OID 25532)
-- Name: group_memberships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_memberships (
    group_id uuid NOT NULL,
    member_id uuid NOT NULL
);



--
-- TOC entry 202 (class 1259 OID 25535)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    owner_id uuid NOT NULL,
    name character varying(25) NOT NULL
);



--
-- TOC entry 203 (class 1259 OID 25538)
-- Name: offer_observers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offer_observers (
    offer_id uuid NOT NULL,
    observer_id uuid NOT NULL
);



--
-- TOC entry 204 (class 1259 OID 25541)
-- Name: offers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offers (
    id uuid NOT NULL,
    maker_id uuid NOT NULL,
    sell_currency_id uuid NOT NULL,
    buy_currency_id uuid NOT NULL,
    rate numeric(11,4) NOT NULL,
    rate_side character(1) NOT NULL,
    without_qty boolean NOT NULL,
    original_qty numeric(11,2),
    qty numeric(11,2),
    qty_side character(1),
    status character varying(25),
    "timestamp" timestamp with time zone NOT NULL
);



--
-- TOC entry 205 (class 1259 OID 25544)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role character varying(15) NOT NULL
);



--
-- TOC entry 206 (class 1259 OID 25547)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    username character varying(50) NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    phone character varying(20) NOT NULL,
    active boolean NOT NULL,
    "timestamp" timestamp with time zone,
    email character varying(50)
);



--
-- TOC entry 207 (class 1259 OID 25550)
-- Name: users_creds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_creds (
    user_id uuid NOT NULL,
    hashed_password text NOT NULL,
    hashed_reset_password text,
    login_timestamp timestamp with time zone
);



--
-- TOC entry 208 (class 1259 OID 25556)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id uuid NOT NULL,
    role character varying(15) NOT NULL
);



--
-- TOC entry 2799 (class 2606 OID 25560)
-- Name: currencies currencies_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_name_key UNIQUE (name);


--
-- TOC entry 2801 (class 2606 OID 25562)
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25564)
-- Name: currencies currencies_symbol_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_symbol_key UNIQUE (symbol);


--
-- TOC entry 2805 (class 2606 OID 25566)
-- Name: currency_rates currency_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency_rates
    ADD CONSTRAINT currency_rates_pkey PRIMARY KEY (symbol);


--
-- TOC entry 2807 (class 2606 OID 25568)
-- Name: deals deals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deals
    ADD CONSTRAINT deals_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 25677)
-- Name: firebase_tokens firebase_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firebase_tokens
    ADD CONSTRAINT firebase_tokens_pkey PRIMARY KEY (user_id, token);


--
-- TOC entry 2810 (class 2606 OID 25570)
-- Name: friendships friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (user1_id, user2_id);


--
-- TOC entry 2812 (class 2606 OID 25572)
-- Name: group_memberships group_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_memberships
    ADD CONSTRAINT group_memberships_pkey PRIMARY KEY (group_id, member_id);


--
-- TOC entry 2814 (class 2606 OID 25574)
-- Name: groups groups_owner_id_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_owner_id_name_key UNIQUE (owner_id, name);


--
-- TOC entry 2816 (class 2606 OID 25576)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 25578)
-- Name: offer_observers offer_observers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_observers
    ADD CONSTRAINT offer_observers_pkey PRIMARY KEY (offer_id, observer_id);


--
-- TOC entry 2820 (class 2606 OID 25580)
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 25582)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role);


--
-- TOC entry 2831 (class 2606 OID 25584)
-- Name: users_creds users_creds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_creds
    ADD CONSTRAINT users_creds_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2825 (class 2606 OID 25586)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 2827 (class 2606 OID 25588)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25590)
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role);


--
-- TOC entry 2829 (class 2606 OID 25765)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 2808 (class 1259 OID 25771)
-- Name: deals_timestamp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX deals_timestamp_index ON public.deals USING btree ("timestamp");


--
-- TOC entry 2821 (class 1259 OID 25770)
-- Name: offers_timestamp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX offers_timestamp_index ON public.offers USING btree ("timestamp");


--
-- TOC entry 2836 (class 2606 OID 25593)
-- Name: deals deals_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deals
    ADD CONSTRAINT deals_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offers(id);


--
-- TOC entry 2837 (class 2606 OID 25598)
-- Name: deals deals_taker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deals
    ADD CONSTRAINT deals_taker_id_fkey FOREIGN KEY (taker_id) REFERENCES public.users(id);


--
-- TOC entry 2850 (class 2606 OID 25671)
-- Name: firebase_tokens firebase_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firebase_tokens
    ADD CONSTRAINT firebase_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2838 (class 2606 OID 25603)
-- Name: friendships friendships_user1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_user1_id_fkey FOREIGN KEY (user1_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2839 (class 2606 OID 25608)
-- Name: friendships friendships_user2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_user2_id_fkey FOREIGN KEY (user2_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2840 (class 2606 OID 25613)
-- Name: group_memberships group_memberships_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_memberships
    ADD CONSTRAINT group_memberships_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 2841 (class 2606 OID 25618)
-- Name: group_memberships group_memberships_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_memberships
    ADD CONSTRAINT group_memberships_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.users(id);


--
-- TOC entry 2842 (class 2606 OID 25623)
-- Name: groups groups_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- TOC entry 2843 (class 2606 OID 25628)
-- Name: offer_observers offer_observers_observer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_observers
    ADD CONSTRAINT offer_observers_observer_id_fkey FOREIGN KEY (observer_id) REFERENCES public.users(id);


--
-- TOC entry 2844 (class 2606 OID 25633)
-- Name: offer_observers offer_observers_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_observers
    ADD CONSTRAINT offer_observers_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offers(id);


--
-- TOC entry 2845 (class 2606 OID 25638)
-- Name: offers offers_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_currency_id_fkey FOREIGN KEY (sell_currency_id) REFERENCES public.currencies(id);


--
-- TOC entry 2846 (class 2606 OID 25643)
-- Name: offers offers_maker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_maker_id_fkey FOREIGN KEY (maker_id) REFERENCES public.users(id);


--
-- TOC entry 2847 (class 2606 OID 25648)
-- Name: users_creds users_creds_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_creds
    ADD CONSTRAINT users_creds_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2848 (class 2606 OID 25653)
-- Name: users_roles users_roles_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_role_fkey FOREIGN KEY (role) REFERENCES public.roles(role);


--
-- TOC entry 2849 (class 2606 OID 25658)
-- Name: users_roles users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);