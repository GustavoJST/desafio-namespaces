Imagem docker que usa o NGINX e fastCGI para exibir os namespaces de um cluster Kubernetes em uma página HTML localhost.

A página é atualizada para as informações mais recentes através de um script shell que executa através do fastCGI.

Para executar a imagem, use a flag `-v`, apontando o diretório contendo o kubeconfig na sua máquina local, para a pasta `/kubeconfig` dentro do container.

Exemplo:

`docker run -p 8080:80 -v /diretório/com/o/kubeconfig:/kubeconfig gejusto/desafio-namespaces:latest`