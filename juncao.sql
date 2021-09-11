CREATE DATABASE agregacao;

USE agregacao;

CREATE TABLE categorias(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT, 
	descricao VARCHAR(60) NOT NULL,
	preco_venda DECIMAL(8,2) NOT NULL,
	preco_custo DECIMAL(8,2) NOT NULL,
	id_categoria int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);


INSERT INTO categorias (nome) VALUES ('Material Escolar');
INSERT INTO categorias (nome) VALUES ('Acessório Informática');
INSERT INTO categorias (nome) VALUES ('Material Escritório');
INSERT INTO categorias (nome) VALUES ('Game');

SELECT * FROM categorias;

START TRANSACTION;
UPDATE categorias set nome = 'Video Game' WHERE id = 4; 
UPDATE tipos_produto set descricao = 'Nobreak' WHERE codigo = 3;
COMMIT;

START TRANSACTION;
COMMIT;
ROLLBACK;

UPDATE categorias set nome = 'Insumos informática' WHERE id = 2;
SELECT * FROM produtos;
START TRANSACTION;


UPDATE produtos set preco_custo = 5.25 WHERE id = 4;
COMMIT;
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caderno', '5.45', '2.30', 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caneta', '1.20', '0.45', 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Pendrive 32GB', '120.54', '32.55', 2);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Mouse', '17.00', '4.30', 2);

#max
SELECT MAX(preco_venda) FROM produtos;
#min
SELECT MIN(preco_venda) FROM produtos;
#avg
SELECT AVG(preco_venda) FROM produtos;
#round
SELECT ROUND(AVG(preco_venda),2) FROM produtos;
#count
SELECT COUNT(preco_venda) AS Quantidade FROM produtos WHERE id_categoria = 1;
#group by
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria;
#having
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria HAVING MAX(preco_venda) > 10;



