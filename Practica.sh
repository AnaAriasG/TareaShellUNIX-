IFS=$'\n' #Pongo un salto de linea como delimitador

#Creo directorios y subdirectorios
for line in $(cat Prov.txt) 
do
	mkdir -p ./$(echo $line| cut -d "," -f 1)"_"$(echo $line| cut -d "," -f 2)/$(echo $line| cut -d "," -f 3)"_"$(echo $line| cut -d "," -f 4) 
done

#Preparo los ficheros para extraer datos con mayor facilidad
for anho in {2006..2015}
do
	j=0
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do
		if [ $anho == 2015)) ] && [ $mes == Mayo ]; then
			break
		fi
		let j+=1
		#Comienzo eliminando la cabecera
		sed "1,9d" datos/$mes"_"$anho/T_127P*.txt >  datos/$mes"_"$anho/new_T_127P*.txt
		#sustituyo todos los espacios en blanco por uno solo y elimino los puntos que separan los miles
		tr -s " " < datos/$mes"_"$anho/new_T_127P.txt |tr -d "." > datos/$mes"_"$anho/aux1.txt 
		#sustituyo los espacios entre los campos por comas teniendo el cuenta la clase de los caracteres.
		sed -i -e 's/\([A-Z]\)\ \([0-9]\)/\1\,\2/g' -e 's/\([0-9]\)\ \([0-9]\)/\1\,\2/g'  -e 's/\([0-9]\)\ \([0-9]\)/\1\,\2/g' -e 's/\([0-9]\)\ \([A-Z]\)/\1\,\2/g' datos/$mes"_"$anho/aux1.txt
		sed -i -e 's/SCT/S.C.T/g' datos/$mes"_"$anho/aux1.txt # vuelvo a poner los puntos en las provincias con abreviaturas (S/C Tenerife)
		for  line in $(cat Prov.txt) 
		do	
			#Recojo en una variable cada uno de los 4 campos de cada linea
			IDCA=$(echo $line| cut -d "," -f 1)
			CA=$(echo $line| cut -d "," -f 2)
			IDP=$(echo $line| cut -d "," -f 3)
			PRO=$(echo $line| cut -d "," -f 4)
			if (($j < 10)); then #-lt
				m=0$j
			else
				m=$j
			fi
			k=2
			#A medida que voy leyendo cada linea de Prov.txt creo un fichero dentro de cada provincia para cada tipo de energia
			for TipEner in Nuclear Carbones Lignitos Fuel GasNatural OtrosCombustibles Total
			do
				echo $anho$m $(awk -F "," -v k="$k" -v PRO="$PRO" '$1==PRO{print $k}' datos/$mes"_"$anho/aux1.txt) >> ./$IDCA"_""$CA"/$IDP"_""$PRO"/$TipEner.txt			
				let k+=1
			done
		done		
	done
done


