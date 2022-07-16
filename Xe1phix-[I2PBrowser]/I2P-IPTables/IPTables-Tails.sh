Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            

Chain FORWARD (policy DROP)
target     prot opt source               destination         

Chain OUTPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9050flags: FIN,SYN,RST,ACK/SYN owner UID match root
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9050flags: FIN,SYN,RST,ACK/SYN owner UID match proxy
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9050flags: FIN,SYN,RST,ACK/SYN owner UID match nobody
ACCEPT     tcp  --  anywhere             localhost            tcpflags: FIN,SYN,RST,ACK/SYN multiport dports 9050,9061,9062,9150 owner UID match amnesia
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9062flags: FIN,SYN,RST,ACK/SYN owner UID match htp
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9062flags: FIN,SYN,RST,ACK/SYN owner UID match tails-iuk-get-target-file
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9062flags: FIN,SYN,RST,ACK/SYN owner UID match tails-upgrade-frontend
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9051 owner UID match tor-launcher
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9051 owner UID match root
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9052 owner UID match amnesia
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:9040 owner UID match amnesia
ACCEPT     udp  --  anywhere             localhost            udp dpt:domain owner UID match amnesia
ACCEPT     udp  --  anywhere             localhost            udp dpt:mdns owner UID match amnesia
ACCEPT     udp  --  anywhere             127.0.0.2            udp dpt:domain owner UID match amnesia
ACCEPT     tcp  --  anywhere             127.0.0.2            tcp dpt:domainflags: FIN,SYN,RST,ACK/SYN owner UID match amnesia
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:ippflags: FIN,SYN,RST,ACK/SYN owner UID match amnesia
ACCEPT     tcp  --  anywhere             localhost            tcp dpt:6136flags: FIN,SYN,RST,ACK/SYN owner UID match amnesia
ACCEPT     tcp  --  anywhere             anywhere             owner UID match clearnet
ACCEPT     udp  --  anywhere             anywhere             owner UID match clearnet udp dpt:domain
lan        all  --  anywhere             10.0.0.0/8          
lan        all  --  anywhere             172.16.0.0/12       
lan        all  --  anywhere             192.168.0.0/16      
ACCEPT     all  --  anywhere             anywhere             owner UID match debian-tor
LOG        all  --  anywhere             anywhere             LOG level debug uid prefix "Dropped outbound packet: "
REJECT     all  --  anywhere             anywhere             reject-with icmp-port-unreachable

Chain lan (3 references)
target     prot opt source               destination         
REJECT     tcp  --  anywhere             anywhere             tcp dpt:domain reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere             udp dpt:domain reject-with icmp-port-unreachable
REJECT     all  --  anywhere             anywhere             owner UID match i2psvc reject-with icmp-port-unreachable
ACCEPT     all  --  anywhere             anywhere            

