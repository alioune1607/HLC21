#!/bin/bash

config_nginx(){
#inicia nginx en segundo plano
#para lanzar nginx en segundo plano y mantener el ocntenedor activo, n
# necesitas un proceso en primer plano que evite que el docker finalice el contenedor
# nginx, por defecto, se ejecuta como un demonio (en segundo plano),
#pero Docker requiere un proceso principal activo en el contenedor

nginx &
# mantener el contendor activo ejecutando nginx en primer plano
#exec nginx -g 'daemon off;'
#manten el contenedor activo
#tail -f /dev/null

}

load_entrypoint_base(){
#ejecutar el entrypoint ubbase    
bash /root/admin/base/start.sh
}

main(){
    load_entrypoint_base
    config_nginx

    tail -f /dev/null
}

main