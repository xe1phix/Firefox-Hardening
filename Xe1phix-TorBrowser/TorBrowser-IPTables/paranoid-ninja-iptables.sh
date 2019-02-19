# load modules

# Look which system need
$MODPROBE ip_tables iptable_nat ip_conntrack iptable-filter ipt_state

# Disable ipv6
# No need enable on archlinux
#sysctl -w net.ipv6.conf.all.disable_ipv6=1
#sysctl -w net.ipv6.conf.default.disable_ipv6=1

####################################################
# Flushing rules

echo "[+] Flushing existing rules..."
$IPT -F
$IPT -F -t nat
$IPT -X
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

echo "[+] Setting up $firewall rules ..."

####################################################
# Input chain

$IPT -A INPUT -m state --state INVALID -j LOG --log-prefix "DROP INVALID " --log-ip-options --log-tcp-options
$IPT -A INPUT -m state --state INVALID -j DROP
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Anti-spoofing
$IPT -A INPUT -i $IF ! -s $INT_NET -j LOG --log-prefix "SPOOFED PKT "
$IPT -A INPUT -i $IF ! -s $INT_NET -j DROP

# Accept rule
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -i $IF -p tcp -s $INT_NET --dport 22 --syn -m state --state NEW -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# default input log rule
$IPT -A INPUT ! -i lo -j LOG --log-prefix "DROP " --log-ip-options --log-tcp-options

####################################################
# Output chain

# Tracking rules
$IPT -A OUTPUT -m state --state INVALID -j LOG --log-prefix "DROP INVALID " --log-ip-options --log-tcp-options
$IPT -A OUTPUT -m state --state INVALID -j DROP
$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Accept rules out
#$IPT -A OUTPUT -o lo -j ACCEPT
$IPT -A OUTPUT -p tcp --dport 22 --syn -m state --state NEW -j ACCEPT

# Allow Tor process output
$IPT -A OUTPUT -o $IF -m owner --uid-owner $tor_uid -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -m state --state NEW -j ACCEPT

# Allow loopback output
$IPT -A OUTPUT -o lo -d 127.0.0.1/32 -j ACCEPT

# Tor transproxy magic
$IPT -A OUTPUT -d 127.0.0.1/32 -p tcp -m tcp --dport $trans_port --tcp-flags FIN,SYN,RST,ACK SYN -j ACCEPT

#$IPT -A OUTPUT -m owner --uid-owner $tor_uid -j ACCEPT
$IPT -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

# Default output log rule
$IPT -A OUTPUT ! -o lo -j LOG --log-prefix "DROP " --log-ip-options --log-tcp-options

####################################################
# Forward chain

# Tracking rule
$IPT -A FORWARD -m state --state INVALID -j LOG --log-prefix "DROP INVALID " --log-ip-options --log-tcp-options
$IPT -A FORWARD -m state --state INVALID -j DROP
$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Anti-spoofing rule
$IPT -A FORWARD -i $IF ! -s $INT_NET -j LOG --log-prefix "SPOOFED PKT "
$IPT -A FORWARD -i $IF ! -s $INT_NET -j DROP

# Accept rule

# Default log rule
$IPT -A FORWARD ! -i lo -j LOG --log-prefix "DROP " --log-ip-options --log-tcp-options

####################################################
# NAT chain

$IPT -t nat -A OUTPUT -m owner --uid-owner $tor_uid -j RETURN
$IPT -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports $dns_port
$IPT -t nat -A OUTPUT -m owner --uid-owner $tor_uid -p udp --dport 53 -j REDIRECT --to-ports $dns_port

$IPT -t nat -A OUTPUT -p tcp -d $virt_tor -j REDIRECT --to-ports $trans_port
$IPT -t nat -A OUTPUT -p udp -d $virt_tor -j REDIRECT --to-ports $trans_port

# Don't nat the tor process on local network
$IPT -t nat -A OUTPUT -o lo -j RETURN

# Allow lan access for non_tor 
for lan in $non_tor 127.0.0.0/9 127.128.0.0/10; do
  $IPT -t nat -A OUTPUT -d "$lan" -j RETURN
done

for _iana in $_resv_iana ; do
  $IPT -t nat -A OUTPUT -d "$_iana" -j RETURN
done

# Redirect all other output to TOR
$IPT -t nat -A OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports $trans_port
$IPT -t nat -A OUTPUT -p icmp -j REDIRECT --to-ports $trans_port
$IPT -t nat -A OUTPUT -p udp -j REDIRECT --to-ports $trans_port
