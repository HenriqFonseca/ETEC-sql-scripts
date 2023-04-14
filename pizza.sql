create table pizza (
id_pizza int identity (1,1) PRIMARY KEY,
sabor VARCHAR(100),
quantidade int,
preco decimal (5,2)
);

insert into pizza values
('mussarela','11','22.99'),
('calabresa','10','25.99'),
('portuguesa','9','25.99'),
('quatro queijos','17','29.99'),
('brasileira','85','28.99'),
('Frango com cheddar','8','24.99'),
('Frango com catupiry','33','24.99'),
('atum','45','22.99'),
('aliche','10','19.99'),
('baiana','42','28.99');

select max(preco) from pizza

select count(*) from pizza

select max(quantidade) from pizza

select min(quantidade) from pizza

select sum(preco) from pizza