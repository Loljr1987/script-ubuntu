#!/bin/bash

# Função para exibir mensagens de forma destacada
function print_message() {
    echo -e "\n\e[1;32m$1\e[0m\n"
}

# Atualização do sistema
print_message "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instalando o Google Chrome
print_message "Instalando o Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb

# Instalando Git e NPM
print_message "Instalando pacotes Git e NPM..."
sudo apt install git npm -y

# Instalando o NVM (Node Version Manager)
print_message "Instalando o NVM (Node Version Manager)..."
sudo apt install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

# Carregando o NVM
print_message "Carregando o NVM..."
source ~/.nvm/nvm.sh

# Instalando a versão mais recente do Node.js
print_message "Instalando a versão mais recente do Node.js..."
nvm install node

# Instalando uma versão LTS do Node.js (caso prefira uma versão estável)
print_message "Instalando a versão LTS do Node.js (22.11.0)..."
nvm install 22.11.0

# Definindo a versão do Node.js para uso
print_message "Definindo a versão 22.11.0 do Node.js..."
nvm use 22.11.0

# Atualizando o NPM
print_message "Atualizando o NPM..."
sudo npm install -g npm


# Instalando o Python a partir do código-fonte
print_message "Baixando e instalando o Python 3.12..."
wget https://www.python.org/ftp/python/3.12.6/Python-3.12.6.tar.xz
tar -xf Python-3.12.6.tar.xz
cd Python-3.12.6

# Instalando as dependências para compilação do Python
print_message "Instalando dependências para a compilação do Python..."
sudo apt-get install build-essential gdb lcov pkg-config \
libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
lzma lzma-dev tk-dev uuid-dev zlib1g-dev -y

# Compilando e instalando o Python
print_message "Compilando e instalando o Python..."
sudo ./configure
sudo make -j "$(nproc)"  # Usando o número máximo de processadores
sudo make install

# Verificando a instalação do Python
print_message "Verificando a instalação do Python..."
which python3.12
python3.12 --version

# Instalando o Pip (gerenciador de pacotes do Python)
print_message "Instalando o Pip para o Python 3.12..."
python3.12 -m ensurepip --upgrade
python3.12 -m pip install pandas

# Instalando o Pyenv
print_message "Instalando o Pyenv..."
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Configurando o Pyenv no bashrc
print_message "Configurando o Pyenv no arquivo .bashrc..."
echo -e '\nexport PYENV_ROOT="$HOME/.pyenv"\n[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"\neval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Atualizando o Pyenv
print_message "Atualizando o Pyenv..."
pyenv update

# Listando versões disponíveis do Python
print_message "Listando as versões disponíveis do Python..."
pyenv install -l

# Instalando uma versão específica do Python com o Pyenv
print_message "Instalando o Python 3.12 com o Pyenv..."
pyenv install 3.12.6
pyenv global 3.12.6

# Instalando o Docker
print_message "Instalando o Docker..."
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Testando a instalação do Docker
print_message "Testando a instalação do Docker..."
sudo docker run hello-world

# Adicionando o usuário ao grupo docker
print_message "Adicionando o usuário ao grupo Docker..."
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Instalando o Docker Compose
print_message "Instalando o Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificando a versão do Docker Compose
docker-compose --version

# Instalando o JDK
print_message "Instalando o JDK (Java Development Kit)..."
sudo apt update
sudo apt install openjdk-21-jdk

# Verificando a instalação do JDK
print_message "Verificando a instalação do JDK..."
java -version

# Instalando o Gradle
print_message "Instalando o Gradle..."
sudo snap install gradle --classic

# Instalando o IntelliJ
print_message "Instalando o IntelliJ IDEA..."
sudo snap install intellij-idea-community --classic

# Instalando o Visual Studio Code
print_message "Instalando o Visual Studio Code..."
sudo snap install code --classic

# Instalando o Eclipse
print_message "Instalando o Eclipse..."
sudo snap install eclipse --classic

# Instalando o PyCharm
print_message "Instalando o PyCharm..."
sudo snap install pycharm-community --classic

# Instalando o Angular CLI
print_message "Instalando o Angular CLI..."
sudo npm install -g @angular/cli@17
ng version

# Instalando o Ionic CLI
print_message "Instalando o Ionic CLI..."
sudo npm install -g @ionic/cli
ionic --version

# Instalando o Flutter
print_message "Instalando o Flutter..."
sudo snap install flutter --classic

# Instalar outros aplicativos via loja (opcional)
print_message "Instalando outros aplicativos..."
sudo apt install gdebi
sudo apt install gnome-tweaks

sudo snap install vlc --classic
sudo snap install amberol --classic
sudo snap install guvcview --classic
sudo snap install xampp --classic

print_message "Instalação completa! Todos os pacotes foram instalados com sucesso."

