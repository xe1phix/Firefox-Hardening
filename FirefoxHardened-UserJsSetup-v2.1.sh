#!/bin/sh
## 

## Make A Directory Called Scripts, And cd Into The Directory:
mkdir Scripts && cd Scripts/


## Clone The Firefox Hardening Projects Github Repository:
git clone https://github.com/pyllyukko/user.js


## cd Into The user.js Directory:
cd user.js/


## Pick a Firefox Profile 


##_____________________________________________________________________________________________________________________________________________________
   [+] systemwide_user.js	|  systemwide_user.js | profile allows values in about:config to be modified. ## Profile is persistent through browser sessions.
   [+] locked_user.js 		|  locked_user.js  	  | profile will locked the about:config and the firefox-esr.js file
   [+] 000-tor-browser.js	|  000-tor-browser.js | profile is imported from the torproject website.



## Make The Selected Firefox Profile .js file: 
make 000-tor-browser.js
make systemwide_user.js
make locked_user.js
make tbb-diff tbb-diff-2
make tbb-missing-from-user.js




| OS             | Path                                                  					     |
| -------------- | ----------------------------------------------------------------------------- |
| Linux (Debian) | `/etc/firefox-esr/firefox-esr.js`        									 |
| Linux          | `~/.mozilla/firefox/XXXXXXXX.your_profile_name/user.js`                       |
| Android        | `/data/data/org.mozilla.firefox/files/mozilla/XXXXXXXX.your_profile_name` 	 |	## see [issue #14](https://github.com/pyllyukko/user.js/issues/14) |
| -------------- | ----------------------------------------------------------------------------- |



## Copy The user.js File into The Users Firefox Directory:
cp -v user.js /home/xe1phix/.mozilla/firefox/xk1uxyq9.Parrot/user.js


## Copy The Selected Firefox Profile Config to /etc/firefox-esr/ Directory:
cp -v systemwide_user.js /etc/firefox-esr/firefox-esr.js
cp -v locked_user.js /etc/firefox-esr/firefox-esr.js
cp -v 000-tor-browser.js /etc/firefox-esr/firefox-esr.js
cp -v Hardened.js /etc/firefox-esr/firefox-esr.js


## Remove Any Previous Firefox Config Files:
rm -f ~/.mozilla/firefox/xk1uxyq9.Parrot/prefs.js
rm -f /etc/firefox/firefox.js


## Concatinate These Firefox.js Configs:
cat /usr/lib/firefox-esr/browser/defaults/preferences/firefox.js
cat /usr/lib/firefox-esr/browser/defaults/preferences/firefox.js | less
cat /usr/lib/firefox-esr/browser/defaults/syspref/firefox-esr.js


## Copy/Backup The Special Firefox Prefs.js Configs:
cp -v /usr/lib/firefox/browser/prefs.js ~/usr-lib-firefox-prefs.js
cp -v /usr/lib/firefox-esr/browser/prefs.js ~/usr-lib-firefox-esr-prefs.js
cp -v /usr/lib/firefox-esr/browser/defaults/preferences/firefox.js ~/firefox.js
cp -v /usr/lib/firefox-esr/browser/defaults/preferences/webide-prefs.js ~/webide-prefs.js
cp -v /usr/lib/firefox-esr/browser/defaults/preferences/devtools.js ~/devtools.js


## Remove the Firefox prefs.js That Have Vulnerable Firefox Config Settings.
rm -f /usr/lib/firefox/browser/prefs.js
rm -f /usr/lib/firefox-esr/browser/prefs.js
rm -f /usr/lib/parrot-skel/etc/skel/.mozilla/firefox/xk1uxyq9.Parrot/prefs.js
rm -f /usr/lib/firefox-esr/browser/defaults/preferences/firefox.js
## rm -f /usr/lib/firefox-esr/browser/defaults/preferences/webide-prefs.js
## rm -f /usr/lib/firefox-esr/browser/defaults/preferences/firefox-branding.js
## rm -f /usr/lib/firefox-esr/browser/defaults/preferences/vendor.js
## rm -f /usr/lib/firefox-esr/browser/defaults/preferences/firefox.js
## rm -f /usr/lib/firefox-esr/browser/defaults/preferences/devtools.js


## Copy The Hardened Firefox Config Settings Into The Hidden Firefox Directories:
cp -v locked_user.js /usr/lib/firefox-esr/browser/firefox-esr.js
cp -v locked_user.js /usr/lib/firefox/browser/firefox-esr.js
cp -v user.js /usr/lib/parrot-skel/etc/skel/.mozilla/firefox/xk1uxyq9.Parrot/firefox-esr.js
cp -v user.js /usr/lib/firefox-esr/browser/defaults/preferences/user.js


## Apply Permissions (By Default, You Shouldn't Need To Podify Permissions)
chown -v xe1phix:xe1phix /etc/firefox-esr/firefox-esr.js
chmod -v 0644 /etc/firefox-esr/firefox-esr.js
chmod -v 0644  /home/xe1phix/.mozilla/firefox/xk1uxyq9.Parrot/user.js
chown -v xe1phix /home/xe1phix/.mozilla/firefox/xk1uxyq9.Parrot/user.js
chmod -v u+rwx,go+rx user.js


