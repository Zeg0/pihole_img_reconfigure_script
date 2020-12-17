#!/bin/bash

echo "going to reset ssh keys..."

find /etc/ssh/ -name "ssh_host*" -print
find /etc/ssh/ -name "ssh_host*" -delete
dpkg-reconfigure openssh-server
update-rc.d -f ssh remove
update-rc.d -f ssh defaults

echo "(should NOT find PermitRootLogin yes below this command)"
cat /etc/ssh/sshd_config | grep "^PermitRootLogin yes$" 

sudo service ssh restart
update-rc.d -f ssh enable 2 3 4 5
echo "resetting ssh keys done"