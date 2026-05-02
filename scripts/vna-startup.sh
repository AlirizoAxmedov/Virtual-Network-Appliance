#!/bin/bash
# VNA Master Startup Script
# Author: Alirizo Axmedov (2426806)
 
echo "Starting VNA Security Stack..."
 
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "[1/5] IP Forwarding enabled"
 
iptables -F && iptables -t nat -F
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p udp --dport 1194 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A FORWARD -p icmp -j ACCEPT
iptables -A FORWARD -i enp0s8 -o tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -o enp0s8 -j ACCEPT
iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
echo "[2/5] Firewall rules applied"
 
systemctl start openvpn-client@client
sleep 3
echo "[3/5] VPN tunnel started"
 
snort -D -i enp0s8 -c /etc/snort/snort.conf -l /var/log/snort/ 2>/dev/null
echo "[4/5] Snort IDS started"
 
systemctl start haproxy
echo "[5/5] HAProxy started"
 
echo "VNA Security Stack READY"
