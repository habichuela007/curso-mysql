insert INTO books(title,author_id) 
VALUES('El laberinto de la soledad','6')


insert INTO books(title,author,year) 
/*Aquí viene el trucazo*/
/*WARNING EL PROCESAMIENTO SE VA AL DIABLO*/
VALUES('El alma en los labios',
    (SELECT author_id FROM authors
    wHERE name = 'Medardo Angel Silva'
    LIMIT 1),
    1960
);
/*POR SI HAY ALGÚN PROBLEMA LIMITO A 1*/
/*Puede tener sus problemas, se puede comprometer la base de datos
Es preferible hacerlo desde la capa de negocios*/

