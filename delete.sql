USE farmacia;
START TRANSACTION;
SELECT * FROM produtos_compra;

DELETE FROM receitas_medica WHERE id_produtos_compra = 3;

DELETE FROM produtos_compra WHERE id = 3;