CREATE TABLE livros (
id_livros int PRIMARY KEY NOT NULL,
titulo varchar(100) NOT NULL,
autor varchar(100) NOT NULL
);

CREATE TABLE usuarios (
id_usuarios int PRIMARY KEY,
nome varchar(100) not null,
idade integer NOT NULL
);

CREATE TABLE emprestimos (
id_emprestimos int PRIMARY KEY NOT NULL,
id_livros integer ,
id_usuarios integer,
data_emprestimo date ,
);

ALTER TABLE emprestimos
	ADD CONSTRAINT fk_livros FOREIGN KEY (id_livros) REFERENCES livros (id_livros);

ALTER TABLE emprestimos
	ADD CONSTRAINT fk_usuarios FOREIGN KEY (id_usuarios) REFERENCES usuarios (id_usuarios);


insert into livros
(id_livros, titulo, autor)
VALUES
(1,'O Essencial da psicologia','Carl Gustav Jung')

insert into livros
(id_livros, titulo, autor)
VALUES
(2,'Deuses Americanos','Neil Gaiman')

insert into livros
(id_livros, titulo, autor)
VALUES
(3,'Filhos de Anansi','Neil Gaiman')

insert into livros
(id_livros, titulo, autor)
VALUES
(4,'Coraline','Neil Gaiman')

insert into livros
(id_livros, titulo, autor)
VALUES
(5,'Sandman','Neil Gaiman')

insert into livros
(id_livros, titulo, autor)
VALUES
(6,'Harry Potter e as Relíquias da Morte','J.K Rowling')

insert into livros
(id_livros, titulo, autor)
VALUES
(7,'Harry Potter e a Pedra Filosofal','J.K Rowling')

insert into livros
(id_livros, titulo, autor)
VALUES
(8,'O corvo e outros contos de Edgar Alan Poe','Edgar Alan Poe')

insert into livros
(id_livros, titulo, autor)
VALUES
(9,'O Auto da Compadecida','Ariano Suassuna')

insert into livros
(id_livros, titulo, autor)
VALUES
(10,'Mein Kampf','Adolf Hitler')


select * from livros

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(1,'Sergio','18')

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(2,'Renato','14')

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(3,'Maria','27')

insert into dbo.usuarios
(id_usuarios, nome, idade)
VALUES
(4,'Mario','23')

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(5,'Juliana','55')

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(6,'Leticia','19')

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(7,'Joyce','13')

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(8,'Kaua','14')

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(9,'Rafael','22')

insert into usuarios
(id_usuarios, nome, idade)
VALUES
(10,'Bruna','21')

select * from usuarios

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(1,1,3,'22/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(2,6,3,'22/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(3,2,2,'18/04/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(4,9,7,'01/03/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(5,8,6,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(6,4,9,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(7,5,5,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(8,10,1,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(9,5,2,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_usuarios, data_emprestimo)
VALUES
(10,8,10,'06/05/2022')


select l.id_livros, l.titulo, u.id_usuarios, u.nome,u.idade, e.data_emprestimo
	from emprestimos as e
	inner join usuarios as u on u.id_usuarios = e.id_emprestimos
	inner join livros as l on l.id_livros = e.id_usuarios
	where u.idade <18

select l.id_livros, l.titulo, u.id_usuarios, u.nome,u.idade, e.data_emprestimo
	from emprestimos as e
	inner join usuarios as u on u.id_usuarios = e.id_emprestimos
	inner join livros as l on l.id_livros = e.id_usuarios
