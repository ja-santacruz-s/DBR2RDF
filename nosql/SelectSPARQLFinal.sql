# Teniendo en cuenta los SELECT plantados en la base de datos relacional,
# A continuación se presentan las sentencias de consulta en la base de datos NoSQL Tipo Grafos
# Con RDF + SPARQL, las pruebas se realizaron utilizando la interfaz Apache Jena Fuseki

#---------------------------------------------------------------------------------------------
# 1) Obtener un listado de los empleados del hotel, con todos sus datos.

prefix emp: <http://hotel/empleado#>

SELECT ?numreg ?nombre ?incorporacion 
WHERE {
  ?emp emp:numreg ?numreg; emp:nombre ?nombre; emp:incorporacion ?incorporacion .
}

#---------------------------------------------------------------------------------------------
# 2) Obtener el nombre del jefe del servicio de "Restaurante".
prefix emp: <http://hotel/empleado#>
prefix ser: <http://hotel/servicio#>

SELECT ?nombre
WHERE {
  ?ser ser:descripcion ?descripcion; ser:ref-numreg ?refnumreg .  
  FILTER regex(?descripcion, "restaurante", "i") .
  ?refnumreg emp:nombre ?nombre 
}

#---------------------------------------------------------------------------------------------
# 3) Obtener el nombre del jefe de "Jorge Alonso Alonso".
prefix emp: <http://hotel/empleado#>
prefix ser: <http://hotel/servicio#>

SELECT ?nombre
WHERE {  
  ?emp emp:nombre 'Jorge Alonso Alonso'; emp:ref-cods ?refcods .
  ?refcods ser:ref-numreg ?refnumreg .
  ?refnumreg emp:nombre ?nombre   
}

#---------------------------------------------------------------------------------------------
# 4) Obtener un listado de los empleados y los servicios a los 
# que están asignados, exclusivamente para aquellos que tengan algún servicio asignado.
prefix emp: <http://hotel/empleado#>
prefix ser: <http://hotel/servicio#>

SELECT ?numreg ?nombre ?descripcion
WHERE {  
  ?emp emp:numreg ?numreg; emp:nombre ?nombre; emp:ref-cods ?refcods .
  ?refcods ser:descripcion ?descripcion
}

#---------------------------------------------------------------------------------------------
# 5) Obtener el número de habitación, tipo y precio de las habitaciones 
# que estén ocupadas en la actualidad (no tienen fecha de salida).
prefix hab: <http://hotel/habitacion#>
prefix pre: <http://hotel/precio#>
prefix fac: <http://hotel/factura#>

SELECT ?numero ?tipo ?precio
WHERE { 
  ?hab hab:numero ?numero; hab:tipo ?tipo; hab:ref-tipo ?reftipo; .
  ?reftipo pre:precio ?precio .
  ?fac fac:ref-numero ?hab .
  OPTIONAL {
    ?fac fac:salida ?salida
  } 
  FILTER (!bound(?salida))
}

#---------------------------------------------------------------------------------------------
# 6) Obtener el nombre y apellidos del cliente o clientes que más veces
# hayan estado en el hotel (no número total de noches, sino estancias diferentes: 
# una persona que ha estado tres veces diferentes de una noche en el hotel habrá "estado" 
# más veces que otra persona que ha estado una vez durante tres noches)

prefix fac: <http://hotel/factura#>
prefix cli: <http://hotel/cliente#>

SELECT ?dni ?nombre ?apellidos ?estancia
WHERE {
  {
    SELECT (MAX(?estancia) as ?maximo)
    WHERE {
      SELECT (COUNT(?dni) as ?estancia)
      WHERE {     
        ?fac fac:dni ?dni .
      }
      GROUP BY ?dni
    }
  }   
  {
    SELECT ?dni ?nombre ?apellidos (COUNT (?dni) AS ?estancia)
    WHERE {
      ?fac fac:ref-dni ?refdni .
      ?refdni cli:dni ?dni; cli:nombre ?nombre; cli:apellidos ?apellidos .  
    }
    GROUP BY ?dni  ?nombre ?apellidos    
  }
  FILTER (?estancia = ?maximo)  
}

#---------------------------------------------------------------------------------------------
# 7) Obtener los datos del empleado o empleados que hayan limpiado todas las habitaciones del 
# hotel

prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
prefix db:  <http://hotel/>
prefix emp: <http://hotel/empleado#>
prefix lim: <http://hotel/limpieza#>

SELECT ?numreg ?nombre ?incorporacion ?sueldo ?veces
WHERE {
  {
    SELECT (COUNT(*) AS ?cantidad)
    WHERE {
      ?hab rdf:type db:habitacion .
    }
  }

  {
    SELECT ?refnumreg (COUNT(?numero) as ?veces)
    WHERE {      
      {
        SELECT  DISTINCT ?refnumreg ?numero
        WHERE {
          ?lim lim:numero ?numero; lim:ref-numreg ?refnumreg; 

        } 
      }
    }
    GROUP BY ?refnumreg   
  }
  FILTER (?veces = ?cantidad)
  
  ?refnumreg emp:numreg ?numreg; emp:nombre ?nombre; emp:incorporacion ?incorporacion; emp:sueldo ?sueldo
}

#---------------------------------------------------------------------------------------------
# 8) Obtener el listado de los clientes que ocupen o hayan ocupado alguna vez habitaciones 
# de los dos tipos (individual y doble)

prefix hab: <http://hotel/habitacion#>
prefix cli: <http://hotel/cliente#>
prefix fac: <http://hotel/factura#>

SELECT DISTINCT ?dni ?nombre ?apellidos ?domicilio ?telefono
WHERE {
  ?cli cli:dni ?dni; cli:nombre ?nombre; cli:apellidos ?apellidos; cli:domicilio ?domicilio; cli:telefono ?telefono .
  {
    SELECT ?dni
    WHERE {
      ?fac fac:dni ?dni .
      ?fac fac:ref-numero ?hab . 
      ?hab hab:tipo 'doble'
    }
  } .
  {
    SELECT ?dni
    WHERE {
      ?fac fac:dni ?dni .
      ?fac fac:ref-numero ?hab . 
      ?hab hab:tipo 'individual'
    }
  }
}

#---------------------------------------------------------------------------------------------
# 9) Obtener un listado de los proveedores cuyas facturas hayan sido aprobadas únicamente 
# por el encargado y no por el responsable de un servicio.

prefix pro: <http://hotel/proveedor#>
prefix ser: <http://hotel/servicio#>
prefix fac: <http://hotel/factura_prov#>

SELECT DISTINCT ?nif ?nombre ?direccion
WHERE {
  ?pro pro:ref-numreg ?refnumreg .
  MINUS { ?ser ser:ref-numreg ?refnumreg }
  ?fac fac:ref-nif ?refnif; fac:ref-numreg ?refnumreg .
  ?refnif pro:nif ?nif; pro:nombre ?nombre; pro:direccion ?direccion;
}

#---------------------------------------------------------------------------------------------
# 10) Igualar el sueldo del empleado que menos cobra dentro del servicio de "restaurante" 
# con el del empleado que más cobra del mismo servicio
# funciona en el SPARQL ENDPOINT /hotel/update

prefix emp: <http://hotel/empleado#>
prefix ser: <http://hotel/servicio#>

DELETE {?emp emp:sueldo ?minimo}
INSERT {?emp emp:sueldo ?maximo}
WHERE {  
  {
    SELECT (MIN(?sueldo) as ?minimo)
    WHERE {
      ?emp emp:sueldo ?sueldo; emp:ref-cods ?refcods .
      ?refcods ser:descripcion 'restaurante    ' .
    }
  }
  
  {
    SELECT (MAX(?sueldo) as ?maximo)
    WHERE {
      ?emp emp:sueldo ?sueldo; emp:ref-cods ?refcods .
      ?refcods ser:descripcion 'restaurante    ' .
    }
  }
     
  {  
    ?refcods ser:descripcion 'restaurante    ' .
    ?emp emp:ref-cods ?refcods .
    OPTIONAL {?emp emp:sueldo ?sueldo} . 
    FILTER (!bound(?sueldo))
  }
  UNION
  {
    ?refcods ser:descripcion 'restaurante    ' .
    ?emp emp:ref-cods ?refcods .
    ?emp emp:sueldo ?minimo .    
  }  
}

# Para obtener la descripcion de los empleados que se modifican y 
# verificar el antes y el despues
# funciona en el SPARQL ENDPOINT /hotel/query

prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
prefix db:  <http://hotel/>
prefix emp: <http://hotel/empleado#>
prefix ser: <http://hotel/servicio#>

DESCRIBE ?emp
WHERE {
  ?emp emp:ref-cods ?refcods .
  ?refcods ser:descripcion 'restaurante    ' .
}

#---------------------------------------------------------------------------------------------
# 11) Incrementar en un 10% el sueldo del empleado de "limpieza" que más habitaciones 
# haya limpiado.
# funciona en el SPARQL ENDPOINT /hotel/update

prefix emp: <http://hotel/empleado#>
prefix lim: <http://hotel/limpieza#>

DELETE {?refnumreg emp:sueldo ?anterior}
INSERT {?refnumreg emp:sueldo ?nuevo}
WHERE { 
  SELECT ?refnumreg ?anterior (?anterior * 1.1 AS ?nuevo)
  WHERE {
    {
      SELECT (MAX(?veces) AS ?maximo)
      WHERE {
        SELECT (COUNT (*) AS ?veces)
        WHERE {
          ?lim lim:numreg ?numreg1
        }
        GROUP BY ?numreg1
      }
    }
    
    {
      SELECT ?refnumreg (COUNT (*) AS ?veces)
      WHERE {
        ?lim lim:ref-numreg ?refnumreg .  
      }
      GROUP BY ?refnumreg   
    } 
    FILTER (?veces = ?maximo)    

    ?refnumreg emp:sueldo ?anterior    
  } 
}

# Para obtener la descripcion de los empleados que se modifican y 
# verificar el antes y el despues
# funciona en el SPARQL ENDPOINT /hotel/query

prefix emp: <http://hotel/empleado#>

DESCRIBE ?emp
WHERE {
  ?emp emp:numreg 11
}