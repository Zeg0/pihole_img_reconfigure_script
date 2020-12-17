#!/bin/bash

FALSE_LINE="su -s /bin/sh -c \"/usr/bin/pihole-FTL\" \"\$FTLUSER\""
CORRECT_LINE="/usr/bin/pihole-FTL"
LINES=$(cat /etc/init.d/pihole-FTL)
if [[ $LINES == *$FALSE_LINE* ]]; then
  sudo sed -i "s/$FALSE_LINE/$CORRECT_LINE/g" /etc/init.d/pihole-FTL
  echo "following should be the corrected line (without su -s /bin/sh -c ... at the beginnning) "
  cat /etc/init.d/pihole-FTL | grep $CORRECT_LINE
  sudo systemctl daemon-reload
  sudo service pihole-FTL restart
  sudo service pihole-FTL status
else
  echo "FTL file looks OK"
fi