#!/bin/bash



#Definindo variaveis de ambiente padrão

PRJ_TYPE="simple"

#Para o backend
AUTHENTICATION="none" #none-> Sem autenticação, token -> Autenticacao simples usuario/senha com uso de mongodb

#para PRJ_TYPE == "blockchain"
FABRIC_VERSION="1.4.0"
NETWORK_SERVICE="local" #local ou IBP (IBM Blockchain Plataform)

#lendo parametros de entrada
while getopts "t:v:a:" opt; do
    case "$opt" in
    t)
        PRJ_TYPE="$OPTARG"
        ;;
    v) FABRIC_VERSION=$OPTARG
        ;;
    a)
        AUTHENTICATION="$OPTARG"
        #AUTHENTICATION=$OPTARG
        ;;
    esac
done

echo $AUTHENTICATION
echo $PRJ_TYPE
echo $FABRIC_VERSION

cd geradores

./back-end.sh

if [ "${PRJ_TYPE}" == "blockchain" ]; then
    #Por enquanto apenas local
    echo "Chamando construtor blockchain"
    ./blockchain.sh -v $FABRIC_VERSION -l 
fi

echo "#CRIANDO PROJETO FRONT-END"
./front-end.sh





