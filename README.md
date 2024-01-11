# Kubernertes AirGap

We are witnessing the installation of Kubernetes in an Air Gap Environment. For this demonstration will be installing Kubernetes v1.27.0.
For the whole demonstration will be downloading all the packages in the environment having full access to the internet then will move those binaries to the Air Gap environment.

### Environment Used in Demonstration

 - Server - NVIDIA DGXA100

 - OS - DGX OS 6.1 (Ubuntu 22.04)

 - CUDA - 12.2 (optional)

 - Docker - 23.04

 - NVIDIA Driver Version - 535.5 (optional)


All those who will be using a virtual machine on the cloud or a normal bare metal server can ignore the GPU part.

## Download all the artifacts
### Step1 : Docker Binaries

We will be downloading all the binaries first like below or just use the docker_binaries.sh script.

```
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_23.0.2-1~ubuntu.22.04~jammy_amd64.deb
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.6.19-1_amd64.deb
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.17.2-1~ubuntu.22.04~jammy_amd64.deb
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-rootless-extras_23.0.2-1~ubuntu.22.04~jammy_amd64.deb
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_23.0.2-1~ubuntu.22.04~jammy_amd64.deb
```
or 

```
git clone https://github.com/AdarshIITDH/Kubernetes-AirGap.git
cd Kubernetes-AirGap
bash docker_binaries.sh
```
### Step2 : Kubernetes Binaries

We will be downloading all the binaries first like below or just use the kubernetes_binaries.sh script.
```
curl -L -O "https://github.com/containernetworking/plugins/releases/download/${CNI_PLUGINS_VERSION}/cni-plugins-linux-${K8s_ARCH}-${CNI_PLUGINS_VERSION}.tgz"
curl -L -O "https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-${K8s_ARCH}.tar.gz"
curl -L --remote-name-all https://dl.k8s.io/release/${KUBE_RELEASE}/bin/linux/${K8s_ARCH}/{kubeadm,kubelet}
curl -L -O "https://raw.githubusercontent.com/kubernetes/release/${RELEASE_VERSION}/cmd/kubepkg/templates/latest/deb/kubelet/lib/systemd/system/kubelet.service"
curl -L -O "https://raw.githubusercontent.com/kubernetes/release/${RELEASE_VERSION}/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf"
curl -L -O "https://dl.k8s.io/release/${KUBE_RELEASE}/bin/linux/${K8s_ARCH}/kubectl"
```
or 
```
git clone https://github.com/AdarshIITDH/Kubernetes-AirGap.git
cd Kubernetes-AirGap
bash kubernetes_binaries.sh
```

### Step3 : Kubernetes other components (images)

```
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
```
### Step4 : Other Remaining Dependies

```
echo -e "\nDownload dependencies"
curl -O "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Everything/${ARCH}/os/Packages/s/socat-1.7.4.2-3.fc37.${ARCH}.rpm"
curl -O "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Everything/${ARCH}/os/Packages/l/libcgroup-3.0-1.fc37.${ARCH}.rpm"
curl -O "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Everything/${ARCH}/os/Packages/c/conntrack-tools-1.4.6-4.fc37.${ARCH}.rpm"
curl -LO "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_${K8s_ARCH}.tar.gz"
curl -LO "https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml"
```
