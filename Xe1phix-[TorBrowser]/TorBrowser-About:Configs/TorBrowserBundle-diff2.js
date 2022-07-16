for setting in $( comm -12 <(sed -n '/^\(user_\)\?pref/s/^.*pref("\([^"]\+\)",\s*\([^)]\+\).*$/\1/p' user.js | sort) <(sed -n '/^\(user_\)\?pref/s/^.*pref("\([^"]\+\)",\s*\([^)]\+\).*$/\1/p' 000-tor-browser.js | sort)); do diff <(grep "^\(user_\)\?pref(\"${setting}\"" user.js | sed -n '/^\(user_\)\?pref/s/^.*pref("\([^"]\+\)",\s*\([^)]\+\).*$/\1 = \2/p' | sort) <(grep "^\(user_\)\?pref(\"${setting}\"" 000-tor-browser.js | sed -n '/^\(user_\)\?pref/s/^.*pref("\([^"]\+\)",\s*\([^)]\+\).*$/\1 = \2/p' | sort); done
1a2
> app.shield.optoutstudies.enabled = true
0a1
> app.update.enabled = false
1c1
< breakpad.reportURL = ""
---
> breakpad.reportURL = "https://crash-stats.mozilla.com/report/index/"
1c1
< browser.aboutHomeSnippets.updateUrl = ""
---
> browser.aboutHomeSnippets.updateUrl = "https://snippets.cdn.mozilla.net/%STARTPAGE_VERSION%/%NAME%/%VERSION%/%APPBUILDID%/%BUILD_TARGET%/%LOCALE%/%CHANNEL%/%OS_VERSION%/%DISTRIBUTION%/%DISTRIBUTION_VERSION%/"
1c1
< browser.bookmarks.max_backups = 0
---
> browser.bookmarks.max_backups = 15
1a2
> browser.crashReports.unsubmittedCheck.enabled = true
1c1
< browser.download.folderList = 2
---
> browser.download.folderList = 1
1c1
< browser.download.useDownloadDir = false
---
> browser.download.useDownloadDir = true
1c1
< browser.newtabpage.enabled = false
---
> browser.newtabpage.enabled = true
1c1
< browser.newtab.preload = false
---
> browser.newtab.preload = true
1c1
< browser.privatebrowsing.autostart = true
---
> browser.privatebrowsing.autostart = false
1c1
< browser.search.geoSpecificDefaults = false
---
> browser.search.geoSpecificDefaults = true
1c1
< browser.sessionstore.privacy_level = 2
---
> browser.sessionstore.privacy_level = 0
1c1
< browser.shell.checkDefaultBrowser = false
---
> browser.shell.checkDefaultBrowser = true
1c1
< browser.shell.shortcutFavicons = false
---
> browser.shell.shortcutFavicons = true
1c1
< browser.ssl_override_behavior = 1
---
> browser.ssl_override_behavior = 2
1c1
< browser.tabs.crashReporting.sendReport = false
---
> browser.tabs.crashReporting.sendReport = true
1c1
< browser.uitour.enabled = false
---
> browser.uitour.enabled = true
1c1
< browser.urlbar.autoFill = false
---
> browser.urlbar.autoFill = true
1c1
< browser.urlbar.autoFill.typed = false
---
> browser.urlbar.autoFill.typed = true
1c1
< browser.urlbar.suggest.history = false
---
> browser.urlbar.suggest.history = true
1c1
< browser.urlbar.suggest.searches = false
---
> browser.urlbar.suggest.searches = true
1c1
< browser.urlbar.trimURLs = false
---
> browser.urlbar.trimURLs = true
1c1
< experiments.enabled = false
---
> experiments.enabled = true
1c1
< experiments.manifest.uri = ""
---
> experiments.manifest.uri = "https://telemetry-experiment.cdn.mozilla.net/manifest/v1/firefox/%VERSION%/%CHANNEL%"
1c1
< experiments.supported = false
---
> experiments.supported = true
1c1
< extensions.getAddons.cache.enabled = false
---
> extensions.getAddons.cache.enabled = true
1c1
< extensions.pocket.enabled = false
---
> extensions.pocket.enabled = true
1a2
> geo.wifi.uri = "https://www.googleapis.com/geolocation/v1/geolocate?key=%GOOGLE_API_KEY%"
1c1
< keyword.enabled = false
---
> keyword.enabled = true
1c1
< lightweightThemes.update.enabled = false
---
> lightweightThemes.update.enabled = true
1c1
< media.webspeech.synth.enabled = false
---
> media.webspeech.synth.enabled = true
1c1
< network.captive-portal-service.enabled = false
---
> network.captive-portal-service.enabled = true
1c1
< network.manage-offline-status = false
---
> network.manage-offline-status = true
1c1
< network.protocol-handler.expose-all = false
---
> network.protocol-handler.expose-all = true
1c1
< pdfjs.disabled = true
---
> pdfjs.disabled = false
1c1
< places.history.enabled = false
---
> places.history.enabled = true
1c1
< plugin.state.flash = 0
---
> plugin.state.flash = 1
1c1
< plugin.state.java = 0
---
> plugin.state.java = 1
1c1
< privacy.clearOnShutdown.offlineApps = true
---
> privacy.clearOnShutdown.offlineApps = false
1c1
< privacy.clearOnShutdown.openWindows = true
---
> privacy.clearOnShutdown.openWindows = false
1c1
< privacy.cpd.offlineApps = true
---
> privacy.cpd.offlineApps = false
1c1
< privacy.sanitize.sanitizeOnShutdown = true
---
> privacy.sanitize.sanitizeOnShutdown = false
1c1
< privacy.sanitize.timeSpan = 0
---
> privacy.sanitize.timeSpan = 1
0a1
> privacy.userContext.enabled = false
1c1
< security.cert_pinning.enforcement_level = 2
---
> security.cert_pinning.enforcement_level = 1
1c1
< toolkit.telemetry.archive.enabled = false
---
> toolkit.telemetry.archive.enabled = true
