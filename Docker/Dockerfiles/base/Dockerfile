FROM ubuntu
ARG USUARIO
RUN apt update && apt install -yq --no-install-recommends \ 
    nano \
    git curl wget \
    net-tools iputils-ping \
    sudo

RUN mkdir -p /root/admin/base
WORKDIR /root/admin/base
# 1. relativo al directorio donde se encuentra base --> si se usa build se usa asi
# COPY ./base/admin/start.sh .


# ---> 1. relativo a la ruta del contexto en el docker-compose.yml del proyectbase
# --> 2. workdir dentro del contenedor
COPY ./dockerfiles/base/admin/start.sh .
RUN chmod +x ./start.sh

# el primer comando que se use el contenedor para mantenerse activo
# CMD ["tail", "-f", "/dev/null"]

ENTRYPOINT ["./start.sh"]