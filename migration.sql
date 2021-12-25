insert into colors (color)
select color
from (
         select DISTINCT(rtrim(color1)) as color
         from animals
         union all
         select DISTINCT(rtrim(color1)) as color
         from animals)
where color is not null
group by color
;

insert into outcome_subtype (subtype)
select outcome_subtype
from animals
group by outcome_subtype;

insert into outcome_type (type)
select outcome_type
from animals
group by outcome_type;

insert into outcome (type_id, subtype_id, age_upon, year, month)
select t.id             as type_id,
       s.id             as subtype_id,
       age_upon_outcome as age_upon,
       outcome_year     as year,
       outcome_month    as month,
       animal_id
from animals
         inner join outcome_type as t
                    on t.type = animals.outcome_type
         inner join outcome_subtype as s
                    on s.subtype = animals.outcome_subtype;

insert into types (type)
select animal_type as type
from animals
group by animal_type;

insert into breeds (name)
select breed
from animals
group by breed;

replace into animals_colors (color_id, animal_id)
select colors.id as color_id,
       animal_id
from animals
         join colors on
    rtrim(animals.color1) = colors.color
union all
select colors.id as color_id,
       animal_id
from animals
         join colors on
    rtrim(animals.color2) = colors.color;

insert into my_animals
select a.id      as id,
       a.name    as name,
       types.id  as type_id,
       breeds.id as breed_id,
       date_of_birth
from (select animal_id   as id,
             name,
             date_of_birth,
             animal_type as type,
             breed
      FROM animals
      group by animal_id) as a
         join types on a.type = types.type
         join breeds on a.breed = breeds.name


