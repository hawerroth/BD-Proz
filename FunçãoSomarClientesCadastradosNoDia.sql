CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name_customer VARCHAR NOT NULL,
  email VARCHAR UNIQUE NOT NULL,
  phone VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name_products VARCHAR NOT NULL,
  description VARCHAR NOT NULL,
  price FLOAT(10) NOT NULL,
  quantity INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL,
  CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES customers(id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INT NOT NULL, 
  product_id INT NOT NULL, 
  quantity INT NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  CONSTRAINT fk_orders FOREIGN KEY (order_id) REFERENCES orders(id),
  CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES products(id),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

/* Inserindo dados nas tabelas*/

INSERT INTO customers (name_customer, email, phone, address) VALUES
('Juliano Ferreira ', 'juliano.ferreira@example.com', '(65)98555-1234', 'Rua Guilherme Mazeto 200'),
('Janete de Almeida', 'janete.almeida@example.com', '(65)98555-5678', 'Rua Amoroso Lima 28'),
('João Santos', 'joão.santos@example.com', '(65)98555-9012', 'Rua Boa Vista 12');

INSERT INTO products (name_products, description, price, quantity) VALUES
('Produto A', 'Descrição do produto A', 9.99, 100),
('Produto B', 'Descrição do produto B', 14.99, 50),
('Produto C', 'Descrição do produto C', 19.99, 25);

INSERT INTO orders (customer_id) VALUES
(1),
(2),
(3);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 9.99),
(1, 2, 1, 14.99),
(2, 2, 3, 14.99),
(3, 3, 1, 19.99);

CREATE OR REPLACE FUNCTION count_customers_for_day(date_input DATE)
/*Criar ou substituir uma função para contar o número de clientes que foram cadastrados em um dia específico*/
RETURNS INT AS $$
/*Declara uma variável local para armazenar o resultado da consulta de contagem*/
DECLARE
  count INT;
BEGIN
/* Execute uma consulta para contar o número de linhas na tabela de clientes em que created_at está entre a data de entrada e o dia seguinte*/
  SELECT COUNT(*)
  INTO count
  FROM customers
  WHERE created_at >= date_input
  AND created_at < date_input + INTERVAL '1 DAY';
  
  RETURN count;
END;
$$ LANGUAGE plpgsql;

SELECT count_customers_for_day('2023-02-15');

