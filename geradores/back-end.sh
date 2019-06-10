
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
mkdir src/controllers src/routes src/services

#Para projetos blockchain 
if [$PRJ_TYPE == "blockchain"]; then
    #instalando dependencias blockchain
    npm i --save fabric-client fabric-network
    if [$NETWORK_SERVICE == "local"]; then

    elif [$NETWORK_SERVICE == "IBP"]; then

    fi
fi


if [$AUTHENTICATION == "token"] then
    npm i --save mongodb cors axios password-hash
fi

#voltando à raiz
cd ./../
