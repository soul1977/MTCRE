add comment="Default Route (ECMP)" distance=1 gateway=77.88.8.1,77.88.8.1,77.88.8.1,77.88.8.2,77.88.8.2
add check-gateway=ping comment="Default Route (Backup)" distance=2 gateway=77.88.8.3
add check-gateway=ping distance=1 dst-address=77.88.8.1/32 gateway=77.88.8.7 scope=10
add check-gateway=ping distance=1 dst-address=77.88.8.2/32 gateway=77.88.8.8 scope=10
add check-gateway=ping distance=1 dst-address=77.88.8.3/32 gateway=3.3.3.2 scope=10
add check-gateway=ping distance=1 dst-address=77.88.8.7/32 gateway=1.1.1.2 scope=10
add check-gateway=ping distance=1 dst-address=77.88.8.8/32 gateway=2.2.2.2 scope=10



deleted:
add check-gateway=ping comment="Default Route (ECMP)" distance=1 gateway=2.2.2.2,1.1.1.2,1.1.1.2
add check-gateway=ping comment="Default Route (Backup)" distance=2 gateway=3.3.3.2
add check-gateway=ping disabled=yes distance=1 gateway=77.88.8.1
add check-gateway=ping disabled=yes distance=2 gateway=77.88.8.2
add check-gateway=ping disabled=yes distance=3 gateway=77.88.8.3
add check-gateway=ping disabled=yes distance=1 dst-address=77.88.8.1/32 gateway=1.1.1.2 scope=10
add check-gateway=ping disabled=yes distance=1 dst-address=77.88.8.2/32 gateway=2.2.2.2 scope=10
add check-gateway=ping disabled=yes distance=1 dst-address=77.88.8.3/32 gateway=3.3.3.2 scope=10
