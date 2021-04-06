---
title: Enabling wifi on Linux on a Teclast F6 plus
tags:
  - linux
---
![Khamkeo Vilaysing - Unsplash](/assets/img/khamkeo-vilaysing-myZqfQhh9QU-unsplash.webp)
I like cheap systems and tweaking them. As my daily notebook, I am using a [Teclast F6 plus](https://www.teclast.com/en/zt/nb/F6Plus/) for about one year now.

Of course, the first thing I did was to install Arch on it. 

Everything was running fine, except the wifi board. The card was not seen on boot. After a forced rescan of the pci bus, the device was listed but the driver would crash when enabling the card.

I had some suspicions about a BIOS issue that would mess with the PCI allocation but I was unable to make it work. I was using a small USB wifi dongle and forgot about it.

Until last week, when I ran into a new issue. The USB dongle is using a Realtek RTL8812AU chip, for which I had to use [a custom driver](https://github.com/aircrack-ng/rtl8812au).

And the driver suddenly broke when upgrading my kernel to 5.11.

I started to play around the BIOS settings again, without too much hope, but.. TADA!! The card started to be detected and actually works! (after one year...)

Here are [the details on askubuntu](https://github.com/aircrack-ng/rtl8812au).
