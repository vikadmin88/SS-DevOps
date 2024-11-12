#!/bin/bash

# Shows OS version, all users on the OS with bash shell installed and shows the open ports

echo -e "\nOS Versions:"
hostnamectl

echo -e "\nUsers with bash enabled:"
grep 'bash' '/etc/passwd'

echo -e "\nOpen ports:"
netstat -tulnp
