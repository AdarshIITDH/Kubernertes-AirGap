#!/bin/bash

ARCH="x86_64"
K8s_ARCH="amd64"
CNI_PLUGINS_VERSION="v1.3.0"
CRICTL_VERSION="v1.27.0"
KUBE_RELEASE="v1.27.3"
RELEASE_VERSION="v0.15.1"
K9S_VERSION="v0.27.4"


echo -e "\nDownload Kubernetes Images"


images=(
    "registry.k8s.io/kube-apiserver:${KUBE_RELEASE}"
    "registry.k8s.io/kube-controller-manager:${KUBE_RELEASE}"
    "registry.k8s.io/kube-scheduler:${KUBE_RELEASE}"
    "registry.k8s.io/kube-proxy:${KUBE_RELEASE}"
    "registry.k8s.io/pause:3.9"
    "registry.k8s.io/etcd:3.5.7-0"
    "registry.k8s.io/coredns/coredns:v1.10.1"
    "registry:2.8.2"
    "flannel/flannel:v0.22.0"
    "flannel/flannel-cni-plugin:v1.1.2"
)

for image in "${images[@]}"; do
    # Pull the image from the registry
    docker pull "$image"

    # Save the image to a tar file on the local disk
    image_name=$(echo "$image" | sed 's|/|_|g' | sed 's/:/_/g')
    docker save -o "${image_name}.tar" "$image"

done
