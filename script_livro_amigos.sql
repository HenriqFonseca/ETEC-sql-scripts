CREATE TABLE livros (
id_livros int PRIMARY KEY NOT NULL,
titulo varchar(100) NOT NULL,
autor varchar(100) NOT NULL
);

CREATE TABLE amigos (
id_amigos int PRIMARY KEY,
nome varchar(100) not null,
idade integer NOT NULL
);

CREATE TABLE emprestimos (
id_emprestimos int PRIMARY KEY NOT NULL,
id_livros integer ,
id_amigos integer,
data_emprestimo date ,
);

ALTER TABLE emprestimos
	ADD CONSTRAINT fk_livros FOREIGN KEY (id_livros) REFERENCES livros (id_livros);

ALTER TABLE emprestimos
	ADD CONSTRAINT fk_amigos FOREIGN KEY (id_amigos) REFERENCES amigos (id_amigos);


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

insert into amigos
(id_amigos, nome, idade)
VALUES
(1,'Rafa','18')

insert into amigos
(id_amigos, nome, idade)
VALUES
(2,'Kauã','17')

insert into amigos
(id_amigos, nome, idade)
VALUES
(3,'Robson','88')

insert into amigos
(id_amigos, nome, idade)
VALUES
(4,'Camile','19')

insert into amigos
(id_amigos, nome, idade)
VALUES
(5,'Bruna','18')

insert into amigos
(id_amigos, nome, idade)
VALUES
(6,'Leticia','16')

insert into amigos
(id_amigos, nome, idade)
VALUES
(7,'Joyce','17')



select * from amigos

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(1,1,3,'04/06/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(2,8,4,'29/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(3,4,2,'18/04/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(4,1,6,'01/03/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(5,2,1,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(6,10,5,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(7,1,5,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(8,6,7,'06/05/2022')

insert into emprestimos
(id_emprestimos, id_livros, id_amigos, data_emprestimo)
VALUES
(9,7,7,'06/05/2022')

select * from emprestimos

select l.id_livros, l.titulo, a.id_amigos, a.nome,a.idade, e.data_emprestimo
	from emprestimos as e
	inner join amigos as a on a.id_amigos = e.id_amigos
	inner join livros as l on l.id_livros = e.id_livros
