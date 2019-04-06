# by Ricardo Bruno 
# RoterOS 6.44.1
# VPN l2tp configuration

/ip pool
add name=VPN-dhcp-remoto ranges=10.30.0.2-10.30.0.254
add name=VPN-dhcp-local ranges=10.30.5.2-10.30.5.254
/ppp profile
add dns-server=177.66.116.40,177.66.116.50 local-address=VPN-dhcp-local name=\
    VPN-profile1 remote-address=VPN-dhcp-remoto
/interface l2tp-server server
set default-profile=VPN-profile1 enabled=yes ipsec-secret=yoursecretkey \
    use-ipsec=required
/ppp secret
add name=user password=pass profile=VPN-profile1 service=l2tp