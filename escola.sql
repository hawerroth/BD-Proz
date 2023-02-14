-- Database: escola

-- DROP DATABASE IF EXISTS escola;

CREATE DATABASE escola;

USE escola;

create table aluno(
	id_nome SERIAL PRIMARY KEY,
	nome VARCHAR(25) not NULL,
	e_mail VARCHAR(50) not NULL,
	endereco VARCHAR not NULL
);

CREATE TRIGGER InsertAlunos
ON aluno
AFTER INSERT
AS
BEGIN
	PRINT('Record(s) inserted successfully')
END

Insert INTO aluno (nome, e_mail, endereco) VALUES
  ('João Alves', 'joao.alves@gmail.com', 'Ruas das flores, 34'),
  ('Roberto Garcia', 'roberto.garcia@gmail.com', 'Rua das fontes, 321'),
  ('Dario Rubens', 'dario.rubens@gmail.com', 'Rua dos enamorados, 87'),
  ('Julia Lopes', 'julia.lopes@gmail.com', 'Rua graciosa, 125'),
  ('Rebeca Giglio', 'rebeca.giglio@gmail.com', 'Rua Souza Soares, 543');

 SELECT * FROM aluno;
