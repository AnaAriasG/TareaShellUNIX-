
#Descarga y descompresion de archivos.

BASEURL="http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales"

for anho in {2006..2014}
do
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do	
		curl -o Datos_$anho'_'$mes.zip $BASEURL/$anho/$mes'_'$anho.zip		
		unzip Datos_$anho'_'$mes.zip -d datos/
		mv datos/$mes datos/$mes'_'$anho #Solo pone el mes
		mv datos/$mes' '$anho datos/$mes'_'$anho #mes y año separados por un espacio
		rm Datos_$anho'_'$mes.zip		
	done
done

for anho2 in 2009
do
	for mes2 in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre
	do
		curl -o Datos_$anho2'_'$mes2.zip $BASEURL/$anho2/$mes2'%20'$anho2.zip	#En el 2009 cambia la ruta
		unzip Datos_$anho2'_'$mes2.zip -d datos/
		mv datos/$mes2 datos/$mes2'_'$anho2 
		rm Datos_$anho2'_'$mes2.zip
	done
done	

for anho3 in 2015
do
	for mes3 in Enero Febrero Marzo Abril  #solo 4 meses de 2015
	do	
		curl -o Datos_$anho3'_'$mes3.zip $BASEURL/$anho3/$mes3'_'$anho3.zip		
		unzip Datos_$anho3'_'$mes3.zip -d datos/
		mv datos/$mes3 datos/$mes3'_'$anho3
		rm Datos_$anho3'_'$mes3.zip
	done
done


