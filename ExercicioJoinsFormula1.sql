create table pais (
	cd_pais int IDENTITY(1,1) primary key not null,
    nm_pais varchar(255) not null
);

create table equipe (
	cd_eq int IDENTITY(1,1) primary key not null ,
    nm_eq varchar(255) not null,
    cd_pais int not null,
    foreign key(cd_pais) references pais(cd_pais)
);

create table piloto (
	cd_pil int IDENTITY(1,1) primary key not null ,
	nm_pil varchar(255) not null,
    cd_eq int,
    foreign key(cd_eq) references equipe(cd_eq),
    cd_pais int,
    foreign key(cd_pais) references pais(cd_pais)
);

create table circuito (
	cd_cir int IDENTITY(1,1) primary key not null ,
    nm_cir varchar(255) not null,
    cd_pais int,
    foreign key(cd_pais) references pais(cd_pais)
);

create table prova (
	cd_pro int IDENTITY(1,1) primary key not null ,
    tp_pro varchar(150) not null,
    dt_pro date not null,
    cd_cir int,
    foreign key(cd_cir) references circuito(cd_cir)
);

create table piloto_pos ( 
	posicao int,
    cd_pil int,
    foreign key(cd_pil) references piloto(cd_pil),
    cd_pro int,
    foreign key(cd_pro) references prova(cd_pro)
);

INSERT INTO pais (nm_pais) VALUES
('Brasil'),
('Espanha'),
('Reino Unido'),
('Alemanha'),
('Itália'),
('Lituania'),
('México');

INSERT INTO equipe (nm_eq, cd_pais) VALUES
('Mercedes', 3),
('Red Bull Racing', 4),
('Ferrari', 5),
('McLaren', 3),
('Alpine', 2);

INSERT INTO piloto (nm_pil, cd_eq, cd_pais) VALUES
('Lewis Hamilton', 1, 3),
('Sebastian Vettel', 1, 3),
('George Russell', 1, 3),
('Max Verstappen', 2, 1),
('Charles Leclerc', 3, 5),
('Lando Norris', 4, 3),
('Fernando Alonso', 5, 2);

INSERT INTO circuito (nm_cir, cd_pais) VALUES
('Interlagos', 1),
('Catalunya', 2),
('Silverstone', 3),
('Nurburgring', 4),
('Monza', 5);

INSERT INTO prova (tp_pro, dt_pro, cd_cir) VALUES
('Grande Prêmio do Brasil', '2022-11-06', 1),
('Grande Prêmio da Espanha', '2022-05-08', 2),
('Grande Prêmio da Grã-Bretanha', '2022-07-17', 3),
('Grande Prêmio da Alemanha', '2022-09-11', 4),
('Grande Prêmio da Itália', '2022-09-18', 5);

-- Inserções para tabela 'piloto_pos'
INSERT INTO piloto_pos (posicao, cd_pil, cd_pro) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

/* 1 Listar o nome de cada equipe seguida do nome do país que ela representa,
mas listar também os demais países que não tem representação. */

select nm_eq, p.nm_pais from equipe as e
full outer join pais as p on p.cd_pais = e.cd_pais

/* 2. Listar o nome de cada equipe seguida do nome do país que ela representa. */
select nm_eq, p.nm_pais from equipe as e
inner join pais as p on p.cd_pais = e.cd_pais

/* 3 Listar o nome dos pilotos que obtiveram 1º lugar em alguma prova (posiçao=1).
Não é necessário repetir o nome do piloto caso ele tenha obtido o 1º lugar em mais de uma prova. */

select nm_pil from piloto as pil
inner join piloto_pos as pos on pos.posicao = pil.cd_pil
where posicao = 1;

/* 4. Listar o nome dos pilotose a posição de cada um obtidano GP do Brasil.  */

select nm_pil, posicao from piloto as pil
inner join piloto_pos as pos on pos.posicao = pil.cd_pil

/* 5. Listar o nome da equipe, seguida do número de pilotos da equipe.  */
select e.nm_eq, 
COUNT(nm_pil) as nm_pil_count
from piloto as pil
inner join equipe as e on e.cd_eq = pil.cd_eq
group by e.nm_eq

/* 6. Listar o nome da equipe, seguida do número de pilotos da equipe,
somente quando o número de pilotos por equipe for maior do que 2.  */
select e.nm_eq, 
COUNT(nm_pil) as nm_pil_count
from piloto as pil
inner join equipe as e on e.cd_eq = pil.cd_eq
group by e.nm_eq
HAVING COUNT(nm_pil) >2;
