CREATE DATABASE juncao;

USE juncao;

CREATE TABLE profissoes(
	id INT NOT NULL AUTO_INCREMENT,
    cargo VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(10) NOT NULL,
    id_profissao INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_profissao) REFERENCES profissoes(id)
);

INSERT INTO profissoes (cargo) VALUES ('Programador');
INSERT INTO profissoes (cargo) VALUES ('Analista de Sistemas');
INSERT INTO profissoes (cargo) VALUES ('Suporte');
INSERT INTO profissoes (id, cargo) VALUES (4, 'Gerente');

SELECT * FROM profissoes;
#DELETE FROM profissoes WHERE id = 7;

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('João Pereira', '1981-06-15', '1234-5678', 1);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Ricardo da Silva', '1973-10-1-', '2234-4923', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Felipe Oliveira', '1987-02-05', '3923-8422', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Mário Pirez', '1993-09-04', '4534-4244', 1);

SELECT * FROM clientes; #WHERE id_profissao = profissoes;

--Junção de produto cartesiano
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c, profissoes AS p
	WHERE c.id_profissao = p.id;

--Inner Join
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c INNER JOIN profissoes AS p
ON c.id_profissao = p.id;

--Rigth Outer Join

SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

--Left Outer join
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

--Full Outer Join (Não funciona no MySQL)
SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

--Full Outer Join ( Versão MySQL)
SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id
UNION
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

--Cross Join
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c
CROSS JOIN profissoes AS p;

--Self Join

CREATE TABLE consumidor(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR (100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

SELECT * FROM consumidor;

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Alfredo Nunes', 'Maria Nunes', 'Rua da Paz, 47', 'São Paulo', '123.123-12', 'Brasil');
INSERT INTO consumidor (id, nome, contato, endereco, cidade, cep, pais) VALUES (2,'Ana Trujollo', 'Guilherme Souza', 'Rua Dourada, 452', 'Goiânia', '123.124-12', 'Brasil');
INSERT INTO consumidor (id, nome, contato, endereco, cidade, cep, pais) VALUES (3,'Leandro Veloz', 'Pedro Siqueira', 'Rua Vazia, 72', 'São Paulo','132.234-65', 'Brasil');
#DELETE FROM consumidor WHERE id = 2;

SELECT a.nome AS Consumidor1, b.nome AS Consumidor2, a.cidade
FROM consumidor AS a
INNER JOIN consumidor AS b
ON a.id <> b.id
AND a.cidade = b.cidade
ORDER BY a.cidade;
