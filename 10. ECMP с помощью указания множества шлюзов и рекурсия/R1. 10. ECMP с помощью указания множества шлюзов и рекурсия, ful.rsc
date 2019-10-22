# oct/22/2019 00:20:02 by RouterOS 6.45.6
# software id = 
#
#
#
/interface ethernet
set [ find default-name=ether1 ] name=ether1-WAN1
set [ find default-name=ether2 ] name=ether2-WAN2
set [ find default-name=ether3 ] name=ether3-WAN3
set [ find default-name=ether4 ] name=ether4-LAN
set [ find default-name=ether11 ] name=ether11-management
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip address
add address=10.10.10.1/24 interface=ether4-LAN network=10.10.10.0
add address=1.1.1.1/24 interface=ether1-WAN1 network=1.1.1.0
add address=3.3.3.1/24 interface=ether3-WAN3 network=3.3.3.0
add address=2.2.2.1/24 interface=ether2-WAN2 network=2.2.2.0
/ip firewall nat
add action=masquerade chain=srcnat comment="NAT WAN1" out-interface=ether1-WAN1 src-address=10.10.10.0/24
add action=masquerade chain=srcnat comment="NAT WAN2" out-interface=ether2-WAN2 src-address=10.10.10.0/24
add action=masquerade chain=srcnat comment="NAT WAN3" out-interface=ether3-WAN3 src-address=10.10.10.0/24
/ip route
add comment="Default Route (ECMP)" distance=1 gateway=77.88.8.1,77.88.8.1,77.88.8.1,77.88.8.2,77.88.8.2
add check-gateway=ping comment="Default Route (Backup)" distance=2 gateway=77.88.8.3
add check-gateway=ping distance=1 dst-address=77.88.8.1/32 gateway=77.88.8.7 scope=10
add check-gateway=ping distance=1 dst-address=77.88.8.2/32 gateway=77.88.8.8 scope=10
add check-gateway=ping distance=1 dst-address=77.88.8.3/32 gateway=3.3.3.2 scope=10
add check-gateway=ping distance=1 dst-address=77.88.8.7/32 gateway=1.1.1.2 scope=10
add check-gateway=ping distance=1 dst-address=77.88.8.8/32 gateway=2.2.2.2 scope=10
/system identity
set name=R1
