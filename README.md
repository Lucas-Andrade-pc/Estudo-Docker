# Estudo-Docker

# ------- Estudo Vagrant -------------

vagrant init <box>: inicializa uma arquivo de configuração 
vagrant status: verifica o status da maquina atual
vagrant global-status: varifica o status de todas as maquinas ja criadas
vagrant halt: desliga a maquina atual
vagrant up: inicializa a maquina


# ------- ESTUDOS DOCKER -------------

<p> docker run <container>: Executa o container </p>
<p> docker stop <container>: Para o container </p>
<p> docker start <container>: Inicia o container </p>
<p> docker ps: lista containers que estão executando no momento </p>
<p> docker ps -a: lista containers que já foram executados </p>
<p> docker -it <container>  </p>

<p> docker run -d <container>: executa container em background </p>
<p> docker build . : constroi a image</p>
<p> docker images: exibi imagens já criadas</p>
<p> docker rm <container>: remove container</p>
<p> docker rm <container> -f: Forçar a removação</p>
<p> docker run -- name nome_do_container <container>: ao executar normal gera um nome aleatorio, com a tags gera com  nome escolhido</p>
<p> docker pull <imagem>: download de imagem</p>
<p> docker tag <container> <nome da image>: alterar tag da image</p>  
<p> docker tag <container> <nome da image>:<nome da tag>: muda nome e a tag</p>
<p> docker build -t <nome> . :gera o build com nome passando</p>
<p> docker rmi <image>: remover imagem </p>
<p> docker system prune: limpa imagens, containers e networks nao ultilizaveis</p>
<p> docker run --rm <container>: depois de executar o container ao sair ele é deletado</p>
<p> docker cp <container:meuLocadeTrabalho/arquivo> <./caminha para o destino>: copia arquivo do host para meu container</p>
<p> docker top <container>: mostra dados do container rodando</p>
<p> docker inspect <container>: para verificar como o container foi configurado</p>
<p> docker stats: para verificar os processos que estao sendo executados</p>
<p> docker login: logar no docker hub</p>

# --------- Tipos de volumes -------------
<p> Volume -> Persistir dados</p>
<p> Volume anonimo: docker run -v /data</p>
<p> Volume nomeados ->  Volumes com nomes, podemos nos referir a estes facilmente
		    e saber para que são utilizados no nosso ambiente

		docker run -v nomdedovolume:/data</p>
		
<p> Bind mounts -> Uma forma de salvar dados na nossa máquina, sem o gerenciamento do docker,
		informamos um diretório para este fim 

		docker run /dir/data:/data</p>


# -------- network ----------

<p> docker network ls : listar os networks</p>
<p> docker network create <nome>: cria uma rede (padrao bridge)</p>
<p> docker network rm <nome da rede>: apagar rede</p>
<p> docker network prune: remove todas as redes nao utilizadas</p>
<p> docker network connect <rede> <container>: conectar container a uma rede manual</p>
<p> docker network disconnect <rede> <container>: desconecta um container de uma rede</p>
<p> docker network inspect <rede>: detalhes da rede</p>

# ---------- Swarm ----------

<p> Nodes: é uma instancia que participa do Swarm</p>
<p> Manager Node: Node que gerencia os demais Nodes</p>
<p> Worker Node: Nodes que trabalham em função do Manager</p>
<p> Service: Um Conjunto de Tasks que o Manager Node manda o Work Node executar</p>
<p> Task: comandos que são executados nos Nodes</p>

<p> Resumo: Teremos varios Node (maquinas), onde em cada uma tera instalado o docker, e escolherar um para 
ser o Manager(gerente) onde vai gerencia os demais outros Nodes, para escolher um Node como Manager
basta executar dentro da maquina que queira docker swarm init. Ao executar o comando vai designar o node como Manager
e aparecerá o comando para ser executado nos demais node que queira gerencia, o comando sera para fazer a ligação com Manager
assim, o manager vai ter controle sobre esse node.</p>

<p> docker node ls: lista o node manager e os nodes que ele gerencia</p>
<p> docker service create --name <nome da aplicação> -p <porta> <imagem>: cria um serviço no meu node</p>
<p> docker service ls: mostra os projetos que estao rodando nas maquinas</p>
<p> docker service rm <nome>: remover serviço </p>
<p> docker service create --name<nome> --replica <numero de replicas> <imagem>: orquestração . Replica nas demais nodes</p>
<p> docker swarm join-token manager: recebe o token, para adicionar outro nodes</p>
<p> docker info: ver como está configurado</p>
<p> docker node rm <ID> -f: remover node</p>
<p> docker service inspect <ID>: ver detalhes do serviço</p>
<p> docker service ps <ID>: podemos ver quais containers um serviço já rodou, semelhante ao docker ps -a</p>
<p> docker stack deploy -c <arquivo.yaml> <nome>: criando serviço com compose.yaml</p>
<p> docker service scale <nome do serviço>=<quantidade de nodes que quer escalar>: replicando serviço</p> 
<p> docker service update --image <imagem> <serviço>: atualizar as configurações dos nodes</p>
<p> docker service --network-add <nome da rede> <serviço>: adiciona o serviço a uma rede especifica</p>


# -------- Kubernetes ----------

<p> Control PLane: Onde é gerenciado o controle dos processos do Nodes(Manager)</p>
<p> Nodes: Maquinas que sao gerenciadas pelo Control Plane</p>
<p> Deployment: Deployment é responsável por criar e atualizar instâncias de seu aplicativo</p> 
<p> Pode: um ou mais containers que estão em um Node</p>
<p> Services: que expõe os Pods ao mundo externo</p>
<p> kubectl: Cliente de linha de comando para o Kubernetes</p>

<p> install</p>
<p> choco install kubernetes-cli</p>
<p> choco install minikube</p>

<p> minikube start --driver=<Driver>: inicializa o kubernetes na maquina, com o driver que escolhemos</p>
<p> minikube stop: para minikube</p>
<p> minikube dashboard: abri o painel de controle do kubernetes</p>
<p> minikube dashboard --url: mostra a url do dashboard</p>
<p> kubectl version: ver a versao do cluster</p>
<p> kubectl cluster-info: ver informações do cluster</p>
<p> kubectl get nodes: mostra todos os nodes</p>
<p> kubectl get deployments: listar meus deploys</p>
<p> kubectl create deployment <name> --image=<nomedaimagem></p>

