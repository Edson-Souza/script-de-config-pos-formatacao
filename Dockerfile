FROM debian:12

RUN apt update && apt upgrade -y
RUN apt install sudo -y && apt update && apt upgrade -y
RUN adduser edson && usermod -aG sudo edson
RUN echo 'edson:edson' | chpasswd
USER edson
WORKDIR /home/edson/teste