CREATE TABLE livros (
id_livros int identity(1,1) PRIMARY KEY  not null,
titulo varchar(100) NOT NULL,
autor varchar(100) NOT NULL,
);


CREATE TABLE amigos (
id_amigos int identity(1,1) PRIMARY KEY  not null,
nome_amigo varchar(100) not null,
);


CREATE TABLE emprestimos (
id_emprestimos int identity(1,1) PRIMARY KEY,
id_livros int  not null,
id_amigos int  not null,
data_emprestimo date  not null,
);


ALTER TABLE emprestimos
ADD CONSTRAINT fk_livros FOREIGN KEY (id_livros) REFERENCES livros (id_livros);


ALTER TABLE emprestimos
ADD CONSTRAINT fk_amigos FOREIGN KEY (id_amigos) REFERENCES amigos (id_amigos);


insert into livros (titulo, autor)
Values
('Deuses Americanos', 'Neil Gaiman' ), ('Coraline', 'Neil Gaiman' ), ('Sandman', 'Neil Gaiman' ), ('Filhos de Anansi', 'Neil Gaiman'), ('1984', 'George Orwell' ), ('Revolução dos Bichos', 'George Orwell')


insert into amigos (nome_amigo)
values
('Fernando'),('Black Friday'), ('Flora'), ('Jeguelson'),('Henrique'), ('Felipe')


insert into emprestimos(id_amigos, id_livros, data_emprestimo)
values
('1' , '3' , '22/06/2022'), ('3' , '6' , '15/05/2022'), ('4' , '2' , '19/03/2022'), ('2' , '3' , '30/05/2022'), ('4' , '1' , '11/06/2022'), ('1' , '1' , '22/06/2022'), ('1' , '2' , '22/06/2022')


/*
DROP TABLE livros
DROP TABLE emprestimos
DROP TABLE amigos
*/



select * from livros
select * from amigos
select * from emprestimos

/* 1- Listagem Livro, numero do exemplar e quem alugou */

select l.titulo, l.id_livros, l.autor, a.nome_amigo from emprestimos as e
inner join amigos as a on a.id_amigos = e.id_amigos
inner join livros as l on l.id_livros = e.id_livros

/* 2- Livros disponíveis  */
select a.nome_amigo, l.titulo, l.autor from emprestimos as e
right join amigos as a on a.id_amigos = e.id_amigos
right join livros as l on l.id_livros = e.id_livros
where e.id_emprestimos is null


/* 3-  exibir livros emprestados */
select a.nome_amigo, l.titulo, l.autor from emprestimos as e
inner join amigos as a on a.id_amigos = e.id_amigos
inner join livros as l on l.id_livros = e.id_livros


/* 4 - listagem de pessoas mesmo com livros ou não*/
select a.nome_amigo, l.titulo, l.autor from emprestimos as e
full outer join amigos as a on a.id_amigos = e.id_amigos
full outer join livros as l on l.id_livros = e.id_livros
where a.id_amigos != 0
