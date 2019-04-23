# by Ricardo Bruno 
# RoterOS 6.44.2
# firewall filters


/ip firewall filter
add action=drop chain=input dst-port=8080 protocol=tcp
add action=drop chain=input dst-port=25 protocol=tcp
add action=drop chain=output dst-port=25 protocol=tcp
add action=drop chain=output dst-port=4145 protocol=tcp
add action=drop chain=input dst-port=4145 protocol=tcp
add action=drop chain=input dst-port=443 protocol=tcp
add action=drop chain=output dst-port=443 protocol=tcp
add action=drop chain=output dst-port=53 protocol=tcp
add action=drop chain=output dst-port=53 protocol=udp
add action=drop chain=input dst-port=53 protocol=udp
add action=drop chain=input dst-port=53 protocol=tcp