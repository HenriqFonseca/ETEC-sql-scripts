create table produto(
id_produto int identity(1,1) PRIMARY KEY,
nomeProduto varchar(100),
);

create table cliente(
id_cliente int identity(1,1)PRIMARY KEY,
nomeCliente varchar(150),
idade int
);

create table vendas (
id_vendas int identity(1,1)PRIMARY KEY,
id_cliente int,
id_produto int
);

/*
Drop table produto
drop table cliente
drop table vendas
*/
ALTER TABLE vendas 
	add constraint fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);

ALTER TABLE vendas 
	add constraint fk_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto);

insert into produto(nomeProduto)
VALUES
('Caixa de areia'), ('Bolinha'), ('Whiskas'), ('Coleira') ,('Shampoo pets');

select * from produto

insert into cliente (nomeCliente, idade)
VALUES
('Henrique', '17'), ('Rafael', '18'), ('Kauã', '17'), ('Bruna', '18') ,('Camile', '18'), ('Robson' , '38');

select * from cliente

insert into vendas (id_cliente, id_produto)
VALUES
('1','1'),('3','4'),('2','2'),('1','3'),('4','4'),('5','2'),('5','1');

select * from vendas

/*quem comprou o que*/
select c.id_cliente, c.nomeCliente, p.nomeProduto, p.id_produto
	from vendas as v
	join cliente as c on c.id_cliente = v.id_cliente
	join produto as p on p.id_produto = v.id_produto

/* exibir todos os produtos (mesmo sem ter sido comprado) */
select c.id_cliente, c.nomeCliente, p.nomeProduto, p.id_produto
	from vendas as v
	right join cliente as c on c.id_cliente = v.id_cliente
	right join produto as p on p.id_produto = v.id_produto

