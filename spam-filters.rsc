# by Ricardo Bruno 
# RoterOS 6.44.1
# spam filters

/ip firewall filter
add action=drop chain=forward dst-port=53 in-interface=WAN protocol=udp
add action=drop chain=input dst-port=53 in-interface=WAN protocol=tcp
add action=drop chain=input comment="ataque de dns (n\E3o desabilitar)" \
    connection-state="" in-interface="WAN" packet-mark=ataque_dns
add action=drop chain=forward dst-port=25 in-interface="WAN" \
    in-interface-list=all out-interface="WAN" out-interface-list=all \
    protocol=tcp
add action=drop chain=forward comment=\
    "Block port-25 for SPAMMERS from spammer-list (rule-1)" dst-port=25 \
    protocol=tcp src-address-list=spammer
add action=add-src-to-address-list address-list=spammer address-list-timeout=\
    3d chain=forward comment=\
    "Add SPAMMERS to spammer-list for 3 days (rule-2)" connection-limit=30,32 \
    dst-port=25 limit=50,5 protocol=tcp src-address-list=!spammer
add action=add-src-to-address-list address-list=spammer address-list-timeout=\
    1d chain=forward comment="Detect and add-list SMTP virus or spammers" \
    connection-limit=30,32 dst-port=25 limit=50,5:packet log=yes log-prefix=\
    spammer protocol=tcp
add action=drop chain=forward comment="BLOCK SPAMMERS OR INFECTED USERS" \
    dst-port=25 protocol=tcp src-address-list=spammer
add action=log chain=forward comment="SPAMMERS LOG" log-prefix=SMTP \
    src-address-list=spammer
add action=add-src-to-address-list address-list=spammer address-list-timeout=\
    1m chain=forward comment="AntiSPAM o AntiWORM" connection-limit=20,32 \
    dst-port=465 protocol=tcp
add action=add-src-to-address-list address-list=spammer address-list-timeout=\
    1m chain=forward connection-limit=10,32 dst-port=25 protocol=tcp
add action=drop chain=forward src-address-list=spammer
