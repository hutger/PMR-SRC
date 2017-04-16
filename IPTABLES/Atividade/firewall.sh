#!/bin/bash

# Apagando todas as regras

iptables –F
iptables –t nat -F

# Habilitando no Kernel o FORWARDING de pacotes entre interfaces
echo "1" > /proc/sys/net/ipv4/ip_forward

# Configurando as regras padrão para DROP para INPUT e FORWARD

iptables –P INPUT DROP
iptables –P FORWARD DROP

# Permitindo conexões ESTABLISHED e RELATED
iptables –A INPUT –m state -–state ESTABLISHED,RELATED –j ACCEPT
iptables –A FORWARD –m state -–state ESTABLISHED,RELATED –j ACCEPT

# Permitindo conexao irrestrita da interface loopback
iptables –A INPUT –i lo –j ACCEPT
iptables –A FORWARD -i lo -o lo –m state -–state ESTABLISHED,RELATED –j ACCEPT


# PREMISSA 1: As consultas DNS recebidas pelo Firewall destinadas ao IP 177.30.20.11 deverão 
# ser traduzidas e encaminhadas para o servidor Quilon (10.0.0.15);
# Dica: Pesquise por DNAT e FORWARD

# PREMISSA 2: Considerando que o MX (Mail Exchanger) para o domínio TUXNET.COM.BR é o 
# IP 177.30.20.12, as requisições para o servidor SMTP deverão ser traduzidas e encaminhadas 
# para o servidor Quilon (10.0.0.15); 
# Dica: Pesquise por DNAT e FORWARD

# PREMISSA 3: A TUXNET possui uma aplicação Web (HTTPS) que encontra-se hospedada no 
# servidor Solon (10.0.0.20) e que deverá estar publicada externamente através do IP 177.30.20.13.
# Dica: Pesquise por DNAT e FORWARD 


# PREMISSA 4: O servidor Tales é um servidor de banco de dados MySQL e NÃO poderá ser acessado 
# a partir da Internet


# PREMISSA 5: Todos os servidores (Quilon, Solon e Tales) poderão acessar a Internet 
# utilizando os serviços HTTP, HTTPS e DNS utilizando os seus IPs externos
# Dica: Pesquise por SNAT e FORWARD


# PREMISSA 6: O Firewall deverá aceitar conexão SSH para si próprio apenas a partir 
# da rede DMZ (10.0.0.0/24)







