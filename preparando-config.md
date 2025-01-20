# Guia para Configuração do Script Ubuntu

Este tutorial descreve como atualizar o sistema, instalar o Git (se necessário) e configurar o script para execução.

## Passo 1: Atualizar o sistema e instalar o Git
Execute o comando abaixo para garantir que o sistema esteja atualizado e que o Git esteja instalado:

```bash
sudo apt update && sudo apt install -y git
```

## Passo 2: Clonar o repositório com o script
Utilize o comando abaixo para clonar o repositório que contém o script:

```bash
git clone https://github.com/Loljr1987/script-ubuntu.git
```

## Passo 3: Acessar a pasta do repositório
Entre na pasta do repositório clonado usando o seguinte comando:

```bash
cd script-ubuntu
```

## Passo 4: Tornar o script executável
Habilite permissões de execução para o script com o comando abaixo:

```bash
chmod +x script-ubuntu.sh
```

## Passo 5: Executar o script
Execute o script para iniciar o processo de configuração:

```bash
./script-ubuntu.sh
```
