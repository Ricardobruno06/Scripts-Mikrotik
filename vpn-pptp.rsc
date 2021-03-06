# by Ricardo Bruno 
# RoterOS 6.44.2
# VPN pptp configuration

/ip pool
add name=pptp-local ranges=10.30.10.2-10.30.10.254
add name=pptp-remoto ranges=10.30.20.2-10.30.20.254
/ppp profile
add dns-server=177.66.116.40,177.66.116.50 local-address=pptp-local name=\
    VPN-profile remote-address=pptp-remoto
/interface pptp-server server
set enabled=yes
/ppp secret
add name=user password=pass profile=VPN-profile service=pptp