#!/bin/bash

echo "Type in a new password for computer user PI"
sudo passwd

echo "Type in a new password for computer user PI (again)"
sudo passwd pi

echo "Type in a new password for computer user ROOT"
sudo passwd root

echo "Type in a new password for PIHOLE-WEBADMIN"
read piweb
sudo pihole -a -p $piweb