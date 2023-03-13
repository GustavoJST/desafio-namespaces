#!/bin/ash
if [ -e /kubeconfig/kubeconfig.yaml ]
then
    echo "A variável de ambiente KUBECONFIG foi configurada com sucesso!"
    spawn-fcgi -s /run/fcgiwrap.socket /usr/bin/fcgiwrap
    chmod 777 /run/fcgiwrap.socket
    echo "Configuração concluída!"
else
    cat /src/misconfiguration.html > /usr/share/nginx/html/index.html
fi

nginx -g "daemon off;"