#!/bin/bash
pihole -v

chmod +x pihole_listen_on_all_dns_interfaces.sh
./pihole_listen_on_all_dns_interfaces.sh
chmod -x pihole_listen_on_all_dns_interfaces.sh

echo "... OK NEXT"
sleep 1

sudo mkdir -p /backups/etc/pihole/
sudo cp /etc/pihole/adlists.list /backups/etc/pihole/adlists.list
sudo rm /etc/pihole/adlists.list
sudo cp pihole_blocklists_alternative.txt /etc/pihole/adlists.list
sudo cat /etc/pihole/adlists.list

echo "... OK NEXT"
sleep 1

# sudo mkdir -p /backups/etc/pihole/
sudo cp /etc/pihole/lan.list /backups/etc/pihole/lan.list
sudo rm /etc/pihole/lan.list
sudo cp pihole_dns_land_names.txt /etc/pihole/lan.list
sudo cat /etc/pihole/lan.list

echo "... OK NEXT"
sleep 1

sudo mkdir -p /backups/etc/sudoers.d/
sudo cp /etc/sudoers.d/pihole /backups/etc/sudoers.d/pihole
ls /backups/etc/sudoers.d/
sudo mkdir -p /backups/etc/bash_completion.d/
sudo cp /etc/bash_completion.d/pihole /backups/etc/bash_completion.d/pihole
# /etc/bash_completion.d/pihole --> https://github.com/pi-hole/pi-hole/blob/master/advanced/bash-completion/pihole"
ls /backups/etc/bash_completion.d/

echo "... OK NEXT"
sleep 1

sudo mkdir -p /backups/opt/pihole/
sudo cp /opt/pihole/list.sh /backups/opt/pihole/list.sh
# /backups/opt/pihole/ --> https://github.com/pi-hole/pi-hole/blob/master/advanced/Scripts/list.sh
ls /backups/opt/pihole/

echo "... OK NEXT"
sleep 1

#/etc/cron.d/pihole --> https://github.com/pi-hole/pi-hole/blob/master/advanced/Templates/pihole.cron
sudo mkdir -p /backups/etc/cron.d/
sudo cp /etc/cron.d/pihole /backups/etc/cron.d/pihole

echo "... OK NEXT"
sleep 1

# whitelist (in multiple files by category) 
# whitelist main
filenametxt=pihole_temp_wlist_main.txt
filenamesh=$(echo $filenametxt | sed 's/txt/sh/g')
echo '#!/bin/bash' > $filenamesh
awk '{print "pihole -w "$1}' $filenametxt >> $filenamesh
chmod +x $filenamesh
./$filenamesh
chmod -x $filenamesh
# whitelist samsungsmarttv
filenametxt=pihole_temp_wlist_samstv.txt
filenamesh=$(echo $filenametxt | sed 's/txt/sh/g')
echo '#!/bin/bash' > $filenamesh
awk '{print "pihole -w "$1}' $filenametxt >> $filenamesh
chmod +x $filenamesh
./$filenamesh
chmod -x $filenamesh
# whitelist xxx
filenametxt=pihole_temp_wlist_xxx.txt
filenamesh=$(echo $filenametxt | sed 's/txt/sh/g')
echo '#!/bin/bash' > $filenamesh
awk '{print "pihole -w "$1}' $filenametxt >> $filenamesh
chmod +x $filenamesh
./$filenamesh
chmod -x $filenamesh
# whitelist addvert allow, startup in own app usage and kali repo
filenametxt=pihole_temp_wlist_addallow.txt
filenamesh=$(echo $filenametxt | sed 's/txt/sh/g')
echo '#!/bin/bash' > $filenamesh
awk '{print "pihole -w "$1}' $filenametxt >> $filenamesh
chmod +x $filenamesh
./$filenamesh
chmod -x $filenamesh

# extra blacklists which are in no global blocklist yet (all, if it gets to heavy create your own github blocklist)
filenametxt=pihole_temp_blist.txt
filenamesh=$(echo $filenametxt | sed 's/txt/sh/g')
echo '#!/bin/bash' > $filenamesh
awk '{print "pihole -w "$1}' $filenametxt >> $filenamesh
chmod +x $filenamesh
./$filenamesh
chmod -x $filenamesh

echo "... OK NEXT"
sleep 1

chmod +x change_ssh_keys.sh
./change_ssh_keys.sh
chmod -x change_ssh_keys.sh
echo "... OK NEXT"
sleep 1

chmod +x pihole_change_credentials.sh
./pihole_change_credentials.sh
chmod -x pihole_change_credentials.sh

echo "... OK NEXT"
sleep 1

TEST_CURL_GITHUBG=$(curl https://github.com)
if [[ $TEST_CURL_GITHUBG == *"GitHub"* ]]; then
  echo "you can reach github OK"
else
  echo "unable to reach internet"
  FTL_SERV=$( sudo service pihole-FTL status )
  if [[ $FTL_SERV == *"exited"* ]]; then 
    # workaround for upgrade issue
	echo "it looks like your FTL DNS service doesn't work"
	echo "******************************"
	echo "1) simply try ./FIX_FTL.sh"
	echo "******************************"
    echo "2) please try manually: "
	echo "In your /etc/init.d/pihole-FTL you can find a line su -s /bin/sh -c \"/usr/bin/pihole-FTL\" \"$FTLUSER\" replace the whole line by /usr/bin/pihole-FTL"
    echo "sudo systemctl daemon-reload"
    echo "sudo service pihole-FTL restart"
    echo "sudo service pihole-FTL status"
	echo "******************************"
  fi
  echo "EXIT 1"
  exit 1
fi

sudo pihole -up

echo "OK"
echo ""
echo "FERTIG"
