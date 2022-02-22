#/bin/bash
sudo yum install -y yum-utils # o pacote (que fornece o utilitário) e configure o repositório estável.
yum-config-manager --disable C7.1.1503-updates
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce  docker-ce-cli containerd.io -y #nstale a versão mais recente do Docker Engine e contêiner
sudo systemctl start docker #startar docker 
sudo systemctl enable docker 