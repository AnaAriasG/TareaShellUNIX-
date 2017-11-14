
#Descarga y descompresion de archivos.

for anho in {2006..2014}
do
	for mes in Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre
	do	
		curl -o Datos_$anho'_'$mes.zip http://www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$anho/$mes'_'$anho.zip		
		unzip Datos_$anho'_'$mes.zip -d datos/
		mv datos/$mes datos/$mes'_'$anho
		mv datos/$mes' '$anho datos/$mes'_'$anho
		rm Datos_$anho'_'$mes.zip		
	done
done




