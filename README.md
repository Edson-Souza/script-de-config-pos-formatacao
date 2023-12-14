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
 * DotNet Core.

## Método de teste usados
Isolamento de processos usando container Docker do Debian 12.

### Comandos Docker
Comando usado pra criar a imagem do container com base no arquivo Dockerfile.
```
docker build . -t dts:12b2
```
Subindo container usando imagem 'dts' criada acima.
```
docker run --rm -it -v $PWD:/home/edson/teste dts:12b2 bash
```

## Tecnologias usadas
 * ShellScript Bash;
 * Docker.