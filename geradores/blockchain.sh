

while getopts "liv:" opt; do
    case "$opt" in
    l)
        echo "local"
        NETWORK_SERVICE="local"
        ;;
    i) NETWORK_SERVICE="ibp"
        ;;
    v)
        VERSION="$OPTARG"
        ;;
    esac
done


if [ "${NETWORK_SERVICE}" == "local" ]; then
    echo "Clonando repositório blockchain local"
    cd ./../
    git clone https://github.com/vibaggi/fabric-network-1.4.git buildNetwork
fi