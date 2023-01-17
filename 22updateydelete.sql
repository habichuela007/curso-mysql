/*Delete siemroe el delete super punutal*/
/*truquito poner un LIMIT al número que quiero borrar*/
DELETE FROM authors WHERE 

SELECT count(*) FROM authors;


SELECT client_id, name name FROM clients WHERE active <> 1;
/*NUNCA utilizar un rand programaticamente, no es eficiente computaccionalmente*/
SELECT client_id, name, active FROM clients order by rand() limit 10;

mysql> SELECT client_id, name, ACTIVE FROM clients WHERE client_id IN (80,65,76,1,61,7,19,97) limit 10;

/*SINTAXIS*/
UPDATE clients 
SET 
    [columna = valores]
WHERE
    [condiciones]

UPDATE clients
SET active = 0
WHERE client_id = 80
LIMIT 1;


SELECT * FROM clients
WHERE 
    client_id IN (1,6,8,27,29,90)
    OR name LIKE '%Lopez%'
LIMIT 1;

UPDATE clients
SET 
    active = 0
WHERE 
    client_id IN (1,6,8,27,29,90)
    OR name LIKE '%Lopez%'
LIMIT 1;

/*para vaciar la tabla*/
truncate tabla
truncate transactions

