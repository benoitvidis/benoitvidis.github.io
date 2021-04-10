---
title: Playing with a low cost android TV box
tags:
  - android tv
  - android
  - home
---
![Pawel Czerwinski - unsplash](/assets/img/pawel-czerwinski-Lki74Jj7H-U-unsplash.webp)
We have been using a [Xiaomi Mi Box 3](https://xiaomi-mi.com/tv-boxes/xiaomi-mi-box-3-international-edition-2gb8gb-4k-tv-console-black/) for several years now. 

We've been happy with it till now but a couple of things made me think about switching to something else.

Mostly, the limited storage (8G) was becoming an issue. Also, since the last upgrade to Android 9, we have to reboot the box every day to be able to play any video.

While the Mi Box S would be a natural upgrade, it suffers from the same RAM & storage limitations.

The next step would have been the [NVidia Shield](https://www.nvidia.com/en-us/shield/), but we do not play on android and I was reluctant to spend that much just to get more storage.

Eventually, I ordered a low-end Chinese box, namely, a [X96 max plus](https://www.geekbuying.com/item/X96-MAX-Plus-Amlogic-S905x3-Android-9-0-8K-Video-Decode-TV-Box-4GB-64G-422573.html).

For a little less money than the Mi Box, you get a more recent and powerful SOC (an Amlogic S905x3), twice as much RAM and **8** times storage.
It also offers far more connections, notably a sd-card slot and an ethernet port.

Of course, there are some drawbacks, apart from the obviously arguable design of the box.

1. The stock ROM is not an _real_ Android TV but an AOSP Android. While it works, the launcher just looks ugly to me
2. The remote control shipped is very basic and is IR only and won't work if you don't directly point at the receiver
3. I don't expect the box to be [Widevine L1 certified](https://www.androidauthority.com/widevine-explained-821935/). Notably, Netflix will most likely run in SD only
4. I am not expecting any ROM update from the manufacturer

That being said, 

1. I had previously checked and custom ROMs seemed to be [available on this box](https://www.evolutiontv-vs.com/uncategorized/%d0%b1%d0%bb%d0%be%d0%b3-%d1%81%d0%b8%d1%81%d1%82%d0%b5%d0%bc%d0%bd%d1%8b%d1%85-%d1%84%d0%b0%d0%b9%d0%bb%d0%be%d0%b2.html)
2. We can find a lot of RF remotes very easilly. I personnally went for [this one](https://www.amazon.fr/gp/product/B07FY954Z3/ref=ppx_yo_dt_b_asin_title_o02_s00?ie=UTF8&psc=1). Until now, it feels quite good.
3. We do not use Netflix. Even if we were, our projector is full HD and 720p does not look bad on it
4. OK, we will have to do it ourselves, but this is where the fun is, right?

## Custom firmware

So, the first thing I tried to do when I received the box, was to try to flash a custom firmware.

The box is using an Amlogic S905x3 SOC. Amlogic provides development tools, among which [a burning software](https://androidmtk.com/download-amlogic-usb-burning-tool) to flash the images you can find on Internet.

The process is:

1. Download and run [USB Burning tool v2.1.7 or later](https://androidmtk.com/download-amlogic-usb-burning-tool)
2. From the tool, open your img file, and click Start
3. While pressing the reset switch with a toothpick at the bottom of the AV port, connect a USB cable from your PC to the box

And... 

```
[0x10105002]Romcode/Initialize DDR/Read initialize status/USB Control setup error
```

Turns out I was using a USB-C > US-A cable. 

______

**Lesson 1: I needed a male - male USB-A > USB-A cable**

______

So, let's start again. I pick up a rom file, burn it to the box. Once complete, I plug the box back to its HDMI and start it and... black screen.

I had bricked my box :\ ...

Ok, no problem, **the box is able to auto-recover itself**. When plugged to an USB cable, it will automatically switch to burn mode. **Be patient, this can take several minutes**.

In practise, you can just use the USB Burning tool again, click Start, plug the box (no need to look for the reset switch), and wait for it to be detected and flashed.

I spent several hours to try every single firmware I could find.

Eventually, only 2 ones worked, both stock...

## Tweaking the stock firmware

My main goal when searching for a custom firmware was to get a similar experience we have with the Android TV running on the Mi Box.

Actually, i appears it is possible, and actually quite easy to [turn AOSP into Android TV](https://youtu.be/vyeVfTSlr1A).

As you can see on the video, the result is quite minimalist, but from there, I was able to install all the apps I needed, even if, for instance, Prime Video would not appear in the Google Play store, but installing it manually after having downloaded the apk worked fine.

We are running the box for only 1 day and till now, the only issue is that the power button on the RF remote does not work (the one from the stock remote does). I am pretty confident it is possible to remap it to work easily.

On the other hand, we are feeling the boost in performance compared to the Mi Box 3 and we have now plenty of space to install a lot of apps we probably won't ever use. 

NB: the SOC is not a harcore performer and won't be able to run games like Fornite or compete with a NVidia shield. But compared to the Mi Box 3, or [even the Mi Box S](https://androidpctv.com/comparative-amlogic-s905x3/), it does not look ridiculous.

Actually, I am looking for testing it with emulators.