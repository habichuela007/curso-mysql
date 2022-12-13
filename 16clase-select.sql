select name, gender from clients limit 10;
SELECT name, gender FROM clients WHERE gender = 'M';
SELECT NOW();
SELECT YEAR(NOW());
SELECT YEAR(NOW()) - YEAR(birthdate) FROM clients limit 10;
SELECT client, YEAR(NOW()) - YEAR(birthdate) FROM clients limit 10;
SELECT year(birthdate) , gender FROM clients WHERE gender = 'M';
/*Crean tablas 'temporales' que no existían hace un momento*/

