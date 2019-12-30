#!/bin/bash
set -ex

#Activate IP forwarding
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward = 1/' /etc/sysctl.conf
sysctl -p


#Disabling the system firewall
ufw disable
