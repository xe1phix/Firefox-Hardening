


TOR_SHA="sha256sums.txt"
TOR_GPG="0x4E2C6E8793298290"
TOR_MIRROR="https://dist.torproject.org/torbrowser/${TOR_VER}"
TOR_X64="tor-browser-linux64-${TOR_VER}_en-US.tar.xz"
TORJAIL_HOME="${TORJAIL_RAM}/tor-browser_en-US/Browser"


curl -OL# "${TOR_MIRROR}/${TOR_DOWNLOAD}"
curl -OL# "${TOR_MIRROR}/${TOR_ASC}"
curl -OL# "${TOR_MIRROR}/${TOR_SHA}"
curl -OL# "${TOR_MIRROR}/${TOR_DOWNLOAD}"

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

gpg --verify $TOR_ASC $TOR_DOWNLOAD







cp -v /home/parrotkios/user.js /home/parrotkios/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/defaults/pref/

chown parrotkios /home/parrotkios/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/defaults/pref/user.js

firejail --profile=/etc/firejail/torbrowser-launcher.profile sh -c '"/home/parrotkios/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser" --detach || ([ !  -x "/home/parrotkios/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser" ] && "$(dirname "$*")"/Browser/start-tor-browser --detach)' dummy %k



firejail --profile="$TORJAIL.profile" -- "./start-tor-browser"





about:profiles

/home/xe1phix/Downloads/tor-browser_en-US/Browser/defaults/pref
/home/xe1phix/Downloads/tor-browser_en-US/Browser/defaults/pref/channel-prefs.js


cp -v user.js /home/xe1phix/Downloads/tor-browser_en-US/Browser/defaults/pref/user.js 
cp -v user.js /home/xe1phix/Downloads/tor-browser_en-US/Browser/TorBrowser/Data/Browser/profile.default/user.js

/home/parrotkios/Downloads/tor-browser_en-US/Browser/defaults/pref
/home/parrotkios/Downloads/tor-browser_en-US/Browser/TorBrowser/Data/Browser/profile.default/prefs.js



about:config


// Allow user-configured proxy settings
user_pref("extensions.torbutton.use_nontor_proxy", true);
// Disable TorLauncher extension
user_pref("extensions.torlauncher.prompt_at_startup", false);
user_pref("extensions.torlauncher.start_tor", false);


extensions.torbutton.use_nontor_proxy
extensions.torlauncher.prompt_at_startup
extensions.torlauncher.start_tor

https://check.torproject.org/


about:addons

mkdir ${HOME}/.tor-browser-en-us
whitelist ${HOME}/.tor-browser-en-us

noblacklist ${HOME}/.config/torbrowser
noblacklist ${HOME}/.local/share/torbrowser

mkdir ${HOME}/.config/torbrowser
mkdir ${HOME}/.local/share/torbrowser
whitelist ${DOWNLOADS}
whitelist ${HOME}/.config/torbrowser
whitelist ${HOME}/.local/share/torbrowser


firejail --profile=/home/<username>/.config/firejail/tor.profile

firejail --profile=/etc/firejail/torbrowser-launcher.profile -- "./start-tor-browser"

firejail --profile=/usr/local/etc/firejail/start-tor-browser.profile ./star-tor.browser

firejail --debug ./start-tor-browser.desktop

cp ../start-tor-browser.desktop "$HOME/.local/share/applications/"
update-desktop-database "$HOME/.local/share/applications/"


# extensions.torbutton.loglevel           2
# extensions.torbutton.logmethod          0
# extensions.torlauncher.control_port      <ControlPort>
# extensions.torlauncher.loglevel          2
# extensions.torlauncher.logmethod         0
# extensions.torlauncher.prompt_at_startup false
# extensions.torlauncher.start_tor         false




