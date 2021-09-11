#Realixando consulta simples.

SELECT * FROM tipos_produtos;
SELECT id, tipo FROM tipos_produtos;
SELECT tipo, id FROM tipos_produtos;

SELECT id, tipo FROM tipos_produtos ORDER BY id DESC;
SELECT id, tipo FROM tipos_produtos ORDER BY tipo DESC;

SELECT * FROM fabricantes;

SELECT * FROM produtos_compra WHERE  quantidade > 2;

