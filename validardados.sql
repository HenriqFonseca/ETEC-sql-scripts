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

ALTER TABLE consultas ADD COLUMN last_user_updated varchar(100);
ALTER TABLE consultas ADD COLUMN last_time_updated timestamp;

ALTER TABLE consultas
ADD CONSTRAINT FKProfissionalDaConsulta FOREIGN KEY
(id_profissionais)
REFERENCES profissionais(id_profissionais);

insert into pacientes (nomePaciente, sexo)
values ('henrique','f'), ('fernando','m'), ('nibi','m');

insert into profissionais(nomeProfissionais)
values ('Bruna'), ('Kauã'), ('Rafael'), ('');

insert into especialidades (especialidade)
values ('ginecologista'), ('urologista'), ('Cardiologista');

insert into consultas (id_especialidades, id_pacientes, id_profissionais)
values (2,2,1), (2,2,2), (3,3,3);

-- inserindo apenas pessoas do sexo masculino que vão passar no ginecologista
insert into consultas (id_especialidades, id_pacientes, id_profissionais)
values (1,2,2);

-- inserindo apenas pessoas do sexo feminino que vão passar no urologista
insert into consultas (id_especialidades, id_pacientes, id_profissionais)
values (2,1,1);

-- valor null pra paciente
insert into consultas (id_especialidades, id_profissionais)
values (1,1);

--valor null para especialidade
insert into consultas (id_pacientes, id_profissionais)
values (2,1);

--valor null para profissional
insert into consultas (id_especialidades, id_pacientes)
values (3,3);




DROP TABLE consultas;
DROP TABLE pacientes;
DROP TABLE profissionais;
DROP TABLE especialidades;

select * from pacientes;
select * from profissionais;
select * from especialidades;
select * from consultas;

select c.id_consultas, pac.nomePaciente, p.nomeProfissionais, e.especialidade, c.insertDate, c.last_user_updated,c.last_time_updated
	from consultas as c
	inner join pacientes as pac on pac.id_pacientes = c.id_pacientes
	inner join especialidades as e on e.id_especialidades = c.id_especialidades
	inner join profissionais as p on p.id_profissionais = c.id_profissionais

CREATE TRIGGER ValidaDadosConsulta
	AFTER INSERT OR UPDATE ON consultas
	FOR EACH ROW
	EXECUTE PROCEDURE ValidaDadosConsulta();

CREATE TRiGGER verifynull
AFTER INSERT OR UPDATE ON consultas
FOR EACH ROW
EXECUTE PROCEDURE verifynull();


	
CREATE OR REPLACE FUNCTION ValidaDadosConsulta()
RETURNS TRIGGER AS $$
DECLARE
paciente_row	RECORD;
especialidade_row RECORD;
BEGIN

        SELECT INTO paciente_row
        *  FROM pacientes as p 
		where id_pacientes = NEW.id_pacientes;

        SELECT INTO especialidade_row
        *  FROM especialidades as e
		where id_especialidades = NEW.id_especialidades;

        IF paciente_row.sexo = 'm'
		AND especialidade_row.especialidade = 'ginecologista' THEN
           RAISE EXCEPTION 'Ginecologista apenas para pacientes do sexo feminino';
        ELSEIF paciente_row.sexo = 'f' 
		AND especialidade_row.especialidade = 'urologista' THEN
           RAISE EXCEPTION 'Urologista apenas para pacientes do sexo masculino';
        END IF;
        
        
        --AUDITA MODIFICACAO 
        NEW.last_time_updated := current_timestamp;
        NEW.last_user_updated := paciente_row.nomePaciente;
	RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verifynull()
RETURNS TRIGGER AS $null$
BEGIN

	
	IF NEW.id_pacientes IS NULL THEN
            RAISE EXCEPTION 'paciente não informado)';
        END IF;
        
        IF NEW.id_especialidades IS NULL THEN
            RAISE EXCEPTION 'especialidade não informada';
        END IF;

        IF NEW.id_profissionais IS NULL THEN
            RAISE EXCEPTION 'profissional não informado';
        END IF;
RETURN NEW;
END
$null$ LANGUAGE plpgsql;
