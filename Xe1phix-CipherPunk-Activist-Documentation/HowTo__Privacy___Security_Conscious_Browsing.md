The purpose of this document is to make recommendations on how to browse in a privacy and security conscious manner. This information is compiled from a number of sources, which are referenced throughout the document, as well as my own experiences with the described technologies. 

I welcome contributions and comments on the information contained. Please see the <a href="#contribute">How to Contribute</a> section for information on contributing your own knowledge.

# Table of Contents
 * [Motivation](#motivation)
 * [Audience](#audience)
 * [TL;DR?](#tldr)
 * [Updates](#updates)
 * [Technologies that Affect Security and Privacy](#technology)
 * [Browser Choice](#browserchoice)
 * [Browser Settings](#browsersettings)
 * [Required Browser Plugins](#reqplugins)
 * [Required Browser Plugins - Chrome](#reqpluginschrome)
 * [Required Browser Plugins - Firefox](#reqpluginsff)
 * [What about Disabling Javascript?](#disablejs)
 * [Browsing Strategies](#browsingstrat)
 * [Changing Your Search Engine](#searchengine)
 * [Preventing DNS Leaks](#dnsleaks)
 * [Private Browsing](#private)
 * [TAILS and Tor](#tailstor)
 * [Using Virtual Private Networks (VPN)](#vpn)
 * [VPN vs Tor](#vpnvstor)
 * [General Security Best Practices](#generalsec)
 * [Checking Your Setup](#checking)
 * [Closing Thoughts](#closing)
 * [How to Contribute](#contribute)
 * [How to Contact the Author](#contact)
 * [Contributors](#contribs)
 * [Changelog](#changelog)

## Motivation <a id="motivation"></a>

This guide was written in response to the continually growing creep of advertising companies and the constant threat of compromise and data loss that all users of the internet face. 

For those unfamiliar with these threats, please familiarize yourself with tactics of advertising companies, such as ["undeleting" cookies](https://en.wikipedia.org/wiki/Zombie_cookie), [scraping your browser history](http://gizmodo.com/facebook-is-now-sharing-your-browsing-history-with-adve-1589809318) and [here](http://www.businessinsider.com/how-to-keep-ad-companies-from-tracking-your-web-history-2011-2), [building personal profiles of your activity without your consent](http://www.zdnet.com/article/firm-facebooks-shadow-profiles-are-frightening-dossiers-on-everyone/), and more.

Recent articles, such as [20 Home Pages, 500 Trackers Loaded](http://www.mondaynote.com/2015/07/20/20-home-pages-500-trackers-loaded-%E2%80%A8media-succumbs-to-monitoring-frenzy/) are well done glimpses into just how far advertising companies go in tracking you. The article [Looking Up Symptoms Online? These Companies Are Tracking You](http://motherboard.vice.com/read/looking-up-symptoms-online-these-companies-are-collecting-your-data), shows how much data is transmitted to tracking companies as you search health care related information.

Similarly, attacks on ordinary internet users has risen exponentially and led to waves of [ransomware](http://malware.dontneedcoffee.com/2015/01/unpatched-vulnerability-0day-in-flash.html), [identity theft](http://www.infoworld.com/article/2612293/cyber-crime/identity-theft-service-planted-botnets-in-lexisnexis--other-data-providers.html), and [financial losses](https://en.wikipedia.org/wiki/Zeus_(malware)).

When using browsers in their default mode, one wrong click in a search engine or one malicious advertisement loading on your favorite website is all that it takes to fully compromise your system.

By following the steps in this guide, you will drastically reduce your exposure to such tactics. 

## Audience <a id="audience"></a>

This guide is written for computer users, both technical and non-technical, who wish to achieve privacy and security when performing a variety of web-based tasks. This document takes an "all out" approach, meaning that no shortcuts are taken and no technologies are spared. If it tracks you online or exposes you to risk then mitigations are needed.

This is document is meant to be accessible to users of all technical levels. If you feel that a section is too technically difficult and not clear to non-technical users then please let me know. You can also contribute your own changes. See the "How to Contribute" section for how to do so.

## TL;DR? <a id="tldr"></a>

If you do not wish to the read the whole document, but want to get value out of it, then read the sections on per-browser settings and required plugins. This guide recommends and provides guidance for Firefox and Chrome.

# Updates <a id="updates"></a>

This document will be updated as new technologies emerge and as browsers and their plugins evolve. The bottom of this document will contain a changelog for major updates. Otherwise, you can check the git history log in order to see changes over time and who contributed them.

# Technologies that Affect Security and Privacy <a id="technology"></a>

This section lists several technologies that prevent or effect efforts to perform secure and private browsing. These technologies and their issues are listed in this section while mitigations are described in the following sections.

If you want a deeper look at these technologies as well as others then check the documents [here](https://zyan.scripts.mit.edu/blog/lessons-from-the-ad-blocker-trenches/) and [here](http://www.w3.org/2001/tag/doc/unsanctioned-tracking/).

## HTTP (Non-SSL) Browsing

> Rule 1: The internet is not a safe or friendly place. 

By default, communication between your web browser and web servers that you contact are not encrypted (HTTP). 
This exposes all of your web traffic to:

* Your ISP
* Anyone at the cafe/library/university providing your internet access
* Anyone that can monitor traffic between your provider and your destination server

It also allows anyone between you and your destination to modify your traffic, including injecting malicious content that can compromise your privacy and security. Both [ATT](http://tech.slashdot.org/story/15/08/25/2257218/att-hotspots-now-injecting-ads) and [Verizon](https://www.eff.org/deeplinks/2014/11/verizon-x-uidh) have been shown to do this in the past for mobile users.

HTTP is such a security issue that Mozilla is [deprecating HTTP in favor of HTTPS](https://blog.mozilla.org/security/2015/04/30/deprecating-non-secure-http/).

To mitigate this issue and to enable secure, encrypted communication, HTTPS must be used. This encrypts communication between your web browser and the web servers that you contact.

## HTTP(S) Cookies

Cookies are used by websites to track users for both legitimate and non-legitimate purposes. Legitimate uses include keep track of logged-in users, storing user preferences, and so on. 

Non-legitimate uses include tracking users across the web by use of uniquely identifying cookie values. For large advertising networks, such as [Google Analytics](http://www.google.com/analytics/), which have tracking code installed on many websites, this unique cookie value allows for tracking and targeting you across nearly every website you visit.

A popular and effective method to tame advertisers that track you through cookies is to block 3rd-party cookies. 3rd-party in this context means websites that are loaded outside of the direct website you visit. For example, if you visit https://www.cnn.com, then CNN becomes the first party. Advertisers that CNN dynamically loads will load from their own infrastructure (e.g., static.chartbeat.com). This separate infrastructure is considered "3rd party", and by setting your browser to block 3rd-party cookies, you can greatly reduce advertisers' effectiveness. Guides exist on how to do this for [Internet Explorer](http://windows.microsoft.com/en-us/windows7/block-enable-or-allow-cookies), [Firefox](https://support.mozilla.org/en-US/kb/disable-third-party-cookies), and [Chrome](https://support.google.com/chrome/answer/95647?hl=en).

## Javascript

Javascript is used to dynamically create and deliver web content. Like HTTP cookies, Javascript has many legitimate uses, but it also provides the technology necessary for 3rd party ad networks to run as well as is a required component of many browser exploits. 

Completely disabling Javascript greatly enhances both security and privacy, but prevents many websites from operating correctly. This guide will discuss how to work around this issue in several sections.

## Flash

> Rule 2: Adobe Flash is a security nightmare that should be avoided at all costs. 

Adobe Flash is a popular technology installed on nearly every non-secure browser in the world.  It is used to render Flash movies that websites use to display interactive media content. Flash is quickly being replaced by HTML5, but like most technologies, will be used long after its successor is available.

Unfortunately, Adobe Flash is also one of the most insecure pieces of technology in widespread use, and is very often targeted by malicious actors to remotely compromise users.  

## Flash "Cookies" (LSOs)

Flash local stored objects (LSOs), also known as "Flash Cookies", are a feature of Adobe Flash that allows for Flash applications to store data on the user's local system. 

LSOs are an issue as many advertisers have abused Flash Cookies to track users, even if the users attempted to clean their information by deleting their HTTP cookies. Several ([1](http://www.insideprivacy.com/advertising-marketing/amazon-settles-flash-cookie-lawsuit/), [2](http://www.wired.com/2010/12/zombie-cookie-settlement/)) lawsuits have been successfully won against advertising companies abusing LSOs in this manner.

LSOs are also a privacy concern as Flash places LSOs for every browser into the same location. This means that a Flash cookie set by an application in Internet Explorer can later be read by that application even if it is later loaded in Firefox or Chrome. Abuse of this cross-browser tracking has been the subject of privacy-related lawsuits as well.

You can find more information on security & privacy issues with LSOs [here](http://cookiecontroller.com/internet-cookies/flash-cookies/), [here](
http://blog.jgc.org/2010/06/whats-wrong-with-flash-cookies.html), and [here](https://en.wikipedia.org/wiki/Local_shared_object#Privacy_concerns).

## HTML5 Local Storage

[HTML5](https://en.wikipedia.org/wiki/HTML5) is the latest version of the HTML specification. One of its features that has drawn privacy concerns, is the ability for websites to create "HTML5 Databases". These databases are similar to HTTP cookies, but they are not kept in the same data stores and allow for much larger and more flexible amounts of data to be stored.

HTML5 also poses a risk to due the [Canvas Fingerprinting issue](https://en.wikipedia.org/wiki/Canvas_fingerprinting). As will be discussed later, this is something that the Tor Browser Bundle specifically defends against that other browsers provide no defense for.

## WebRTC

[WebRTC](https://en.wikipedia.org/wiki/WebRTC) is another new technology that allows for browser-to-browser interactions not previously possible with other standards.

Like other technologies, a serious privacy issue has been found in WebRTC. This issue allows for websites to enumerate the local IP address of a user. This has been observed in the [wild](https://twitter.com/incloud/status/619624021123010560
) and is a part of the [Browser Exploitation Framework](http://beefproject.com/).

The ability for websites to determine the local IP address of a user is a major concern as that allows for unique identification of users behind NATs, VPN, and potentially Tor.

In non-technical terms, this means that instead of every member of a family appearing as coming from the same network (e.g., the in-home wireless router), advertisers can determine a very specific property of each user's system in order to more uniquely track them.

You can check if your current browser is vulnerable by visiting [this website](https://diafygi.github.io/webrtc-ips/). If you see your local IP or your VPN IP then you need to follow the advice in this guide.

## Browsing Fingerprinting

While not a technology itself, the ability for 3rd parties to fingerprint, meaning make a unique identification of, your browser is highly reliant on certain browser technologies to be installed. 

As end-users became more aware of cookies and online tracking, many of them turned to limiting cookies and blocking trackers in an attempt to gain an upper hand on privacy. Advertisers did not want to honor these wishes though, and instead developed a number of fingerprinting methods that leveraged attributes that are very difficult for the average user to modify. 

The [Fingerprinting](https://wiki.mozilla.org/Fingerprinting) page on the Mozilla wiki documents a number of these methods. The [Panoptclick](https://panopticlick.eff.org/) project from the EFF studied the high level of uniqueness that each browser demonstrates. After configuring your browser according to this guide you should then check your browser’s fingerprint to ensure that is not highly identifiable. 

# Browser Choice <a id="browserchoice"></a>

In this section, we will begin to describe how you can protect yourself from advertisers, attackers, and other malicious actors on the internet.  To start, we will discuss the choice of which browser(s) to use and when they may be applicable.

## Internet Explorer

Unless you are on a corporate system with no other choice, you should never use Internet Explorer. 

It is a security and privacy nightmare, and its lack of a plugin/extensions API and community means that you cannot easily modify the browser to meet these needs. Its long history of having vulnerabilities is also a major concern.

## Safari

Safari should also be avoided unless necessary to be used. It is built on a notoriously insecure code base, meaning that many vulnerabilities have been discovered, and it also does not provide a robust plugin/extension API. As will be discussed with the following browsers, plugins and extensions are necessary to fully modify the browser to be as secure and privacy conscious as possible.

## Firefox

While Chrome provides the best security, Firefox is a **much** better choice for security and privacy than IE or Safari. 

Be aware that Mozilla's has recently [embraced  advertisers](https://blog.mozilla.org/advancingcontent/2015/05/21/providing-a-valuable-platform-for-advertisers-content-publishers-and-users/) though, which has troubled many privacy-conscious people.

Firefox also has a much weaker security model than Chrome, but much of this can be tamed through extensions as we will see.

## Chrome

For general purpose browsing, Chrome is the most ideal browser when configured correctly (see the following sections on "Browser Settings" and "Required Browser Plugins").

Chrome has a very mature security model (see [here](http://blog.azimuthsecurity.com/2010/05/chrome-sandbox-part-1-of-3-overview.html), [here](https://www.chromium.org/Home/chromium-security/bugs), and [here](https://blog.chromium.org/2012/05/tale-of-two-pwnies-part-1.html)), which often requires advanced exploitation and multiple vulnerabilities to fully compromise. No other browser comes close to this model.

This security models helps to protect both privacy and security of its users.

## The Tor Browser Bundle

The [Tor Browser Bundle](https://www.torproject.org/projects/torbrowser.html.en
) (TBB) is the recommended browser to use when utilizing the Tor network. A full discussion of Tor is outside the scope of this document, but compared to connecting directly to the internet through your ISP, Tor provides substantial privacy for users. Before using TBB, I highly recommend reading the Tor [documentation](https://www.torproject.org/about/overview.html.en) and [FAQ](https://www.torproject.org/docs/faq.html.en). While Tor does provide anonymity in **most** situations, depending on your adversary and geolocation, there may be a higher chance of deanonymization while using it. If you are going to use Tor and/or TBB for anything besides the reasons listed in this document's <a href="#audience">Audience</a> section, then you MUST consult further Tor documentation before proceeding.

While you can use Tor with any modern browser, TBB is built and configured with both security and privacy in mind. Every concerning technology listed in <a href="#technology">Technologies that Affect Security and Privacy</a> is accounted for in TBB as well as other privacy effecting technology. A full list of these protections and TBB's design goals can be found in its [design documents](https://www.torproject.org/projects/torbrowser/design/
). This document is also the best available on current threats to browsing privacy, and is a must read for technical users. 

In the <a href="#strategies">Browsing Strategies</a> section is extensive discussion on when TBB is best used for this document's purposes.

# Browser Settings <a id="browsersettings"></a>

## Chrome 

By default, Chrome sends a substantial amount of data to Google. This includes URLs visited, "suspicious" files downloaded, misspelled words, and more. Luckily, Google documents all of this information on the [Chrome Privacy Page](https://support.google.com/chrome/answer/114836?hl=en), and describes how to opt-out of the "features". To do so, simply follow the "Turn off a privacy setting" instructions on the privacy page. 

To be fully safe, you should uncheck everything under "Privacy", and then only check the "Send a ‘Do Not Track’ request with your browsing traffic" option. 'Do Not Track' is an option that tells websites not to track you. Unfortunately, [major advertisers](https://en.wikipedia.org/wiki/Do_Not_Track#History) decided to ignore this feature, but some websites do honor it. By unchecking everything else under privacy you will ensure that Google is not collecting data on your every browser action.

## Firefox

Firefox also documents how to disable its features that may reduce or eliminate user privacy. This information can be found [here](https://support.mozilla.org/en-US/products/firefox/privacy-and-security/passwords-forms-search-and-history) and [here](https://support.mozilla.org/en-US/products/firefox/customize/firefox-options-preferences-and-settings).

Firefox users should also read [this](http://b.agilob.net/better-security-privacy-and-anonymity-in-firefox/) document in order to fully make their browser security and privacy hardened.  It covers a wide range of plugins and browser settings that must be configured for ultimate protection.

# Required Browser Plugins <a id="reqplugins"></a>

In order to achieve the maximum amount of privacy and security reasonably possible, browser extensions (often also called plugins), must be used. These extensions have substantial control over the browser and can provide layers of security not otherwise obtainable.

To start, we will discuss plugins for Chrome. We will then discuss how to achieve the same goals in Firefox. Many of the plugins mentioned support both browsers, but some require different plugins with similar or equivalent capability.

# Required Browser Plugins - Chrome <a id="reqpluginschrome"></a>

To install extensions in Chrome, please follow [this](https://support.google.com/chrome_webstore/answer/2664769?hl=en) guide.

## HTTPS Everywhere

[HTTPS Everywhere](https://www.eff.org/HTTPS-everywhere) is a Chrome extension by the [EFF](https://www.eff.org) that forces connections to webservers to be performed over HTTPS (encrypted browsing). This means that if you attempt to browse to a site, such as __http://__ www.example.com, the extension will change your request to contact __https://__ www.example.com. This will ensure that you connect to the website over a secure channel. Similarly, when web pages try to load resources (think: images, javascript files, icons), these requests will occur over HTTPS as well. Of course, if a particular web service does not support HTTPS then HTTPS Everywhere cannot enable secure transport for you. If needed, HTTPS Everywhere can be configured to block all HTTP requests and only allow secure connections.

Even if you install nothing else recommended by this guide, you should install HTTPS Everywhere.

Also, whether you use HTTPS Everywhere or not, before sending any sensitive or private data to a website you should verify that a secure SSL connection is established. Instructions for how to check an SSL connection are available for [Internet Explorer](http://windows.microsoft.com/en-us/windows-vista/get-information-about-secure-sockets-layer-ssl-certificates), [Chrome](https://support.google.com/chrome/answer/95617?hl=en), and [FireFox](https://support.mozilla.org/en-US/products/firefox/protect-your-privacy).

## Privacy Badger

[Privacy Badger](https://www.eff.org/privacybadger) is another project by the EFF that monitors websites' behaviors in order to dynamically identify those that collect tracking information. You can then use the extension button in order to block offending websites. The button UI is very well done, and after visiting a few sites with heavy advertising (e.g., major news websites), you will have effectively blacklisted a majority of advertisers.

## An Ad Blocker

From a security perspective, [malicious advertising](https://en.wikipedia.org/wiki/Malvertising) is one of the biggest threats to ordinary end users ([1]( http://arstechnica.com/security/2015/04/faked-flash-based-ads-on-huffpo-other-sites-downloaded-extortionware/), [2]( http://www.ibtimes.co.uk/hackers-use-yahoo-ad-network-spread-malware-hundreds-millions-internet-users-1513853), [3]( http://www.cyphort.com/100m-huffington/)). From a privacy perspective, advertisers are the biggest threat to web-based privacy. They track every move you make across nearly every website and then correlate all your data in the background to build very personal profiles of your behavior and actions. 

To prevent the security and privacy hazards that online ads present, you need to install an ad blocker. 

The most popular of these is [Ad Block Plus (ABP)](https://adblockplus.org/), but recent [behavior](http://www.businessinsider.com.au/google-microsoft-amazon-taboola-pay-adblock-plus-to-stop-blocking-their-ads-2015-2) by the company has caused concern among many web users. To make Ad Block Plus most effective, you must go into its 'Options' and uncheck "Allow some non-intrusive advertising". Otherwise, Ad Block Plus will apply a filter that allows companies, such as Google and Taboola, to still serve ads. Such ads break the overall security model due to the tracking they enable.

Instead of ABP, many users are now moving to [uBlock Origin]( https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en). It provides the same benefits as Ad Block Plus without the potentially questionable business practices -- and also without allowing paid advertisers to bypass the filters. uBlock also has a number of other advantages, such as incorporating malware and spam domain filters as well as blocking WebRTC, which is discussed shortly. This guide **strongly** recommends uBlock Origin over AdBlockPlus. [This](http://b.agilob.net/quick-%C2%B5block-configuration-in-firefox) guide describes how to configure uBlock Origin in Firefox, but it is very similar to configure the same options in Chrome.

## Flash Control

As mentioned previously, Adobe Flash is one of the biggest threats to internet security. If you need to have it installed in your browser, then you MUST install a plugin, such as [Flash Control](https://chrome.google.com/webstore/detail/flashcontrol/mfidmkgnfgnkihnjeklbekckimkipmoe?hl=en), that will prevent Flash from auto-playing. Instead, these plugins make Flash "click to play", meaning that the Flash object will not load unless you click to explicitly enable it.

By making Flash click-to-play, you significantly reduce the ability for malicious advertisers or websites to compromise your system with Flash exploits. Similarly, this prevents Flash-based ads from loading. 

As a general security precaution, you can make all Chrome plugins click-to-play by following the instructions [here](https://security.berkeley.edu/content/how-do-i-enable-click-play-google-chrome). This prevents the need for an extension, but can be less flexible depending on your use case. An advantage to making Flash click-to-play over an extension is that extensions can fall victim to [click jacking](https://en.wikipedia.org/wiki/Clickjacking) attacks. The built-in filtering of Flash does not have this vulnerability.

## WebRTC Blocking

As discussed above, WebRTC has a major privacy issue in that it can be abused to leak the internal IP address of users. This is very useful for advertisers who wish to develop very unique identifiers for users. It can also be abused to deanonymize users whom utilized VPNs and/or Tor ([1](https://trac.torproject.org/projects/tor/ticket/5578), [2](https://lists.torproject.org/pipermail/tor-talk/2015-February/036845.html), [3](https://lists.torproject.org/pipermail/tor-talk/2015-January/036620.html)) in order to hide their true identity. 

To block WebRTC in Chrome you must install this [plugin](https://chrome.google.com/webstore/detail/webrtc-leak-prevent/eiadekoaikejlgdbkbdfeijglgfdalml) or enable the WebRTC blocking in uBlock Origin. 

The Chrome "official" fix is rather insane and requires manually editing a huge JSON file [(bug tracker)](https://code.google.com/p/chromium/issues/detail?id=333752). Also, Chrome enables WebRTC by default, leaving users vulnerable to this issue. Hopefully this issue is treated better by the default Chrome in the future. This document will be updated if that occurs.

To test if the plugin is operating correctly, visit [this](https://diafygi.github.io/webrtc-ips/) website and make sure that your local IP address does not appear.

# Required Browser Plugins - Firefox <a id="reqpluginsff"></a>

To install plugins in Firefox, please use [this](https://support.mozilla.org/en-US/kb/find-and-install-add-ons-add-features-to-firefox) guide.

The following plugins from Chrome are cross-compatible with Firefox and provide the same benefits:

* HTTPS Everywhere
* Privacy Badger
* Ad Block Plus & uBlock Origin

The following require Firefox specific plugins:

## Flash Control

[Flashblock](https://addons.mozilla.org/en-us/firefox/addon/flashblock/) for Firefox provides the same functionality as "Flash Control" for Chrome. It will block Flash by default, but with a click you can view the content.

## WebRTC Block

To disable WebRTC in Firefox:

* Enter "about:config" in the URL bar
* Find the key of "media.peerconnection.enabled"
* Set the value to "false"

## Certificate Patrol

The [Certificate Patrol]( https://addons.mozilla.org/en-us/firefox/addon/certificate-patrol/) add-on for Firefox monitors for updates in SSL certificates in web services. This allows users to detect when rogue certificates have been created in an attempt to break SSL connections. 

Unfortunately, Chrome does not provide an API to inspect SSL certificates, so no parallel extension exists.

# What about Disabling Javascript? <a id="disablejs"></a>

Many technical readers may be wondering why I did not list NoScript for Firefox or its equivalent (ScriptSafe) for Chrome. The reason for this is that disabling Javascript simply "breaks" the web for too many people. If you feel that you can live without Javascript, then install either of the previously mentioned plugins.

To mitigate the threat in a different manner, along with mitigating other threats, please read the next section "Browsing Strategies".

# Browsing Strategies <a id="browsingstrat"></a>

Many users, including technical ones, perform all of their browser-based activity (web mail, banking, Facebook, "Bing searching", reading the news, etc.) in one browser. While convenient, this is a HORRIBLE security practice, and should be avoided at all costs. In this section, we detail the issues with this approach and provide more security and privacy conscious alternatives. 

## Problems with Using only One Browser

The problems with using only one browser for "everything" are numerous. 

#### Scripting Attacks

Any scripting vulnerability in authenticated websites can lead to compromise of all data related to authenticated sessions. When using one browser for all activities, users will generally be logged into many services at once - greatly amplifying the effects of such vulnerabilities.

### XSS

[XSS](https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)), which is short hand for "Cross Site Scripting", is an web-based attack technique that allows an attacker to control a victim's browser's actions on a particular website. In less technical terms, XSS allows for a malicious actor to perform actions in a user's browser as if the attacker were controlling the user's mouse. 

Common malicious uses of XSS include forcing victims to perform banking actions (withdraw, transfer, etc.), resetting passwords to email accounts, or disabling security protections associated with online accounts. All of these can lead to loss of control of accounts as well as loss of very personal information. XSS is also a threat to businesses as attackers can leverage employees' legitimate access to systems in order to steal data or backdoor corporate systems.

### UXSS

[UXSS](https://www.acunetix.com/blog/articles/universal-cross-site-scripting-uxss/) or Universal XSS is a more dangerous form of XSS in that the attacker can force the user's browser to perform actions on **any** website, and not just a vulnerable one.

### CSRF 

[CSRF](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)) is another attack technique wherein an attacker can control actions of a user's browser, including forging requests to online banking, social media, medical, and other authenticated sessions.

### Preventing All Tracking is Nearly Impossible

By being logged into a number of services at once, it becomes nearly impossible to filter out data associated with trackers. Take for example a user that is logged into:

* Gmail (email)
* Facebook (social media)

By being logged into Gmail, you cannot effectively block Google analytics, Double Click (Google owned), as well as several other major advertising networks. This occurs as Google controls the entire ecosystem - search, YouTube, Maps, email, etc. This means every time you search a term, Google immediately knows who you are, what search term you entered, and any search results link(s) you may click. Similarly, if you plan your vacation route through Google Maps, Google then knows exactly where you are going. Beyond Google services, through DC and GA, Google tracks you throughout the entire web. Now they not only know everything about your search, email, and travel plans, they also know essentially every website you visit, how you got there, and where you will be going next.

Similarly, through Facebook's [Like Button](https://developers.facebook.com/docs/plugins/like-button), you are tracked throughout the web. Every time you visit a website (or individual page) with a "Like" button, Facebook sends the URL back to itself. If you are logged into Facebook at the time, then it also has your authentication information, which allows Facebook to it tie many of your browsing habits directly to your very personal user account. More info: [1](http://bits.blogs.nytimes.com/2011/09/27/as-like-buttons-spread-so-do-facebooks-tentacles/?_r=0), [2](http://www.infosecisland.com/blogview/21386-Facebook-Like-Button--Privacy-Violation--Security-Risk.html), [3](https://theweek.com/articles/484539/facebooks-like-button-spying)

In this example, if we tried to block Facebook and Google properties, then we would certainly stop the tracking - but at the same time we would be breaking the sessions we have open to Facebook and Gmail.

While Google and Facebook were used in this example as they are two of the most popular services on the web, the same issues are faced when utilizing any service that combines ads with other features. 

As we will see, using multiple browsers effectively alleviates this issue and provides the opportunity for true privacy.

### Compromise Affects all of your Data

As you can likely deduce, using one browser is a major vulnerability as a compromise of the browser compromises all of your web data - and potentially all of your data in total. Using one of the following strategies will effectively fix this issue as well.

## Using Multiple Browsers

To fix the previously described issues, one approach you can take it to use multiple web browsers on a single computer. This will greatly reduce the attack surface related to XSS, UXSS, etc., as well as allow true filtering of ad networks. This step is also much more achievable for less technical users than the virtual machine approached described in the next section.

### Why

Using multiple browsers allows for compartmentalization of data. We will use this setup to limit tracking as well as the risk of XSS & its friends. 

### Setup

In this example, we will use one install of Firefox for authenticated sessions with tracking (Google, Facebook, etc.), one install of Chrome for online banking and other sensitive logins, and TBB for all non-authenticated browsing (reading Reddit, watching memory forensics talks, etc.). The Firefox and Chrome installs need to be configured as discussed above for both settings updates and required plugins.

As a side note - many security professionals use this exact setup.

### Operation

When browsing, we must be sure to follow our compartmentalized flow. We cannot cross contaminate any browser with data from another one. One way you can train yourself to do this is use a plugin, such as [Block Site](https://chrome.google.com/webstore/detail/block-site/eiimnmioipafcokbfikbljfdeojpcgbh?hl=en), that allows you to whitelist and blacklist websites. In the Chrome browser, you would blacklist every site not related to online banking and your other sensitive logins. Likewise, in Firefox you would whitelist Google and Facebook, and blacklist everything else. This prevents data leakage.

Another option you can choose is to change your default browser to a non-browser application, such as Notepad. Then, if you accidently click a link in an email, Twitter client, etc. then it won't load in any browser. Instead, you will need to copy the link and then paste it into the appropriate browser. This prevents accidental data leaks and security breaks.

The reason to use TBB for all non-authenticated browsing is that TBB is highly secure, and Tor provides a high level of anonymity. We can browse news sites, perform web searches, and many other tasks without fearing of being effectively tracked by every website on the internet. TBB's security comes from its use of plugins and configuration settings that block Javascript (through NoScript), Flash, Java, and other 3rd party applets. Similarly, TBB also utilizes a number of techniques to avoid providing unique data that can be used to individually identify and track users. See the [design documents](https://www.torproject.org/projects/torbrowser/design/) for a complete list.

### Security and Privacy Gained

By using this setup you:

* Prevent cross-contamination of data and cross-browser data leakage
* Stops the real power of XSS and UXSS as you aren't logged into sensitive websites in a browser that visits untrusted websites
* Prevents advertising based on your unique habits. TBB provides anonymous browsing, and by confining Google, Facebook, and other trackers only to their own services they cannot gather external data on you or your habits
* The use of TBB on non-authenticated websites means that untrusted websites will not be able to execute Javascript or other vulnerable technology 

Note: You need to very careful if you enable Flash as the cross-browser data reading can occur as explained previously in this document.

Note 2: For this mode to work effectively, you must train yourself to limit websites to their particular browser. Using a plugin that whitelists and blacklists websites can greatly help with this effort and can save you if you make a mistake. You can also set strict NoScript (javascript) filters for websites you want to block in order to effectively stop their tracking.

## Use of Virtual Machines

### Why

While using multiple browsers provides substantial benefit over using one browser, using virtual machine guests to browse provides the highest level of security and privacy you can achieve on a single physical system.

### Setup

To use virtual machines for browsing, a virtualization package must be chosen. Popular candidates are [VMware](https://www.vmware.com) Workstation, Fusion and Player, as well as [Virtual Box](https://www.virtualbox.org/wiki/Downloads). 

A base operating system must then be installed in a secure fashion. A good setup is base Debian install with GrSec/Pax enabled kernel and the Chromium (Chrome) browser with the setup and plugins described previously. The following links describe GrSec and Pax and how to install them: [here](https://en.wikibooks.org/wiki/Grsecurity/Obtaining_grsecurity), [here](https://en.wikibooks.org/wiki/Grsecurity/Configuring_and_Installing_grsecurity), and [here](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options).

For less technical users, a Windows operating system, such as Windows 8.1, can be virtualized. 

Once a virtual machine guest is created with a base operating system and a properly configured browser, a secure, offline copy of it must then be made. It is advisable to use hashing and other file integrity techniques to ensure its security.

For the use of TBB, the TBB browser can also be installed in the image, or [Tails](https://tails.boum.org/about/index.en.html), which is a virtual machine configured specifically for anonymous and private browsing, can be utilized. Tails is highly recommended in this scenario.

If you are going to use the virtual machine approach then you should consider and learn about [Qubes OS](https://www.qubes-os.org/). Qubes leverage virtual machines to provide a high level isolation on a system physical system. It does not replace compartmentalization by using separate physical systems, but in some respects it is as close as you can get. 

If you are going to use Qubes then you should also read the documentation of the [Whoonix](https://www.whonix.org/) project and [Qubes-Whoonix]( https://www.whonix.org/wiki/Qubes). Qubes-Whoonix uses two virtual machines, the Whoonix Workstation and the Whoonix Gateway. It ensures that all connections from the Workstation VM are routed through the Gateway VM. The Gateway routes all network connections through Tor. This provides a high level of security and anonymity, even in the case of the Workstation VM being compromised.

### Operation

To perform browsing, unique copies of the configured virtual machine guest must be created. The copies will mirror the browser setup from the previous section, except that instead of installing multiple browsers directly to the host operating system, each VM will run a browser with a specific purpose.

For example, one VM copy will be used for Facebook and Google, while another will be used for online banking, and another for logging into your hospital's medical system. Installing multiple browsers to an OS can be difficult, but making copies of VMs is very straightforward.

For general browsing and search, Tails should be used.

After each session the Tails VM should be rebooted. Similarly, at least once a week, the VMs used for logging into services should be reverted to the original state. As discussed next, this will greatly time limit the exposure and time frame any potential attackers have in which to be active.

To help you keep browsing sessions into their correct VM, you may want to use visual cues. For example, set a different background for each VM and then associate that with a security level.

When using virtual machines, you must be very careful with how you configure copy-and-paste and shared folders between the VMs. If you need to bring a file out to the host, then you must setup a unique share folder structure for each guest. Otherwise, an attacker that is active in a VM can steal files associated with another. This breaks the security boundary. Similarly, if you allow for copy-and-paste between guests then an attack in one VM can read your clipboard data from another VM or the host itself. This can be catastrophic depending on the sensitivity of such data.

### Security and Privacy Gained

Using VMs has the same benefit as multiple browsers as well as the added bonus of:

* Limit the time your data is exposed. By using VMs and reverting them often, which brings them back to their original state, you are setting a defined time limit on which attackers or malware can be active before you instantly remove them. When revering a virtual machine you are bringing it back to the state it was in when you first installed it. If attackers want to get access to your VM again they then must re-exploit your browser. Similarly, if tracking companies have bypassed your filters, resetting while remove all tracking data.

* Protection of browser exploitation. If one VM has a compromised browser, the data on the other VMs are not affected.** Reverting the VMs often can greatly close this time window. No other approach can save you if a browser is fully compromised. This approach saves your other web data as well as the rest of your personal data contained on the system.

** Technical Note: While guest->host escapes exist, they are quite rare compared to other software vulnerabilities, and are generally reserved for very targeted attacks.

# Changing Your Search Engine <a id="searchengine"></a>

When moving to a posture of security and privacy, one thing you must often rethink is your search engine. Even if you use TBB, major search engines (you know who they are), still track your search terms and attempt to uniquely identify you by setting cookies and other data. 

To remedy this you should use a privacy conscious search engine. A popular option is [DuckDuckGo](https://duckduckgo.com/) as well as [StartPage](https://www.startpage.com). 

Startpage does not log your IP or search and uses Google's results to "enhance" its own results - meaning you get the power of Google search without the tracking.

Similarly, DuckGoGo [does not log your searches](https://duckduckgo.com/privacy) in any manner that can be traced back to you.

# Preventing DNS Leaks <a id="dnsleaks"></a>

The Domain Name System (DNS) is used to resolve textual names of a service (e.g., www.cnn.com) to an IP address. This process is needed to allow your browser to communicate with remote services that you are commonly familiar with.
Unfortunately, DNS is not privacy friendly, and even if you use other techniques described in this document, leaking of DNS queries can be a huge privacy issue. 

For example, if you went to an HTTPS website about specific cancer treatments or mental health conditions, your ISP would not be able to determine the exact page you visited. But, due to DNS, if you use your ISP’s DNS servers, which is generally the default method, then your ISP would know that you are visiting a particular website because you first queried its name.  So even though it wouldn’t know the exact page you visited, it would still know the website that you visited. This is an obvious privacy issue.
In order to make your DNS queries private, there a number of choices you can make. 

First, there are several public DNS servers that do not log requests. These are listed [here]( https://anonymous-proxy-servers.net/wiki/index.php/Censorship-free_DNS_servers). 

Another option is to use a VPN client that supports DNS tunneling.  This will give you the same privacy benefits of VPNs in general, which are described in the <a href="#vpn">VPN</a> section.

And finally, you can use a system, such as TAILs, that will route all DNS requests through Tor.  The Tor [documentation]( https://trac.torproject.org/projects/tor/wiki/doc/Preventing_Tor_DNS_Leaks) page describes this issue and resolution in detail.  

To test if your setup allows for DNS leaks, you can use the [DNS Leaks]( https://www.dnsleaktest.com/) page.  You should make sure that both the standard and extended test do not produce a DNS leak.

# What about Private Browsing? <a id="private"></a>

["Private Browsing"](https://en.wikipedia.org/wiki/Privacy_mode) is a feature provided by all modern browsers in order to enhance privacy by not recording data to your local system (browsing history, cookies, etc.) as well as on the network when the browser is in private mode. Unfortunately, this browsing mode sounds more secure than it really is. For a well-done, illustrated guide to these problems, please check the [Private Browsing Myths](http://privatebrowsingmyths.com/) website.

# Why not use TBB or TAILs for all Browsing? <a id="tailstor"></a>

As you read this document, you may wonder why you shouldn't use TBB for all of your browsing, including authenticated sessions. There are two problems with this approach.

The first is that malicious exit nodes, which are the last servers your data travels through on the Tor network before it reaches the outside internet, can maliciously sniff and alter your non-HTTPS traffic. Since many websites still allow for authenticated use without strict HTTPS, you are essentially trusting your account security to Tor exit nodes - which is something you shouldn't do. There are a number of references [here](https://www.youtube.com/watch?v=ibF36Yyeehw), [here](https://trac.torproject.org/projects/tor/ticket/8657), and [here](https://threatpost.com/researcher-finds-tor-exit-node-adding-malware-to-binaries/109008) on malicious exit nodes. 

The second issue with authenticated Tor browsing is that when using Tor you can appear to be browsing from anywhere in the world. This is a great advantage from a privacy and anonymity perspective, but it will almost certainly cause lockouts on your banking, health, and other websites where sensitive data is stored. Similarly, it is a strong security measure for these websites to know which geographic regions you usually login from in order to detect when your account gets compromised by an attacker on the other side of the world.

# Using Virtual Private Networks (VPN) <a id="vpn"></a>

A VPN allows a user to tunnel their network connections through a remote network.  The remote network then passes the traffic through to the intended destination (e.g., Amazon, Ebay, etc.).

VPNs can provide immense security and privacy benefits as the connection from the user’s computer to the VPN server is encrypted, which prevents people on open wireless networks as well as the user’s ISP, from determining where the user browses. The user is also protected from IP address based tracking, as web servers will see the user as connecting from the VPN’s external IP address and not the actual IP address of the user. 

The use of VPNs is not only beneficial on desktops and laptops, but also on mobile devices. While this guide does not explicitly cover mobile devices, many of the anti-security and anti-privacy technologies described affect mobile as well. Mobile devices also have the added threat of fake base stations ([1](http://www.makeuseof.com/tag/4-things-you-need-know-about-those-rogue-cellphone-towers),   [2](http://www.popsci.com/article/technology/mysterious-phony-cell-towers-could-be-intercepting-your-calls),  [3](https://security.stackexchange.com/questions/93500/how-to-protect-against-rogue-base-stations)) and [rogue wireless access points](http://arstechnica.com/security/2014/06/free-wi-fi-from-xfinity-and-att-also-frees-you-to-be-hacked/) that monitor and interfere with the device’s internet connection.

## Choosing a VPN Provider

Although there are many trustworthy VPN providers, [Surf Easy](https://www.surfeasy.com) is highly recommended and used by a number of computer security professionals.  It not only provides VPN capabilities for desktops and laptops, but it also has mobile support (Android and iOS). While the VPN is free up to a certain amount of bandwidth, the paid version of the mobile application provides unlimited bandwidth as well as ad-blocking capabilities. 

Before deciding on a VPN provider you should also read the yearly VPN provider review written by  [TorrentFreak](https://torrentfreak.com/anonymous-vpn-service-provider-review-2015-150228/). You can also use multiple VPN providers in a rotation. The TorrentFreak article lists a number of questions you should ask before choosing a VPN provider. Obviously some of these are geared towards BitTorrent use, but the questions are useful in general regardless of your reason(s) for wanting to use a VPN.

## VPN Software & Fail Open

A common "gotcha" of VPN software applications is that they may "fail open" when service issues are experienced. To "fail open" means to allow an action to continue when an error is encountered whereas "fail closed" means to deny all actions until the problem is resolved. 

In computer networking, a common example is a network security monitoring device "failing open" when it has an error, which exposes the network to risk but allows traffic to continue passing through. If the device were to "fail close" then all network traffic passing through it would be blocked until the device is functioning properly. Many organizations chose to operate unprotected rather than to shut down all operations.

When dealing with VPN software, "failing open" means that your connections will no longer router through the VPN, but instead will connect directly to the internet. Depending on your threat model and current geolocation that may be an unacceptable risk. Before using a particular VPN software you must read the documentation about whether it fails opened or closed and make your judgement accordingly. 

# VPN vs TOR <a id="vpnvstor"></a>

The first revision of this document did not cover VPNs, but did cover Tor. This generated quite a bit of feedback related to non-technical users being "safer" using a VPN vs Tor. 

This argument has some merit as it well known in technical circles that the intelligence services of many nations monitor Tor and its usage. It is also known that downloads of the Tor Browser Bundle are monitored by many intelligence services as well. It is believed that users that use Tor are put under close monitoring than others. 

When choosing Tor versus a VPN, there are both technical and political choices to make. If you live in a country whose internet is heavily monitored, and where you can face legal action depending on your evasion of filters, then Tor must be used with care. 

This document will not cover such use, but the previously linked to Tor documents do discuss how to handle such situations. VPNs can and also are monitored for in such locations, but VPNs are often harder to detect than Tor, which is easily identifiable based on the machines you connect to in order to connect to the Tor network.

From a technical perspective, Tor provides much greater anonymity than a VPN, assuming your adversary is not at the nation state level. With a VPN, you must place a great deal of trust in your VPN provider as a malicious VPN provider can monitor, log, and tamper with your traffic. With Tor, your main point of concern is malicious exit nodes as previously described. This can be greatly mitigated through HTTPS.

# General Security Best Practices <a id="generalsec"></a>

## Use a Password Manager

Password Managers provide great password security as they generate strong passwords and then save them for all the websites you visit. This not only makes your password uncrackable after database dumps (related: Troy Hunt's iampwned? project [here](https://haveibeenpwned.com/)), but it also means you will have a unique password on every website - a strong measure compared to most people's security posture.

[Keepass](http://keepass.info/) and [Last Pass](https://lastpass.com/) are popular password managers.

When using password managers remember the rules on compartmentalization. 

## Enable Two Factor Authentication Everywhere

On top of strong passwords, you should also enable two factor authentication (2FA) everywhere possible. Nearly every reputable service provides this option now, and if you have sensitive data in an account where 2FA is not possible then you should switch services and remove your data.

2FA is such a strong security measure as it requires not only your password to log in (one factor), but also a second factor that attacker's cannot easily access - such as a code retrieved from a SMS to your phone or a code generated in a mobile application. This extra step mitigates attacks after your password is stolen or where attackers attempt to force you to log into a service through a scripting vulnerability.

The [Two Factor Auth List](https://twofactorauth.org/) lists a wide range of services and whether they support two factor authentication or not. Thanks to [@malwareforme](https://www.twitter.com/malwareforme) for the link.

## Log only into Websites Currently being Used

When logging into sensitive websites, you must only log into one at a time. If you have multiple bank accounts at different companies, log into one, logout when you finish, and then log into the next.  This prevents a scripting vulnerability in one banking website from compromising data or performing actions on your behalf on the other website. Apply the same logic to every other website that you don't want your data stolen from.

# Checking Your Setup <a id="checking"></a>

After creating your secure and private browsing setup, you then need to test that it works. To test your setup, visit [BrowserLeaks](https://www.browserleaks.com/), and click every option (leak method) on the sidebar. If you see data that shouldn't be there or if you see data that you are not comfortable leaking in a particular context, then you need to fix it. 

If you are using a VPN or proxy setup then you browse to [W I T C H](http://witch.valdikss.org.ru/) and check what information is detected. 

# Closing Thoughts <a id="closing"></a>

As stated in the beginning, this guide is for those who want maximum privacy and security related to their web browsing sessions. Privacy is about preventing leakage of data and minimizing the damage of any future leak. Similarly, security is about reducing the chance of your system being compromised as well as minimizing data that is accessible to any potential attacker. This guide helps you achieve this through blocking and modifying technologies that allow for web-based tracking and browser exploitation. 

If you don't take security and privacy seriously, then you will eventually lose data that is sensitive to you. You can't then go back in time and fix what is already leaked - you need to secure it before catastrophe occurs.

As [@thegrugq](https://www.twitter.com/thegrugq) often says:

> OPSEC is prophylactic, not retroactive. 

# How to Contribute <a id="contribute"></a>

I wrote this as a Gist in order to promote contributions from others, and to spur discussion. If you have a GitHub account, please feel free to use its facilities when commenting or contributing changes. If you are not comfortable using Git or GitHub, then please feel free to email me.

# Contact <a id="contact"></a>

This guide was originally developed by Andrew Case. I can be contacted through the methods described on my [website](http://dfir.org/?q=contact).

# Contributors <a id="contribs"></a>

I would like to thank the following people for their useful suggestions and corrections:

* [Morgan Marquis-Boire]( https://twitter.com/headhntr)
* [David Stampley](http://www.slideshare.net/DaveStampley/)
* [Kenn White](https://twitter.com/kennwhite)
* [SG-S](https://gist.github.com/sg-s/)
* [vmiktres](https://www.reddit.com/r/netsec/comments/3e7yan/i_wrote_a_detailed_howto_on_privacy_security/ctdc9vq?context=3)


# ChangeLog <a id="changelog"></a>

July 22, 2015   - Version 1 released publicly at https://gist.github.com/atcuno/3425484ac5cce5298932

August 25, 2015 - Version 2 released. Includes new sections on VPNs, DNS security, VPNs vs Tor, Browser Fingerprinting, and many smaller updates and fixes. The commit can be found [here](https://gist.github.com/atcuno/3425484ac5cce5298932/revisions?short_path=8a2718e#diff-8a2718e4aa22e4b51b74a52010e8c754).
