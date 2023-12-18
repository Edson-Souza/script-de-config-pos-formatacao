# Script Pos Formatação

## Objetivo
Configurar um ambiente de desenvolvimento e uso pessoal usando automação de processos com shellScript no Debian 12.

## Configurações realizadas
 * Aliases: atualizar;
 * Git;
 * Docker;
 * VsCode;
 * Google Chrome;
 * Gimp;
 * Spotify;
 * DotNet Core;
 * Transmission.

## Método de teste usados
Isolamento de processos usando container Docker no Debian 12.

### Comandos Docker
Comando usado pra criar a imagem do container com base no arquivo Dockerfile.
```
docker build . -t dts:12b3
```
Subindo container usando imagem 'dts' criada acima.
```
docker run --rm -it -v $PWD:/home/edson/teste dts:12b3 bash
```

## Tecnologias usadas
 * ShellScript Bash;
 * Docker.

## Pretenções
 * Configurações do Xfce;
 * Configurações do Transmission;
 * Configurações do VsCode;
 * Mega;
 * Wine;
 * Oracle VM.