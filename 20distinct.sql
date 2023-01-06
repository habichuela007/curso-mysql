/* CASOS DE NEGOCIO*/

/*
Qué nacionalides hay.?
Distinct quita los duplicados
Los NULL van a estar ahj[i
]
*/
SELECT DISTINCT nationality FROM authors;
SELECT DISTINCT nationality FROM authors ORDER BY nationality;

/*cuántos escritores hay de cada nacionalidad*/
SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
GROUP BY nationality
ORDER BY c_authors DESC;

/*Puedo ordenar por tantas columnas como las llamo en el SELECT*/
SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
GROUP BY nationality
ORDER BY c_authors DESC, nationality ASC;

/*Puedo añadir condicionales*/
SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality IS NOT NULL
GROUP BY nationality
ORDER BY c_authors DESC, nationality ASC;

SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality <> 'RUS'
GROUP BY nationality
ORDER BY c_authors DESC, nationality ASC;

/*
OTRA FORMA DEL DIFERENTE, MAS CORRECTA
CONVENTION OVER CONFIGURATION
EL ORDEN DE LAS CONDICIONALES ES IMNPORTANTE
HAY QUE ELIMINAR LAS MÁS PESADAS PRIMERO
*/
SELECT nationality, COUNT(author_id) AS c_authors
FROM authors
WHERE nationality NOT IN('RUS','AUT')
GROUP BY nationality
ORDER BY c_authors DESC, nationality ASC;

/*desviación estándar STDDEV es una de las funciones muy cercanas al procesador ed la base de datos*/

SELECT title, price FROM books ORDER BY price DESC limit 10;

SELECT AVG(price) AS prom, STDDEV(price) AS std
FROM books;

SELECT nationality, 
    COUNT(book_id) AS libros,
    AVG(price) AS prom,
    STDDEV(price) AS std
FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
GROUP BY nationality
ORDER BY libros DESC;