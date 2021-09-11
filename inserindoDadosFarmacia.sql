#Inserindo dados de teste - DML.

USE farmacia;


RENAME TABLE tipos_prosutos TO tipos_produtos;

#Tipos produtos.
INSERT INTO tipos_produtos (tipo) VALUES ('Remedios');
INSERT INTO tipos_produtos (tipo) VALUES ('Cosmeticos');
INSERT INTO tipos_produtos (tipo) VALUES ('Diversos');

#Fabricantes.

INSERT INTO fabricantes (fabricante) VALUES ('Roche');
INSERT INTO fabricantes (fabricante) VALUES ('Visa');
INSERT INTO fabricantes (fabricante) VALUES ('Palmolive1');

#Médicos.
INSERT INTO medicos (nome, crm) VALUES ('DR. Alfredo Munir', '1234567');
INSERT INTO medicos (nome, crm) VALUES ('DR. Fernanda Avila', '7654321');
INSERT INTO medicos (nome, crm) VALUES ('DR. Julieta Santana', '939385898');


UPDATE medicos set nome = 'DR. Alfredo Muniz' WHERE id = 3;

START TRANSACTION;

INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf)
	VALUES ('Yhago Almeida', 'Rua do Mais Bondoso, 01', '1234-4321',' 123321-12', 'Águas Caridosas', '123.123.123.-12');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf)
	VALUES ('Yoseph Almeida', 'Rua do Mais Bondoso, 02', ' 123-321', '123321-12', 'Águas Caridosas', '123.123.123-12');
UPDATE clientes set cpf = '123.123.123-12' WHERE ID = 1;
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf)
	VALUES ('Rafael Almeida', 'Rua do Mais Bondoso, 01', '1234-4321', '123321-12', 'Águas Caridosas', '123.123.123-12');
UPDATE clientes set endereco = 'Rua do Mais Bondoso, 02' WHERE id = 3;

START TRANSACTION;

#produtos.
INSERT INTO produtos (nome, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante)
	VALUE ('Erva Cidreira', 'Chá', 'Folhas', '1.99', 1, 1);
INSERT INTO produtos (nome, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante)
	VALUE ('Hortelâ', 'Vermicida', 'Folhas', '1.99', 1, 1);

SELECT * FROM produtos;
UPDATE produtos set nome = 'Hortelã' WHERE id = 2;
INSERT INTO produtos (nome, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante)
	VALUE ('Atroverã', 'Dor', 'Folhas', '1.99', 1, 1);

INSERT INTO compras (id_cliente, data) VALUES (1, '2021-09-10');
INSERT INTO compras (id_cliente, data) VALUES (2, '2021-09-10');
INSERT INTO compras (id_cliente, data) VALUES (3, '2021-09-10');

#Produtos compra
INSERT INTO produtos_compra ( id_compra, id_produto, quantidade) VALUES (1, 1, 2);
INSERT INTO produtos_compra ( id_compra, id_produto, quantidade) VALUES (1, 2, 3);
INSERT INTO produtos_compra ( id_compra, id_produto, quantidade) VALUES (1, 2, 3);

#Receitas Médicas.
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (1, 1, 'receita1.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (3, 2, 'receita1.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (1, 1, 'receita1.pdf');
select * from receitas_medica;

#Tipos Produtos.
START TRANSACTION;
SELECT * FROM tipos_produtos;
INSERT INTO tipos_produtos (id, tipo) VALUES (4, 'Outros'); 
ROLLBACK;
COMMIT;

UPDATE tipos_produtos set tipo = 'Bijuteria' WHERE id = 4;

#SELECT * FROM fabricantes;
#UPDATE fabricantes set fabricante = 'Solo' WHERE id = 2;
#UPDATE produtos set precos_venda = '2.01'

SELECT * FROM produtos;