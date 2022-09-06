-- Database: trigger_hospital

-- DROP DATABASE IF EXISTS trigger_hospital;

CREATE DATABASE trigger_hospital
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
values ('Bruna'), ('Kauã'), ('Rafael');

insert into especialidades (especialidade)
values ('Clínica geral'), ('Urologista'), ('Cardiologista');

insert into consultas (id_especialidades, id_pacientes, id_profissionais)
values (2,1,1), (2,2,2), (2,3,3);

DROP TABLE consultas;

select * from pacientes;
select * from profissionais;
select * from especialidades;
select * from consultas;

CREATE TRIGGER ValidaDadosConsulta
	AFTER INSERT OR UPDATE ON consultas
	FOR EACH ROW
	EXECUTE PROCEDURE ValidaDadosConsulta();
	
CREATE OR REPLACE FUNCTION ValidaDadosConsulta()
RETURNS TRIGGER AS $$
BEGIN
	raise notice 'o trigger rodou!!';
	raise notice 'CONSEGUI FAZER 10 MINUTOS ANTES DA ATIVIDADE FECHAR🙏';
	RETURN NEW;
END
$$ LANGUAGE plpgsql;
	
