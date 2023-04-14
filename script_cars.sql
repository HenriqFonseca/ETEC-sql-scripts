CREATE TABLE veiculo(
idVeiculo int PRIMARY KEY,
placa VARCHAR(45),
modelo VARCHAR(45),		  
fabricante VARCHAR(45),
combustivel VARCHAR(45),
ano int,
valor float,
quilometragem float
);				  

INSERT INTO veiculo
(idVeiculo, placa, modelo, fabricante, combustivel, ano, valor, quilometragem)
VALUES 
(1,'ABC1D23', 'fiat uno', 'FIAT', 'diesel', '2004', '15000', '0'),
(2,'ABC2D34', 'GOL', 'Wolkswagen', 'etanol', '2007', '20000', '50000'),
(3,'CBA5D51', 'Vectra', 'Nissan', 'gasolina', '2010', '16000', '25000'),
(4,'HAW1D23', 'Supra', 'Toyota', 'gasolina', '1993', '75000', '0'),
(5,'AHA1D52', 'BMW X3', 'BMW', 'etanol', '2015', '80000', '5000'),
(6,'PWO1D21', 'Chevett', 'Chevrolet', 'etanol', '1991', '15000', '150000'),
(7,'ANH2D34', 'HB20', 'Hyundai', 'etanol', '2007', '20000', '45000'),
(8,'CAB5D95', 'Ferrari F-40', 'Ferrari', 'gasolina', '1995', '16000', '29000'),
(9,'ISW1D43', 'Jetta', 'Wolkswagen', 'etanol', '1990', '75000', '50000'),
(10,'AWE1D82', 'NISSAN 350Z', 'Nissan', 'gasolina', '2015', '80000', '90000')
;

SELECT * FROM veiculo

SELECT fabricante, modelo, ano 
FROM veiculo
WHERE ano>2000

SELECT * FROM veiculo
WHERE combustivel = 'gasolina'
ORDER BY valor ASC

SELECT fabricante, modelo, ano, valor 
FROM veiculo
WHERE valor>=15000 AND valor<=25000
ORDER BY valor DESC

SELECT placa, quilometragem FROM veiculo
WHERE quilometragem <30000

SELECT * FROM veiculo
WHERE combustivel = 'gasolina' OR combustivel = 'etanol'

SELECT * FROM veiculo
WHERE fabricante = 'fiat' AND combustivel = 'diesel'

UPDATE veiculo
	SET valor = 60000
	WHERE fabricante = 'fiat'

Delete from veiculo
Where fabricante = 'Nissan';
