# by Ricardo Bruno 
# RoterOS 6.44.1
# IPv6 configuration
 
add name=pool1-IPv6 prefix=2804:4fe8::/48 prefix-length=64
add name=PoolPD prefix=2804:4fe8:1::/48 prefix-length=58
/ipv6 address
add address=2001:db8:100:ded1:cad0::2/126 advertise=no comment=IPV6-CONFIGURACAO \
    interface=eteher2
/ipv6 nd
set [ find default=yes ] advertise-dns=yes other-configuration=yes
