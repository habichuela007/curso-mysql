SELECT host,USER,password FROM mysql.user;
SELECT host,USER FROM mysql.user;

CREATE DATABASE IF NOT EXISTS ef_bio_main

/*para crear usuarios*/
CREATE USER 'reports'@localhost IDENTIFIED BY 'CEP$34235.b';
CREATE USER 'reports'@10.7.11.35 IDENTIFIED BY 'Bio.18049';

/*para darles acceso a una base*/
GRANT ALL PRIVILEGES ON glpi.* TO 'reports'@'10.7.11.35' WITH GRANT OPTION;

/*enlistar usuarios*/
SELECT User, Host FROM mysql.user;

/*ver los permisos del usuario actual*/
SHOW GRANTS;