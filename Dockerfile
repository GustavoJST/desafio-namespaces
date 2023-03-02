FROM nginx:stable-alpine
COPY fcgiwrap.conf default.conf  /
WORKDIR /usr/local/bin
RUN \
    apk update && apk add fcgiwrap spawn-fcgi tzdata && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv /fcgiwrap.conf /etc/nginx/fcgiwrap.conf && \
    mv /default.conf /etc/nginx/conf.d/default.conf
COPY namespaces/get-namespaces /usr/lib/namespaces/get-namespaces
RUN chmod 755 /usr/lib/namespaces/get-namespaces
WORKDIR /src
ENV KUBECONFIG=/kubeconfig/kubeconfig.yaml
ENV TZ=America/Sao_Paulo
COPY get-namespaces.sh /src/
COPY index.html /usr/share/nginx/html/index.html
ENTRYPOINT [ "sh", "get-namespaces.sh" ]