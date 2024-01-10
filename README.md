# Kubernertes AirGap

We are witnessing the installation of Kubernetes in an Air Gap Environment. For this demonstration will be installing Kubernetes v1.27.0.
For the whole demonstration will be downloading all the packages in the environment having full access to the internet then will move those binaries to the Air Gap environment.

### Environment Used in Demonstration

 - Server - DGXA100

 - OS - DGX OS 6.1 (Ubuntu 22.04)

 - CUDA - 

 - Firmware - 

 - Docker - 

 - NVIDIA Driver Version - 


All those who will be using a virtual machine on the cloud or a normal bare metal server, can ignore the GPU part.

### Step1 : Installing Docker

We will be downloading all the binaries first like below or just use the docker.sh script.

```

```
or 

```
git clone https://github.com/AdarshIITDH/Kubernertes-AirGap.git
cd Kubernetes-AirGap
bash docker.sh
```
