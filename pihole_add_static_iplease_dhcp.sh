#!/bin/bash
sudo rm /etc/dnsmasq.d/04-pihole-static-dhcp.conf
echo "dhcp-host=B8:27:EB:18:34:DA,192.168.178.236,raspberrypi-2w" | sudo tee -a /etc/dnsmasq.d/04-pihole-static-dhcp.conf
echo "dhcp-host=B8:27:EB:01:C6:7B,192.168.178.20,raspberrypi-1l" | sudo tee -a /etc/dnsmasq.d/04-pihole-static-dhcp.conf
echo "dhcp-host=B8:27:EB:54:93:2E,192.168.178.56,raspberrypi-1w" | sudo tee -a /etc/dnsmasq.d/04-pihole-static-dhcp.conf
echo "dhcp-host=9C:AE:D3:EA:23:24,192.168.178.67,EPSONEA2324" | sudo tee -a /etc/dnsmasq.d/04-pihole-static-dhcp.conf
echo "dhcp-host=C2:39:6F:A6:76:39,192.168.178.205,fritz.repeater" | sudo tee -a /etc/dnsmasq.d/04-pihole-static-dhcp.conf
echo "dhcp-host=B8:BC:5B:A4:A0:94,192.168.178.21,bernds-smart-tv" | sudo tee -a /etc/dnsmasq.d/04-pihole-static-dhcp.conf
echo "dhcp-host=E8:9E:B4:14:E9:5D,192.168.178.28,Honi-Kino" | sudo tee -a /etc/dnsmasq.d/04-pihole-static-dhcp.conf
cat /etc/dnsmasq.d/04-pihole-static-dhcp.conf
