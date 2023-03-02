#!/bin/ash
if [ -e /kubeconfig/kubeconfig.yaml ]
then
    cat /kubeconfig/kubeconfig.yaml
    echo "a variável KUBECONFIG=$KUBECONFIG foi setada"
    spawn-fcgi -s /run/fcgiwrap.socket /usr/bin/fcgiwrap
    chmod 777 /run/fcgiwrap.socket
    echo "Namespaces obtidos com sucesso. Configuração concluída"
else
    echo "ERRO: Arquivo KUBECONFIG não existe. Verifique a pasta de montagem do docker run -v."
    echo "Misconfiguration. Arquivo KUBECONFIG não existe." > /usr/share/nginx/html/index.html
fi

nginx -g "daemon off;"