# Virtual-Network-Appliance

VNA Final Year Project - University of Wolverhampton



\# Virtual Network Appliance (VNA)

\## Ensuring Cybersecurity of Networks through Virtual Network Appliances



\*\*Student:\*\* Alirizo Axmedov

\*\*Student ID:\*\* 2426806

\*\*University:\*\* University of Wolverhampton

\*\*Module:\*\* 6CS007/ZB1 Project and Professionalism

\*\*Supervisor:\*\* Mr. D. Ergashev



\---



\## Project Overview



A software-defined Virtual Network Appliance that integrates four

security functions in a hybrid cloud environment spanning VirtualBox

and Microsoft Azure.



\## Architecture



ParrotOS (Client) → Ubuntu VNA (Gateway) → Azure VM (Cloud)

192.168.10.2         192.168.10.1           72.155.89.83

10.8.0.2 (VPN)         10.8.0.1 (VPN)



\## Security Functions



| Function | Tool | Purpose |

|---|---|---|

| Firewall | iptables | Packet filtering |

| IDS | Snort | Intrusion detection |

| VPN | OpenVPN AES-256 | Encrypted tunnel |

| Load Balancer | HAProxy | Traffic distribution |



\## Test Results



\- All 12 test cases passed

\- VPN throughput: 187 Mbps

\- IDS detection rate: 100%

\- Zero packet loss under normal load

