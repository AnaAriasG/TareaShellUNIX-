
#Descarga y descompresion de archivos.

for anho in {2006..2014}
do
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do	
		curl -o Datos_$anho'_'$mes.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$anho/$mes'_'$anho.zip		
		unzip Datos_$anho'_'$mes.zip -d datos/
		mv datos/$mes datos/$mes'_'$anho #Solo pone el mes
		mv datos/$mes' '$anho datos/$mes'_'$anho #mes y año separados por un espacio
		rm Datos_$anho'_'$mes.zip		
	done
done
for mes2 in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre
	do
		curl -o Datos_2009_$mes2.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/2009/$mes2'%20'2009.zip	#En el 2009 cambia la ruta
		unzip Datos_2009_$mes2.zip -d datos/
		mv datos/$mes2 datos/$mes2'_'2009 
		rm Datos_2009_$mes2.zip
done	

for mes3 in Enero Febrero Marzo Abril  #solo 4 meses de 2015
	do	
		curl -o Datos_2015_$mes3.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/2015/$mes3'_'2015.zip		
		unzip Datos_2015_$mes3.zip -d datos/
		mv datos/$mes3 datos/$mes3'_'2015
		rm Datos_2015_$mes3.zip
done


