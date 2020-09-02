
/* Con base en la implementación de la base de datos para el Hotel, 
 * generar los scripts SQL necesarios para resolver las siguientes consultas: */

/* 1) Obtener un listado de los empleados del hotel, con todos sus datos. */

SELECT e.numreg, e.nombre, e.incorporacion, e.sueldo 
FROM empleado e
ORDER BY e.numreg;

/* 2) Obtener el nombre del jefe del servicio de "Restaurante". */

SELECT e.nombre FROM empleado e
INNER JOIN servicio s
ON e.numreg = s.numreg AND s.descripcion = 'restaurante';

/* 3) Obtener el nombre del jefe de "Jorge Alonso Alonso". */

SELECT e2.nombre FROM empleado e1
INNER JOIN servicio s ON e1.cods = s.cods
INNER JOIN empleado e2 ON e2.numreg = s.numreg
WHERE e1.nombre = 'Jorge Alonso Alonso';

/* 4) Obtener un listado de los empleados y los servicios a los que están asignados, 
 * exclusivamente para aquellos que tengan algún servicio asignado. */

SELECT e.numreg, e.nombre, s.descripcion FROM empleado e
INNER JOIN servicio s ON e.cods = s.cods
AND e.cods IS NOT NULL;

/* 5) Obtener el número de habitación, tipo y precio de las habitaciones que estén 
 * ocupadas en la actualidad (no tienen fecha de salida). */

SELECT h.numero, h.tipo, p.precio FROM habitacion h
INNER JOIN precio p ON h.tipo = p.tipo
INNER JOIN factura f ON h.numero = f.numero AND f.salida IS NULL;

/* 6) Obtener el nombre y apellidos del cliente o clientes que más veces hayan 
 * estado en el hotel (no número total de noches, sino estancias diferentes: 
 * una persona que ha estado tres veces diferentes de una noche en el hotel habrá "estado" 
 * más veces que otra persona que ha estado una vez durante tres noches) */

SELECT c.dni, c.nombre, c.apellidos, COUNT (f.dni) FROM cliente c
INNER JOIN factura f ON c.dni = f.dni
GROUP BY c.dni, c.nombre, c.apellidos
HAVING COUNT (f.dni) = (
    SELECT MAX(e.estancia) FROM (
        SELECT f.dni, COUNT(f.dni) estancia FROM factura f
        GROUP BY f.dni
    ) e
);

/* 7) Obtener los datos del empleado o empleados que hayan limpiado todas las 
 * habitaciones del hotel
 */
 
SELECT e.numreg, e.nombre, e.incorporacion, e.sueldo, l.veces FROM empleado e
INNER JOIN (
	SELECT l.numreg, COUNT (l.numero) AS veces FROM (
		SELECT DISTINCT l.numreg, l.numero FROM limpieza l
	) l
	GROUP BY l.numreg
	HAVING COUNT (l.numero) = (
		SELECT COUNT(h.numero) FROM habitacion h
	)
) l ON e.numreg = l.numreg;

/* 8) Obtener el listado de los clientes que ocupen o hayan ocupado alguna vez 
 * habitaciones de los dos tipos (individual y doble)
 */

SELECT DISTINCT c.dni, c.nombre, c.apellidos, c.domicilio, c.telefono FROM cliente c
INNER JOIN (
	SELECT f.dni FROM factura f
	WHERE numero IN (
		SELECT h.numero FROM habitacion h WHERE tipo = 'individual'
	)
) i ON c.dni = i.dni
INNER JOIN (
	SELECT f.dni FROM factura f
	WHERE numero IN (
		SELECT h.numero FROM habitacion h WHERE tipo = 'doble'
	)
) d ON c.dni = d.dni;

/* 9) Obtener un listado de los proveedores cuyas facturas hayan sido aprobadas 
 * únicamente por el encargado y no por el responsable de un servicio. 
 */

SELECT DISTINCT p1.nif, p1.nombre, p1.direccion FROM proveedor p1
INNER JOIN factura_prov fp ON p1.nif = fp.nif AND fp.numreg IN (
	SELECT p2.numreg FROM proveedor p2 WHERE p2.numreg NOT IN (
		SELECT s.numreg FROM servicio s
	)
);

/* 10) Igualar el sueldo del empleado que menos cobra dentro del servicio de 
 * "restaurante" con el del empleado que más cobra del mismo servicio
 */

UPDATE empleado e
SET sueldo = (
	SELECT MAX (sueldo) FROM empleado e
	INNER JOIN servicio s ON e.cods = s.cods AND s.descripcion = 'restaurante'	
)
FROM servicio s
WHERE e.cods = s.cods AND s.descripcion = 'restaurante' AND (
	e.sueldo = (
		SELECT MIN (sueldo) FROM empleado e
		INNER JOIN servicio s ON e.cods = s.cods AND s.descripcion = 'restaurante'
	) 
	OR 
	e.sueldo IS NULL
);

/* 11) Incrementar en un 10% el sueldo del empleado de "limpieza" que más habitaciones
 * haya limpiado.
 */

UPDATE empleado e
SET sueldo = sueldo * 1.10
WHERE e.numreg = (
	SELECT l.numreg FROM limpieza l
	GROUP BY l.numreg 
	HAVING COUNT(*) = (
		SELECT MAX (veces) FROM (
			SELECT l.numreg, COUNT(*) AS veces FROM limpieza l
			GROUP BY l.numreg	
		) l
	)	
)
