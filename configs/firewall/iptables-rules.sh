#!/bin/bash
# VNA Firewall Rules
# Author: Alirizo Axmedov (2426806)
 
iptables -F
iptables -t nat -F
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
 
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p udp --dport 1194 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A FORWARD -p icmp -j ACCEPT
iptables -A FORWARD -i enp0s8 -o tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -o enp0s8 -j ACCEPT
iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
 
echo "Firewall rules applied"
