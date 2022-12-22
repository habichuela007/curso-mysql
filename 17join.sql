INSERT INTO transactions (book_id, client_id, type, finished) VALUES
	(12,34,'sell',1),
	(54,87,'lend',0),
	(3,14,'sell',1),
	(1,54,'sell',1),
	(12,81,'lend',1),
	(12,81,'sell',1),
	(87,29,'sell',1);

SELECT count(*) from authors;

select * FROM authors WHERE author_id > 0 and author_id <= 5;
select * FROM books WHERE author_id between 1 and 5;
select book_id, author_id, title FROM books WHERE author_id between 1 and 5;

select b.book_id, a.name, b.title
  from books AS b
  inner join authors as a
    on a.author_id = b.author_id
WHERE a.author_id between 1 and 5;

/*El inner join se demora más*/

select b.book_id, a.name, b.title
  from books AS b
  join authors as a
    on a.author_id = b.author_id
WHERE a.author_id between 1 and 5;

SELECT name FROM authors WHERE author_id = 4;

/*mysql no puede usar el as si hay una palabra despúes de la tabla*/
/*convention over transacction, por diseño las tabals se corresponden*/
/*table pivote*/

select c.name, b.title, a.name, t.type
from transactions as t
join books as b
    on t.book_id = b.book_id /*aqui son iguales por diseño, no necesariamente*/
join clients as c
    on t.client_id = c.client_id
join authors as a 
    on b.author_id = a.author_id
where c.gender = 'M'
    and t.type = 'sell'


select c.name, b.title, a.name, t.type
from transactions as t
join books as b
    on t.book_id = b.book_id /*aqui son iguales por diseño, no necesariamente*/
join clients as c
    on t.client_id = c.client_id
join authors as a 
    on b.author_id = a.author_id
where c.gender = 'M'
    and t.type IN ('sell', 'lend');

SELECT c.name, b.title, a.name, t.type
FROM transactions AS t
JOIN books AS b
  ON t.book_id = b.book_id
JOIN clients AS c
  ON t.client_id = c.client_id
JOIN authors AS a
  ON b.author_id = a.author_id
WHERE c.gender = 'M'
  AND t.type IN ('sell', 'lend');

/*ESTO TAMBIÉN ES UN JOIN, es una versión se sintaxis que será deprecada en algpun momento*/
SELECT b.title, a.name
from authors as a, books as b
  WHERE a.author_id = b.author_id
LIMIT 10

/*TIENE más facilidad de lectura*/
select b.title, a.name
from books as b
inner join authors as a
  on a.author_id = b.author_id
limit 10

SELECT a.author_id, a.name, a.nationality, b.title
from authors as a
join books as b
  on b.author_id = a.author_id
where a.author_id between 1 and 5
order by a.author_id desc;
order by a.author_id asc; /*por defecto es ascendente*/

/*el left join me trae TODO lo que cumpla la condición*//*CUÉNTAME CUÁNTOS BOOK ID HAY*/
SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id)
FROM authors AS a
left join books AS b /*sin el left NO me van a aparecer los autores que no tengan libros*/
  on b.author_id = a.author_id
where a.author_id between 1 and 5
GROUP BY a.author_id
order by a.author_id desc;




SELECT *
FROM vtas_budget 
WHERE ejercicio = 2023 AND d_cliente LIKE '%Ã‘%'
GROUP BY d_cliente;

UPDATE vtas_budget SET d_cliente = REPLACE(d_cliente,'Ã‘','Ñ');