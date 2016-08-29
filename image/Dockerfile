FROM weaveworks/plugin:1.6.1
ADD ./weaver ./launch.sh ./kube-peers /home/weave/
ADD weavedata.db /weavedb/
COPY ca-certificates.crt /etc/ssl/certs/
ADD https://storage.googleapis.com/kubernetes-release/release/v1.3.5/bin/linux/amd64/kubectl /home/weave/kubectl
ADD http://stedolan.github.io/jq/download/linux64/jq /home/weave/jq
ENTRYPOINT ["/home/weave/launch.sh"]
