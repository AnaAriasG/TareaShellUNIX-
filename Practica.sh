IFS=$'\n'
for line in $(cat Prov.txt)
do
	mkdir -p ./$(echo $line| cut -d "," -f 1)"_"$(echo $line| cut -d "," -f 2)/$(echo $line| cut -d "," -f 3)"_"$(echo $line| cut -d "," -f 4) #Creando directorios y subdirectorios
done

for file in datos/*
do
	sed "1,9d" $file/T_127P*.txt >  $file/new_T_127P.txt #Eliminar cabecera
done


#sed 's/ //g' datos/*/T_127P*.txt > datos/*/T_127P*.txt #eliminar espacios en blanco
	#sed 's /       / , / g' sample1.txt