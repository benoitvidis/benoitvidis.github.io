---
title: Streaming hi-quality audio via bluetooth
tags:
  - audio
  - hack
  - raspberry pi
---
![Wolfgang Hasselmann - unsplash](/assets/img/wolfgang-hasselmann-PN9JtsCCHDk-unsplash.webp)
I am the happy owner of an [audio-technica AT-LP120-USB turntable](https://www.audio-technica.com/fr-ca/at-lp120-usb).

However, my room is arranged in a way where the turntable cannot be placed next to my amplifier and where it is not easy nor nice to pull some cables.

So, I started to think about a wireless solution.

My requirements were:

- It had to be the best possible quality - What would be the purpose to have a nice turntable if I would end it up listening to it in MP3 quality?
- It had to be relatively affordable
- At least the receiver had to have a small factor to fit in my room

I also preferred bluetooth over a proprietary solution to be able to reuse components for other setups if needed.

## Receiver

I had a crush on the [Fiio BTR3K](https://www.fiio.com/btr3k). It is by far the most expensive part of the setup (~60€ with Chinese import), but I can use it to turn any audio device into a bluetooth wireless one.

I am using it part-time on my old good Bose QC25 and it is great.

It is small, light, very easy to use, and support most of bluetooth codecs, including aptX HD &amp; LDAC (aptx Adaptive is not common).

## Transmitter

Now that I had a receiver, I needed a transmitter, and this is where it appeared to not be that easy.

I first had a look at built-in transmitters.

Sure, the [Fiio BTA30](https://www.fiio.com/bta30) is a very nice beast, but it was over-budget.

On Aliexpress, the [best budget transmitters](https://fr.aliexpress.com/item/32956872357.html?spm=a2g0s.9042311.0.0.27426c37QBIpOQ) were topping as aptx HD, which is not bad, but I was wondering if I could also benefit from LDAC.

Then, I remembered I had a [rapsberri pi zero W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/) taking dust somewhere.

This thing has bluetooth, wifi, and an USB connecto to connect the table's ADC.

Next, we need a piece of software.

Since its 15.0 version, in July 2021, pulseaudio now supports bluetooth with aptX HD and LDAC. It is available in Arch, but there is a much simpler and newer way, being [pipewire](https://pipewire.org/)

Pipewire can be used as a replacement for both [pulseaudio](https://wiki.archlinux.org/title/PipeWire#PulseAudio_clients) and [jack](https://wiki.archlinux.org/title/PipeWire#JACK_clients), and has support for [bluetooth](https://wiki.archlinux.org/title/PipeWire#Bluetooth_devices), with aptx HD and LDAC support.

Plugin things together, streaming the turntable USB output is just as simple as 

```shell
#!/bin/sh

set -ex

mac="40:ED:98:XX:XX:XX"

systemctl --user restart pipewire-pulse
sleep 3

bluetoothctl power on
sleep 10
bluetoothctl connect "${mac}"

jack_connect "PCM2900C Audio CODEC Analog Stereo:capture_FL" "FiiO BTR3K:playback_FL"
jack_connect "PCM2900C Audio CODEC Analog Stereo:capture_FR" "FiiO BTR3K:playback_FR"

echo done
```

The mac here is the one from my fiio receiver.

We connect to it, and then, use jack to pipe the inputs (Left and Right) to the bluetooth sink :)

I have not tested the setup extensively yet. During my tests, the sound was sometimes choppy, because of a very high CPU usage.

After sligthy overclocking the pi, it seems to be ok for now. At worse, I will switch to a pi zero w2.