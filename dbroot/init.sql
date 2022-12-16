DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS payment_systems;


create table payment_systems
(
    id   serial      not null
        constraint payment_systems_pk
            primary key,
    name varchar(16) not null
);

alter table payment_systems
    owner to postgres;

INSERT INTO public.payment_systems (id, name) VALUES (1, 'МИР');
INSERT INTO public.payment_systems (id, name) VALUES (2, 'VISA');
INSERT INTO public.payment_systems (id, name) VALUES (3, 'MasterCard');


create table cards
(
    id                serial         not null
        constraint cards_pk
            primary key,
    chat_id           bigint         not null,
    balance           numeric(16, 2) not null,
    number            bigint         not null,
    payment_system_id integer        not null
        constraint cards_payment_systems_id_fk
            references payment_systems
            on update restrict on delete restrict
);

alter table cards
    owner to postgres;

INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (1, 984903039, 3124.00, 2222333344445555, 2);
INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (10, 732314018, 0.00, 838501151009485, 3);
INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (8, 732314018, 10000.00, 922154893310502, 2);
INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (9, 732314018, 5000.00, 4274788242051368, 1);
INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (11, 247021014, 0.00, 3627938801131594, 2);
INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (12, 1139166057, 100000.00, 4789411859098784, 3);
INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (6, 247021014, 2329.00, 9376437851174408, 1);
INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (7, 247021014, 13000.00, 4429144610222166, 3);
INSERT INTO public.cards (id, chat_id, balance, number, payment_system_id) VALUES (13, 247021014, 600.00, 309914510451073, 1);