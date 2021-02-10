#!/usr/bin/env bash

# ----- Funciones de requerimientos -----

instalar_requerimientos() {
    if [[ "$(command -v apt)" ]]; then
        echo "apt detectado...instalando"
        sudo apt install cryptsetup
    fi
}


requerimientos() {
    # Revisar si el comando cryptsetup existe
    if ! [ -x "$(command -v cryptsetup)" ]; then
        echo 'Error: cryptsetup no está instalado.' >&2
        instalar_requerimientos
    else
        return 0
    fi
}


# Revisar si el script está siendo ejecutado con permisos de root
if ! [[ "$(id -u)" = 0 ]]; then
    echo "Error, este script necesita privilegios de administrador"
    exit 127
fi
