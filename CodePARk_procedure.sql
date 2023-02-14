CREATE TABLE compras (
    compra_ID SERIAL PRIMARY KEY,
    produto VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    valor FLOAT NOT NULL,
    data_compra DATE NOT NULL
);

INSERT INTO compras (produto, quantidade, valor, data_compra)
VALUES
    ('Calça Jeans', 3, 29.99, '2022-02-10'),
    ('Shorts Jeans', 16, 79.99, '2022-02-11'),
    ('Saia', 5, 79.99, '2022-02-11'),
    ('Vestido', 16, 79.99, '2022-02-11'),
    ('Tênis', 8, 119.99, '2022-02-12'),
    ('Meia', 2, 119.99, '2022-02-12');


CREATE PROCEDURE qtdProdutosCompradoPorDia(day_compra date)
AS $$
/*Select the date of purchase and count the number of rows for each date*/
SELECT COUNT(quantidade) FROM compras
WHERE data_compra = day_compra;
$$ LANGUAGE SQL;
/* This line sets the SQL language for the stored procedure to SQL*/

CALL qtdProdutosCompradoPorDia('2022-02-11');
