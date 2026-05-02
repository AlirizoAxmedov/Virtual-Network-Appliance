# Virtual Network Appliance (VNA)
### Ensuring Cybersecurity of Networks through Virtual Network Appliances

**Student:** Alirizo Axmedov
**Student ID:** 2426806
**University:** University of Wolverhampton
**Module:** 6CS007/ZB1 Project and Professionalism
**Supervisor:** Mr. D. Ergashev

---

## Project Overview
A software-defined Virtual Network Appliance integrating four security
functions in a hybrid cloud environment spanning VirtualBox and Microsoft Azure.

## Architecture
\\\
ParrotOS (Client) --> Ubuntu VNA (Gateway) --> Azure VM (Cloud)
192.168.10.2          192.168.10.1              72.155.89.83
                      10.8.0.2 (VPN)            10.8.0.1 (VPN)
\\\

## Security Functions
| Function | Tool | Purpose |
|---|---|---|
| Firewall | iptables | Packet filtering and access control |
| IDS | Snort | Intrusion detection and alerting |
| VPN | OpenVPN AES-256 | Encrypted site-to-site tunnel |
| Load Balancer | HAProxy | Traffic distribution and failover |

## Network Topology
- ParrotOS isolated client (192.168.10.2) routes all traffic via VNA
- VNA acts as gateway, security inspector and VPN client
- Azure VM acts as VPN server and cloud endpoint
- All inter-site traffic encrypted with AES-256-CBC

## Test Results
- All 12 test cases passed
- VPN throughput: 187 Mbps
- IDS detection rate: 100% on simulated attacks
- Zero packet loss under normal load
- Load balancer failover: seamless with zero dropped requests

## Repository Structure
\\\
configs/
  firewall/   - iptables firewall rules
  vpn/        - OpenVPN client and server configs
  ids/        - Snort custom detection rules
  loadbalancer/ - HAProxy configuration
scripts/
  vna-startup.sh - Master auto-start script
\\\

## Setup Instructions
1. Import Ubuntu-VNA into VirtualBox
2. Import ParrotOS-Client into VirtualBox
3. Start Azure VM (VPN server must start first)
4. Start Ubuntu VNA (connects to Azure via OpenVPN)
5. Start ParrotOS (routes through VNA automatically)

## Security Notice
Private keys and certificates are excluded via .gitignore.
Never commit .key or .pem files to this repository.
