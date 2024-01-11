#!/bin/bash

echo -e "\n Downloading Kubernetes Binaries"

curl -L -O "https://github.com/containernetworking/plugins/releases/download/${CNI_PLUGINS_VERSION}/cni-plugins-linux-${K8s_ARCH}-${CNI_PLUGINS_VERSION}.tgz"
curl -L -O "https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-${K8s_ARCH}.tar.gz"
curl -L --remote-name-all https://dl.k8s.io/release/${KUBE_RELEASE}/bin/linux/${K8s_ARCH}/{kubeadm,kubelet}
curl -L -O "https://raw.githubusercontent.com/kubernetes/release/${RELEASE_VERSION}/cmd/kubepkg/templates/latest/deb/kubelet/lib/systemd/system/kubelet.service"
curl -L -O "https://raw.githubusercontent.com/kubernetes/release/${RELEASE_VERSION}/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf"
curl -L -O "https://dl.k8s.io/release/${KUBE_RELEASE}/bin/linux/${K8s_ARCH}/kubectl"

echo -e "\n Done"
