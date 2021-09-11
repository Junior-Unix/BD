USE secao04;


SELECT * FROM tipos_produto;

START TRANSACTION;
	UPDATE tipos_produto SET codigo = 3 WHERE codigo = 7;
	INSERT INTO tipos_produto (codigo, descricao) VALUES (3, 'Farmacia');
	DELETE farmacia;
COMMIT;

ROLLBACK;

CREATE DATABASE secao05;

USE secao05;

SHOW DATABASES;
SHOW TABLES;

CREATE TABLE tipos_produto(
	codigo INT NOT NULL AUTO_INCREMENT,
    descricao VARcHAR(30) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE produtos(
	codigo INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    preco DECIMAL(8,2),
    codigo_tipo INT NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_tipo) REFERENCES tipos_produto(codigo)
);

INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', '1000', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', '300', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', '500', 2); 


SELECT * FROM produtos;
SELECT * FROM produtos WHERE codigo_tipo = 2;
SELECT * FROM produtos WHERE codigo_tipo = 1;

SELECT * FROM produtos WHERE codigo_tipo = 2 AND preco > 300;

SELECT * FROM tipos_produto;
SELECT * FROM produtos;
SELECT * FROM 


#Informa o produto pelo nome e não pelo id.
SELECT p.codigo AS 'Codigo', p.descricao AS 'Descricao', p.preco AS 'Preco', tp.descricao AS 'Tipo Produto'
	FROM produtos AS p, tipos_produto AS tp
    WHERE p.codigo_tipo = tp.codigo;
    