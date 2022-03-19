# Estudo-Docker

------- Estudo Vagrant -------------

vagrant init <box>: inicializa uma arquivo de configuração 
vagrant status: verifica o status da maquina atual
vagrant global-status: varifica o status de todas as maquinas ja criadas
vagrant halt: desliga a maquina atual
vagrant up: inicializa a maquina


# ------- ESTUDOS DOCKER -------------

docker run <container>: Executa o container
docker stop <container>: Para o container
docker start <container>: Inicia o container
docker ps: lista containers que estão executando no momento
docker ps -a: lista containers que já foram executados
docker -it <container> 

docker run -d <container>: executa container em background
docker build . : constroi a image
docker images: exibi imagens já criadas
docker rm <container>: remove container
docker rm <container> -f: Forçar a removação
docker run -- name nome_do_container <container>: ao executar normal gera um nome aleatorio, com a tags gera com  nome escolhido
docker pull <imagem>: download de imagem
docker tag <container> <nome da image>: alterar tag da image  
docker tag <container> <nome da image>:<nome da tag>: muda nome e a tag
docker build -t <nome> . :gera o build com nome passando
docker rmi <image>: remover imagem 
docker system prune: limpa imagens, containers e networks nao ultilizaveis
docker run --rm <container>: depois de executar o container ao sair ele é deletado
docker cp <container:meuLocadeTrabalho/arquivo> <./caminha para o destino>: copia arquivo do host para meu container
docker top <container>: mostra dados do container rodando
docker inspect <container>: para verificar como o container foi configurado
docker stats: para verificar os processos que estao sendo executados
docker login: logar no docker hub

#--------- Tipo de volume -------------
Volume -> Persistir dados
Volume anonimo: docker run -v /data
Volume nomeados ->  Volumes com nomes, podemos nos referir a estes facilmente
		    e saber para que são utilizados no nosso ambiente

		docker run -v nomdedovolume:/data
		
Bind mounts -> Uma forma de salvar dados na nossa máquina, sem o gerenciamento do docker,
		informamos um diretório para este fim 

		docker run /dir/data:/data


# -------- network ----------

docker network ls : listar os networks
docker network create <nome>: cria uma rede (padrao bridge)
docker network rm <nome da rede>: apagar rede
docker network prune: remove todas as redes nao utilizadas
docker network connect <rede> <container>: conectar container a uma rede manual
docker network disconnect <rede> <container>: desconecta um container de uma rede
docker network inspect <rede>: detalhes da rede

# ---------- Swarm ----------

Nodes: é uma instancia que participa do Swarm
Manager Node: Node que gerencia os demais Nodes
Worker Node: Nodes que trabalham em função do Manager
Service: Um Conjunto de Tasks que o Manager Node manda o Work Node executar
Task: comandos que são executados nos Nodes

Resumo: Teremos varios Node (maquinas), onde em cada uma tera instalado o docker, e escolherar um para 
ser o Manager(gerente) onde vai gerencia os demais outros Nodes, para escolher um Node como Manager
basta executar dentro da maquina que queira docker swarm init. Ao executar o comando vai designar o node como Manager
e aparecerá o comando para ser executado nos demais node que queira gerencia, o comando sera para fazer a ligação com Manager
assim, o manager vai ter controle sobre esse node.

docker node ls: lista o node manager e os nodes que ele gerencia
docker service create --name <nome da aplicação> -p <porta> <imagem>: cria um serviço no meu node
docker service ls: mostra os projetos que estao rodando nas maquinas
docker service rm <nome>: remover serviço 
docker service create --name<nome> --replica <numero de replicas> <imagem>: orquestração . Replica nas demais nodes
docker swarm join-token manager: recebe o token, para adicionar outro nodes
docker info: ver como está configurado
docker node rm <ID> -f: remover node
docker service inspect <ID>: ver detalhes do serviço
docker service ps <ID>: podemos ver quais containers um serviço já rodou, semelhante ao docker ps -a
docker stack deploy -c <arquivo.yaml> <nome>: criando serviço com compose.yaml
docker service scale <nome do serviço>=<quantidade de nodes que quer escalar>: replicando serviço 
docker service update --image <imagem> <serviço>: atualizar as configurações dos nodes
docker service --network-add <nome da rede> <serviço>: adiciona o serviço a uma rede especifica


# -------- Kubernetes ----------

Control PLane: Onde é gerenciado o controle dos processos do Nodes(Manager)
Nodes: Maquinas que sao gerenciadas pelo Control Plane
Deployment: Deployment é responsável por criar e atualizar instâncias de seu aplicativo 
Pode: um ou mais containers que estão em um Node
Services: que expõe os Pods ao mundo externo
kubectl: Cliente de linha de comando para o Kubernetes

install
choco install kubernetes-cli
choco install minikube

minikube start --driver=<Driver>: inicializa o kubernetes na maquina, com o driver que escolhemos
minikube stop: para minikube
minikube dashboard: abri o painel de controle do kubernetes
minikube dashboard --url: mostra a url do dashboard
kubectl version: ver a versao do cluster
kubectl cluster-info: ver informações do cluster
kubectl get nodes: mostra todos os nodes
kubectl get deployments: listar meus deploys
kubectl create deployment <name> --image=<nomedaimagem>

