CREATE TABLE outcome_subtype
(
    id      integer PRIMARY KEY AUTOINCREMENT,
    subtype varchar(20)
);

CREATE TABLE outcome_type
(
    id   integer PRIMARY KEY AUTOINCREMENT,
    type varchar(20)
);

CREATE TABLE outcome
(
    id         integer PRIMARY KEY AUTOINCREMENT,
    type_id    integer,
    subtype_id integer,
    age_upon   varchar(20),
    `year`     integer,
    `month`    integer,
    animal_id  varchar,
    FOREIGN KEY (type_id) REFERENCES outcome_type (id),
    FOREIGN KEY (subtype_id) REFERENCES outcome_subtype (id)
);

CREATE TABLE types
(
    id   integer PRIMARY KEY AUTOINCREMENT,
    type varchar(20)
);

CREATE TABLE breeds
(
    id   integer PRIMARY KEY AUTOINCREMENT,
    name varchar(20)
);

CREATE TABLE my_animals
(
    id            varchar(30),
    name          varchar(20),
    type_id       integer,
    breed_id      integer,
    date_of_bidth date,
    FOREIGN KEY (type_id) REFERENCES types (id),
    FOREIGN KEY (breed_id) REFERENCES breeds (id)
);

CREATE TABLE colors
(
    id    integer PRIMARY KEY AUTOINCREMENT,
    color varchar(15)
);

CREATE TABLE animals_colors
(
    color_id  integer,
    animal_id integer,
    FOREIGN KEY (color_id) REFERENCES colors (id),
    FOREIGN KEY (animal_id) REFERENCES my_animals (id),
    PRIMARY KEY (color_id, animal_id)
)

