
#Descarga y descompresion de archivos.

for anho in {2006..2015}
do
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do	
		curl -o Datos_$anho'_'$mes.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$anho/$mes'_'$anho.zip	#Descargo los archivos
		unzip Datos_$anho'_'$mes.zip -d datos/ #Dsescomprimo los archivos
		mv datos/$mes datos/$mes'_'$anho #Aquellos archivos que vienen solo con el nombre del mes, los guardo como "mes_año"
		mv datos/$mes' '$anho datos/$mes'_'$anho #Aquellos archivos que vienen con mes y año separados por un espacio,  los guardo como "mes_año"
		rm Datos_$anho'_'$mes.zip		#elimino los archivos comprimidos
		
		if [ $anho == 2015 ] && [ $mes == Mayo ]; then # En 2015 solo hay datos hasta el mes de Abril
			break
		fi
	done
	
done

#Los meses correspondientes al año 2009 tiene la ruta diferente, asi que los descargos por separado con este bucle
for mes2 in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre
	do
		curl -o Datos_2009_$mes2.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/2009/$mes2'%20'2009.zip	#Descargo los archivos. Cambio la ruta
		unzip Datos_2009_$mes2.zip -d datos/ #Descomprimo los archivos
		mv datos/$mes2 datos/$mes2'_'2009  #Aquellos archivos que vienen solo con el nombre del mes, los guardo como "mes_año"
		rm Datos_2009_$mes2.zip #Elimino los archivos comprimidos
done	

# Solo hay datos de Enero a Abril en el año 2015, asi que los descargo por separado en este bucle
#for mes3 in Enero Febrero Marzo Abril  #solo 4 meses de 2015
#	do	
#		curl -o Datos_2015_$mes3.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/2015/$mes3'_'2015.zip		#Descargo los archivos
#		unzip Datos_2015_$mes3.zip -d datos/ #Descomprimo los archivos
#		mv datos/$mes3 datos/$mes3'_'2015 #Aquellos archivos que vienen solo con el nombre del mes, los guardo como "mes_año"
#		rm Datos_2015_$mes3.zip #Elimino los archivos comprimidos
#done


