create table funcionario(
id_funcionario int identity (1,1) PRIMARY KEY,
primeiroNome varchar(100),
segundoNome varchar(100),
ultimoNome varchar(100),
dataNasc date,
cpf varchar(100),
rg varchar(100),
endereco varchar(100),
cep varchar(100),
cidade varchar(100),
telefone  varchar(100),
id_departamento int,
funcao varchar(100),
salario float
);


insert into	funcionario 
(primeiroNome, segundoNome, ultimoNome,dataNasc,cpf,rg,endereco,cep,cidade,telefone,id_departamento,funcao,salario)
VALUES
('Nathan','Neves','Nunes','17/11/2004','49057210835','535231337',
'rua josé vieira guimaraes', '08430421', 'são paulo','11949046721','3','empacotador', '2000'),


('Danilo','Pedro','Moreira','13/03/1944','179.327.339-10','40.192.721-0',
'Quadra 16 MR 3', '73751-500', 'Planaltina','(61) 98582-6268','3','estagiario', '1300'),

('Manuel','Leonardo','Souza','05/04/1945','469.255.121-63','18.290.360-6',
'Avenida Serzedelo Corrêa', '66033-770', 'Ituiutaba','(91) 3982-6023','1','telefonista', '4000'),

('Valentina','','Caldeira','23/02/1964','778.120.881-11','32.998.058-0',
'Rua José de Oliveira', '49085-170', 'Aracaju','(79) 2927-6604','2','telemarketing', '1500'),

('Vera','Regina','Elaine','02/04/1990','763.538.400-71','34.945.821-2',
'Rua Assis Brasil', '49043-675', 'Aracaju','(79) 98169-8428','3','transporte', '4000'),

('Aparecida','Stefany','Heloise','19/02/1964','584.175.282-02','19.712.972-9',
'Rua Urias Ribeiro', '79075-180', 'Três Lagoas','(67) 3750-9184','3','transporte', '4000'),

('Daniel','','Paz','01/04/1985','807.416.171-45','36.653.883-4',
'Rua Rio Alalaú', '69315-002', 'Ituiutaba','(95) 99957-2507','1','telefonista', '3500'),

('Yuri','Daniel','Baptista','25/02/1975','002.016.194-82','21.103.656-0',
'21.103.656-0', '13480-013', 'Limeira','(19) 99766-3188','1','ScruMaster', '8000'),

('Enzo','','Jesus','22/02/1978','368.833.036-69','13.293.674-4',
'Rua Ana Amélia', '65608-540', 'Caxias','(99) 98176-0078','2','Suporte', '2000'),

('Marcos','Vinicius','Viana','02/02/1976','395.253.115-46','42.919.989-2',
'Rua Francisco Rodrigues da Rocha', '59631-455', 'Mossoró','(84) 98979-5235','1','Técnico de Redes', '8000'),

('Ester','','Martins','23/01/1977','961.865.043-01','19.314.669-1',
'Rua Paciência', '28070-287', 'Campos dos Goytacazes','(22) 99721-2241','2','Atendente', '1500'),

('Emilly','Alessandra','Neves','10/02/1992','689.843.419-59','23.460.571-6',
'Rua Sabino Silveira', '97578-190', 'Santana do Livramento','(55) 99707-8910','2','Gerente', '4000');
select * from funcionario

select primeiroNome, ultimoNome from funcionario
ORDER BY ultimoNome ASC

select * from funcionario
order by cidade 

select primeiroNome,segundoNome,ultimoNome,salario from funcionario
where salario > 1000
order by primeiroNome

select primeiroNome, dataNasc from funcionario
order by dataNasc DESC

select telefone, primeiroNome, ultimoNome, endereco, cidade from funcionario

select primeiroNome, ultimoNome from funcionario 
where segundoNome = ''

select * from funcionario
where cidade = 'Ituiutaba' AND funcao = 'telefonista'

select primeiroNome, segundoNome,ultimoNome from funcionario
where id_departamento = 2

select primeiroNome,ultimoNome, id_departamento from funcionario
where salario > 2000

/*
drop table funcionario
*/