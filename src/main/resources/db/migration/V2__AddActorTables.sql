create table Actor (
    id int primary key,
    name varchar(255)
);

create table Acting (
    actor_id int,
    movie_id int,
    primary key (actor_id, movie_id),
    foreign key (actor_id) references Actor(id),
    foreign key (movie_id) references Movie(id)
);
