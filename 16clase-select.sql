select name, gender from clients limit 10;
SELECT name, gender FROM clients WHERE gender = 'M';
SELECT NOW();
SELECT YEAR(NOW());
SELECT YEAR(NOW()) - YEAR(birthdate) FROM clients limit 10;
SELECT client, YEAR(NOW()) - YEAR(birthdate) FROM clients limit 10;
SELECT year(birthdate) , gender FROM clients WHERE gender = 'M';
/*Crean tablas 'temporales' que no existían hace un momento*/

SELECT * FROM clients WHERE name LIKE '%Saave%'

SELECT name, email, YEAR(NOW()) - YEAR(birthdate) AS edad,
    gender
    FROM clients
    WHERE gender = 'F'
        AND name LIKE '%Lop%';