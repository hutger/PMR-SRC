# **Atividade IPTABLES – Montando um Firewall Linux usando IPTABLES para publicação de serviços na Internet**

Você foi contratado pela empresa TUXNET para implementar um Firewall Linux que permita que os seus serviços estejam disponibilizados na Internet. O ambiente da TUXNET pode ser observado abaixo:

Inline-style: 
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")




Uma tabela contemplando os nomes dos servidores, serviços, endereços IP (externos e internos) e uma breve descrição pode ser observado abaixo:

| **Nome** | **Serviço** | **IP Externo** | **IP Interno** | **Descrição** |
| --- | --- | --- | --- | --- |
| Quilon | DNS | 177.30.20.11 | 10.0.0.15 | Servidor responsável por hospedar os serviços de DNS e SMTP na Internet |
| SMTP | 177.30.20.12 |
| Solon | HTTPS | 177.30.20.13 | 10.0.0.20 | Servidor responsável por hospedar disponibilizar o serviço de HTTPS na Internet |
| Tales | MySQL DB | - | 10.0.0.25 | Servidor de banco de dados interno |

O cliente repassou para você as seguintes premissas que deverão ser seguidas para o desenvolvimento das regras:

1. As consultas DNS recebidas pelo Firewall destinadas ao IP 30.20.11 deverão ser traduzidas e encaminhadas para o servidor Quilon (10.0.0.15);
2. Considerando que o MX (_Mail Exchanger_) para o domínio TUXNET.COM.BR é o IP 30.20.12, as requisições para o servidor SMTP deverão ser traduzidas e encaminhadas para o servidor Quilon (0.0.15);
3. A TUXNET possui uma aplicação Web (HTTPS) que encontra-se hospedada no servidor Solon (0.0.20) e que deverá estar publicada externamente através do IP 30.20.13.
4. O servidor Tales é um servidor de banco de dados MySQL e NÃO poderá ser acessado a partir da Internet
5. Todos os servidores (Quilon, Solon e Tales) poderão acessar a Internet utilizando os serviços HTTP, HTTPS e DNS utilizando os seus IPs externos
6. O Firewall deverá aceitar conexão SSH para si próprio apenas a partir da rede DMZ (0.0.0/24)

Desenvolva um _script_ com regras de filtragem e NAT utilizando o IPTables de modo que as premissas acima listadas sejam respeitadas.

Utilize como base para o desenvolvimento o _script_ publicado através do Link abaixo:

[https://raw.githubusercontent.com/hutger/PMR-SRC/master/IPTABLES/Atividade/firewall.sh](https://raw.githubusercontent.com/hutger/PMR-SRC/master/IPTABLES/Atividade/firewall.sh)
