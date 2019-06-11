cd ./../

#Recebendo parametros
while getopts "a:" opt; do
    case "$opt" in
    a)
        echo "authentication type: ${OPTARG}"
        AUTHENTICATION=$OPTARG
        ;;
    esac
done

#ng new front-end --style="scss" --routing

if [ "${AUTHENTICATION}" == "token" ]; then
    mkdir ./front-end/src/app/services
    echo "#Criando servico de autenticacao e interceptador para passar token por header"
    cp -r ./geradores/files/auth.service.tmpl ./front-end/src/app/services/auth.service.ts
    cp -r ./geradores/files/token.interceptor.tmpl ./front-end/src/app/services/token.interceptor.ts

fi