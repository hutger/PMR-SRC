#!/bin/bash

HOST=`grep -m1 -ao '[1]''[0-9]''[0-9]' /dev/urandom | head -n1`
IP=10.36.30.$HOST
IF=enp0s3
MASK=255.255.255.0
GW=10.36.30.2

ifconfig $IF $IP netmask $MASK up
route add default gw $GW

ping -c 1 $IP > /dev/null 2>/dev/null

if [ $? -eq 0 ]; then
 echo "Interface configurada com o IP: $IP"
else
 echo "Erro na configuracao. Execute novamente."
fi
