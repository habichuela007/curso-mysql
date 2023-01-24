/*Dale inteligencia a las columnas*/
SELECT distinct nationality FROM authors;
UPDATE authors SET nationality = 'GBR' WHERE nationality = 'ENG';

SELECT sellable, sum(price*copies) FROM books GROUP BY sellable;

/*Buena práctica es ir sobre el campo que quiero contar*/
SELECT count(*), sum(1) FROM books;
SELECT count(book_id), sum(1) FROM books;
SELECT count(book_id), sum(if(conficion,valor si verdadero,valor si falso)) FROM books;
SELECT count(book_id), sum(if(year < 1950,1,0)) FROM books;
SELECT count(book_id) FROM books WHERE year < 1950;

SELECT count(book_id),
    sum(if(year < 1950,1,0)) as `<1950`,
    sum(if(year < 1950,0,1)) as `>1950`
FROM books;

SELECT count(book_id),
    sum(if(year < 1950,1,0)) as `<1950`,
    sum(if(year >= 1950 and year <1990,1,0)) as `<1990`,
    sum(if(year >= 1990 AND year <2000,1,0)) as `<2000`,
    sum(if (year >=2000,1,0)) as `<hoy`
FROM books;


SELECT nationality, count(book_id),
    sum(if(year < 1950,1,0)) as `<1950`,
    sum(if(year >= 1950 and year <1990,1,0)) as `<1990`,
    sum(if(year >= 1990 AND year <2000,1,0)) as `<2000`,
    sum(if (year >=2000,1,0)) as `<hoy`
FROM books as b
JOIN authors as a
    ON a.author_id = b.author_id
WHERE 
    a.nationality is NOT NULL
GROUP BY nationality
;