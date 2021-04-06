---
title: Compiling Kodi on Chrome OS for nothing
tags:
  - chrome os
  - fail
  - kodi
---
![jonas leupe - unsplash](/assets/img/jonas-leupe-jRPxlHqc_no-unsplash.webp)

My wife recently offered herself a brand new [Honor Magic D14](https://www.hihonor.com/global/products/laptop/honor-magicbook14/) laptop.

I must admit I am a little jalous. The machine works very well, is light and beautiful. For less than 600€, this is really a great bargain.

Having this new system, I refurbished our old venerable [Asus C300SA Chromebook](https://www.asus.com/sg/Commercial-Laptops/ASUS-Chromebook-C300SA/specifications/) to be used by the family as a low-end media player. The idea is to have a light machine we can travel with, share with friends, and for which we don't worry too much if it is stolen or broken.

Within the process, I wanted to install Kodi. My first thought was, of course, to install the android version and that worked very well.

The only problem with that solution is that Google play installs the last version and for the time being, only a few addons are compatible with Kodi 19.

So, my next idea was to install it as a Linux app. The linux container embedded within Chrome OS works very well and is a Debian buster distribution. As there is no official ppa for Kodi on Debian, and because I like DIY, I started [compiling Kodi 18.9 Leia](https://github.com/xbmc/xbmc/blob/18.9-Leia/docs/README.Linux.md). 

After 2 days (!...) of compilation, I could finally launch kodi, which worked well... except for one detail.

There was no hardware acceleration at all. I like my chromebook for being light but decoding a video with a Celeron 3060 is demanding. Anything above 720p is choppy and we have to forget about HEVC.

The harware used in an intel HD Graphics 400, so I first tried to enable VAAPI, but ran into an issue.

Here is the output of `lspci` inside my Linux container:

```
00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma]
00:01.0 Unassigned class [ffff]: Red Hat, Inc Virtio console
00:02.0 Unassigned class [ffff]: Red Hat, Inc Virtio block device
00:03.0 Unassigned class [ffff]: Red Hat, Inc Virtio block device
00:04.0 Unassigned class [ffff]: Red Hat, Inc Device 105b
00:05.0 Unassigned class [ffff]: Red Hat, Inc Virtio RNG
00:06.0 Unassigned class [ffff]: Red Hat, Inc Virtio memory balloon
00:07.0 Unassigned class [ffff]: Red Hat, Inc Virtio network device
00:08.0 Unassigned class [ffff]: Red Hat, Inc Device 107f
00:09.0 Display controller: Red Hat, Inc Virtio GPU
00:0a.0 Unassigned class [ffff]: Red Hat, Inc Device 1053
00:0b.0 Audio device: Intel Corporation 82801AA AC'97 Audio Controller
00:0c.0 USB controller: Fresco Logic FL1000G USB 3.0 Host Controller
```

No intel card.. We are running a virtio GPU.

After a couple of hours on the web trying to find out if using VAAPI or VDPAU on an virtio GPU was possible, I finally came to the conclusion that it was not possible :\