# pihole_img_reconfigure_script
This project is for myself to setup my own local pihole. It is not intended to be used as is for anyone else! These scripts might damage your environment if you run them without changing them to your own needs.

**DO NOT USE THE .sh SCRIPTS BLINDLY** (pihole_setup_all.sh, pihole_dns_land_names.txt, pihole_listen_on_all_dns_interfaces.sh, change_ssh_keys.sh, pihole_change_credentials.sh, ...)

However i made the project public so you can access the blocklist / whitelist .txt files if you like to.

**USAGE: **
Copy this directory to your raspberry with pihole installed for the first setup.
(copy into a folder WORKDIRNAME)
Prepare linefeeds:
```
   sudo apt-get install dos2unix
   cd WORKDIRNAME
   find . -type f -print0 | xargs -0 dos2unix
```
Use the project like this:
```
   chmod +x pihole_setup_all.sh
   ./pihole_setup_all.sh
   chmod -x pihole_setup_all.sh
```
(All other scripts are automatically executed from the setup_all. Setup asks you for new passwords and takes ~20mins to download new pihole version and new blocklists.)


**UPDATE / FIRST INSTALL**
Download Rasperry pi imager https://www.raspberrypi.org/software/

Choose Raspberry OS (Raspian) and your SD-Card. Press STRG+SHIFT+X for wlan and ssh advanced setup .

Install SD and start your raspberry pi. Connect with tools like Putty ssh or WinSCP...

Install Pihole: https://docs.pi-hole.net/main/basic-install/

```
	wget -O basic-install.sh https://install.pi-hole.net
	sudo bash basic-install.sh
```

