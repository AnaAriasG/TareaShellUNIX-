Tarea de la Shell de Unix

Para la realización de esta tarea he creado un script compuesto por 3 ficheros
La ejecución de cada uno de ellos implica distintos procesos necesarios para alcanzar
el objetivo.

- La ejecucion del fichero "Descarga.sh" implica la descarga de los datos comprimidos
  y su posterior descompresión ,referentes a las series temporales mensuales de producción
  eléctrica pubicadas por el Ministerio de Industria. En concreto se obtendrán los datos 
  de la tabla 1.2.7. PRODUCCION BRUTA DE ENERGIA TERMOELECTRICA POR PROVINCIAS SEGUN EL COMBUSTIBLE

- El fichero de texto "Prov.txt" contiene la relación entre Provincias y Comunidades 
  Autónomas y sus correspondientes identificadores.

- La ejecucion del fichero "Practica.sh" entraña diferentes procesos:

	- En primer lugar, se genera un directorio para cada comunidad autónoma
	 (ID_Nombre Com. Autónoma), y dentro de cada uno de ellos, se crea otro directorio
	 para cada provincia (ID_ Nombre provincia).
	 
	- A continuación se prepara cada fichero para facilitar la extracción de datos.	  
	
	- Por último se ejecutan varias lineas de codigo con el fin de crear un fichero
	  por cada tipo de energia termoeléctrica dentro de cada uno de estos últimos directorios.
	  Cada fichero consistirá en la serie temporal completa del tipo de combustible, compuesto
	  por dos columnas.	La primera indica el año y mes (AAAAMM) al que corresponde el dato, y en la 
	  segunda los datos correspondientes a la producción de cada tipo de energia en KW/H
	  Es decir, cada fichero tendrá el siguiente formato:
	  
	     
					200601  67854
					200602   4356
					 ...     ...
