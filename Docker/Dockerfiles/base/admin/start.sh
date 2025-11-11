#!/bin/bash

#Carga de las variables de entorno pasadas desde el docker-compose.yml
set -e

check_usuario (){
    if grep -q "${USUARIO}" /etc/passwd
       then
         echo "El usuario ${USUARIO} se encuentra en el sistema" >> /root/logs/informe.log
        return 1
        else
           echo "El usuario ${USUARIO} no se encuentra en el sistema" >> /root/logs/informe.log
           return 0
           fi
}
    
newUser (){
   check_usuario
   if [ $? -eq 0 ]
      then
    useradd -rm -m /home/${USUARIO}/ -s /bin/bash ${USUARIO}
    echo "${USUARIO}:${PASSWORD}" | chpasswd
    echo "Bienvenido ${USUARIO} A tu empresa ..." > /home/${USUARIO}/bienvenido.txt
}

main (){
   touch /root/logs/informe.log
    newUser
  # encargada de mantener el contenedor corriendo
    tail -f /dev/null
    #script que se encargar de configurar la imagen/contenedor
}