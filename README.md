# pihole_img_reconfigure_script
This project is for myself to setup my own local pihole. It is not intended to be used as is for anyone else! These scripts might damage your environment if you run them without changing them to your own needs.

**DO NOT USE THE .sh SCRIPTS BLINDLY**

However i made the project public so you can access the blocklist / whitelist .txt files if you like to.

Usage:
Copy this directory to your raspberry with pihole installed for the first setup. 
Use the project like this:
```
   chmod +x pihole_setup_all.sh
   .\pihole_setup_all.sh
   pihole_setup_all.sh
```
(All other scripts are automatically executed from the setup_all. Setup asks you for new passwords and takes ~20mins to download new pihole version and new blocklists.)
