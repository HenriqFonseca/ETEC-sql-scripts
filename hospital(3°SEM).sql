create table pacientes(
    id_pacientes int identity(1,1) PRIMARY KEY,
    nomePaciente varchar(40) not null,
    sexo varchar (1),
	/*tive que utilizar o BIT pois não há boolean type no sqlserver. 1 = true, 0 = false */
    obito BIT,
    );

create table profissionais(
    id_profissionais int identity(1,1) PRIMARY KEY,
    nomeProfissionais varchar(50),
	insertDate datetime NOT NULL,
    );

create table especialidades(
    id_especialidades int identity(1,1) PRIMARY KEY,
    especialidade varchar(50),
	insertDate datetime NOT NULL,
);

create table consultas (
    id_consultas int identity(1,1) PRIMARY KEY,
    id_especialidades int,
    id_pacientes int,
    id_profissionais int,
	insertDate datetime
)

create table obitos (
     id_obitos int identity(1,1) PRIMARY KEY, 
    obs text);

ALTER TABLE consultas
ADD CONSTRAINT FKEspecialidadeDaConsulta FOREIGN KEY
(id_especialidades)
REFERENCES
especialidades (id_especialidades);

ALTER TABLE consultas
ADD CONSTRAINT FKProfissionalDaConsulta FOREIGN KEY
(id_profissionais)
REFERENCES profissionais(id_profissionais);

insert into pacientes (nomePaciente, sexo, obito)
values ('henrique','m',0), ('fernando','m',0), ('nibi','m',1)

insert into profissionais(nomeProfissionais, insertDate)
values ('Bruna',getdate()), ('Kauã',getdate()), ('Rafael',getdate())

insert into especialidades (especialidade, insertDate)
values ('Clínica geral', getdate()), ('Urologista',getdate()), ('Cardiologista',getdate())

insert into consultas (id_especialidades, id_pacientes, id_profissionais, insertDate)
values (3,1,1,getdate()), (1,2,2,getdate()), (2,3,3,getdate())


select * from pacientes
select * from profissionais
select * from especialidades
select * from consultas

select c.id_consultas, pac.nomePaciente, p.nomeProfissionais, e.especialidade, c.insertDate
	from consultas as c
	inner join pacientes as pac on pac.id_pacientes = c.id_pacientes
	inner join especialidades as e on e.id_especialidades = c.id_especialidades
	inner join profissionais as p on p.id_profissionais = c.id_profissionais

/*
drop table pacientes
drop table profissionais
drop table especialidades
drop table obitos
drop table consultas
*/


