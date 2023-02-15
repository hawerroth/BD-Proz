CREATE TABLE clientes(
 	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
 	email VARCHAR(200) UNIQUE,
 	contato VARCHAR(15) NOT NULL,
  	endereco VARCHAR
);


INSERT INTO Clientes (nome, email, contato, endereco) VALUES 
('Ana Soares', 'ana.soares@email.com', '(11) 9999-9888', 'Rua B, 321'),
('João Silva', 'joao.silva@email.com', '(11) 9999-9999', 'Rua A, 123'),
('Joana Silva', 'joana.silva@email.com', '(11) 9999-9998', 'Rua A, 123');

/*Função verifica se o email já existe quando é inserido um novo dado e retorna uma mensagem*/
CREATE or REPLACE FUNCTION verificaEmailUnico() RETURNS
TRIGGER as $$
BEGIN 
    IF EXISTS (SELECT 1 FROM Clientes WHERE Email = NEW.Email) THEN
        RAISE EXCEPTION 'Já existe um cliente com esse email';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Checa se o email é unico executando a procedure verificaEmailUnico()--
CREATE TRIGGER checandoEmailUnico
BEFORE INSERT ON Clientes
FOR EACH ROW
EXECUTE PROCEDURE verificaEmailUnico();


INSERT INTO Clientes (nome, email, contato, endereco) VALUES 
('Ana Paula Soares', 'ana.soares@email.com', '(11) 9999-9888', 'Rua B, 321');

SELECT * FROM Clientes;

INSERT INTO Clientes (nome, email, contato, endereco) VALUES 
('Ana Paula Soares', 'anap.soares@email.com', '(11) 9999-9888', 'Rua B, 321');

INSERT INTO Clientes (nome, email, contato, endereco) VALUES 
('João Paulo Silva', 'joao.silva@email.com', '(11) 9988-9989', 'Rua C, 213');

SELECT * FROM Clientes;



