CREATE DATABASE secao04;

use secao04;
USE banco;
create table tipos_produto(
	codigo int not null auto_increment,
    descricao varchar(30) not null,
    primary key(codigo)
);

create table produtos(
	codigo int not null auto_increment primary key,
    descricao varchar(30) not null,
    preco decimal(8,2) not null,
    codigo_tipo int not null,
    foreign key (codigo_tipo) references tipos_produto(codigo)
);

INSERT INTO tipos_produto (descricao) VALUES ('Computadores');
INSERT INTO tipos_produto (descricao) VALUES ('Impressoras');
INSERT INTO tipos_produto (descricao) VALUES ('Apple');


INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Descktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato de Tinta', '300', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', '500', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Notebook', '1200', 1);
INSERT INTO produtos VALUES (NULL, 'Macbook Pro', '7200', 3);
INSERT INTO produtos VALUES (NULL, 'iPad', '3200', 3);

SELECT * FROM tipos_produto;
SELECT * FROM produtos;

SELECT codigo,descricao FROM tipos_produto;
SELECT descricao,codigo FROM tipos_produto;

SELECT p.codigo AS cod, p.descricao AS descri, p.preco AS pre, p.codigo_tipo AS ctp FROM produtos AS p;

UPDATE produtos set codigo_tipo = 3  WHERE descricao = 'Macbook Pro';

DELETE FROM produtos WHERE codigo = 4;

#NUNCA ESQUEÇA DE FILTRAR O REGISTRO COM O WHERE.


