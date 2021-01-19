/* Speed Tweak - Common to all Configurations */
user_pref("network.http.pipelining", true);
user_pref("network.http.proxy.pipelining", true);
user_pref("network.http.pipelining.maxrequests", 8);
user_pref("content.notify.backoffcount", 5);
user_pref("plugin.expose_full_path", true);
user_pref("ui.submenuDelay", 0);
/* Speed Tweak - Fast Computer Fast Connection */
user_pref("content.interrupt.parsing", true);
user_pref("content.max.tokenizing.time", 2250000);
user_pref("content.notify.interval", 750000);
user_pref("content.notify.ontimer", true);
user_pref("content.switch.threshold", 750000);
user_pref("nglayout.initialpaint.delay", 0);
user_pref("network.http.max-connections", 48);
user_pref("network.http.max-connections-per-server", 16);
user_pref("network.http.max-persistent-connections-per-proxy", 16);
user_pref("network.http.max-persistent-connections-per-server", 8);
user_pref("browser.cache.memory.capacity", 65536);

/* Disable IPV6 - Use tmpfs*/
user_pref("network.dns.disableIPv6", true);
user_pref("browser.cache.disk.parent_directory",/tmp);

/* SPDY https://en.wikipedia.org/wiki/SPDY */
user_pref("network.http.spdy.enabled",true);

/////////////////////////////////////////
//*External Applications*//
////////////////////////////////////////

/* Tor/Privoxy*/
user_pref("network.http.keep-alive.timeout",600);
user_pref("network.http.proxy.keep-alive",true);

/* Search with Duckduckgo */
user_pref("keyword.URL", "https://duckduckgo.com/?q=");

/* Multimedia players */
user_pref("network.protocol-handler.app.mms", "/usr/bin/mplayer");
user_pref("network.protocol-handler.external.mms", true);
user_pref("network.protocol-handler.app.rtsp", "/usr/bin/realplayer");
user_pref("network.protocol-handler.external.rtsp", true);

/* Access local files*/
user_pref("capability.policy.policynames", "localfilelinks");
user_pref("capability.policy.localfilelinks.sites", "http://localhost");
user_pref("capability.policy.localfilelinks.checkloaduri.enabled", "allAccess");

/////////////////////////
//* Ui tweaks *//
/////////////////////////

/* Fix the font layout */
user_pref("layout.css.dpi", 0);

/* Hide the Go button */
user_pref("browser.urlbar.hideGoButton", true);

/* Get rid of the ugly gtk file picker */
user_pref("ui.allow_platform_file_picker", false);

/* Set backspace key to go to previous page */
user_pref("browser.backspace_action", 0);

/* hide tab close button*/
user_pref("browser.tabs.closebuttons",2);

/////////////////////////////////////////////
//*Turning off annoyances*///
/////////////////////////////////////////////

// Turn that annoying autocomplete popup REALLY off:
// (This actually has a UI but it's buried.)
user_pref("browser.urlbar.autocomplete.enabled", false);
user_pref("browser.urlbar.showPopup", false);
user_pref("browser.urlbar.showSearch", false);

/* Block 3rd party cookies */
user_pref("network.cookie.cookieBehavior", 1);

// Self-signed certificate handling is annoying //
user_pref("browser.ssl_override_behavior", 2);
user_pref("browser.xul.error_pages.expert_bad_cert", true);

/* Disable Mozilla blocklist
user_pref("extensions.blocklist.enabled",false);

/* Disable network prefetching/search engine suggest */
user_pref("network.prefetch-next", false);
user_pref("browser.search.suggest.enabled", false);

/* Disable geolocation */
user_pref("geo.enabled", false);

/* Disable Google lookups */
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.remoteLookups", false);

/* Put an end to blinking text! */
user_pref("browser.blink_allowed", false);
user_pref("browser.display.show_image_placeholders", false);

/* Disable  Find As You Type */
user_pref ("accessibility.typeaheadfind", false);

/* Disable image animation */
 user_pref("image.animation_mode", "none");

/* Disable scrolling marquees */
user_pref("browser.display.enable_marquee", false);
