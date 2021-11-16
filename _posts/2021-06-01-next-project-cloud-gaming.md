---
title: My next project&colon; build my own cloud gaming server
tags:
  - cloud
  - gaming
---

> 2021-11 Update:
>
> Technically, the project was a success. I was able to play BoTW on Cemu in full HD.
>
> There is no way to enable nested virtualization on regular AWS instances, so I had to forget about KVM, but it appears that building a custom AMI with Windows 10 (which is a little tricky), is actually recognized as a Linux AMI.  
> Amazon G4dn instances embed a NVidia T4 GPU, for which gaming drivers are available and work very nice. 
>
> However, I had underestimated AWS costs for snapshots... To save my state, I created a new AMI each time from the EC2, which ended up in hundreds of GB stored in snapshots.
>
> Eventually, this costed me more than Shadow :\\...
>
> I am thinking to a solution involving a small Linux partition which would save or restore the Windows partition from S3, but I did not find the motivation and time yet to implement it.

<hr style="clear: both;"><br>

![Bilal O. - unsplash](/assets/img/bilal-o-jbI6XvZe7no-unsplash.webp)

I've been happily using [shadow.tech](https://shadow.tech/) services for months now. 

But as you may know, Shadow has encountered financial difficulties and was eventually [bought by OVH founders](https://www.datacenterdynamics.com/en/news/ovhcloud-founder-acquires-blade-and-shadow-gaming-service/).

Since then, as logically expected, [Blade announced a new grid price](https://shadow.tech/blog/teamshadow/introducing-our-new-offer).

Basically, the Shadow Boost offer is doubing its price.

I really love Shadow. Their service is awsome, the support is great and the experience is excellent.

If I had some money to spare, I'd just keep my subscription to support them. But the truth is that I do not not play enough and am not ready to spend 168€ per year, and I am sorry for that.

That being said, I still wish to be able to play games once in a while in descent conditions.

The idea is not new, and we can see some attempts here or there on the Internet, but I'd like to try to build a game machine on the cloud using a GPU instance.

- experiment balancing between location / latency / costs between, from AWS Spot on eu-east-2 (most likely the cheapest one), and Scaleway RENDER-S instances.
- instead of using a Windows Server instance, use a Windows 10 guest on KVM, with PCI pass-through and runing Parsec

The last part is still unclear to me and this is where I'd like to dig.