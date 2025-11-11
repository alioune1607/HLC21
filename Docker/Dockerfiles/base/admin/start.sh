#!/bin/bash

#Carga de las variables de entorno pasadas desde el docker-compose.yml
set -e

newUser (){
    useradd -rm -m /home/${USUARIO}/ -s /bin/bash ${USUARIO}
    echo "${USUARIO}:1234" | chpasswd
    echo "Bienvenido ${USUARIO} A tu empresa ..." > /home/${USUARIO}/bienvenido.txt
}

main (){
    newUser
  # encargada de mantener el contenedor corriendo
    tail -f /dev/null
    #script que se encargar de configurar la imagen/contenedor
}

main
