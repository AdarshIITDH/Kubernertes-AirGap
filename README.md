# Kubernertes AirGap

We are witnessing the installation of Kubernetes in an Air Gap Environment. For this demonstration will be installing Kubernetes v1.27.0.
For the whole demonstration will be downloading all the packages in the environment having full access to the internet then will move those binaries to the Air Gap environment.

### Environment Used in Demonstration

 - Server - DGXA100

 - OS - DGX OS 6.1 (Ubuntu 22.04)

 - CUDA - 12.2

 - Docker - 23.04

 - NVIDIA Driver Version - 535.5


All those who will be using a virtual machine on the cloud or a normal bare metal server, can ignore the GPU part.

### Step1 : Installing Docker

We will be downloading all the binaries first like below or just use the docker.sh script.

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
bash docker.sh
```
