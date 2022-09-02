-- Database: hospital

-- DROP DATABASE IF EXISTS hospital;

CREATE DATABASE hospital
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	create table pacientes(
    id_pacientes int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,	
    nomePaciente varchar(40) not null,
    sexo varchar (1),
	/*tive que utilizar o BIT pois n�o h� boolean type no sqlserver. 1 = true, 0 = false */
    obito BIT
	);

create table profissionais(
    id_profissionais int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nomeProfissionais varchar(50),
	insertDate TIMESTAMP NOT NULL DEFAULT NOW()
    );

create table especialidades(
    id_especialidades int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    especialidade varchar(50),
	insertDate TIMESTAMP NOT NULL DEFAULT NOW()
);

create table consultas (
    id_consultas int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_especialidades int,
    id_pacientes int,
    id_profissionais int,
	insertDate TIMESTAMP NOT NULL DEFAULT NOW()
);



ALTER TABLE consultas
ADD CONSTRAINT FKEspecialidadeDaConsulta FOREIGN KEY
(id_especialidades)
REFERENCES
especialidades (id_especialidades);

ALTER TABLE consultas
ADD CONSTRAINT FKProfissionalDaConsulta FOREIGN KEY
(id_profissionais)
REFERENCES profissionais(id_profissionais);

insert into pacientes (nomePaciente, sexo)
values ('henrique','m'), ('fernando','m'), ('nibi','m');

insert into profissionais(nomeProfissionais)
values ('Bruna'), ('Kau�'), ('Rafael');

insert into especialidades (especialidade)
values ('Cl�nica geral'), ('Urologista'), ('Cardiologista');

insert into consultas (id_especialidades, id_pacientes, id_profissionais)
values (2,1,1), (2,2,2), (2,3,3);

DROP TABLE consultas;

select * from pacientes;
select * from profissionais;
select * from especialidades;
select * from consultas;

select c.id_consultas, pac.nomePaciente, p.nomeProfissionais, e.especialidade, c.insertDate
	from consultas as c
	inner join pacientes as pac on pac.id_pacientes = c.id_pacientes
	inner join especialidades as e on e.id_especialidades = c.id_especialidades
	inner join profissionais as p on p.id_profissionais = c.id_profissionais

create OR REPLACE function trgValidaDadosConsulta()
RETURNS trigger AS trgValidaDadosConsulta

DECLARE
pac_row record;
espec_row record;

BEGIN
	raise notice 'o trigger rodou!!';
	RETURN NEW;
END
$trgValidaDadosConsulta$ LANGUAGE plpgsql;

create TRIGGER validaDadosConsulta
before insert or UPDATE on consultas
FOR each ROW
EXECUTE PROCEDURE trgValidaDadosConsulta();