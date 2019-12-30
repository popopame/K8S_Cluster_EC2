#!/bin/bash

set -ex

#Installation of the needed packet on the server
apt-get -y update
apt-get -y install ansible python-pip

#Installation of the python packets
curl https://raw.githubusercontent.com/kubernetes-sigs/kubespray/master/requirements.txt > requirements.txt
pip install -r requirements.txt


sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward = 1/' /etc/sysctl.conf
