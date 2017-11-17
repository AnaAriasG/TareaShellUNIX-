IFS=$'\n' #Pongo un salto de linea como delimitador

#Creo directorios y subdirectorios
for line in $(cat Prov.txt) 
do
	mkdir -p ./$(echo $line| cut -d "," -f 1)"_"$(echo $line| cut -d "," -f 2)/$(echo $line| cut -d "," -f 3)"_"$(echo $line| cut -d "," -f 4) 
done

#Propar0 los ficheros para extraer datos con mayor facilidad
for anho in {2006..2014}
do
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do
		#Comienzo eliminando la cabecera
		sed "1,9d" datos/$mes"_"$anho/T_127P*.txt >  datos/$mes"_"$anho/new_T_127P*.txt
		#sustituyo todos los espacios en blanco por uno solo y elimino los puntos que separan los miles
		tr -s " " < datos/$mes"_"$anho/new_T_127P.txt |tr -d "." > datos/$mes"_"$anho/aux1.txt 
		#sustituyo los espacios entre los campos por comas teniendo el cuenta la clase de los caracteres.
		sed -i -e 's/\([A-Z]\)\ \([0-9]\)/\1\,\2/g' -e 's/\([0-9]\)\ \([0-9]\)/\1\,\2/g'  -e 's/\([0-9]\)\ \([0-9]\)/\1\,\2/g' -e 's/\([0-9]\)\ \([A-Z]\)/\1\,\2/g' datos/$mes"_"$anho/aux1.txt
		sed -i -e 's/SCT/S.C.T/g' datos/$mes"_"$anho/aux1.txt # vuelvo a poner los puntos en las provincias con abreviaciones (S/C Tenerife)
	done
done

#Lo hago de nuevo todo pero para los unicos meses de los que se tienen datos en 2015
for mes in Enero Febrero Marzo Abril 
do
	#Comienzo eliminando la cabecera
	sed "1,9d" datos/$mes"_"2015/T_127P*.txt >  datos/$mes"_"2015/new_T_127P*.txt
	#sustituyo todos los espacios en blanco por uno solo y elimino los puntos que separan los miles
	tr -s " " < datos/$mes"_"2015/new_T_127P.txt |tr -d "." > datos/$mes"_"2015/aux1.txt 
	#sustituyo los espacios entre los campos por comas teniendo el cuenta la clase de los caracteres.
	sed -i -e 's/\([A-Z]\)\ \([0-9]\)/\1\,\2/g' -e 's/\([0-9]\)\ \([0-9]\)/\1\,\2/g'  -e 's/\([0-9]\)\ \([0-9]\)/\1\,\2/g' -e 's/\([0-9]\)\ \([A-Z]\)/\1\,\2/g' datos/$mes"_"2015/aux1.txt
	sed -i -e 's/SCT/S.C.T/g' datos/$mes"_"2015/aux1.txt # vuelvo a poner los puntos en las provincias con abreviaciones (S/C Tenerife)
done
