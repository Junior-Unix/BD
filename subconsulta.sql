CREATE DATABASE subconsulta;

USE subconsulta;

CREATE TABLE escritório(
		id INT NOT NULL AUTO_INCREMENT,
        pais VARCHAR(30) NOT NULL,
        PRIMARY KEY (id)
);
SELECT * FROM escritorios;
RENAME TABLE escritório TO escritorios;
START TRANSACTION;

CREATE TABLE funcionarios(
		id INT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(20) NOT NULL,
        sobrenome VARCHAR(20) NOT NULL,
        id_escritorio INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (id_escritorio) REFERENCES escritorios(id)
);

SELECT * FROM funcionarios;

COMMIT;
START TRANSACTION;
CREATE TABLE pagamentos(
		id INT NOT NULL AUTO_INCREMENT,
        id_funcionario INT NOT NULL,
        salario DECIMAL(8,2) NOT NULL,
        data DATE NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

SELECT * FROM pagamentos;
COMMIT;

START TRANSACTION;

INSERT INTO escritorios (pais) VALUES ('Brasil');
INSERT INTO escritorios (pais) VALUES ('Estados Unidos');
INSERT INTO escritorios (pais) VALUES ('Alemanha');
INSERT INTO escritorios (pais) VALUES ('França');

SELECT * FROM escritorios;
COMMIT;

START TRANSACTION;

INSERT INTO funcionarios (id, nome, sobrenome, id_escritorio) VALUES (1 ,'Pedro', 'Souza', 1);
INSERT INTO funcionarios (id, nome, sobrenome, id_escritorio) VALUES (2, 'Sandra', 'Rubin', 2);
INSERT INTO funcionarios (id, nome, sobrenome, id_escritorio) VALUES (3, 'Mikail', 'Shumer', 3);
INSERT INTO funcionarios (id, nome, sobrenome, id_escritorio) VALUES (4 ,'Oliver', 'Gloçan', 4);
ROLLBACK;
SELECT * FROM funcionarios;

COMMIT;

START TRANSACTION;

INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (1, '1234.44', '2021-09-10');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (2, '2300.34', '2021-09-10');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (3, '3200.21', '2021-09-10');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (4, '5400.99', '2021-09-10');
 
SELECT * FROM pagamentos;

COMMIT;

#Exemplo 1.
SELECT nome, sobrenome FROM funcionarios WHERE id_escritorio IN (SELECT id FROM escritorios WHERE pais = 'Brasil');