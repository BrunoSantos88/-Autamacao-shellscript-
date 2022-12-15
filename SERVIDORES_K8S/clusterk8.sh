#!/bin/bash ubuntu 20:04
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "step1"
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
echo "kubeadm install"
sudo apt update -y
sudo apt -y install vim git curl wget kubelet=1.23.0-00 kubeadm=1.23.0-00 kubectl=1.23.0-00
sudo apt-mark hold kubelet kubeadm kubectl
echo "memory swapoff"
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo swapoff -a
sudo modprobe overlay
sudo modprobe br_netfilter
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
sysctl --system
sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
sysctl --system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y containerd.io
mkdir -p /etc/containerd
containerd config default>/etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd
sudo systemctl enable kubelet
sudo kubeadm config images pull --cri-socket /run/containerd/containerd.sock --kubernetes-version v1.23.0

# kubeadm init 
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 

#kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address= "YOUR IP PUCLIC"


# Flanel network
sudo curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/canal.yaml -O
kubectl apply -f canal.yaml

# Calico network
sudo curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/calico-policy-only.yaml -o calico.yaml
kubectl apply -f calico.yaml

# create Join
kubeadm token create --print-join-command
