Create DATABASE books;

CREATE TABLE author (
 	id_author SERIAL PRIMARY KEY,
	name_author VARCHAR(100) NOT NULL
);

CREATE TABLE book (
  	id_book SERIAL PRIMARY KEY ,
  	book_name VARCHAR(100) NoT NULL,
  	fk_id_author INT NOT NULL,
  	CONSTRAINT fk_author FOREIGN KEY (fk_id_author) REFERENCES author(id_author)
);

INSERT INTO author (name_author)
VALUES
('Mark Twain'),
('David Baldacci'),
('Delia Owens'),
('Nicholas Sparks');

INSERT INTO book (book_name,fk_id_author)
VALUES
('Querido John','4'),
('As Aventuras de Tom Sawyer','1'),
('One Summer','2'),
('Lá, Onde o Vento Chora','3'),
('A última Música','4'),
('Um amor para recordar','4'),
( 'O estranho Misterioso','1');


SELECT * from author
INNER join book on author.id_author = book.fk_id_author;

SELECT * from author
Left join book on author.id_author = book.fk_id_author;

SELECT * from author
Left join book on author.id_author = book.fk_id_author
WHERE author.id_author = '4';


