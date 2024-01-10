#! /bin/bash

export PUBLIC_IP=$(curl ifconfig.me)
K3S_VERSION=v1.27.6+k3s1
echo $PUBLIC_IP
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=$K3S_VERSION INSTALL_K3S_EXEC="server --disable=traefik  --node-external-ip=$PUBLIC_IP --tls-san=$PUBLIC_IP --tls-san=k8s.ijuned.com" sh -
mkdir -p /root/.kube/
cp /etc/rancher/k3s/k3s.yaml /root/.kube/config
cat /root/.kube/config | sed "s|127.0.0.1|$PUBLIC_IP|g" > /tmp/kube_config.yaml
