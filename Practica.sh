IFS=$'\n' #Pongo un salto de linea como delimitador

#Creo directorios y subdirectorios aprovechando la lista de comunidades autonomas y provincias.

for line in $(cat Prov.txt) 
do
	mkdir -p ./$(echo $line| cut -d "," -f 1)"_"$(echo $line| cut -d "," -f 2)/$(echo $line| cut -d "," -f 3)"_"$(echo $line| cut -d "," -f 4) 
done

# Recorro años y meses para preparar los ficheros para la extraccion de datos y procedo a su extraccion y volcado en el fichero correspondiente.
for anho in {2006..2015}
do
	j=0
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do
		if [ $anho == 2015 ] && [ $mes == Mayo ]; then # En 2015 solo hay datos hasta el mes de Abril
			break
		fi
		let j+=1 #Creo un contandor que me facilitará la escritura de la fecha correspondiente a cada dato en cada fichero
		#Preparo los ficheros para extraer datos con mayor facilidad
		
		sed "1,9d" datos/$mes"_"$anho/T_127P*.txt >  datos/$mes"_"$anho/aux1.txt #Comienzo eliminando la cabecera
		#Sustituyo todos los espacios en blanco por uno solo y elimino los puntos que separan los miles
		tr -s " " < datos/$mes"_"$anho/aux1.txt |tr -d "." > datos/$mes"_"$anho/aux2.txt 
		#Sustituyo los espacios entre los campos por comas teniendo el cuenta la clase de los caracteres.
		sed -i -e 's/\([A-Z]\)\ \([0-9]\)/\1\,\2/g' -e 's/\([0-9]\)\ \([0-9]\)/\1\,\2/g'  -e 's/\([0-9]\)\ \([0-9]\)/\1\,\2/g' -e 's/\([0-9]\)\ \([A-Z]\)/\1\,\2/g' datos/$mes"_"$anho/aux2.txt
		sed -i -e 's/SCT/S.C.T/g' datos/$mes"_"$anho/aux2.txt # Vuelvo a poner los puntos en las provincias con abreviaturas (S/C Tenerife)
		for  line in $(cat Prov.txt) 
		do	
			#Recojo en una variable cada uno de los 4 campos de cada linea de Prov.txt
			IDCA=$(echo $line| cut -d "," -f 1)
			CA=$(echo $line| cut -d "," -f 2)
			IDP=$(echo $line| cut -d "," -f 3)
			PRO=$(echo $line| cut -d "," -f 4)
			
			
			if (($j < 10)); then #-lt
				m=0$j
			else                           #Aprovecho el contador j que inicializo arriba para poner la fecha que acompañara a cada dato
				m=$j
			fi
							
			k=2
			#A medida que voy leyendo cada linea de Prov.txt creo un fichero dentro de cada provincia para cada tipo de energia
			#Distingo la provincia de Coruña de las demas por la dificultad para reconocer el caranter "ñ" 
			if [ $PRO == "LA CORUÑA" ];then
				for TipEner in Nuclear Carbones Lignitos Fuel GasNatural OtrosCombustibles Total
				do
					echo $anho$m $(awk -F "," -v k="$k" '$1~"LA CORU"{print $k}' datos/$mes"_"$anho/aux2.txt) >> ./$IDCA"_""$CA"/$IDP"_""$PRO"/$TipEner.txt		#Volcado de cada dato en el fichero correspondiente	
					let k+=1             																														#acompañado de la fecha	
				done					
			else	
				for TipEner in Nuclear Carbones Lignitos Fuel GasNatural OtrosCombustibles Total
				do
					echo $anho$m $(awk -F "," -v k="$k" -v PRO="$PRO" '$1==PRO{print $k}' datos/$mes"_"$anho/aux2.txt) >> ./$IDCA"_""$CA"/$IDP"_""$PRO"/$TipEner.txt			
					let k+=1
				done
			fi
		done		
	done
done


