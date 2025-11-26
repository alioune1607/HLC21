#!/bin/bash
set -e

make_ssh(){
    # Crear directorio para SSH si no existe
    mkdir -p /var/run/sshd
    
    # Configurar SSH
    sed -i 's/#Port 22/Port 2345/' /etc/ssh/sshd_config
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
    sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/' /etc/ssh/sshd_config
    
    # Iniciar servicio SSH
    service ssh start
    
    echo "--> SSH configurado en puerto 2345" >> /root/logs/informe.log
}

# exec /etc/init.d/ssh start &
# exec /usr/sbin/sshd -D & # Dejar el ssh en segundo plano