##
# FUNÇÕES
##

function createLocalService(){
    
    cp -r ./../geradores/files/network-service.js ./rest-api/src/services/network-service.js

}



while getopts "t:v:" opt; do
    case "$opt" in
    t)
        echo "project type: ${OPTARG}"
        PRJ_TYPE=$OPTARG
        ;;
    v)
        echo "blockchain type: ${OPTARG}"
        NETWORK_SERVICE=$OPTARG
        ;;
    esac
done



##
# INICIANDO 
##

cd ./../
#Criando pasta e entrando nela
mkdir rest-api
cd rest-api #A partir daqui não navege entre as pastas internas

#Iniciando projeto npm
npm init

#Iniciando o básico de um projeto node
#instalando dependencias basicas
npm i --save express http-status-codes dotenv 
#criando pastas e arquivos
mkdir src src/controllers src/routes src/services

#Para projetos blockchain 
if [ "${PRJ_TYPE}" == "blockchain" ]; then
    echo "#instalando dependencias blockchain"
    npm i --save fabric-client fabric-network
    if [ "${NETWORK_SERVICE}" == "local" ]; then
        echo "local"
        createLocalService
    elif [ "${NETWORK_SERVICE}" == "IBP" ]; then
        echo "IBP"
    fi
fi


if [ "${AUTHENTICATION}" == "token" ]; then
    npm i --save mongodb cors axios password-hash
fi

#voltando à raiz
cd ./../
