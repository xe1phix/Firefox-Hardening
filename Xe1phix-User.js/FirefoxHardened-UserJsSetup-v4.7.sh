#!/bin/sh
## 

https://github.com/pyllyukko/user.js/


## Make A Directory Called Scripts, And cd Into The Directory:
mkdir Scripts && cd Scripts/


## Clone The Firefox Hardening Projects Github Repository:
git clone https://github.com/pyllyukko/user.js


## cd Into The user.js Directory:
cd user.js/


## Pick a Firefox Profile:
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


## Move To Xe1phix's -[ ParrotKios/Firefox-Hardening/Xe1phix-User.js ]- Directory:
cd /home/xe1phix/Downloads/ParrotKios/Firefox-Hardening/Xe1phix-User.js


## Copy The user.js File into The Users Firefox Directory:
cp -v user.js /home/xe1phix/.mozilla/firefox/xk1uxyq9.Parrot/user.js


## Copy The Selected Firefox Profile Config to /etc/firefox-esr/ Directory:
cp -v systemwide_user.js /etc/firefox-esr/firefox-esr.js
cp -v systemwide_user.js /etc/firefox/firefox.js
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





## ParrotDNS/OpenNIC
nameserver 139.99.96.146
nameserver 37.59.40.15
nameserver 185.121.177.177


## OpenDNS
nameserver 208.67.222.222
nameserver 208.67.220.220


## Mullvad
nameserver 193.138.219.228



## Print Parrots DNS:
cat /etc/resolv.conf.head












https://www.torproject.org/download/download-easy.html.en
https://www.torproject.org/docs/signing-keys.html.en
https://www.torproject.org/docs/verifying-signatures.html.en



gpg --full-generate-key --enable-large-rsa

gpg --keyserver pool.sks-keyservers.net --recv-keys 0x4E2C6E8793298290

gpg --fingerprint 0x4E2C6E8793298290



pub   rsa4096 2014-12-15 [C] [expires: 2020-08-24]
                  EF6E 286D DA85 EA2A 4BA7  DE68 4E2C 6E87 9329 8290
Key fingerprint = EF6E 286D DA85 EA2A 4BA7  DE68 4E2C 6E87 9329 8290
uid           [ unknown] Tor Browser Developers (signing key) <torbrowser@torproject.org>
sub   rsa4096 2018-05-26 [S] [expires: 2020-09-12]


gpg --lsign-key 0x4E2C6E8793298290

cd ParrotKios/Firefox-Hardening/Xe1phix-TorBrowser/


gpg --verbose --keyid-format 0xlong --verify tor-browser-linux64-8.0.4_en-US.tar.xz.asc tor-browser-linux64-8.0.4_en-US.tar.xz





~/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/Tor Browser/Data/Browser/profile.default/



about:config


    // Allow user-configured proxy settings
    user_pref("extensions.torbutton.use_nontor_proxy", true);
    // Disable TorLauncher extension
    user_pref("extensions.torlauncher.prompt_at_startup", false);
    user_pref("extensions.torlauncher.start_tor", false);
    
    
    
~/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser






