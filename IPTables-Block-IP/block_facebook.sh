#####################
# Block Facebook #
#####################

/system/bin/iptables -A "afwall" -d 31.13.24.0/21 -j REJECT
/system/bin/iptables -A "afwall" -d 31.13.64.0/18 -j REJECT
/system/bin/iptables -A "afwall" -d 45.64.40.0/22 -j REJECT
/system/bin/iptables -A "afwall" -d 66.220.144.0/20 -j REJECT
/system/bin/iptables -A "afwall" -d 69.63.176.0/20 -j REJECT
/system/bin/iptables -A "afwall" -d 69.171.224.0/19 -j REJECT
/system/bin/iptables -A "afwall" -d 74.119.76.0/22 -j REJECT
/system/bin/iptables -A "afwall" -d 103.4.96.0/22 -j REJECT
/system/bin/iptables -A "afwall" -d 157.240.0.0/17 -j REJECT
/system/bin/iptables -A "afwall" -d 173.252.64.0/18 -j REJECT
/system/bin/iptables -A "afwall" -d 179.60.192.0/22 -j REJECT
/system/bin/iptables -A "afwall" -d 185.60.216.0/22 -j REJECT
/system/bin/iptables -A "afwall" -d 204.15.20.0/22 -j REJECT