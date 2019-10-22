# oct/21/2019 15:54:37 by RouterOS 6.45.6
# software id = 
#
#
#
/interface ethernet
set [ find default-name=ether1 ] name=ether1-NET1WAN1
set [ find default-name=ether2 ] name=ether2-NET2WAN2
set [ find default-name=ether3 ] name=ether3-NET3WAN3
set [ find default-name=ether9 ] name=ether9-INTERNET
set [ find default-name=ether11 ] name=ether11-management
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip address
add address=192.168.8.129/24 interface=ether9-INTERNET network=192.168.8.0
add address=1.1.1.2/24 interface=ether1-NET1WAN1 network=1.1.1.0
add address=2.2.2.2/24 interface=ether2-NET2WAN2 network=2.2.2.0
add address=3.3.3.2/24 interface=ether3-NET3WAN3 network=3.3.3.0
/ip firewall nat
add action=masquerade chain=srcnat comment="NAT for NET1WAN1" out-interface=ether9-INTERNET src-address=1.1.1.0/24
add action=masquerade chain=srcnat comment="NAT for NET2WAN2" out-interface=ether9-INTERNET src-address=2.2.2.0/24
add action=masquerade chain=srcnat comment="NAT for NET3WAN3" out-interface=ether9-INTERNET src-address=3.3.3.0/24
/ip route
add distance=1 gateway=192.168.8.2
/system identity
set name=PROVIDER
