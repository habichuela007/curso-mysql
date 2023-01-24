/*para ahcer respaldos un comando alter puede dañar todo el esquema*/
ALTER TABLE authors ADD COLUMN birthyear INTEGER DEFAULT 1930 AFTER name;
ALTER TABLE authors MODIFY COLUMN birthyear YEAR DEFAULT 1920;
ALTER TABLE authors DROP COLUMN birthyear;

/*Dos manera de hacer backup, desde una terminal que no está en ela base de datos*/

/*traerlo como un archivo de texto(esquema y datos)*/
mysqldump -u root -p pruebaplatzi -h 10.20.10.93 --port 33060

/*traerlo como un archivo de texto(solo esquema útil para versioando) BANDERA -d*/
mysqldump -u root -p -d pruebaplatzi -h 10.20.10.93 --port 33060 | more
mysqldump -u root -p -d pruebaplatzi -h 10.20.10.93 --port 33060 > esquema.sql