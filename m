Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D6411C6B
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 17:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfEBPPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 11:15:49 -0400
Received: from mxc2.seznam.cz ([77.75.77.23]:7065 "EHLO mxc2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbfEBPPt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 11:15:49 -0400
X-Greylist: delayed 895 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 May 2019 11:15:34 EDT
Received: from email.seznam.cz
        by email-smtpc12b.ng.seznam.cz (email-smtpc12b.ng.seznam.cz [10.23.14.105])
        id 5543126b82f8ab0e55eb0cac;
        Thu, 02 May 2019 17:15:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1556810133; bh=uxZB6dSvoQ7KzE+BBogXZgKuFO43T0mqiBxdQEtvtBg=;
        h=Received:From:To:Date:MIME-Version:Content-type:Subject:
         Message-ID:Priority:X-mailer;
        b=JDJSlkypIZv4stpJOzkE3rF0YJHAk63TxQZU0yEBpu49QTaOoZffTPsTkBa3o+ucY
         wqnj4OeLzvrWYUjUY0Fz42Kh3eSBymLMtndv7+70YSgq+CFgp8slqWZy8Er0dI106x
         IIXoZg7PozBh5NF/nfkil8v2ZF5w5nxQCPyPOUxM=
Received: from [192.168.254.10] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay14.ng.seznam.cz (Seznam SMTPD 1.3.103) with ESMTP;
        Thu, 02 May 2019 17:00:30 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Thu, 02 May 2019 17:00:30 +0200
MIME-Version: 1.0
Content-type: Multipart/Mixed; boundary=Message-Boundary-25148
Subject: Noob DVB-T2 experience: Mygica T230C2, CrazyCat, DVR w. output plugins, and friends...  
Message-ID: <5CCB060E.7930.49270C6E@Frantisek.Rysanek.post.cz>
X-mailer: Pegasus Mail for Windows (4.63)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Dear everyone,

apologies for the intrusion, and for the talkative message... feel 
free to discard on the basis of TL;DR or OT.

I have some noob experience to share, and this looks like a pretty 
good place to document the status quo in its breadth.
I haven't found a companion "users" mailing list - so with a shaking 
hand, I'm posting here.

Whether you care to read this or not, your comments are welcome.

# Intro and background
-----------------------

I'm still a script kid, despite my bodily age racing forward.
And in my private life / hobbies, I'm proud to be a DIY freetard.

Where I live, in the Czech Republic in the post-commie eastern EU, 
terrestrial TV reception has a long tradition. The analog darkness 
came about in cca 2012 if memory serves - since then, we've been left 
with DVB-T, and it's been a semi-positive experience.
("digital" makes debugging antenna systems more difficult with just 
your naked eye, and there's wireless data barking at us just outside 
the fences both above 800 MHz and below 470 MHz, etc.)

DVB-T is an old story. But, within about 1 year, DVB-T will pass away 
too, and we'll be left with DVB-T2 (actually maybe more like just 
half a year from now, allegedly, in our particular area).
Our flavour of DVB-T2 is characteristic by HEVC encoding and 
apparently we will enjoy a high percentage of free-view programs (if 
not all, in the terrestrial transmission). Not sure if "enjoy" is the 
right vocabulary for various reasons, but that's a different story.
We will probably have some public TV channels in full HD and a flock 
of commercial channels in QHD and low bitrate, tightly packed in just 
a few "networks" (multiplexes) in massive wide-area SDN.

Obviously the world around is not standing still, there's the 
satellite coverage, there's IPTV in various flavours, even the late 
nineties twisted telco copper in the ground is still alive and 
kicking on VDSL2 steroids (FTTH won't happen for a long time) etc. 
Youngsters spend more time on YouTube than watching classic TV etc.
It almost feels like I'm "late and to the wrong party", trying to 
make DVB-T2 work for me...

I myself have lived through the DVB-T era with a Vestel T816 
twin-tuner PVR, which has its glitches but is generally bearable, and 
has some features that are shining bright, such as the massive 
tabular EPG with an integrated recording/scheduling capability. 
I have revamped two pieces of this PVR in my family with solid poly 
caps and that's how they will both manage to live to reach moral 
obsolescence in reasonable health.

I like the PVR box being separate from the TV display.
During the last year or two, I've been trawling the market for a 
replacement, capable of DVB-T2 - and all that I could see were 
small-brand PVR machines, imported in small quantities by... small 
traders, sometimes having downsides that make them impractical for 
our DVB-T2 flavour etc. Significantly more expensive than the old 
Vestel box, although not much better in terms of bells and whistles.


# Enter "Linux media" and HTPC
------------------------------------------

And, I've been eyeing the HTPC segment as well - wondering what it 
would take, or if it's possible at all, to build a "DIY twin-tuner T2 
PVR" using an x86 ATOM motherboard and some general-purpose Linux as 
the underlying OS. I know I know - there are the Raspberries and 
Odroids and specialized ARM SoC's that can do HEVC better than a 
Gemini Lake... but to me that's at the cost of some x86 freedom.

Apparently I'm not alone - there's a small group of people in this 
country, who are tinkering in vaguely the same direction, including 
some who have been using Linux-based DVB-T headends for several 
years.

I have a nifty old RTL2832U dongle for SDR, especially useful 
with RTLSDR-scanner, for tuning the antenna systems for my family.
Obviously that's well supported in Linux and DVB-T only.

In order to "test the water", I decided to buy a basic USB dongle 
with DVB-T2 capability and see if I can make it work.
Friendly people in a local Linux forum have suggested two or three 
models of cheap hardware. Last year there were still some "Astrometa 
clones" with RTL2832P, with plausible driver support, which 
apparently have vanished from Aliexpress in early 2019 or so.
Another tip was a local importer selling the Mygica T230C2 (sold 
relabeled under a local private brand) - it is universally available 
around here and the word was, that it can be made to work in Linux, 
at the cost of some driver patching and kernel compilation.

To sum up, my goal for the trial was:
to plug in the Mygica, connect it to a decent antenna, scan the band, 
and get some moving picture (even if just a "slide show") on the 
screen, on scrap x86 hardware, to see that the signal chain is 
basically feasible, subject to further fine-tuning on tailor-made 
hardware for production use, if that route looks fruitful.


# Speaking of hardware
-------------------------------

For my distro-tourism venture, I'm using a retired notebook PC.
The "platform" is a 65nm Core 2 Duo with i965GM north bridge
(containing the GMA-X3100 mobile IGP) with 2 GB of RAM.
The system is nowadays too feeble for modern Windows,
but feels fair enough for a basic Linux setup.
Fair enough, except possibly the VA capabilities - more on that 
below. I used to think that software decoding would be okay for the 
"proof of concept", but modulo practical software available, that 
guess was possibly too casual.

To feed the Mygica, I'm taking signal from an antenna system that 
I've been managing for years on our small residential block, on the 
cheap side. It's fine-tuned for the DVB-T transponder set that will 
soon become a matter of the past, but it also allows some T2 
transponders through, as the amp stack is not a proper "crate of 
highly selective channel blade inserts" - rather, the channel 
amplifiers are somewhat broad, so the nearby temporary T2 
transponders get through as well. By various measures, I'm keeping 
the CDMA and LTE interferences at bay, and I've somewhat de-tuned a 
nearby DVB-T transponder that's very strong, despite transmitting 
mostly junk programs (only good at overloading my headend PA).
I'm keeping the aggregate TX output of the headend's power amp
just below the level where THD starts to hamper reception for the 
clients. 
In the house, I have several DVB-T and T2 receivers (among my 
neighbors) as a general "ballparking benchmark" of how the antenna 
system is doing, and I can judge details by RTLSDR_scanner.


# Kernel space: the driver
-------------------------------

I was aware in advance, that the Mygica T230C2 was not supported in 
the vanilla kernel. I checked that in the "head" at git.kernel.org, 
in drivers/media/usb/dvb-usb/cxusb.c.

A local fellow tinkerer calling himself "no_body" has proposed a 
small patch set to vanilla, that would allegedly get the dongle to 
work.
https://gist.github.com/dev-as-nobody/55e83fdb57601407a343de78685331be
No_body himself did not submit the patch to vanilla upstream because 
he felt that his mod was too simple, the changes to demod init would 
not properly cater for the older T230 and T230C.
The older models did not bother me, so I massaged this patch into 
5.0.8 vanilla, which did not take much effort (there are differences 
to the original patch target i.e. 4.15.12, but the surrounding 
context is limited enough for me to understand.)
So I patched 5.0.8: added the PCI ID's into cxusb.c, also extended 
the "index enum", modded the demodulator driver to add the extra init 
commands, and... it turns out that no_body's mods still lack an 
update to the tuner hookup/init. I ended up with an error message 
from cxusb complaining about "unknown chip version Si21128",
referring to the tuner (si2141 was expected). 

Apparently CrazyCat has noticed that problem years ago:
https://tvheadend.org/boards/5/topics/10864?r=22487
and at the time he opined that, rather than a different chip version, 
it seemd that the expected tuner chip was at a different I2C address 
(or a different I2C host port? = my impression.)
In the current cxusb driver from CrazyCat, this problem is corrected.
https://bitbucket.org/CrazyCat/linux_media/src/latest/

I took a closer look at the function called
  cxusb_mygica_t230_frontend_attach()
in cxusb.c. In the vanilla, that only knows the T230, this is a 
single function.
In his version of the driver, CrazyCat has two flavours of the 
frontend-attach function: one for T230, and a second version for 
T230C and T230C2. And, the contents of that function have changed 
significantly. Where the vanilla is using a rather crude and direct 
I2C access, CrazyCat has wrapped the tuner-related init into 
dedicated functions (apparently doing tuner chip auto-detection) and 
provided for the demod init code to be aware of what particular T230 
sub-model it's dealing with.
It looks like a nice cleanup on part of CrazyCat, and not a trivial 
one = I decided not to try to "port" those changes back into vanilla. 
https://bitbucket.org/CrazyCat/linux_media/src/latest/drivers/media/us
b/dvb-usb/cxusb.c

Instead, I downloaded CrazyCat's driver.
There are two options: I could download CrazyCat's whole kernel (some 
5.0-RC) or build just the driver (media subsystem) out of tree.
I chose the latter - with the "media_build" script by CrazyCat this 
is very easy, and it allows me to choose a kernel version that I like 
best. I chose 5.0.8 and later in my distro-tourism 5.0.10 (latest 
stable at the time).

As it turns out, a minor trouble with this is, that the driver built 
"out of tree" will taint the kernel (although it doesn't contain any 
binary blob). Ahh well... I respect that the kernel devs do know what 
they're doing.

Once the driver got compiled and loaded, the T230C2 dongle gets
properly detected and the real fun may begin: in the user space.
(In my case, apparently the dongle would only work right
if plugged in at runtime = if not present during Linux OS boot...
not sure why.)

With the CrazyCat drivers loaded, w_scan starts showing some signs of 
life: some multiplexes and programs get detected, and a channels.conf 
gets produced. The list of DVB-T / T2 carriers and programs is not 
necessarily complete and perfectly correct, but it's a fairly good 
start.

Unfortunately, CrazyCat's DVB driver stack is perhaps not 100% 
API-compatible with the vanilla stack - which probably requires me
to recompile pretty much all user space DVB software against 
CrazyCat's header files... :-( This may seem limited to only to the 
immediate back-ends of PVR apps, but other reasons may force you to 
recompile the "user interface" layers as well, basically if the 
packaged software in the distro repos is outdated for DVB-T2,
or too old for the PVR/headend backend software, that just got 
updated and recompiled. Dependency hell.


# What's worse than the kernel? The user space.
---------------------------------------------

I was aware beforehand, that DVB-T2 is still somewhat "hot news"
to Linux software - curious as it may sound, after years of field 
trials and gradual production roll-out taking place around here.
I knew I'd have to aim for fresh versions of all the software.

# Debian
------------

Initially I started my experiments in Debian 9.8.
I know that the distro is conservative, and the versions of 
everything in the Debian "stable" strain is a little dated
- but I like the stability and I thought that perhaps I could cope,
at the cost of downloading some stuff from upstream sources.

So I wasn't very surprised that I needed to compile fresh versions
of many things from source, including some dependencies.
A fresh version of VDR was fairly undemanding, but a VDR output 
plugin would require a fresh VAAPI support (libva) and a fresh 
ffmpeg, which are moderately difficult to compile (lots of 
dependencies).


I took a look at the list of compilation dependencies of Kodi (like 
an A4 page of dense print), considered the relative difficulty of 
configuring a tvheadend, and skipped Kodi altogether - did not want 
to compile this from source. 
Actually I tried booting a USB stick with the latest LibreElec 
(featuring Kodi 18.1) but the prebuilt live image did not contain a 
driver for the Mygica (the cxusb module is vanilla) which turned me 
off. I've noticed brief hints of a "CrazyCat driver stack option 
pack", but for that I'd have to install LibreElec on the disk drive, 
and the installer warnded that it would wipe all data (including 
non-linux partitions?) which to me was like "why bother".
Based on the feature set, I actually don't like Kodi for my simple TV 
PVR app very much. It has lots of functions I do not need.

Another mediacenter project in Linux is the MythTV.
Which comes with a useful build script that takes care of 
dependencies, and compiles even on Debian 9.8.
After the installationg from source was over, I encountered an 
implicit generated MythTV password for MariaDB access, which Google 
helped me sort out...
I managed to get pretty far with MythTV, before the screeching halt 
finally came. The GUI did start just fine, both the mythtv-setup and 
the user front end, I was able to configure stuff - only when I tried 
to scan the band, the scanning process would always time out, never 
finding a single channel. I have noticed that the scanning submenu 
did show the Mygica DVB device and I even found an option to select 
from the Mygica's three "sub-devices" (possibly dedicated to DVB-C, 
DVB-T and ATSC) but neither of them resulted in a successful channel 
search. 
I noticed some further notes about MySQL/MariaDB side effects, advice 
to uninstall and reinstall the database, or to manually convert 
tables from MyISAM to InnoDB storage format... which seemd a little 
"over the top" to me, and not necessarily at the core of my problem. 
Later in the logs somewhere I have noticed an error message roughly 
along the lines of "couldn't read DVB response".
All in all I would bet that MythTV compiled against the 
systemwide/vanilla "v4l / linux media / uapi kernel headers", whereas 
the driver stack was CrazyCat's... and I haven't found a way of how 
to point the MythTV build script to the CrazyCat headers.
The CrazyCat's "include" directory actually contains some other 
modified header files, outside of the uapi subtree. I'd probably need 
to somehow prepend -I/$CRAZYCAT/include/linux/ into the CFLAGS, which 
I did not know how to do.
Which was when I gave up on MythTV as well.


The third mediacenter package that I turned my attention to, was the 
VDR. Surprisingly to me, this project is apparently less popular 
around here, compared to Kodi and MythTV.

There are several things that I like about the vdr:
1) it seems more compact than the other two, and there's more overlap 
between its feature set and my personal requirements. 
2) The GUI seems sweet: clean cut, lean and mean.
3) the principal author / maintainer is a German citizen, and IMO the 
Germans are front runners in DVB-T and now T2 deployment. Chances are 
that the community around VDR and its plugins could have all the 
constituent toys in relatively good shape.
4) it comes with a build system that allows me to redirect the 
include path to the CrazyCat subdirectory.

So I tried compiling VDR from source. VDR 2.4.0 with all the 
"developer" patches, which applied cleanly. 
First on the Debian 9.8. 
I managed to get all the dependencies.
When I faced errors against the Debianese (understandably reatively 
stale) VAAPI and FFMPEG, I recompiled those relatively big projects 
from source as well, in several iterations, as I kept finding out 
./configure options that I'd missed the first time around...

Curiously to me, the VDR does not have an inherent "display front 
end" out of the box. It relies on "output plugins", all of which 
appear to be 3rd-party projects. The output plugins have had quite a 
history of their own during the years, and it happens to be somewhat 
difficult to get "just something simple to display the GUI and video 
on my X desktop or DRI FB", while being up to date.

And the final result was, that I didn't manage to make it all work in 
Debian 9.8. The VDR itself did seem to work, did report locking onto 
a DVB-T TS, but the output plugins compiled from source would all 
result in a black screen. Either with an error message hinting at an 
attempt to free() a null pointer, or with a silent coredump.
Which I attributed to my obvious gross incompetence as a 
maintainer/developer (*cough*).

The w_scan also didn't seem to work quite right, but I left 
fine-tuning that for later - and I noticed the wirbelscan plugin for 
VDR, with fresh updates, which I hoped could replace w_scan 
completely.

At about this point I backed up useful data that I'd gathered so far, 
and decided to ditch Debian in favour of something closer to the 
bleeding edge. As I'm not a fan of rolling release distroes (Gentoo 
et al), I went for the latest proper "release" of a major progressive 
distro. I went for Ubuntu.


# Ubuntu
-------------

Two decades ago, I would've looked at RedHat/Fedora.
Today, I chose Ubuntu in general, as that has a reputation for 
strapping modern goodies on Debian-testing. And, within Ubuntu, I 
went for the newest short-lived release: currently the 19.04 - hoping 
that I'd get "reasonably fresh versions of everything for free" as a 
starting point, also hoping that the upstream developers of DVR etc. 
would be living in this kind of environment as well = that any 
compilation from source would have a chance of success.
Which proved to be somewhat right.

The first thing I did, I confirmed that the Mygica is not supported 
in the distro kernel. Next, I compiled CrazyCat's media stack out of 
tree against 5.0.10 vanilla, and installed that.

I ran w_scan to get a fresh channels.conf.
I noticed that it seems to skip some channels.
Sometimes it would skip DVB-T2 transponders altogether in its output,
but the last time around, it would properly export all the DVB-T2 it 
came across, but would skip a major (strongest) DVB-T public TV mux
at 570 MHz (CCIR channel 33)... curious, I may return to that later. 
Difficult for me to tell if this is due to bugs in w_scan, or the 
cxusb driver, or the Mygica hardware, or if my signal is too weak or 
too strong, or not pure enough (THD/IMD from the headend too high)
or what. Subject to further investigation.
Well at least I did get *some* list of channels to play with.

Unfortunately, the original w_scan is no longer maintained.
https://www.gen2vdr.de/wirbel/w_scan/index2.html
The last version is from January 2017.
This is also the distro version.
Maybe I can learn something from the source code,
but otherwise I was hoping to get better results from the wirbelscan 
plugin to VDR, which has some more recent updates. And I'd have to 
compile wirbelscan from source.

Next, I noticed that the stock VDR build in Disco allows me to get 
some SD image on the screen through the stock vdr-plugin-xine,
apparently through software MPEG2 decoding.
Yippee, finally I had a GUI and some picture.
Interestingly, just a single transponder (out of about 4 that I 
caught) would get the program streams actually displayed.
It was a single DVB-T mux, probably the strongest on a nearby 
hilltop. The DVB-T2 programs would not yield a picture on the screen, 
just the VDR GUI saying "no signal". Ho hum. That would hint at some  
problem between the VDR backend and my antenna system.
Or maybe XINE cannot display the QHD HEVC ?
Difficult to say... time for that later.

In the commandline stderr from 
   vdr -P"xine"
I have noticed repeated lines that the "TS is scrambled".
Which is not in fact true... could really mean garbled, rather than 
scrambled (encrypted). = yet another hint to potentially follow.

Next, I went on to recompile VDR 2.4.0+patches and some plugins from 
source, and as expected, this time I did not need to recompile VAAPI 
or FFMPEG. 

I managed to compile the wirbelscan plugin 
  https://www.gen2vdr.de/wirbel/wirbelscan/index2.html
Unfortunately the wirbelscancontrol did not compile, complaining 
about some unknown class members in VDR headers (if memory serves).
Without that, I won't ever see wirbelscan in the VDR OSD, if I 
understand correctly.
Ahh well.

As I'd like the output path to be as direct as possible,
I went looking for "the children of softhddevice",
itself no longer maintained. The latest appears to be:
https://github.com/pesintta/vdr-plugin-vaapidevice
That compiles, but VDR quits immediately if I try to load that. I'm 
attaching the /var/log/messages and /var/log/debug from the time 
period while vdr -P"vaapidevice" was trying to start.
Not much interesting in there... apart from
VAAPI: Failed to initialise VAAPI connection: -1899086224 ((null))
I've also tried stracing the vdr with the vaapidevice plugin,
but the only potentially interesting apparition in the strace log
was the hint at /etc/libva.conf . That file was missing.
I tried creating it, specifying only LIBVA_MESSAGING_LEVEL=2 
- but that did not change anything, did not yield more log output
in /var/log/debug or some such.

I've found notes that the error message from VAAPI could be due to 
the right driver file missing.
Not sure if this is the same symptom, but vainfo indicates something 
similar: it says it's trying to load a driver for the video decoding 
accel for the i965 IGP, finds the VAAPI driver file and the relevant
entry point, but the init routine returns with an error.
The driver is called
/usr/lib/x86_64-linux-gnu/dri/i965_drv_video.so
and it's clearly present on disk, so it is *not missing*.
But, I have my doubt if this driver can actually exploit the i965GM 
(GMA-X3100) hardware for MPEG2 video acceleration. The driver is also 
known as libva-intel-driver, and supposedly supports MPEG decode 
acceleration on younger chipsets only, starting from GMA-4500 
(4-series Intel chipsets).
https://wiki.archlinux.org/index.php/Hardware_video_acceleration
Also the debian Wiki offers words of warning with respect to video 
decode offload into hardware:
https://wiki.debian.org/HardwareVideoAcceleration 
And I've found other people's opinions, that the i965GM was a first 
attempt at MPEG video accel, and it didn't turn out quite right in 
the silicon, so it's probably not supported in the VAAPI driver that 
actually carries the name of that early "video accelerated" chipset.
Anyway so this might be down to my stupid choice of hardware,
i.e. not all hope is lost, I plan to give vdr-plugin-vaapidevice 
another go on a more modern motherboard.

To possibly at least see the "VDR compiled from source" in action,
I've tried compiling the XINE output plugin from source.
I've tried three different source packages:
https://packages.ubuntu.com/source/disco/vdr-plugin-xine
https://github.com/mhop/vdr-plugin-xine
https://sourceforge.net/projects/xineliboutput/
I wasn't able to compile either.
Downloading dependencies is all fine, 
but every time I end up with a missing C/C++ struct member
in some xine or VDR header - which is where I'm stuffed.

It's curious to me that the VDR source code does not contain an 
output plugin for generic PC graphics out of the box, inherently 
compatible with the same-version VDR backend - apparently the 
principal author has some PCI tuner cards with HW MPEG decode 
onboard, and maintains a dedicated output plugin for those. 


# closing notes
--------------------

So this is how far I got.
Any hints / ideas are welcome, on any of the links in the signal 
chain or software stack.

I'm attaching a handful of log snippets - I hope they don't get 
filtered. The largest three files are in a zip, as they contain lots 
of compressible repeated 
messages.

If you'd like to test something on my hardware setup, just let me 
know. I can 
try things or maybe I could even arrange remote access to the machine 
with 
Disco running and the cxusb dongle plugged in - and it doesn't have 
to be the 
old notebook, I could build something slightly more modern out of 
retired 
desktop hardware or some such.

I've noticed some patches from CrazyCat in the archive of this 
mailing list in 
2016-ish, but nothing since then... I can only speculate why he 
doesn't bother 
to post patches upstream anymore, and I do not want to fan any flames 
on this topic. My opinion is that this is sad, apparently he's doing 
a good job, his updates to cxusb and the related Silicon Image demod 
and tuner code appear to work and look elegant and to the point, in 
terms of coding style and structure.

If you've read this far, I'd like to thank you for your attention.

Frank Rysanek



--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  lspci.txt
     Date:  1 May 2019, 19:09
     Size:  3131 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="lspci.txt"; type=Unix-text
Content-disposition: attachment; filename="lspci.txt"
Content-transfer-encoding: BASE64

MDA6MDAuMCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gTW9iaWxlIFBNOTY1L0dN
OTY1L0dMOTYwIE1lbW9yeSBDb250cm9sbGVyIEh1YiAocmV2IDAzKQowMDowMi4wIFZHQSBj
b21wYXRpYmxlIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIE1vYmlsZSBHTTk2NS9H
TDk2MCBJbnRlZ3JhdGVkIEdyYXBoaWNzIENvbnRyb2xsZXIgKHByaW1hcnkpIChyZXYgMDMp
CjAwOjAyLjEgRGlzcGxheSBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiBNb2JpbGUg
R005NjUvR0w5NjAgSW50ZWdyYXRlZCBHcmFwaGljcyBDb250cm9sbGVyIChzZWNvbmRhcnkp
IChyZXYgMDMpCjAwOjFhLjAgVVNCIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIDgy
ODAxSCAoSUNIOCBGYW1pbHkpIFVTQiBVSENJIENvbnRyb2xsZXIgIzQgKHJldiAwMykKMDA6
MWEuMSBVU0IgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gODI4MDFIIChJQ0g4IEZh
bWlseSkgVVNCIFVIQ0kgQ29udHJvbGxlciAjNSAocmV2IDAzKQowMDoxYS43IFVTQiBjb250
cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUggKElDSDggRmFtaWx5KSBVU0IyIEVI
Q0kgQ29udHJvbGxlciAjMiAocmV2IDAzKQowMDoxYi4wIEF1ZGlvIGRldmljZTogSW50ZWwg
Q29ycG9yYXRpb24gODI4MDFIIChJQ0g4IEZhbWlseSkgSEQgQXVkaW8gQ29udHJvbGxlciAo
cmV2IDAzKQowMDoxYy4wIFBDSSBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSCAo
SUNIOCBGYW1pbHkpIFBDSSBFeHByZXNzIFBvcnQgMSAocmV2IDAzKQowMDoxYy4xIFBDSSBi
cmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSCAoSUNIOCBGYW1pbHkpIFBDSSBFeHBy
ZXNzIFBvcnQgMiAocmV2IDAzKQowMDoxYy4yIFBDSSBicmlkZ2U6IEludGVsIENvcnBvcmF0
aW9uIDgyODAxSCAoSUNIOCBGYW1pbHkpIFBDSSBFeHByZXNzIFBvcnQgMyAocmV2IDAzKQow
MDoxZC4wIFVTQiBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUggKElDSDgg
RmFtaWx5KSBVU0IgVUhDSSBDb250cm9sbGVyICMxIChyZXYgMDMpCjAwOjFkLjEgVVNCIGNv
bnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSCAoSUNIOCBGYW1pbHkpIFVTQiBV
SENJIENvbnRyb2xsZXIgIzIgKHJldiAwMykKMDA6MWQuMiBVU0IgY29udHJvbGxlcjogSW50
ZWwgQ29ycG9yYXRpb24gODI4MDFIIChJQ0g4IEZhbWlseSkgVVNCIFVIQ0kgQ29udHJvbGxl
ciAjMyAocmV2IDAzKQowMDoxZC43IFVTQiBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlv
biA4MjgwMUggKElDSDggRmFtaWx5KSBVU0IyIEVIQ0kgQ29udHJvbGxlciAjMSAocmV2IDAz
KQowMDoxZS4wIFBDSSBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxIE1vYmlsZSBQ
Q0kgQnJpZGdlIChyZXYgZjMpCjAwOjFmLjAgSVNBIGJyaWRnZTogSW50ZWwgQ29ycG9yYXRp
b24gODI4MDFITSAoSUNIOE0pIExQQyBJbnRlcmZhY2UgQ29udHJvbGxlciAocmV2IDAzKQow
MDoxZi4xIElERSBpbnRlcmZhY2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSE0vSEVNIChJ
Q0g4TS9JQ0g4TS1FKSBJREUgQ29udHJvbGxlciAocmV2IDAzKQowMDoxZi4yIFNBVEEgY29u
dHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gODI4MDFITS9IRU0gKElDSDhNL0lDSDhNLUUp
IFNBVEEgQ29udHJvbGxlciBbQUhDSSBtb2RlXSAocmV2IDAzKQowMDoxZi4zIFNNQnVzOiBJ
bnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUggKElDSDggRmFtaWx5KSBTTUJ1cyBDb250cm9sbGVy
IChyZXYgMDMpCjAyOjAwLjAgRXRoZXJuZXQgY29udHJvbGxlcjogQnJvYWRjb20gSW5jLiBh
bmQgc3Vic2lkaWFyaWVzIE5ldExpbmsgQkNNNTc4N00gR2lnYWJpdCBFdGhlcm5ldCBQQ0kg
RXhwcmVzcyAocmV2IDAyKQowNDowMC4wIE5ldHdvcmsgY29udHJvbGxlcjogQnJvYWRjb20g
SW5jLiBhbmQgc3Vic2lkaWFyaWVzIEJDTTQzMTEgODAyLjExYi9nIFdMQU4gKHJldiAwMSkK
MGY6MDYuMCBDYXJkQnVzIGJyaWRnZTogVGV4YXMgSW5zdHJ1bWVudHMgUENJeHgxMiBDYXJk
YnVzIENvbnRyb2xsZXIKMGY6MDYuMSBGaXJlV2lyZSAoSUVFRSAxMzk0KTogVGV4YXMgSW5z
dHJ1bWVudHMgUENJeHgxMiBPSENJIENvbXBsaWFudCBJRUVFIDEzOTQgSG9zdCBDb250cm9s
bGVyCjBmOjA2LjIgTWFzcyBzdG9yYWdlIGNvbnRyb2xsZXI6IFRleGFzIEluc3RydW1lbnRz
IFBDSXh4MTIgRmxhc2ggTWVkaWEgQ29udHJvbGxlcgowZjowNi4zIFNEIEhvc3QgY29udHJv
bGxlcjogVGV4YXMgSW5zdHJ1bWVudHMgUENJeHgxMiBTREEgU3RhbmRhcmQgQ29tcGxpYW50
IFNEIEhvc3QgQ29udHJvbGxlcgowMDowMC4wIDA2MDA6IDgwODY6MmEwMCAocmV2IDAzKQow
MDowMi4wIDAzMDA6IDgwODY6MmEwMiAocmV2IDAzKQowMDowMi4xIDAzODA6IDgwODY6MmEw
MyAocmV2IDAzKQowMDoxYS4wIDBjMDM6IDgwODY6MjgzNCAocmV2IDAzKQowMDoxYS4xIDBj
MDM6IDgwODY6MjgzNSAocmV2IDAzKQowMDoxYS43IDBjMDM6IDgwODY6MjgzYSAocmV2IDAz
KQowMDoxYi4wIDA0MDM6IDgwODY6Mjg0YiAocmV2IDAzKQowMDoxYy4wIDA2MDQ6IDgwODY6
MjgzZiAocmV2IDAzKQowMDoxYy4xIDA2MDQ6IDgwODY6Mjg0MSAocmV2IDAzKQowMDoxYy4y
IDA2MDQ6IDgwODY6Mjg0MyAocmV2IDAzKQowMDoxZC4wIDBjMDM6IDgwODY6MjgzMCAocmV2
IDAzKQowMDoxZC4xIDBjMDM6IDgwODY6MjgzMSAocmV2IDAzKQowMDoxZC4yIDBjMDM6IDgw
ODY6MjgzMiAocmV2IDAzKQowMDoxZC43IDBjMDM6IDgwODY6MjgzNiAocmV2IDAzKQowMDox
ZS4wIDA2MDQ6IDgwODY6MjQ0OCAocmV2IGYzKQowMDoxZi4wIDA2MDE6IDgwODY6MjgxNSAo
cmV2IDAzKQowMDoxZi4xIDAxMDE6IDgwODY6Mjg1MCAocmV2IDAzKQowMDoxZi4yIDAxMDY6
IDgwODY6MjgyOSAocmV2IDAzKQowMDoxZi4zIDBjMDU6IDgwODY6MjgzZSAocmV2IDAzKQow
MjowMC4wIDAyMDA6IDE0ZTQ6MTY5MyAocmV2IDAyKQowNDowMC4wIDAyODA6IDE0ZTQ6NDMx
MSAocmV2IDAxKQowZjowNi4wIDA2MDc6IDEwNGM6ODAzOQowZjowNi4xIDBjMDA6IDEwNGM6
ODAzYQowZjowNi4yIDAxODA6IDEwNGM6ODAzYgowZjowNi4zIDA4MDU6IDEwNGM6ODAzYwo=
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  lsusb.txt
     Date:  1 May 2019, 19:09
     Size:  509 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="lsusb.txt"; type=Unix-text
Content-disposition: attachment; filename="lsusb.txt"
Content-transfer-encoding: BASE64

QnVzIDAwMiBEZXZpY2UgMDA0OiBJRCAwNTcyOmM2OGEgQ29uZXhhbnQgU3lzdGVtcyAoUm9j
a3dlbGwpLCBJbmMuIApCdXMgMDAyIERldmljZSAwMDE6IElEIDFkNmI6MDAwMiBMaW51eCBG
b3VuZGF0aW9uIDIuMCByb290IGh1YgpCdXMgMDA3IERldmljZSAwMDE6IElEIDFkNmI6MDAw
MSBMaW51eCBGb3VuZGF0aW9uIDEuMSByb290IGh1YgpCdXMgMDA2IERldmljZSAwMDE6IElE
IDFkNmI6MDAwMSBMaW51eCBGb3VuZGF0aW9uIDEuMSByb290IGh1YgpCdXMgMDA1IERldmlj
ZSAwMDE6IElEIDFkNmI6MDAwMSBMaW51eCBGb3VuZGF0aW9uIDEuMSByb290IGh1YgpCdXMg
MDAxIERldmljZSAwMDE6IElEIDFkNmI6MDAwMiBMaW51eCBGb3VuZGF0aW9uIDIuMCByb290
IGh1YgpCdXMgMDA0IERldmljZSAwMDE6IElEIDFkNmI6MDAwMSBMaW51eCBGb3VuZGF0aW9u
IDEuMSByb290IGh1YgpCdXMgMDAzIERldmljZSAwMDE6IElEIDFkNmI6MDAwMSBMaW51eCBG
b3VuZGF0aW9uIDEuMSByb290IGh1Ygo=
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  vainfo.txt
     Date:  1 May 2019, 19:09
     Size:  405 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="vainfo.txt"; type=Unix-text
Content-disposition: attachment; filename="vainfo.txt"
Content-transfer-encoding: BASE64

cm9vdEBwbGVjaG92a2E6fiMgdmFpbmZvIApsaWJ2YSBpbmZvOiBWQS1BUEkgdmVyc2lvbiAx
LjQuMApsaWJ2YSBpbmZvOiB2YV9nZXREcml2ZXJOYW1lKCkgcmV0dXJucyAwCmxpYnZhIGlu
Zm86IFRyeWluZyB0byBvcGVuIC91c3IvbGliL3g4Nl82NC1saW51eC1nbnUvZHJpL2k5NjVf
ZHJ2X3ZpZGVvLnNvCmxpYnZhIGluZm86IEZvdW5kIGluaXQgZnVuY3Rpb24gX192YURyaXZl
ckluaXRfMV80CmxpYnZhIGVycm9yOiAvdXNyL2xpYi94ODZfNjQtbGludXgtZ251L2RyaS9p
OTY1X2Rydl92aWRlby5zbyBpbml0IGZhaWxlZApsaWJ2YSBpbmZvOiB2YV9vcGVuRHJpdmVy
KCkgcmV0dXJucyAtMQp2YUluaXRpYWxpemUgZmFpbGVkIHdpdGggZXJyb3IgY29kZSAtMSAo
dW5rbm93biBsaWJ2YSBlcnJvciksZXhpdAoK
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  vdr_vaapidevice_err-out.txt
     Date:  1 May 2019, 19:09
     Size:  86 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="vdr_vaapidevice_err-out.txt"; type=Unix-text
Content-disposition: attachment; filename="vdr_vaapidevice_err-out.txt"
Content-transfer-encoding: BASE64

cm9vdEBwbGVjaG92a2E6fiMgL3Vzci9sb2NhbC9iaW4vdmRyIC1QInZhYXBpZGV2aWNlIC10
IDB4RkZGRiIKQWJvcnRlZCAoY29yZSBkdW1wZWQpCgo=
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  vdr_vaapidevice_var-log-debug.log
     Date:  1 May 2019, 19:09
     Size:  2564 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="vdr_vaapidevice_var-log-debug.log"; type=Unix-text
Content-disposition: attachment; filename="vdr_vaapidevice_var-log-debug.log"
Content-transfer-encoding: BASE64

TWF5ICAxIDE3OjQxOjM3IHBsZWNob3ZrYSB2ZHI6IFszNTQyXSBmb3VuZCAyOCBsb2NhbGVz
IGluIC91c3IvbG9jYWwvc2hhcmUvbG9jYWxlCk1heSAgMSAxNzo0MTozOCBwbGVjaG92a2Eg
dmRyOiBbMzU0Ml0gcmVnaXN0ZXJlZCBzb3VyY2UgcGFyYW1ldGVycyBmb3IgJ0EgLSBBVFND
JwpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDNdIHZpZGVvIGRpcmVjdG9y
eSBzY2FubmVyIHRocmVhZCBzdGFydGVkIChwaWQ9MzU0MiwgdGlkPTM1NDMsIHByaW89bG93
KQpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDNdIHZpZGVvIGRpcmVjdG9y
eSBzY2FubmVyIHRocmVhZCBlbmRlZCAocGlkPTM1NDIsIHRpZD0zNTQzKQpNYXkgIDEgMTc6
NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDRdIGVwZyBkYXRhIHJlYWRlciB0aHJlYWQgc3Rh
cnRlZCAocGlkPTM1NDIsIHRpZD0zNTQ0LCBwcmlvPWhpZ2gpCk1heSAgMSAxNzo0MTozOCBw
bGVjaG92a2EgdmRyOiBbMzU0NF0gcmVhZGluZyBFUEcgZGF0YSBmcm9tIC92YXIvY2FjaGUv
dmRyL2VwZy5kYXRhCk1heSAgMSAxNzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gcmVn
aXN0ZXJlZCBzb3VyY2UgcGFyYW1ldGVycyBmb3IgJ0MgLSBEVkItQycKTWF5ICAxIDE3OjQx
OjM4IHBsZWNob3ZrYSB2ZHI6IFszNTQyXSByZWdpc3RlcmVkIHNvdXJjZSBwYXJhbWV0ZXJz
IGZvciAnUyAtIERWQi1TJwpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDJd
IHJlZ2lzdGVyZWQgc291cmNlIHBhcmFtZXRlcnMgZm9yICdUIC0gRFZCLVQnCk1heSAgMSAx
Nzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gcHJvYmluZyAvZGV2L2R2Yi9hZGFwdGVy
MC9mcm9udGVuZDAKTWF5ICAxIDE3OjQxOjM4IHBsZWNob3ZrYSB2ZHI6IFszNTQyXSBjcmVh
dGluZyBjRHZiRGV2aWNlCk1heSAgMSAxNzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0g
bmV3IGRldmljZSBudW1iZXIgMQpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1
NDJdIGNUaW1lTXM6IHVzaW5nIG1vbm90b25pYyBjbG9jayAocmVzb2x1dGlvbiBpcyAxIG5z
KQpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDJdIG5ldyBkZXZpY2UgbnVt
YmVyIDIKTWF5ICAxIDE3OjQxOjM4IHBsZWNob3ZrYSB2ZHI6IFszNTQyXSBWQUFQSTogTWFr
ZVByaW1hcnlEZXZpY2U6IDEKTWF5ICAxIDE3OjQxOjM4IHBsZWNob3ZrYSB2ZHI6IFszNTQy
XSBWQUFQSTogU2V0VmlkZW9Gb3JtYXQ6IDAKTWF5ICAxIDE3OjQxOjM4IHBsZWNob3ZrYSB2
ZHI6IFszNTQyXSBWQUFQSTogU2V0VmlkZW9EaXNwbGF5Rm9ybWF0OiAxCk1heSAgMSAxNzo0
MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gVkFBUEk6IEdldFNwdURlY29kZXI6Ck1heSAg
MSAxNzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gVkFBUEk6IFNldFZvbHVtZURldmlj
ZTogMjU1Ck1heSAgMSAxNzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gYXNzdW1pbmcg
bWFudWFsIHN0YXJ0IG9mIFZEUgpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1
NDddIGRldmljZSAxIHNlY3Rpb24gaGFuZGxlciB0aHJlYWQgc3RhcnRlZCAocGlkPTM1NDIs
IHRpZD0zNTQ3LCBwcmlvPWxvdykKTWF5ICAxIDE3OjQxOjM4IHBsZWNob3ZrYSB2ZHI6IFsz
NTQ2XSBmcm9udGVuZCAwLzAgdHVuZXIgdGhyZWFkIHN0YXJ0ZWQgKHBpZD0zNTQyLCB0aWQ9
MzU0NiwgcHJpbz1oaWdoKQpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDJd
IFZBQVBJOiB2aWRlbzogdmlzdWFsIDB4MjEgZGVwdGggMjQKTWF5ICAxIDE3OjQxOjM4IHBs
ZWNob3ZrYSB2ZHI6IFszNTQyXSBWQUFQSTogdmlkZW86IHdpbmRvdyBwcmVwYXJlZApNYXkg
IDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDJdIFZBQVBJOiB2aWRlbzogc2NyZWVu
IHNhdmVyIGV4dGVuc2lvbiBwcmVzZW50Ck1heSAgMSAxNzo0MTozOCBwbGVjaG92a2EgdmRy
OiBbMzU0Ml0gVkFBUEk6IHZpZGVvOiBkcG1zIGV4dGVuc2lvbiBwcmVzZW50Ck1heSAgMSAx
Nzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gVkFBUEk6IE9wZW5lZCBWQSBkaXNwbGF5
IHZpYSBYMTEgZGlzcGxheSAjMDMwLgpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjog
WzM1NDJdIFZBQVBJOiBsaWJ2YTogIzAzMApNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZk
cjogbWVzc2FnZSByZXBlYXRlZCA1IHRpbWVzOiBbIFszNTQyXSBWQUFQSTogbGlidmE6ICMw
MzBdCk1heSAgMSAxNzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gVkFBUEk6IEZhaWxl
ZCB0byBpbml0aWFsaXNlIFZBQVBJIGNvbm5lY3Rpb246IC0xODk5MDg2MjI0ICgobnVsbCkp
LgpNYXkgIDEgMTc6NDI6NDggcGxlY2hvdmthIHZkcjogWzM1NTVdIGVwZyBkYXRhIHdyaXRl
ciB0aHJlYWQgc3RhcnRlZCAocGlkPTcyNiwgdGlkPTM1NTUsIHByaW89bG93KQpNYXkgIDEg
MTc6NDI6NDggcGxlY2hvdmthIHZkcjogWzM1NTVdIGVwZyBkYXRhIHdyaXRlciB0aHJlYWQg
ZW5kZWQgKHBpZD03MjYsIHRpZD0zNTU1KQo=
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  vdr_vaapidevice_var-log-messages.log
     Date:  1 May 2019, 19:09
     Size:  2090 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="vdr_vaapidevice_var-log-messages.log"; type=Unix-text
Content-disposition: attachment; filename="vdr_vaapidevice_var-log-messages.log"
Content-transfer-encoding: BASE64

TWF5ICAxIDE3OjQxOjM3IHBsZWNob3ZrYSB2ZHI6IFszNTQyXSBWRFIgdmVyc2lvbiAyLjQu
MCBzdGFydGVkCk1heSAgMSAxNzo0MTozNyBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gY29kZXNl
dCBpcyAnVVRGLTgnIC0ga25vd24KTWF5ICAxIDE3OjQxOjM3IHBsZWNob3ZrYSB2ZHI6IFsz
NTQyXSBsb2FkaW5nIHBsdWdpbjogL3Vzci9sb2NhbC9saWIvdmRyL2xpYnZkci12YWFwaWRl
dmljZS5zby4yLjQuMApNYXkgIDEgMTc6NDE6MzcgcGxlY2hvdmthIHZkcjogWzM1NDJdIGxv
YWRpbmcgL3Zhci9saWIvdmRyL3NldHVwLmNvbmYKTWF5ICAxIDE3OjQxOjM3IHBsZWNob3Zr
YSB2ZHI6IFszNTQyXSBsb2FkaW5nIC92YXIvbGliL3Zkci9zb3VyY2VzLmNvbmYKTWF5ICAx
IDE3OjQxOjM3IHBsZWNob3ZrYSB2ZHI6IFszNTQyXSBsb2FkaW5nIC92YXIvbGliL3Zkci9k
aXNlcWMuY29uZgpNYXkgIDEgMTc6NDE6MzcgcGxlY2hvdmthIHZkcjogWzM1NDJdIGxvYWRp
bmcgL3Zhci9saWIvdmRyL3Njci5jb25mCk1heSAgMSAxNzo0MTozNyBwbGVjaG92a2EgdmRy
OiBbMzU0Ml0gbG9hZGluZyAvdmFyL2xpYi92ZHIvY2hhbm5lbHMuY29uZgpNYXkgIDEgMTc6
NDE6MzcgcGxlY2hvdmthIHZkcjogWzM1NDJdIGxvYWRpbmcgL3Zhci9saWIvdmRyL3RpbWVy
cy5jb25mCk1heSAgMSAxNzo0MTozNyBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gbG9hZGluZyAv
dmFyL2xpYi92ZHIvY29tbWFuZHMuY29uZgpNYXkgIDEgMTc6NDE6MzcgcGxlY2hvdmthIHZk
cjogWzM1NDJdIGxvYWRpbmcgL3Zhci9saWIvdmRyL3JlY2NtZHMuY29uZgpNYXkgIDEgMTc6
NDE6MzcgcGxlY2hvdmthIHZkcjogWzM1NDJdIGxvYWRpbmcgL3Zhci9saWIvdmRyL3N2ZHJw
aG9zdHMuY29uZgpNYXkgIDEgMTc6NDE6MzcgcGxlY2hvdmthIHZkcjogWzM1NDJdIGxvYWRp
bmcgL3Zhci9saWIvdmRyL2tleW1hY3Jvcy5jb25mCk1heSAgMSAxNzo0MTozNyBwbGVjaG92
a2EgdmRyOiBbMzU0Ml0gbG9hZGluZyAvdmFyL2xpYi92ZHIvY2FtcmVzcG9uc2VzLmNvbmYK
TWF5ICAxIDE3OjQxOjM4IHBsZWNob3ZrYSB2ZHI6IFszNTQyXSBEVkIgQVBJIHZlcnNpb24g
aXMgMHgwNTBCIChWRFIgd2FzIGJ1aWx0IHdpdGggMHgwNTBCKQpNYXkgIDEgMTc6NDE6Mzgg
cGxlY2hvdmthIHZkcjogWzM1NDJdIGZyb250ZW5kIDAvMCBwcm92aWRlcyBEVkItVCxEVkIt
VDIsRFZCLUMsRFZCLUMgd2l0aCBRUFNLLFFBTTE2LFFBTTMyLFFBTTY0LFFBTTEyOCxRQU0y
NTYgKCJTaWxpY29uIExhYnMgU2kyMTY4IikKTWF5ICAxIDE3OjQxOjM4IHBsZWNob3ZrYSB2
ZHI6IFszNTQyXSBmb3VuZCAxIERWQiBkZXZpY2UKTWF5ICAxIDE3OjQxOjM4IHBsZWNob3Zr
YSB2ZHI6IFszNTQyXSBpbml0aWFsaXppbmcgcGx1Z2luOiB2YWFwaWRldmljZSAoMS4wLjAt
R0lUYTE3YzExMCk6IFZBLUFQSSBPdXRwdXQgRGV2aWNlCk1heSAgMSAxNzo0MTozOCBwbGVj
aG92a2EgdmRyOiBbMzU0Ml0gc2V0dGluZyBwcmltYXJ5IGRldmljZSB0byAyCk1heSAgMSAx
Nzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gc2V0dGluZyBjdXJyZW50IHNraW4gdG8g
ImxjYXJzIgpNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDJdIGxvYWRpbmcg
L3Zhci9saWIvdmRyL3RoZW1lcy9sY2Fycy1kZWZhdWx0LnRoZW1lCk1heSAgMSAxNzo0MToz
OCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gc3RhcnRpbmcgcGx1Z2luOiB2YWFwaWRldmljZQpN
YXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjogWzM1NDJdIFZBQVBJOiBhdWRpbzogJ25v
b3AnIG91dHB1dCBtb2R1bGUgdXNlZApNYXkgIDEgMTc6NDE6MzggcGxlY2hvdmthIHZkcjog
WzM1NDJdIFZBQVBJOiBhdWRpbzogIDQ0MTAwSHogc3VwcG9ydHMgMCAwIDAgMCAwIDAgMCAw
IGNoYW5uZWxzCk1heSAgMSAxNzo0MTozOCBwbGVjaG92a2EgdmRyOiBbMzU0Ml0gVkFBUEk6
IGF1ZGlvOiAgNDgwMDBIeiBzdXBwb3J0cyAwIDAgMCAwIDAgMCAwIDAgY2hhbm5lbHMKTWF5
ICAxIDE3OjQxOjM4IHBsZWNob3ZrYSB2ZHI6IFszNTQyXSBWQUFQSTogYXVkaW86IDE5MjAw
MEh6IHN1cHBvcnRzIDAgMCAwIDAgMCAwIDAgMCBjaGFubmVscwo=
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  vdr_xine_err-out.txt
     Date:  1 May 2019, 19:09
     Size:  8801 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="vdr_xine_err-out.txt"; type=Unix-text
Content-disposition: attachment; filename="vdr_xine_err-out.txt"
Content-transfer-encoding: BASE64

IyB2ZHIgLS1wbHVnaW49InhpbmUgLXIiCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpN
YWtlUHJpbWFyeURldmljZTogMQo9PT09PT09PT09PT09PT09PT09PT09PT09ClNldFZpZGVv
Rm9ybWF0OiAwClNldFZvbHVtZURldmljZTogMjU1CmZyYW1lOiAoMCwgMCktKC0xLCAtMSks
IHpvb206ICgxLjAwLCAxLjAwKQpTZXRBdWRpb0NoYW5uZWxEZXZpY2U6IDAKU2V0Vm9sdW1l
RGV2aWNlOiAyNTUKU2V0UGxheU1vZGU6IDEKU2V0RGlnaXRhbEF1ZGlvRGV2aWNlOiAwClNl
dFBsYXlNb2RlOiAwCmZyYW1lOiAoMCwgMCktKC0xLCAtMSksIHpvb206ICgxLjAwLCAxLjAw
KQpTZXRQbGF5TW9kZTogMQpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKW0FNXQpU
UyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioq
KioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQg
KioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNj
cmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioK
VFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioq
KioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVk
ICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBz
Y3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioq
ClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioq
KioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxl
ZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMg
c2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioq
KgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioq
KioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJs
ZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlz
IHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioq
KioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioq
KioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1i
bGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBp
cyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioq
KioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioq
KioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFt
YmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMg
aXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioq
KioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoq
KioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3Jh
bWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRT
IGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioq
KioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAq
KioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2Ny
YW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpU
UyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioq
KioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQg
KioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNj
cmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioK
VFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioq
KioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVk
ICoqKioqKioqKioqKioqCnZkci14aW5lOiBDbGllbnQgY29ubmVjdGluZyAuLi4KdmRyLXhp
bmU6IENsaWVudCBjb25uZWN0ZWQhClt2XQpEaXNjb250aW51aXR5RGV0ZWN0ZWQ6IHRyaWdn
ZXJpbmcgc29mdCBzdGFydApbdlZNXWJ1ZmZlcmVkIDguNSBmcmFtZXMgKHY6OC41LCBhOjAu
MCkKQWJ1ZmZlcmVkIDExLjMgZnJhbWVzICh2OjI0LjUsIGE6MTEuMykKVFMgaXMgc2NyYW1i
bGVkICoqKioqKioqKioqKioqCmJ1ZmZlcmVkIDEzLjAgZnJhbWVzICh2OjI1LjUsIGE6MTMu
MCkKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioq
KioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1i
bGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBp
cyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioq
KioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioq
KioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFt
YmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMg
aXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqCk1UUyBpcyBzY3JhbWJsZWQgKioqKioqKioq
KioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAq
KioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2Ny
YW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpU
UyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioq
KioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQg
KioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqCmJ1ZmZlcmVk
IDE1LjAgZnJhbWVzICh2OjE1LjAsIGE6MTkuMSkKVFMgaXMgc2NyYW1ibGVkICoqKioqKioq
KioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQg
KioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNj
cmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioK
VFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqCmJ1ZmZlcmVkIDIzLjUgZnJhbWVzICh2
OjM5LjcsIGE6MjMuNSkKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNj
cmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioK
VFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioq
KioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVk
ICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBz
Y3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioq
ClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioq
KioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxl
ZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMg
c2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioq
KgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioq
KioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJs
ZWQgKioqKioqKioqKioqKioKcmVzZXRpbmcgUEVTX3NjcmFtYmxpbmdfY29udHJvbDogMHg5
NQpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioq
KioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJs
ZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlz
IHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpidWZmZXJlZCAyNS43IGZyYW1lcyAodjo0MC4w
LCBhOjI1LjcpClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJs
ZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqCmJ1ZmZl
cmVkIDMyLjEgZnJhbWVzICh2OjQ5LjcsIGE6MzIuMSkKVFMgaXMgc2NyYW1ibGVkICoqKioq
KioqKioqKioqCmZyYW1lOiAoMCwgMCktKDcyMCwgNTc2KSwgem9vbTogKDEuMDAsIDEuMDAp
ClNldFBsYXlNb2RlOiAwClNldFBsYXlNb2RlOiAxClNldFBsYXlNb2RlOiAwClNldFBsYXlN
b2RlOiAxCltBTV0KRGlzY29udGludWl0eURldGVjdGVkOiB0cmlnZ2VyaW5nIHNvZnQgc3Rh
cnQKW0FNXWJ1ZmZlcmVkIDMzLjQgZnJhbWVzICh2OjAuMCwgYTozMy40KQpmcmFtZTogKDAs
IDApLSg3MjAsIDU3NiksIHpvb206ICgxLjAwLCAxLjAwKQpTZXRQbGF5TW9kZTogMApTZXRQ
bGF5TW9kZTogMQpbQU1dClNldFBsYXlNb2RlOiAwClNldFBsYXlNb2RlOiAxCltBTV0KRGlz
Y29udGludWl0eURldGVjdGVkOiB0cmlnZ2VyaW5nIHNvZnQgc3RhcnQKW2FBTV1idWZmZXJl
ZCAxMS4yIGZyYW1lcyAodjowLjAsIGE6MTEuMikKZnJhbWU6ICgwLCAwKS0oNzIwLCA1NzYp
LCB6b29tOiAoMS4wMCwgMS4wMCkKU2V0UGxheU1vZGU6IDAKU2V0UGxheU1vZGU6IDEKW0FN
XQpEaXNjb250aW51aXR5RGV0ZWN0ZWQ6IHRyaWdnZXJpbmcgc29mdCBzdGFydApbQU1dYnVm
ZmVyZWQgMTMuMSBmcmFtZXMgKHY6MC4wLCBhOjEzLjEpCmZyYW1lOiAoMCwgMCktKDcyMCwg
NTc2KSwgem9vbTogKDEuMDAsIDEuMDApClNldFBsYXlNb2RlOiAwClNldFBsYXlNb2RlOiAx
CltBTV0KRGlzY29udGludWl0eURldGVjdGVkOiB0cmlnZ2VyaW5nIHNvZnQgc3RhcnQKW2FB
TV1idWZmZXJlZCAyMC4yIGZyYW1lcyAodjowLjAsIGE6MjAuMikKZnJhbWU6ICgwLCAwKS0o
NzIwLCA1NzYpLCB6b29tOiAoMS4wMCwgMS4wMCkKU2V0UGxheU1vZGU6IDAKU2V0UGxheU1v
ZGU6IDEKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqCltBTV0KVFMgaXMgc2NyYW1i
bGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpmcmFt
ZTogKDAsIDApLSg3MjAsIDU3NiksIHpvb206ICgxLjAwLCAxLjAwKQpTZXRQbGF5TW9kZTog
MApTZXRQbGF5TW9kZTogMQpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMg
c2NyYW1ibGVkICoqKioqKioqKioqKioqCltBTV0KVFMgaXMgc2NyYW1ibGVkICoqKioqKioq
KioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQg
KioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNj
cmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioK
VFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioq
KioqKioqKgpmcmFtZTogKDAsIDApLSg3MjAsIDU3NiksIHpvb206ICgxLjAwLCAxLjAwKQpU
UyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKU2V0UGxheU1vZGU6IDAKU2V0UGxheU1v
ZGU6IDEKW0FNXQpEaXNjb250aW51aXR5RGV0ZWN0ZWQ6IHRyaWdnZXJpbmcgc29mdCBzdGFy
dApbYUFNXWJ1ZmZlcmVkIDguMCBmcmFtZXMgKHY6MC4wLCBhOjguMCkKdlZidWZmZXJlZCAx
Ni4xIGZyYW1lcyAodjoyMy45LCBhOjE2LjEpClNldFBsYXlNb2RlOiAwClNldFBsYXlNb2Rl
OiAxClNldFBsYXlNb2RlOiAwCmZyYW1lOiAoMCwgMCktKDcyMCwgNTc2KSwgem9vbTogKDEu
MDAsIDEuMDApClNldFBsYXlNb2RlOiAxCltBTV0KRGlzY29udGludWl0eURldGVjdGVkOiB0
cmlnZ2VyaW5nIHNvZnQgc3RhcnQKW3ZBVk1dYnVmZmVyZWQgOC4wIGZyYW1lcyAodjoxNC4y
LCBhOjguMCkKYnVmZmVyZWQgNS42IGZyYW1lcyAodjoxMS44LCBhOjUuNikgPDw8PDwKU2V0
UGxheU1vZGU6IDAKZnJhbWU6ICgwLCAwKS0oNzIwLCA1NzYpLCB6b29tOiAoMS4wMCwgMS4w
MCkKU2V0UGxheU1vZGU6IDEKW0FNXQpEaXNjb250aW51aXR5RGV0ZWN0ZWQ6IHRyaWdnZXJp
bmcgc29mdCBzdGFydApbYUFNXWJ1ZmZlcmVkIDguMSBmcmFtZXMgKHY6MC4wLCBhOjguMSkK
dlZidWZmZXJlZCA5LjkgZnJhbWVzICh2OjE2LjEsIGE6OS45KQpidWZmZXJlZCA5LjEgZnJh
bWVzICh2OjE1LjUsIGE6OS4xKSA8PDw8PApmcmFtZTogKDAsIDApLSg3MjAsIDU3NiksIHpv
b206ICgxLjAwLCAxLjAwKQpTZXRQbGF5TW9kZTogMApTZXRQbGF5TW9kZTogMQpmcmFtZTog
KDAsIDApLSg3MjAsIDU3NiksIHpvb206ICgxLjAwLCAxLjAwKQpTZXRQbGF5TW9kZTogMApT
ZXRQbGF5TW9kZTogMQpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKW0FNXQpUUyBp
cyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioq
KioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioq
KioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFt
YmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMg
aXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioq
KioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoq
KioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3Jh
bWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRT
IGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioq
KioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqCkRpc2NvbnRpbnVpdHlEZXRl
Y3RlZDogdHJpZ2dlcmluZyBzb2Z0IHN0YXJ0ClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioq
KioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoq
KioqKioqKioqKioqCltBTV1idWZmZXJlZCAzMC4yIGZyYW1lcyAodjowLjAsIGE6MzAuMikK
VFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioq
KioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVk
ICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBz
Y3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioq
ClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioq
KioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxl
ZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMg
c2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioq
KgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioq
KioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJs
ZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlz
IHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioq
KioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioq
KioqKioqKioqKgpUUyBpcyBzY3JhbWJsZWQgKioqKioqKioqKioqKioKVFMgaXMgc2NyYW1i
bGVkICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpidWZm
ZXJlZCAyMy44IGZyYW1lcyAodjowLjAsIGE6MjMuOCkgPDw8PDwKVFMgaXMgc2NyYW1ibGVk
ICoqKioqKioqKioqKioqClRTIGlzIHNjcmFtYmxlZCAqKioqKioqKioqKioqKgpmcmFtZTog
KDAsIDApLSg3MjAsIDU3NiksIHpvb206ICgxLjAwLCAxLjAwKQpUUyBpcyBzY3JhbWJsZWQg
KioqKioqKioqKioqKioKVFMgaXMgc2NyYW1ibGVkICoqKioqKioqKioqKioqClNldFBsYXlN
b2RlOiAwClNldFBsYXlNb2RlOiAxCnJlYWQoNCkgcmV0dXJuZWQgMCwgZXJyb3IgMDogU3Vj
Y2Vzcwp2ZHIteGluZTogQ2xpZW50IGRpc2Nvbm5lY3RlZCEKU2V0UGxheU1vZGU6IDAKCgo=
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  w_scan__err-out.txt
     Date:  1 May 2019, 19:09
     Size:  23842 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="w_scan__err-out.txt"; type=Unix-text
Content-disposition: attachment; filename="w_scan__err-out.txt"
Content-transfer-encoding: BASE64

d19zY2FuIC1jIENaIAp3X3NjYW4gdmVyc2lvbiAyMDE3MDEwNyAoY29tcGlsZWQgZm9yIERW
QiBBUEkgNS4xMCkKdXNpbmcgc2V0dGluZ3MgZm9yIENaRUNIIFJFUFVCTElDCkRWQiBhZXJp
YWwKRFZCLVQgRXVyb3BlCnNjYW4gdHlwZSBURVJSRVNUUklBTCwgY2hhbm5lbGxpc3QgNApv
dXRwdXQgZm9ybWF0IHZkci0yLjAKV0FSTklORzogY291bGQgbm90IGd1ZXNzIHlvdXIgY29k
ZXBhZ2UuIEZhbGxpbmcgYmFjayB0byAnVVRGLTgnCm91dHB1dCBjaGFyc2V0ICdVVEYtOCcs
IHVzZSAtQyA8Y2hhcnNldD4gdG8gb3ZlcnJpZGUKSW5mbzogdXNpbmcgRFZCIGFkYXB0ZXIg
YXV0byBkZXRlY3Rpb24uCgkvZGV2L2R2Yi9hZGFwdGVyMC9mcm9udGVuZDAgLT4gVEVSUkVT
VFJJQUwgIlNpbGljb24gTGFicyBTaTIxNjgiOiB2ZXJ5IGdvb2QgOi0pKQoKVXNpbmcgVEVS
UkVTVFJJQUwgZnJvbnRlbmQgKGFkYXB0ZXIgL2Rldi9kdmIvYWRhcHRlcjAvZnJvbnRlbmQw
KQotXy1fLV8tXyBHZXR0aW5nIGZyb250ZW5kIGNhcGFiaWxpdGllcy1fLV8tXy1fIApVc2lu
ZyBEVkIgQVBJIDUuMTEKZnJvbnRlbmQgJ1NpbGljb24gTGFicyBTaTIxNjgnIHN1cHBvcnRz
CkRWQi1UMgpJTlZFUlNJT05fQVVUTwpRQU1fQVVUTwpUUkFOU01JU1NJT05fTU9ERV9BVVRP
CkdVQVJEX0lOVEVSVkFMX0FVVE8KSElFUkFSQ0hZX0FVVE8KRkVDX0FVVE8KQkFORFdJRFRI
X0FVVE8gbm90IHN1cHBvcnRlZCwgdHJ5aW5nIDYvNy84IE1Iei4KRlJFUSAoNDIuMDBNSHog
Li4uIDg3MC4wME1IeikKLV8tXy1fLV8tXy1fLV8tXy1fLV8tXy1fLV8tXy1fLV8tXy1fLV8t
Xy1fLV8tXyAKU2Nhbm5pbmcgRFZCLVQuLi4KU2Nhbm5pbmcgOE1IeiBmcmVxdWVuY2llcy4u
Lgo0NzQwMDA6ICh0aW1lOiAwMDowMi4yNDgpICAgICAgICAgc2lnbmFsIG9rOglRQU1fQVVU
TyBmID0gNDc0MDAwIGtIeiBJOTk5QjhDOTk5RDk5OVQ5OTlHOTk5WTk5OSAoMDowOjApCiAg
ICAgICAgSW5mbzogbm8gZGF0YSBmcm9tIFBBVCBhZnRlciAyIHNlY29uZHMKICAgICAgICBk
ZWxldGluZyAoUUFNX0FVVE8gZiA9IDQ3NDAwMCBrSHogSTk5OUI4Qzk5OUQ5OTlUOTk5Rzk5
OVk5OTkgKDA6MDowKSkKNDgyMDAwOiAodGltZTogMDA6MDUuNTQ4KSAKNDkwMDAwOiAodGlt
ZTogMDA6MDcuNTY0KSAKNDk4MDAwOiAodGltZTogMDA6MDkuNTgwKSAKNTA2MDAwOiAodGlt
ZTogMDA6MTEuNTk2KSAKNTE0MDAwOiAodGltZTogMDA6MTMuNjEyKSAKNTIyMDAwOiAodGlt
ZTogMDA6MTUuNjI4KSAKNTMwMDAwOiAodGltZTogMDA6MTcuNjUyKSAKNTM4MDAwOiAodGlt
ZTogMDA6MTkuNjY4KSAKNTQ2MDAwOiAodGltZTogMDA6MjEuNzA4KSAgICAgICAgIHNpZ25h
bCBvazoJUUFNX0FVVE8gZiA9IDU0NjAwMCBrSHogSTk5OUI4Qzk5OUQ5OTlUOTk5Rzk5OVk5
OTkgKDA6MDowKQogICAgICAgIFFBTV9BVVRPIGYgPSA1NDYwMDAga0h6IEk5OTlCOEM5OTlE
OTk5VDk5OUc5OTlZOTk5ICgwOjA6MCkgOiB1cGRhdGluZyB0cmFuc3BvcnRfc3RyZWFtX2lk
OiAtPiAoMDowOjEwMzApCiAgICAgICAgUUFNX0FVVE8gZiA9IDU0NjAwMCBrSHogSTk5OUI4
Qzk5OUQ5OTlUOTk5Rzk5OVk5OTkgKDA6MDoxMDMwKSA6IHVwZGF0aW5nIG5ldHdvcmtfaWQg
LT4gKDA6MTI1NTE6MTAzMCkKICAgICAgICBhbHJlYWR5IGtub3duOiAoUUFNX0FVVE8gZiA9
IDU0NjAwMCBrSHogSTk5OUI4Qzk5OUQ5OTlUOTk5Rzk5OVk5OTkgKDA6MTI1NTE6MTAzMCkp
LCBidXQgbm90IGZvdW5kIGJ5IHBpZHMKICAgICAgICBRQU1fQVVUTyBmID0gNTQ2MDAwIGtI
eiBJOTk5QjhDOTk5RDk5OVQ5OTlHOTk5WTk5OSAoMDoxMjU1MToxMDMwKSA6IHVwZGF0aW5n
IHRwIGlkcyAtPiAoODM5NToxMjU1MToxMDQzKQogICAgICAgIHVwZGF0aW5nIHRyYW5zcG9u
ZGVyOgogICAgICAgICAgIChRQU1fQVVUTyBmID0gNTQ2MDAwIGtIeiBJOTk5QjhDOTk5RDk5
OVQ5OTlHOTk5WTk5OSAoODM5NToxMjU1MToxMDQzKSkgMHgwMDAwCiAgICAgICAgdG8gKFFB
TV82NCAgIGYgPSA2NDIwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEw
NDMpKSAweDQwNUEKICAgICAgICBhbHJlYWR5IGtub3duOiAoUUFNXzY0ICAgZiA9IDY0MjAw
MCBrSHogSTk5OUI4QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTA0MykpLCBidXQgbm90IGZv
dW5kIGJ5IHBpZHMKICAgICAgICBRQU1fNjQgICBmID0gNjQyMDAwIGtIeiBJOTk5QjhDMzRE
MFQ4RzhZMCAoODM5NToxMjU1MToxMDQzKSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAoODM5NTox
MjU1MToxMDI1KQogICAgICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0gNjQyMDAw
IGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5NToxMjU1MToxMDI1KSksIGJ1dCBub3QgZm91
bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA2NDIwMDAga0h6IEk5OTlCOEMzNEQw
VDhHOFkwICg4Mzk1OjEyNTUxOjEwMjUpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEy
NTUxOjEwMjYpCiAgICAgICAgdXBkYXRpbmcgdHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFB
TV82NCAgIGYgPSA2NDIwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEw
MjYpKSAweDQwNUEKICAgICAgICB0byAoUUFNXzY0ICAgZiA9IDY1ODAwMCBrSHogSTk5OUI4
QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTAyNikpIDB4NDA1QQogICAgICAgIGFscmVhZHkg
a25vd246IChRQU1fNjQgICBmID0gNjU4MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5
NToxMjU1MToxMDI2KSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAg
IGYgPSA2NTgwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwMjYpIDog
dXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNTUxOjEwMjcpCiAgICAgICAgdXBkYXRpbmcg
dHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFBTV82NCAgIGYgPSA2NTgwMDAga0h6IEk5OTlC
OEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwMjcpKSAweDQwNUEKICAgICAgICB0byAoUUFN
XzY0ICAgZiA9IDUwNjAwMCBrSHogSTk5OUI4QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTAy
NykpIDB4NDA1QQogICAgICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0gNTA2MDAw
IGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5NToxMjU1MToxMDI3KSksIGJ1dCBub3QgZm91
bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA1MDYwMDAga0h6IEk5OTlCOEMzNEQw
VDhHOFkwICg4Mzk1OjEyNTUxOjEwMjcpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEy
NTUxOjEwMjgpCiAgICAgICAgdXBkYXRpbmcgdHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFB
TV82NCAgIGYgPSA1MDYwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEw
MjgpKSAweDQwNUEKICAgICAgICB0byAoUUFNXzY0ICAgZiA9IDc1NDAwMCBrSHogSTk5OUI4
QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTAyOCkpIDB4NDA1QQogICAgICAgIGFscmVhZHkg
a25vd246IChRQU1fNjQgICBmID0gNzU0MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5
NToxMjU1MToxMDI4KSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAg
IGYgPSA3NTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwMjgpIDog
dXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNTUxOjEwMjkpCiAgICAgICAgdXBkYXRpbmcg
dHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFBTV82NCAgIGYgPSA3NTQwMDAga0h6IEk5OTlC
OEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwMjkpKSAweDQwNUEKICAgICAgICB0byAoUUFN
XzY0ICAgZiA9IDY2NjAwMCBrSHogSTk5OUI4QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTAy
OSkpIDB4NDA1QQogICAgICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0gNjY2MDAw
IGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5NToxMjU1MToxMDI5KSksIGJ1dCBub3QgZm91
bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA2NjYwMDAga0h6IEk5OTlCOEMzNEQw
VDhHOFkwICg4Mzk1OjEyNTUxOjEwMjkpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEy
NTUxOjEwMzApCiAgICAgICAgdXBkYXRpbmcgdHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFB
TV82NCAgIGYgPSA2NjYwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEw
MzApKSAweDQwNUEKICAgICAgICB0byAoUUFNXzY0ICAgZiA9IDU0NjAwMCBrSHogSTk5OUI4
QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTAzMCkpIDB4NDA1QQogICAgICAgIGFscmVhZHkg
a25vd246IChRQU1fNjQgICBmID0gNTQ2MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5
NToxMjU1MToxMDMwKSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAg
IGYgPSA1NDYwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwMzApIDog
dXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNTUxOjEwMzEpCiAgICAgICAgdXBkYXRpbmcg
dHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFBTV82NCAgIGYgPSA1NDYwMDAga0h6IEk5OTlC
OEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwMzEpKSAweDQwNUEKICAgICAgICB0byAoUUFN
XzY0ICAgZiA9IDUwNjAwMCBrSHogSTk5OUI4QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTAz
MSkpIDB4NDA1QQogICAgICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0gNTA2MDAw
IGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5NToxMjU1MToxMDMxKSksIGJ1dCBub3QgZm91
bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA1MDYwMDAga0h6IEk5OTlCOEMzNEQw
VDhHOFkwICg4Mzk1OjEyNTUxOjEwMzEpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEy
NTUxOjEwMzIpCiAgICAgICAgdXBkYXRpbmcgdHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFB
TV82NCAgIGYgPSA1MDYwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEw
MzIpKSAweDQwNUEKICAgICAgICB0byAoUUFNXzY0ICAgZiA9IDY2NjAwMCBrSHogSTk5OUI4
QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTAzMikpIDB4NDA1QQogICAgICAgIGFscmVhZHkg
a25vd246IChRQU1fNjQgICBmID0gNjY2MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5
NToxMjU1MToxMDMyKSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAg
IGYgPSA2NjYwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwMzIpIDog
dXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNTUxOjEwMzMpCiAgICAgICAgdXBkYXRpbmcg
dHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFBTV82NCAgIGYgPSA2NjYwMDAga0h6IEk5OTlC
OEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwMzMpKSAweDQwNUEKICAgICAgICB0byAoUUFN
XzY0ICAgZiA9IDY0MjAwMCBrSHogSTk5OUI4QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTAz
MykpIDB4NDA1QQogICAgICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0gNjQyMDAw
IGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5NToxMjU1MToxMDMzKSksIGJ1dCBub3QgZm91
bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA2NDIwMDAga0h6IEk5OTlCOEMzNEQw
VDhHOFkwICg4Mzk1OjEyNTUxOjEwMzMpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEy
NTUxOjEwNDApCiAgICAgICAgdXBkYXRpbmcgdHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFB
TV82NCAgIGYgPSA2NDIwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEw
NDApKSAweDQwNUEKICAgICAgICB0byAoUUFNXzY0ICAgZiA9IDY3NDAwMCBrSHogSTk5OUI4
QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTA0MCkpIDB4NDA1QQogICAgICAgIGFscmVhZHkg
a25vd246IChRQU1fNjQgICBmID0gNjc0MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5
NToxMjU1MToxMDQwKSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAg
IGYgPSA2NzQwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwNDApIDog
dXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNTUxOjEwNDEpCiAgICAgICAgdXBkYXRpbmcg
dHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFBTV82NCAgIGYgPSA2NzQwMDAga0h6IEk5OTlC
OEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEwNDEpKSAweDQwNUEKICAgICAgICB0byAoUUFN
XzY0ICAgZiA9IDY1ODAwMCBrSHogSTk5OUI4QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTA0
MSkpIDB4NDA1QQogICAgICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0gNjU4MDAw
IGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5NToxMjU1MToxMDQxKSksIGJ1dCBub3QgZm91
bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA2NTgwMDAga0h6IEk5OTlCOEMzNEQw
VDhHOFkwICg4Mzk1OjEyNTUxOjEwNDEpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEy
NTUxOjEwNDIpCiAgICAgICAgdXBkYXRpbmcgdHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFB
TV82NCAgIGYgPSA2NTgwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTUxOjEw
NDIpKSAweDQwNUEKICAgICAgICB0byAoUUFNXzY0ICAgZiA9IDgxMDAwMCBrSHogSTk5OUI4
QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTA0MikpIDB4NDA1QQo1NTQwMDA6ICh0aW1lOiAw
MDozMS4wNzYpIAo1NjIwMDA6ICh0aW1lOiAwMDozMy4xMDQpIAo1NzAwMDA6ICh0aW1lOiAw
MDozNS4xMjgpICAgICAgICAgc2lnbmFsIG9rOglRQU1fQVVUTyBmID0gNTcwMDAwIGtIeiBJ
OTk5QjhDOTk5RDk5OVQ5OTlHOTk5WTk5OSAoMDowOjApCiAgICAgICAgUUFNX0FVVE8gZiA9
IDU3MDAwMCBrSHogSTk5OUI4Qzk5OUQ5OTlUOTk5Rzk5OVk5OTkgKDA6MDowKSA6IHVwZGF0
aW5nIHRyYW5zcG9ydF9zdHJlYW1faWQ6IC0+ICgwOjA6MjczKQogICAgICAgIFFBTV9BVVRP
IGYgPSA1NzAwMDAga0h6IEk5OTlCOEM5OTlEOTk5VDk5OUc5OTlZOTk5ICgwOjA6MjczKSA6
IHVwZGF0aW5nIG5ldHdvcmtfaWQgLT4gKDA6MTI1NjA6MjczKQogICAgICAgIHVwZGF0aW5n
IHRyYW5zcG9uZGVyOgogICAgICAgICAgIChRQU1fQVVUTyBmID0gNTcwMDAwIGtIeiBJOTk5
QjhDOTk5RDk5OVQ5OTlHOTk5WTk5OSAoMDoxMjU2MDoyNzMpKSAweDAwMDAKICAgICAgICB0
byAoUUFNXzY0ICAgZiA9IDU3MDAwMCBrSHogSTk5OUI4QzIzRDBUOEc0WTAgKDgzOTU6MTI1
NjA6MjczKSkgMHg0MDVBCjU3ODAwMDogKHRpbWU6IDAwOjQxLjc2NCkgCjU4NjAwMDogKHRp
bWU6IDAwOjQ2LjM5NikgCjU5NDAwMDogKHRpbWU6IDAwOjUxLjA4NCkgCjYwMjAwMDogKHRp
bWU6IDAwOjUzLjEwMCkgCjYxMDAwMDogKHRpbWU6IDAwOjU1LjEyMCkgCjYxODAwMDogKHRp
bWU6IDAwOjU3LjE0NCkgCjYyNjAwMDogKHRpbWU6IDAwOjU5LjE2NCkgCjYzNDAwMDogKHRp
bWU6IDAxOjAxLjIwMCkgCjY0MjAwMDogKHRpbWU6IDAxOjAzLjIyNCkgCjY1MDAwMDogKHRp
bWU6IDAxOjA1LjI2NCkgCjY1ODAwMDogKHRpbWU6IDAxOjA3LjI2NCkgCjY2NjAwMDogKHRp
bWU6IDAxOjA5LjMwMCkgCjY3NDAwMDogKHRpbWU6IDAxOjExLjM2MCkgCjY4MjAwMDogKHRp
bWU6IDAxOjEzLjM3NikgCjY5MDAwMDogKHRpbWU6IDAxOjE1LjM5NikgCjY5ODAwMDogKHRp
bWU6IDAxOjE3LjQyNCkgCjcwNjAwMDogKHRpbWU6IDAxOjE5LjQ0NCkgCjcxNDAwMDogKHRp
bWU6IDAxOjIxLjQ4OCkgICAgICAgICBzaWduYWwgb2s6CVFBTV9BVVRPIGYgPSA3MTQwMDAg
a0h6IEk5OTlCOEM5OTlEOTk5VDk5OUc5OTlZOTk5ICgwOjA6MCkKICAgICAgICBRQU1fQVVU
TyBmID0gNzE0MDAwIGtIeiBJOTk5QjhDOTk5RDk5OVQ5OTlHOTk5WTk5OSAoMDowOjApIDog
dXBkYXRpbmcgdHJhbnNwb3J0X3N0cmVhbV9pZDogLT4gKDA6MDozMDgxKQogICAgICAgIFFB
TV9BVVRPIGYgPSA3MTQwMDAga0h6IEk5OTlCOEM5OTlEOTk5VDk5OUc5OTlZOTk5ICgwOjA6
MzA4MSkgOiB1cGRhdGluZyBuZXR3b3JrX2lkIC0+ICgwOjEyNTY4OjMwODEpCiAgICAgICAg
bmV3IHRyYW5zcG9uZGVyOiAoUVBTSyAgICAgZiA9ICAgICAgMCBrSHogSTBCOTk5QzBEMFQy
RzMyWTAgKDgzOTU6MTI1Njg6MjUwMCkpIDB4NDAwMAogICAgICAgIG5ldyB0cmFuc3BvbmRl
cjogKFFQU0sgICAgIGYgPSAgICAgIDAga0h6IEk5OTlCOEMxMkQwVDJHMzJZMCAoODM5NTox
MjU2ODozMDAwKSkgMHg0MDVBCiAgICAgICAgbmV3IHRyYW5zcG9uZGVyOiAoUUFNXzY0ICAg
ZiA9IDcwNjAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwNzMpKSAw
eDQwNUEKICAgICAgICBhbHJlYWR5IGtub3duOiAoUUFNX0FVVE8gZiA9IDcxNDAwMCBrSHog
STk5OUI4Qzk5OUQ5OTlUOTk5Rzk5OVk5OTkgKDA6MTI1Njg6MzA4MSkpLCBidXQgbm90IGZv
dW5kIGJ5IHBpZHMKICAgICAgICBRQU1fQVVUTyBmID0gNzE0MDAwIGtIeiBJOTk5QjhDOTk5
RDk5OVQ5OTlHOTk5WTk5OSAoMDoxMjU2ODozMDgxKSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAo
ODM5NToxMjU2ODozMDc0KQogICAgICAgIHVwZGF0aW5nIHRyYW5zcG9uZGVyOgogICAgICAg
ICAgIChRQU1fQVVUTyBmID0gNzE0MDAwIGtIeiBJOTk5QjhDOTk5RDk5OVQ5OTlHOTk5WTk5
OSAoODM5NToxMjU2ODozMDc0KSkgMHgwMDAwCiAgICAgICAgdG8gKFFBTV82NCAgIGYgPSA3
MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkwICg4Mzk1OjEyNTY4OjMwNzQpKSAweDQwNUEK
ICAgICAgICBhbHJlYWR5IGtub3duOiAoUUFNXzY0ICAgZiA9IDcxNDAwMCBrSHogSTk5OUI4
QzM0RDBUOEc4WTAgKDgzOTU6MTI1Njg6MzA3NCkpLCBidXQgbm90IGZvdW5kIGJ5IHBpZHMK
ICAgICAgICBRQU1fNjQgICBmID0gNzE0MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5
NToxMjU2ODozMDc0KSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAoODM5NToxMjU2ODozMDc1KQog
ICAgICAgIHVwZGF0aW5nIHRyYW5zcG9uZGVyOgogICAgICAgICAgIChRQU1fNjQgICBmID0g
NzE0MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzhZMCAoODM5NToxMjU2ODozMDc1KSkgMHg0MDVB
CiAgICAgICAgdG8gKFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZ
MCAoODM5NToxMjU2ODozMDc1KSkgMHg0MDVBCiAgICAgICAgbmV3IHRyYW5zcG9uZGVyOiAo
UUFNXzY0ICAgZiA9IDY4MjAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4
OjMwNzYpKSAweDQwNUEKICAgICAgICBuZXcgdHJhbnNwb25kZXI6IChRQU1fNjQgICBmID0g
NzIyMDAwIGtIeiBJOTk5QjhDMzREMFQ4RzMyWTAgKDgzOTU6MTI1Njg6MzA3NykpIDB4NDA1
QQogICAgICAgIG5ldyB0cmFuc3BvbmRlcjogKFFBTV82NCAgIGYgPSA3NjIwMDAga0h6IEk5
OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDc4KSkgMHg0MDVBCiAgICAgICAgYWxy
ZWFkeSBrbm93bjogKFFBTV82NCAgIGYgPSA4MTAwMDAga0h6IEk5OTlCOEMzNEQwVDhHOFkw
ICg4Mzk1OjEyNTUxOjEwNDIpKSwgYnV0IG5vdCBmb3VuZCBieSBwaWRzCiAgICAgICAgUUFN
XzY0ICAgZiA9IDgxMDAwMCBrSHogSTk5OUI4QzM0RDBUOEc4WTAgKDgzOTU6MTI1NTE6MTA0
MikgOiB1cGRhdGluZyB0cCBpZHMgLT4gKDgzOTU6MTI1Njg6MzA3OSkKICAgICAgICB1cGRh
dGluZyB0cmFuc3BvbmRlcjoKICAgICAgICAgICAoUUFNXzY0ICAgZiA9IDgxMDAwMCBrSHog
STk5OUI4QzM0RDBUOEc4WTAgKDgzOTU6MTI1Njg6MzA3OSkpIDB4NDA1QQogICAgICAgIHRv
IChRQU1fNjQgICBmID0gNTA2MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzMyWTAgKDgzOTU6MTI1
Njg6MzA3OSkpIDB4NDA1QQogICAgICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0g
NTcwMDAwIGtIeiBJOTk5QjhDMjNEMFQ4RzRZMCAoODM5NToxMjU2MDoyNzMpKSwgYnV0IG5v
dCBmb3VuZCBieSBwaWRzCiAgICAgICAgUUFNXzY0ICAgZiA9IDU3MDAwMCBrSHogSTk5OUI4
QzIzRDBUOEc0WTAgKDgzOTU6MTI1NjA6MjczKSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAoODM5
NToxMjU2ODozMDgwKQogICAgICAgIHVwZGF0aW5nIHRyYW5zcG9uZGVyOgogICAgICAgICAg
IChRQU1fNjQgICBmID0gNTcwMDAwIGtIeiBJOTk5QjhDMjNEMFQ4RzRZMCAoODM5NToxMjU2
ODozMDgwKSkgMHg0MDVBCiAgICAgICAgdG8gKFFBTV82NCAgIGYgPSA2NzQwMDAga0h6IEk5
OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDgwKSkgMHg0MDVBCiAgICAgICAgYWxy
ZWFkeSBrbm93bjogKFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZ
MCAoODM5NToxMjU2ODozMDc1KSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFB
TV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODoz
MDc1KSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAoODM5NToxMjU2ODozMDgxKQogICAgICAgIG5l
dyB0cmFuc3BvbmRlcjogKFFBTV82NCAgIGYgPSA3NzAwMDAga0h6IEk5OTlCOEMzNEQwVDhH
MzJZMCAoODM5NToxMjU2ODozMDgyKSkgMHg0MDVBCiAgICAgICAgYWxyZWFkeSBrbm93bjog
KFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2
ODozMDgxKSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA3
MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDgxKSA6IHVwZGF0
aW5nIHRwIGlkcyAtPiAoODM5NToxMjU2ODozMDgzKQogICAgICAgIGFscmVhZHkga25vd246
IChRQU1fNjQgICBmID0gNzIyMDAwIGtIeiBJOTk5QjhDMzREMFQ4RzMyWTAgKDgzOTU6MTI1
Njg6MzA3NykpLCBidXQgbm90IGZvdW5kIGJ5IHBpZHMKICAgICAgICBRQU1fNjQgICBmID0g
NzIyMDAwIGtIeiBJOTk5QjhDMzREMFQ4RzMyWTAgKDgzOTU6MTI1Njg6MzA3NykgOiB1cGRh
dGluZyB0cCBpZHMgLT4gKDgzOTU6MTI1Njg6MzA4NCkKICAgICAgICBhbHJlYWR5IGtub3du
OiAoUUFNXzY0ICAgZiA9IDcwNjAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEy
NTY4OjMwNzMpKSwgYnV0IG5vdCBmb3VuZCBieSBwaWRzCiAgICAgICAgUUFNXzY0ICAgZiA9
IDcwNjAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwNzMpIDogdXBk
YXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNTY4OjMwODUpCiAgICAgICAgYWxyZWFkeSBrbm93
bjogKFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NTox
MjU2ODozMDgzKSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYg
PSA3MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDgzKSA6IHVw
ZGF0aW5nIHRwIGlkcyAtPiAoODM5NToxMjU2ODozMDg2KQogICAgICAgIG5ldyB0cmFuc3Bv
bmRlcjogKFFBTV82NCAgIGYgPSA3NTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5
NToxMjU2ODozMDg3KSkgMHg0MDVBCjcyMjAwMDogc2tpcHBlZCAoYWxyZWFkeSBrbm93biB0
cmFuc3BvbmRlcikKNzMwMDAwOiAodGltZTogMDE6MjIuMjI0KSAKNzM4MDAwOiAodGltZTog
MDE6MjQuMjQ1KSAKNzQ2MDAwOiAodGltZTogMDE6MjguOTY5KSAKNzU0MDAwOiBza2lwcGVk
IChhbHJlYWR5IGtub3duIHRyYW5zcG9uZGVyKQo3NjIwMDA6IHNraXBwZWQgKGFscmVhZHkg
a25vd24gdHJhbnNwb25kZXIpCjc3MDAwMDogc2tpcHBlZCAoYWxyZWFkeSBrbm93biB0cmFu
c3BvbmRlcikKNzc4MDAwOiAodGltZTogMDE6MzAuOTg5KSAKNzg2MDAwOiAodGltZTogMDE6
MzUuNzI1KSAKNzk0MDAwOiAodGltZTogMDE6MzcuNzQ1KSAKODAyMDAwOiAodGltZTogMDE6
MzkuNzYxKSAKODEwMDAwOiAodGltZTogMDE6NDEuNzg5KSAKODE4MDAwOiAodGltZTogMDE6
NDMuODA1KSAKODI2MDAwOiAodGltZTogMDE6NDUuODQ1KSAKODM0MDAwOiAodGltZTogMDE6
NDcuODkzKSAKODQyMDAwOiAodGltZTogMDE6NDkuOTQ1KSAKODUwMDAwOiAodGltZTogMDE6
NTEuOTkzKSAKODU4MDAwOiAodGltZTogMDE6NTQuMDMzKSAKU2Nhbm5pbmcgRFZCLVQyLi4u
CjQ3NDAwMDogKHRpbWU6IDAxOjU2LjA0OSkgCjQ4MjAwMDogKHRpbWU6IDAxOjU4LjA5Nykg
CjQ5MDAwMDogKHRpbWU6IDAyOjAwLjA5NykgCjQ5ODAwMDogKHRpbWU6IDAyOjAyLjEyOSkg
CjUwNjAwMDogc2tpcHBlZCAoYWxyZWFkeSBrbm93biB0cmFuc3BvbmRlcikKNTE0MDAwOiAo
dGltZTogMDI6MDQuMTQ5KSAKNTIyMDAwOiAodGltZTogMDI6MDYuMTk3KSAKNTMwMDAwOiAo
dGltZTogMDI6MDguMjQxKSAgICAgICAgIHNpZ25hbCBvazoJUUFNX0FVVE8gZiA9IDUzMDAw
MCBrSHogSTk5OUI4Qzk5OUQ5OTlUOTk5Rzk5OVk5OTlQMCAoMDowOjApCiAgICAgICAgUUFN
X0FVVE8gZiA9IDUzMDAwMCBrSHogSTk5OUI4Qzk5OUQ5OTlUOTk5Rzk5OVk5OTlQMCAoMDow
OjApIDogdXBkYXRpbmcgdHJhbnNwb3J0X3N0cmVhbV9pZDogLT4gKDA6MDo4OTc4KQogICAg
ICAgIFFBTV9BVVRPIGYgPSA1MzAwMDAga0h6IEk5OTlCOEM5OTlEOTk5VDk5OUc5OTlZOTk5
UDAgKDA6MDo4OTc4KSA6IHVwZGF0aW5nIG5ldHdvcmtfaWQgLT4gKDA6MTI2MTA6ODk3OCkK
ICAgICAgICBuZXcgdHJhbnNwb25kZXI6IChRQU1fQVVUTyBmID0gNDk4MDAwIGtIeiBJOTk5
QjhDOTk5RDBUMzJHOFkwUDAgKDgzOTU6MTI2MTA6ODk3NykpIDB4NDAwNAogICAgICAgIHVw
ZGF0aW5nIHRyYW5zcG9uZGVyOgogICAgICAgICAgIChRQU1fQVVUTyBmID0gNTMwMDAwIGtI
eiBJOTk5QjhDOTk5RDk5OVQ5OTlHOTk5WTk5OVAwICgwOjEyNjEwOjg5NzgpKSAweDAwMDAK
ICAgICAgICB0byAoUUFNX0FVVE8gZiA9IDUzMDAwMCBrSHogSTk5OUI4Qzk5OUQwVDMyRzhZ
MFAwICg4Mzk1OjEyNjEwOjg5NzgpKSAweDQwMDQKICAgICAgICBuZXcgdHJhbnNwb25kZXI6
IChRQU1fQVVUTyBmID0gNjUwMDAwIGtIeiBJOTk5QjhDOTk5RDBUMzJHOFkwUDAgKDgzOTU6
MTI2MTA6ODk3OSkpIDB4NDAwNAogICAgICAgIG5ldyB0cmFuc3BvbmRlcjogKFFBTV9BVVRP
IGYgPSA1NTQwMDAga0h6IEk5OTlCOEM5OTlEMFQzMkc4WTBQMCAoODM5NToxMjYxMDo4OTgw
KSkgMHg0MDA0CiAgICAgICAgYWxyZWFkeSBrbm93bjogKFFBTV9BVVRPIGYgPSA1NTQwMDAg
a0h6IEk5OTlCOEM5OTlEMFQzMkc4WTBQMCAoODM5NToxMjYxMDo4OTgwKSksIGJ1dCBub3Qg
Zm91bmQgYnkgcGlkcwogICAgICAgIFFBTV9BVVRPIGYgPSA1NTQwMDAga0h6IEk5OTlCOEM5
OTlEMFQzMkc4WTBQMCAoODM5NToxMjYxMDo4OTgwKSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAo
ODM5NToxMjYxMDo4OTgxKQogICAgICAgIG5ldyB0cmFuc3BvbmRlcjogKFFBTV9BVVRPIGYg
PSA1MTQwMDAga0h6IEk5OTlCOEM5OTlEMFQzMkc4WTBQMCAoODM5NToxMjYxMDo4OTgyKSkg
MHg0MDA0CiAgICAgICAgbmV3IHRyYW5zcG9uZGVyOiAoUUFNX0FVVE8gZiA9IDQ4MjAwMCBr
SHogSTk5OUI4Qzk5OUQwVDMyRzhZMFAwICg4Mzk1OjEyNjEwOjg5ODMpKSAweDQwMDQKNTM4
MDAwOiAodGltZTogMDI6MTEuNDEzKSAKNTQ2MDAwOiAodGltZTogMDI6MTMuNDI5KSAKNTU0
MDAwOiBza2lwcGVkIChhbHJlYWR5IGtub3duIHRyYW5zcG9uZGVyKQo1NjIwMDA6ICh0aW1l
OiAwMjoxNS40NDEpIAo1NzAwMDA6ICh0aW1lOiAwMjoxNy40ODkpIAo1NzgwMDA6ICh0aW1l
OiAwMjoxOS41MDkpIAo1ODYwMDA6ICh0aW1lOiAwMjoyMS41MTMpIAo1OTQwMDA6ICh0aW1l
OiAwMjoyMy41NDEpIAo2MDIwMDA6ICh0aW1lOiAwMjoyNS41ODUpIAo2MTAwMDA6ICh0aW1l
OiAwMjoyNy42MDkpIAo2MTgwMDA6ICh0aW1lOiAwMjoyOS42NTMpIAo2MjYwMDA6ICh0aW1l
OiAwMjozMS42OTcpIAo2MzQwMDA6ICh0aW1lOiAwMjozMy43NDUpIAo2NDIwMDA6ICh0aW1l
OiAwMjozNS43NDUpIAo2NTAwMDA6IHNraXBwZWQgKGFscmVhZHkga25vd24gdHJhbnNwb25k
ZXIpCjY1ODAwMDogKHRpbWU6IDAyOjM3Ljc4NSkgCjY2NjAwMDogKHRpbWU6IDAyOjM5Ljg0
NikgCjY3NDAwMDogc2tpcHBlZCAoYWxyZWFkeSBrbm93biB0cmFuc3BvbmRlcikKNjgyMDAw
OiBza2lwcGVkIChhbHJlYWR5IGtub3duIHRyYW5zcG9uZGVyKQo2OTAwMDA6ICh0aW1lOiAw
Mjo0MS44NTQpIAo2OTgwMDA6ICh0aW1lOiAwMjo0My44OTApIAo3MDYwMDA6IHNraXBwZWQg
KGFscmVhZHkga25vd24gdHJhbnNwb25kZXIpCjcxNDAwMDogc2tpcHBlZCAoYWxyZWFkeSBr
bm93biB0cmFuc3BvbmRlcikKNzIyMDAwOiBza2lwcGVkIChhbHJlYWR5IGtub3duIHRyYW5z
cG9uZGVyKQo3MzAwMDA6ICh0aW1lOiAwMjo0NS44OTApIAo3MzgwMDA6ICh0aW1lOiAwMjo0
Ny45MjYpIAo3NDYwMDA6ICh0aW1lOiAwMjo0OS45NzApIAo3NTQwMDA6IHNraXBwZWQgKGFs
cmVhZHkga25vd24gdHJhbnNwb25kZXIpCjc2MjAwMDogc2tpcHBlZCAoYWxyZWFkeSBrbm93
biB0cmFuc3BvbmRlcikKNzcwMDAwOiBza2lwcGVkIChhbHJlYWR5IGtub3duIHRyYW5zcG9u
ZGVyKQo3NzgwMDA6ICh0aW1lOiAwMjo1MS45OTApIAo3ODYwMDA6ICh0aW1lOiAwMjo1NC4w
MzQpIAo3OTQwMDA6ICh0aW1lOiAwMjo1Ni4wNTQpIAo4MDIwMDA6ICh0aW1lOiAwMjo1OC4w
NzgpIAo4MTAwMDA6ICh0aW1lOiAwMzowMC4xMzApIAo4MTgwMDA6ICh0aW1lOiAwMzowMi4x
MzgpIAo4MjYwMDA6ICh0aW1lOiAwMzowNC4xODIpIAo4MzQwMDA6ICh0aW1lOiAwMzowNi4y
MzApIAo4NDIwMDA6ICh0aW1lOiAwMzowOC4yNzgpIAo4NTAwMDA6ICh0aW1lOiAwMzoxMC4z
MjYpIAo4NTgwMDA6ICh0aW1lOiAwMzoxMi4zNzApIAp0dW5lIHRvOiBRQU1fNjQgICBmID0g
NTA2MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzMyWTAgKDgzOTU6MTI1Njg6MzA3OSkgKHRpbWU6
IDAzOjE0LjQxOCkgCi0tLS0tLS0tLS1ubyBzaWduYWwtLS0tLS0tLS0tCnR1bmUgdG86IFFB
TV9BVVRPIGYgPSA1MDYwMDAga0h6IEk5OTlCOEM5OTlEMFQ5OTlHOTk5WTAgKDgzOTU6MTI1
Njg6MzA3OSkgKHRpbWU6IDAzOjIwLjQ0MikgIChubyBzaWduYWwpCi0tLS0tLS0tLS1ubyBz
aWduYWwtLS0tLS0tLS0tCnR1bmUgdG86IFFBTV82NCAgIGYgPSA2NzQwMDAga0h6IEk5OTlC
OEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDgwKSAodGltZTogMDM6MjYuNDg2KSAKLS0t
LS0tLS0tLW5vIHNpZ25hbC0tLS0tLS0tLS0KdHVuZSB0bzogUUFNX0FVVE8gZiA9IDY3NDAw
MCBrSHogSTk5OUI4Qzk5OUQwVDk5OUc5OTlZMCAoODM5NToxMjU2ODozMDgwKSAodGltZTog
MDM6MzIuNTI2KSAgKG5vIHNpZ25hbCkKLS0tLS0tLS0tLW5vIHNpZ25hbC0tLS0tLS0tLS0K
dHVuZSB0bzogUUFNXzY0ICAgZiA9IDcxNDAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4
Mzk1OjEyNTY4OjMwODYpICh0aW1lOiAwMzozOC41NDYpIAogICAgICAgIFFBTV82NCAgIGYg
PSA3MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDg2KSA6IHVw
ZGF0aW5nIHRyYW5zcG9ydF9zdHJlYW1faWQ6IC0+ICg4Mzk1OjEyNTY4OjMwODEpCglzZXJ2
aWNlID0gT0NLTyBFWFBSRVMgKENFU0tFIFJBRElPS09NVU5JS0FDRSkKCXNlcnZpY2UgPSBO
b2UgVFYgKENFU0tFIFJBRElPS09NVU5JS0FDRSkKCXNlcnZpY2UgPSBCYXJyYW5kb3YgTmV3
cyAoQ0VTS0UgUkFESU9LT01VTklLQUNFKQoJc2VydmljZSA9IFNsYWdyIDIgKENFU0tFIFJB
RElPS09NVU5JS0FDRSkKCXNlcnZpY2UgPSBSZXRybyBNdXNpYyBUViAoQ0VTS0UgUkFESU9L
T01VTklLQUNFKQoJc2VydmljZSA9IFJlZ2lvbmFsbmkgdGVsZXZpemUgQ1ogKENFU0tFIFJB
RElPS09NVU5JS0FDRSkKCXNlcnZpY2UgPSBTcG9ydCA1IChDRVNLRSBSQURJT0tPTVVOSUtB
Q0UpCglzZXJ2aWNlID0gUE9XRVIgVFYgKENFU0tFIFJBRElPS09NVU5JS0FDRSkKICAgICAg
ICBhbHJlYWR5IGtub3duOiAoUUFNXzY0ICAgZiA9IDcwNjAwMCBrSHogSTk5OUI4QzM0RDBU
OEczMlkwICg4Mzk1OjEyNTY4OjMwODUpKSwgYnV0IG5vdCBmb3VuZCBieSBwaWRzCiAgICAg
ICAgUUFNXzY0ICAgZiA9IDcwNjAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEy
NTY4OjMwODUpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNTY4OjMwNzMpCiAgICAg
ICAgYWxyZWFkeSBrbm93bjogKFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlCOEMzNEQw
VDhHMzJZMCAoODM5NToxMjU2ODozMDgxKSksIGJ1dCBub3QgZm91bmQgYnkgcGlkcwogICAg
ICAgIFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NTox
MjU2ODozMDgxKSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAoODM5NToxMjU2ODozMDc0KQogICAg
ICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0gNzE0MDAwIGtIeiBJOTk5QjhDMzRE
MFQ4RzMyWTAgKDgzOTU6MTI1Njg6MzA3NCkpLCBidXQgbm90IGZvdW5kIGJ5IHBpZHMKICAg
ICAgICBRQU1fNjQgICBmID0gNzE0MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzMyWTAgKDgzOTU6
MTI1Njg6MzA3NCkgOiB1cGRhdGluZyB0cCBpZHMgLT4gKDgzOTU6MTI1Njg6MzA3NSkKICAg
ICAgICBhbHJlYWR5IGtub3duOiAoUUFNXzY0ICAgZiA9IDcyMjAwMCBrSHogSTk5OUI4QzM0
RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwODQpKSwgYnV0IG5vdCBmb3VuZCBieSBwaWRzCiAg
ICAgICAgUUFNXzY0ICAgZiA9IDcyMjAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1
OjEyNTY4OjMwODQpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNTY4OjMwNzcpCiAg
ICAgICAgdXBkYXRpbmcgdHJhbnNwb25kZXI6CiAgICAgICAgICAgKFFBTV9BVVRPIGYgPSA1
MDYwMDAga0h6IEk5OTlCOEM5OTlEMFQ5OTlHOTk5WTAgKDgzOTU6MTI1Njg6MzA3OSkpIDB4
MDAwMAogICAgICAgIHRvIChRQU1fNjQgICBmID0gNTA2MDAwIGtIeiBJOTk5QjhDMzREMFQ4
RzMyWTAgKDgzOTU6MTI1Njg6MzA3OSkpIDB4NDA1QQogICAgICAgIHVwZGF0aW5nIHRyYW5z
cG9uZGVyOgogICAgICAgICAgIChRQU1fQVVUTyBmID0gNjc0MDAwIGtIeiBJOTk5QjhDOTk5
RDBUOTk5Rzk5OVkwICg4Mzk1OjEyNTY4OjMwODApKSAweDAwMDAKICAgICAgICB0byAoUUFN
XzY0ICAgZiA9IDY3NDAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMw
ODApKSAweDQwNUEKICAgICAgICBhbHJlYWR5IGtub3duOiAoUUFNXzY0ICAgZiA9IDcxNDAw
MCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwNzUpKSwgYnV0IG5vdCBm
b3VuZCBieSBwaWRzCiAgICAgICAgUUFNXzY0ICAgZiA9IDcxNDAwMCBrSHogSTk5OUI4QzM0
RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwNzUpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1
OjEyNTY4OjMwODEpCiAgICAgICAgYWxyZWFkeSBrbm93bjogKFFBTV82NCAgIGYgPSA3MTQw
MDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDgxKSksIGJ1dCBub3Qg
Zm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlCOEMz
NEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDgxKSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAoODM5
NToxMjU2ODozMDgzKQogICAgICAgIGFscmVhZHkga25vd246IChRQU1fNjQgICBmID0gNzIy
MDAwIGtIeiBJOTk5QjhDMzREMFQ4RzMyWTAgKDgzOTU6MTI1Njg6MzA3NykpLCBidXQgbm90
IGZvdW5kIGJ5IHBpZHMKICAgICAgICBRQU1fNjQgICBmID0gNzIyMDAwIGtIeiBJOTk5QjhD
MzREMFQ4RzMyWTAgKDgzOTU6MTI1Njg6MzA3NykgOiB1cGRhdGluZyB0cCBpZHMgLT4gKDgz
OTU6MTI1Njg6MzA4NCkKICAgICAgICBhbHJlYWR5IGtub3duOiAoUUFNXzY0ICAgZiA9IDcw
NjAwMCBrSHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwNzMpKSwgYnV0IG5v
dCBmb3VuZCBieSBwaWRzCiAgICAgICAgUUFNXzY0ICAgZiA9IDcwNjAwMCBrSHogSTk5OUI4
QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwNzMpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4
Mzk1OjEyNTY4OjMwODUpCiAgICAgICAgYWxyZWFkeSBrbm93bjogKFFBTV82NCAgIGYgPSA3
MTQwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDgzKSksIGJ1dCBu
b3QgZm91bmQgYnkgcGlkcwogICAgICAgIFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlC
OEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDgzKSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAo
ODM5NToxMjU2ODozMDg2KQogICAgICAgIFFBTV82NCAgIGYgPSA3MTQwMDAga0h6IEk5OTlC
OEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDg2KSA6IHVwZGF0aW5nIHRyYW5zcG9ydF9z
dHJlYW1faWQ6IC0+ICg4Mzk1OjEyNTY4OjMwODEpCnR1bmUgdG86IFFBTV82NCAgIGYgPSA3
MDYwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDg1KSAodGltZTog
MDM6NTIuNTU1KSAKLS0tLS0tLS0tLW5vIHNpZ25hbC0tLS0tLS0tLS0KdHVuZSB0bzogUUFN
X0FVVE8gZiA9IDcwNjAwMCBrSHogSTk5OUI4Qzk5OUQwVDk5OUc5OTlZMCAoODM5NToxMjU2
ODozMDg1KSAodGltZTogMDM6NTguNTc5KSAgKG5vIHNpZ25hbCkKLS0tLS0tLS0tLW5vIHNp
Z25hbC0tLS0tLS0tLS0KdHVuZSB0bzogUUFNXzY0ICAgZiA9IDY4MjAwMCBrSHogSTk5OUI4
QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwNzYpICh0aW1lOiAwNDowNC41OTkpIAotLS0t
LS0tLS0tbm8gc2lnbmFsLS0tLS0tLS0tLQp0dW5lIHRvOiBRQU1fQVVUTyBmID0gNjgyMDAw
IGtIeiBJOTk5QjhDOTk5RDBUOTk5Rzk5OVkwICg4Mzk1OjEyNTY4OjMwNzYpICh0aW1lOiAw
NDoxMC42NzUpICAobm8gc2lnbmFsKQotLS0tLS0tLS0tbm8gc2lnbmFsLS0tLS0tLS0tLQp0
dW5lIHRvOiBRQU1fNjQgICBmID0gNzIyMDAwIGtIeiBJOTk5QjhDMzREMFQ4RzMyWTAgKDgz
OTU6MTI1Njg6MzA4NCkgKHRpbWU6IDA0OjE2LjcyMykgCi0tLS0tLS0tLS1ubyBzaWduYWwt
LS0tLS0tLS0tCnR1bmUgdG86IFFBTV9BVVRPIGYgPSA3MjIwMDAga0h6IEk5OTlCOEM5OTlE
MFQ5OTlHOTk5WTAgKDgzOTU6MTI1Njg6MzA4NCkgKHRpbWU6IDA0OjIyLjc2NykgIChubyBz
aWduYWwpCi0tLS0tLS0tLS1ubyBzaWduYWwtLS0tLS0tLS0tCnR1bmUgdG86IFFBTV82NCAg
IGYgPSA3NjIwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAoODM5NToxMjU2ODozMDc4KSAo
dGltZTogMDQ6MjguODI3KSAKLS0tLS0tLS0tLW5vIHNpZ25hbC0tLS0tLS0tLS0KdHVuZSB0
bzogUUFNX0FVVE8gZiA9IDc2MjAwMCBrSHogSTk5OUI4Qzk5OUQwVDk5OUc5OTlZMCAoODM5
NToxMjU2ODozMDc4KSAodGltZTogMDQ6MzMuNDcxKSAgKG5vIHNpZ25hbCkKLS0tLS0tLS0t
LW5vIHNpZ25hbC0tLS0tLS0tLS0KdHVuZSB0bzogUUFNXzY0ICAgZiA9IDc3MDAwMCBrSHog
STk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwODIpICh0aW1lOiAwNDozOS41MTkp
IAogICAgICAgIFFBTV82NCAgIGYgPSA3NzAwMDAga0h6IEk5OTlCOEMzNEQwVDhHMzJZMCAo
ODM5NToxMjU2ODozMDgyKSA6IHVwZGF0aW5nIHRyYW5zcG9ydF9zdHJlYW1faWQ6IC0+ICg4
Mzk1OjEyNTY4OjUxNikKCXNlcnZpY2UgPSAgTk9WQSAoQ0VTS0UgUkFESU9LT01VTklLQUNF
KQoJc2VydmljZSA9IE5PVkEgQ0lORU1BIChDRVNLRSBSQURJT0tPTVVOSUtBQ0UpCglzZXJ2
aWNlID0gUHJpbWEgQ09PTCAoQ0VTS0UgUkFESU9LT01VTklLQUNFKQoJc2VydmljZSA9IFBy
aW1hIChDRVNLRSBSQURJT0tPTVVOSUtBQ0UpCglzZXJ2aWNlID0gQkFSUkFORE9WIFRWIChD
RVNLRSBSQURJT0tPTVVOSUtBQ0UpCiAgICAgICAgUUFNXzY0ICAgZiA9IDc3MDAwMCBrSHog
STk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjUxNikgOiB1cGRhdGluZyBuZXR3b3Jr
X2lkIC0+ICg4Mzk1OjEyNTQ4OjUxNikKdHVuZSB0bzogUUFNXzY0ICAgZiA9IDc1NDAwMCBr
SHogSTk5OUI4QzM0RDBUOEczMlkwICg4Mzk1OjEyNTY4OjMwODcpICh0aW1lOiAwNDo1My41
NjMpIAotLS0tLS0tLS0tbm8gc2lnbmFsLS0tLS0tLS0tLQp0dW5lIHRvOiBRQU1fQVVUTyBm
ID0gNzU0MDAwIGtIeiBJOTk5QjhDOTk5RDBUOTk5Rzk5OVkwICg4Mzk1OjEyNTY4OjMwODcp
ICh0aW1lOiAwNDo1OS42NTEpICAobm8gc2lnbmFsKQotLS0tLS0tLS0tbm8gc2lnbmFsLS0t
LS0tLS0tLQp0dW5lIHRvOiBRQU1fQVVUTyBmID0gNTMwMDAwIGtIeiBJOTk5QjhDOTk5RDBU
MzJHOFkwUDAgKDgzOTU6MTI2MTA6ODk3OCkgKHRpbWU6IDA1OjA1LjY5NikgCglzZXJ2aWNl
ID0gTm92YSB8IFQyIChEQiwgUHJlY2hvZC4gTVVYIDEzKQoJc2VydmljZSA9IE5vdmEgQ2lu
ZW1hIHwgVDIgKERCLCBQcmVjaG9kLiBNVVggMTMpCglzZXJ2aWNlID0gTm92YSBBY3Rpb24g
fCBUMiAoREIsIFByZWNob2QuIE1VWCAxMykKCXNlcnZpY2UgPSBOb3ZhIEdvbGQgfCBUMiAo
REIsIFByZWNob2QuIE1VWCAxMykKCXNlcnZpY2UgPSBOb3ZhIDIgfCBUMiAoREIsIFByZWNo
b2QuIE1VWCAxMykKCXNlcnZpY2UgPSBQcmltYSBDb21lZHkgQ2VudHJhbCBIRCB8IFQyIChE
QiwgUHJlY2hvZC4gTVVYIDEzKQoJc2VydmljZSA9IEpPSiBGYW1pbHkgSEQgfCBUMiAoREIs
IFByZWNob2QuIE1VWCAxMykKCXNlcnZpY2UgPSBUViBSRUJFTCB8IFQyIChEQiwgUHJlY2hv
ZC4gTVVYIDEzKQoJc2VydmljZSA9IFRWIFJFTEFYIHwgVDIgKERCLCBQcmVjaG9kLiBNVVgg
MTMpCglzZXJ2aWNlID0gS0lOT1NWRVQgfCBUMiAoREIsIFByZWNob2QuIE1VWCAxMykKICAg
ICAgICBhbHJlYWR5IGtub3duOiAoUUFNX0FVVE8gZiA9IDU1NDAwMCBrSHogSTk5OUI4Qzk5
OUQwVDMyRzhZMFAwICg4Mzk1OjEyNjEwOjg5ODEpKSwgYnV0IG5vdCBmb3VuZCBieSBwaWRz
CiAgICAgICAgUUFNX0FVVE8gZiA9IDU1NDAwMCBrSHogSTk5OUI4Qzk5OUQwVDMyRzhZMFAw
ICg4Mzk1OjEyNjEwOjg5ODEpIDogdXBkYXRpbmcgdHAgaWRzIC0+ICg4Mzk1OjEyNjEwOjg5
ODApCiAgICAgICAgYWxyZWFkeSBrbm93bjogKFFBTV9BVVRPIGYgPSA1NTQwMDAga0h6IEk5
OTlCOEM5OTlEMFQzMkc4WTBQMCAoODM5NToxMjYxMDo4OTgwKSksIGJ1dCBub3QgZm91bmQg
YnkgcGlkcwogICAgICAgIFFBTV9BVVRPIGYgPSA1NTQwMDAga0h6IEk5OTlCOEM5OTlEMFQz
Mkc4WTBQMCAoODM5NToxMjYxMDo4OTgwKSA6IHVwZGF0aW5nIHRwIGlkcyAtPiAoODM5NTox
MjYxMDo4OTgxKQp0dW5lIHRvOiBRQU1fQVVUTyBmID0gNDk4MDAwIGtIeiBJOTk5QjhDOTk5
RDBUMzJHOFkwUDAgKDgzOTU6MTI2MTA6ODk3NykgKHRpbWU6IDA1OjE5LjU0OCkgCi0tLS0t
LS0tLS1ubyBzaWduYWwtLS0tLS0tLS0tCnR1bmUgdG86IFFBTV9BVVRPIGYgPSA0OTgwMDAg
a0h6IEk5OTlCOEM5OTlEMFQ5OTlHOTk5WTBQMCAoODM5NToxMjYxMDo4OTc3KSAodGltZTog
MDU6MjUuNjI0KSAgKG5vIHNpZ25hbCkKLS0tLS0tLS0tLW5vIHNpZ25hbC0tLS0tLS0tLS0K
dHVuZSB0bzogUUFNX0FVVE8gZiA9IDY1MDAwMCBrSHogSTk5OUI4Qzk5OUQwVDMyRzhZMFAw
ICg4Mzk1OjEyNjEwOjg5NzkpICh0aW1lOiAwNTozMS43MTIpIAotLS0tLS0tLS0tbm8gc2ln
bmFsLS0tLS0tLS0tLQp0dW5lIHRvOiBRQU1fQVVUTyBmID0gNjUwMDAwIGtIeiBJOTk5QjhD
OTk5RDBUOTk5Rzk5OVkwUDAgKDgzOTU6MTI2MTA6ODk3OSkgKHRpbWU6IDA1OjM3Ljc0OCkg
IChubyBzaWduYWwpCi0tLS0tLS0tLS1ubyBzaWduYWwtLS0tLS0tLS0tCnR1bmUgdG86IFFB
TV9BVVRPIGYgPSA1NTQwMDAga0h6IEk5OTlCOEM5OTlEMFQzMkc4WTBQMCAoODM5NToxMjYx
MDo4OTgxKSAodGltZTogMDU6NDMuNzYwKSAKICAgICAgICBRQU1fQVVUTyBmID0gNTU0MDAw
IGtIeiBJOTk5QjhDOTk5RDBUMzJHOFkwUDAgKDgzOTU6MTI2MTA6ODk4MSkgOiB1cGRhdGlu
ZyB0cmFuc3BvcnRfc3RyZWFtX2lkOiAtPiAoODM5NToxMjYxMDo2MTk1OCkKV0FSTklORzog
cmVjZWl2ZWQgZ2FyYmFnZSBkYXRhOiBjcmMgPSAweDRmNTRiMjYyOyBleHBlY3RlZCBjcmMg
PSAweDZlN2I2ZTNiCmluY3JlYXNpbmcgZmlsdGVyIHRpbWVvdXQgdG8gMzIgc2VjcyAocGlk
OjE3IHRhYmxlX2lkOjY2IHRhYmxlX2lkX2V4dDotMSkuCglzZXJ2aWNlID0gTk9WQSB8IFQy
IChDRVNLRSBSQURJT0tPTVVOSUtBQ0UpCglzZXJ2aWNlID0gTk9WQSBDSU5FTUEgfCBUMiAo
Q0VTS0UgUkFESU9LT01VTklLQUNFKQoJc2VydmljZSA9IFByaW1hIExPVkUgfCBUMiAoQ0VT
S0UgUkFESU9LT01VTklLQUNFKQoJc2VydmljZSA9IFByaW1hIFpPT00gfCBUMiAoQ0VTS0Ug
UkFESU9LT01VTklLQUNFKQoJc2VydmljZSA9IFByaW1hIE1BWCB8IFQyIChDRVNLRSBSQURJ
T0tPTVVOSUtBQ0UpCglzZXJ2aWNlID0gUHJpbWEgfCBUMiAoQ0VTS0UgUkFESU9LT01VTklL
QUNFKQoJc2VydmljZSA9IFByaW1hIENPT0wgfCBUMiAoQ0VTS0UgUkFESU9LT01VTklLQUNF
KQoJc2VydmljZSA9IFByaW1hIEtSSU1JIHwgVDIgKENFU0tFIFJBRElPS09NVU5JS0FDRSkK
CXNlcnZpY2UgPSBPY2tvIHwgVDIgKENFU0tFIFJBRElPS09NVU5JS0FDRSkKCXNlcnZpY2Ug
PSBPQ0tPIFNUQVIgfCBUMiAoQ0VTS0UgUkFESU9LT01VTklLQUNFKQoJc2VydmljZSA9IE5v
ZSBUViB8IFQyIChDRVNLRSBSQURJT0tPTVVOSUtBQ0UpCglzZXJ2aWNlID0gQmFycmFuZG92
IEtSSU1JIHwgVDIgKENFU0tFIFJBRElPS09NVU5JS0FDRSkKCXNlcnZpY2UgPSBLaW5vIEJh
cnJhbmRvdiB8IFQyIChDRVNLRSBSQURJT0tPTVVOSUtBQ0UpCglzZXJ2aWNlID0gQkFSUkFO
RE9WIFRWIHwgVDIgKENFU0tFIFJBRElPS09NVU5JS0FDRSkKCXNlcnZpY2UgPSBCYXJyYW5k
b3YgTmV3cyB8IFQyIChDRVNLRSBSQURJT0tPTVVOSUtBQ0UpCglzZXJ2aWNlID0gU2xhZ3Ig
VFYgfCBUMiAoQ0VTS0UgUkFESU9LT01VTklLQUNFKQoJc2VydmljZSA9IFNsYWdyIDIgfCBU
MiAoQ0VTS0UgUkFESU9LT01VTklLQUNFKQoJc2VydmljZSA9IFNlem5hbS5jeiBUViB8IFQy
IChDRVNLRSBSQURJT0tPTVVOSUtBQ0UpCglzZXJ2aWNlID0gUHJvZ2xhcyB8IFQyIChDRVNL
RSBSQURJT0tPTVVOSUtBQ0UpCiAgICAgICAgUUFNX0FVVE8gZiA9IDU1NDAwMCBrSHogSTk5
OUI4Qzk5OUQwVDMyRzhZMFAwICg4Mzk1OjEyNjEwOjYxOTU4KSA6IHVwZGF0aW5nIG5ldHdv
cmtfaWQgLT4gKDgzOTU6MTI2MDk6NjE5NTgpCnR1bmUgdG86IFFBTV9BVVRPIGYgPSA1MTQw
MDAga0h6IEk5OTlCOEM5OTlEMFQzMkc4WTBQMCAoODM5NToxMjYxMDo4OTgyKSAodGltZTog
MDU6NTcuNTU2KSAKLS0tLS0tLS0tLW5vIHNpZ25hbC0tLS0tLS0tLS0KdHVuZSB0bzogUUFN
X0FVVE8gZiA9IDUxNDAwMCBrSHogSTk5OUI4Qzk5OUQwVDk5OUc5OTlZMFAwICg4Mzk1OjEy
NjEwOjg5ODIpICh0aW1lOiAwNjowMy42NDQpICAobm8gc2lnbmFsKQotLS0tLS0tLS0tbm8g
c2lnbmFsLS0tLS0tLS0tLQp0dW5lIHRvOiBRQU1fQVVUTyBmID0gNDgyMDAwIGtIeiBJOTk5
QjhDOTk5RDBUMzJHOFkwUDAgKDgzOTU6MTI2MTA6ODk4MykgKHRpbWU6IDA2OjA5LjY4NCkg
Ci0tLS0tLS0tLS1ubyBzaWduYWwtLS0tLS0tLS0tCnR1bmUgdG86IFFBTV9BVVRPIGYgPSA0
ODIwMDAga0h6IEk5OTlCOEM5OTlEMFQ5OTlHOTk5WTBQMCAoODM5NToxMjYxMDo4OTgzKSAo
dGltZTogMDY6MTUuNzgxKSAgKG5vIHNpZ25hbCkKLS0tLS0tLS0tLW5vIHNpZ25hbC0tLS0t
LS0tLS0KKHRpbWU6IDA2OjIxLjg2NSkgZHVtcGluZyBsaXN0cyAoNDIgc2VydmljZXMpCi4u
CkRvbmUsIHNjYW4gdGltZTogMDY6MjEuODY1Cg==
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  w_scan__channels.conf
     Date:  1 May 2019, 19:09
     Size:  4587 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="w_scan__channels.conf"; type=Unix-text
Content-disposition: attachment; filename="w_scan__channels.conf"
Content-transfer-encoding: BASE64

QmFycmFuZG92IE5ld3M7Q0VTS0UgUkFESU9LT01VTklLQUNFOjcxNDAwMDpCOEMzNEQwRzMy
TTY0VDhZMDpUOjI3NTAwOjg2MT0yOjg2MkA0OjA6MDoyMDU0OjgzOTU6MzA4MTowClJlZ2lv
bmFsbmkgdGVsZXZpemUgQ1o7Q0VTS0UgUkFESU9LT01VTklLQUNFOjcxNDAwMDpCOEMzNEQw
RzMyTTY0VDhZMDpUOjI3NTAwOjg3MT0yOjg3MkA0OjA6MDo2NDAxOjgzOTU6MzA4MTowClNs
YWdyIDI7Q0VTS0UgUkFESU9LT01VTklLQUNFOjcxNDAwMDpCOEMzNEQwRzMyTTY0VDhZMDpU
OjI3NTAwOjg5MT0yNzo4OTJANDowOjA6NTYzNjo4Mzk1OjMwODE6MApPQ0tPIEVYUFJFUztD
RVNLRSBSQURJT0tPTVVOSUtBQ0U6NzE0MDAwOkI4QzM0RDBHMzJNNjRUOFkwOlQ6Mjc1MDA6
ODQxPTI3Ojg0MkA0OjA6MDoxMDI3OjgzOTU6MzA4MTowClNwb3J0IDU7Q0VTS0UgUkFESU9L
T01VTklLQUNFOjcxNDAwMDpCOEMzNEQwRzMyTTY0VDhZMDpUOjI3NTAwOjgyMT0yOjgyMkA0
OjA6MDo4MTk0OjgzOTU6MzA4MTowCk5vZSBUVjtDRVNLRSBSQURJT0tPTVVOSUtBQ0U6NzE0
MDAwOkI4QzM0RDBHMzJNNjRUOFkwOlQ6Mjc1MDA6ODExPTI6ODEyQDQ6MDowOjEyODE6ODM5
NTozMDgxOjAKUmV0cm8gTXVzaWMgVFY7Q0VTS0UgUkFESU9LT01VTklLQUNFOjcxNDAwMDpC
OEMzNEQwRzMyTTY0VDhZMDpUOjI3NTAwOjk0MT0yOjk0MkA0OjA6MDo1ODg5OjgzOTU6MzA4
MTowClBPV0VSIFRWO0NFU0tFIFJBRElPS09NVU5JS0FDRTo3MTQwMDA6QjhDMzREMEczMk02
NFQ4WTA6VDoyNzUwMDoxMDExPTI6MTAxMkAzOjA6MDo4NDUxOjgzOTU6MzA4MTowCiBOT1ZB
O0NFU0tFIFJBRElPS09NVU5JS0FDRTo3NzAwMDA6QjhDMzREMEczMk02NFQ4WTA6VDoyNzUw
MDoxMDE9MjoxMTE9Y3plQDMsMTEyPWN6ZToxMjE6MDo1MTM6ODM5NTo1MTY6MApOT1ZBIENJ
TkVNQTtDRVNLRSBSQURJT0tPTVVOSUtBQ0U6NzcwMDAwOkI4QzM0RDBHMzJNNjRUOFkwOlQ6
Mjc1MDA6NDAxPTI6NDExPWN6ZUAzOjQyMTowOjUxNDo4Mzk1OjUxNjowClByaW1hIENPT0w7
Q0VTS0UgUkFESU9LT01VTklLQUNFOjc3MDAwMDpCOEMzNEQwRzMyTTY0VDhZMDpUOjI3NTAw
OjUwMT0yOjUxMT1jemVAMzo1MjE6MDo3NzA6ODM5NTo1MTY6MApQcmltYTtDRVNLRSBSQURJ
T0tPTVVOSUtBQ0U6NzcwMDAwOkI4QzM0RDBHMzJNNjRUOFkwOlQ6Mjc1MDA6NjAxPTI6NjEx
PWN6ZUAzLDYxMj1jemU6NjIxOjA6NzczOjgzOTU6NTE2OjAKQkFSUkFORE9WIFRWO0NFU0tF
IFJBRElPS09NVU5JS0FDRTo3NzAwMDA6QjhDMzREMEczMk02NFQ4WTA6VDoyNzUwMDozMDE9
MjozMTE9Y3plQDMsMzEyPWN6ZTozMjE6MDoyMDUwOjgzOTU6NTE2OjAKTm92YSB8IFQyO0RC
LCBQcmVjaG9kLiBNVVggMTM6NTMwMDAwOkI4RDBHOFMxVDMyWTBQMDpUOjI3NTAwOjI3Mz0z
NjoyNzRAMTc6MDsyNzg6MDo1MTk6ODM5NTo4OTc4OjAKTm92YSBDaW5lbWEgfCBUMjtEQiwg
UHJlY2hvZC4gTVVYIDEzOjUzMDAwMDpCOEQwRzhTMVQzMlkwUDA6VDoyNzUwMDoyODk9MzY6
MjkwQDE3OjA7Mjk0OjA6NTIwOjgzOTU6ODk3ODowCk5vdmEgQWN0aW9uIHwgVDI7REIsIFBy
ZWNob2QuIE1VWCAxMzo1MzAwMDA6QjhEMEc4UzFUMzJZMFAwOlQ6Mjc1MDA6MzA1PTM2OjMw
NkAxNzowOzMxMDowOjUyMTo4Mzk1Ojg5Nzg6MApOb3ZhIEdvbGQgfCBUMjtEQiwgUHJlY2hv
ZC4gTVVYIDEzOjUzMDAwMDpCOEQwRzhTMVQzMlkwUDA6VDoyNzUwMDozMjE9MzY6MzIyQDE3
OjA7MzI2OjA6NTIyOjgzOTU6ODk3ODowCk5vdmEgMiB8IFQyO0RCLCBQcmVjaG9kLiBNVVgg
MTM6NTMwMDAwOkI4RDBHOFMxVDMyWTBQMDpUOjI3NTAwOjMzNz0zNjozMzhAMTc6MDszNDI6
MDo1MjM6ODM5NTo4OTc4OjAKUHJpbWEgQ29tZWR5IENlbnRyYWwgSEQgfCBUMjtEQiwgUHJl
Y2hvZC4gTVVYIDEzOjUzMDAwMDpCOEQwRzhTMVQzMlkwUDA6VDoyNzUwMDo1Mjk9MzY6NTMw
PWN6ZUAxNyw1MzE9Y3plOjA6MDo4MDI6ODM5NTo4OTc4OjAKSk9KIEZhbWlseSBIRCB8IFQy
O0RCLCBQcmVjaG9kLiBNVVggMTM6NTMwMDAwOkI4RDBHOFMxVDMyWTBQMDpUOjI3NTAwOjc4
NT0zNjo3ODY9Y3plQDE3LDc4OD1xYWE6Nzg5OjA6MjU2NDo4Mzk1Ojg5Nzg6MApUViBSRUJF
TCB8IFQyO0RCLCBQcmVjaG9kLiBNVVggMTM6NTMwMDAwOkI4RDBHOFMxVDMyWTBQMDpUOjI3
NTAwOjEzMTM9MzY6MTMxND1jemVAMTcsMTMxNT1jemU6MDowOjI4MTk6ODM5NTo4OTc4OjAK
VFYgUkVMQVggfCBUMjtEQiwgUHJlY2hvZC4gTVVYIDEzOjUzMDAwMDpCOEQwRzhTMVQzMlkw
UDA6VDoyNzUwMDoxMjk3PTM2OjEyOTg9Y3plQDE3LDEyOTk9Y3plOjA6MDoyODIwOjgzOTU6
ODk3ODowCktJTk9TVkVUIHwgVDI7REIsIFByZWNob2QuIE1VWCAxMzo1MzAwMDA6QjhEMEc4
UzFUMzJZMFAwOlQ6Mjc1MDA6MTgwOT0zNjoxODEwQDE3OjA6MDo2MTQ2OjgzOTU6ODk3ODow
ClByaW1hIExPVkUgfCBUMjtDRVNLRSBSQURJT0tPTVVOSUtBQ0U6NTU0MDAwOkI4RDBHOFMx
VDMyWTBQMDpUOjI3NTAwOjQwODE9MzY6NDA4Mj1jemVAMTc6MDowOjc4Mjo4Mzk1OjYxOTU4
OjAKUHJpbWEgWk9PTSB8IFQyO0NFU0tFIFJBRElPS09NVU5JS0FDRTo1NTQwMDA6QjhEMEc4
UzFUMzJZMFAwOlQ6Mjc1MDA6NDEwMT0zNjo0MTAyPWN6ZUAxNzowOjA6NzgzOjgzOTU6NjE5
NTg6MApQcmltYSBNQVggfCBUMjtDRVNLRSBSQURJT0tPTVVOSUtBQ0U6NTU0MDAwOkI4RDBH
OFMxVDMyWTBQMDpUOjI3NTAwOjQxMjE9MzY6NDEyMj1jemVAMTc6NDEzMDowOjc4NTo4Mzk1
OjYxOTU4OjAKQkFSUkFORE9WIFRWIHwgVDI7Q0VTS0UgUkFESU9LT01VTklLQUNFOjU1NDAw
MDpCOEQwRzhTMVQzMlkwUDA6VDoyNzUwMDo0MTQxPTM2OjQxNDI9Y3plQDE3LDQxNDM9Y3pl
OjQxNTA6MDoyMDU4OjgzOTU6NjE5NTg6MApLaW5vIEJhcnJhbmRvdiB8IFQyO0NFU0tFIFJB
RElPS09NVU5JS0FDRTo1NTQwMDA6QjhEMEc4UzFUMzJZMFAwOlQ6Mjc1MDA6NDE2MT0zNjo0
MTYyPWN6ZUAxNyw0MTYzPWN6ZTo0MTcwOjA6MjA1Njo4Mzk1OjYxOTU4OjAKQmFycmFuZG92
IEtSSU1JIHwgVDI7Q0VTS0UgUkFESU9LT01VTklLQUNFOjU1NDAwMDpCOEQwRzhTMVQzMlkw
UDA6VDoyNzUwMDo0MTgxPTM2OjQxODI9Y3plQDE3LDQxODM9Y3plOjQxOTA6MDoyMDU1Ojgz
OTU6NjE5NTg6MApPQ0tPIFNUQVIgfCBUMjtDRVNLRSBSQURJT0tPTVVOSUtBQ0U6NTU0MDAw
OkI4RDBHOFMxVDMyWTBQMDpUOjI3NTAwOjQyMjE9MzY6NDIyMj1jemVAMTc6MDowOjEwMjk6
ODM5NTo2MTk1ODowClNsYWdyIFRWIHwgVDI7Q0VTS0UgUkFESU9LT01VTklLQUNFOjU1NDAw
MDpCOEQwRzhTMVQzMlkwUDA6VDoyNzUwMDo0MjQxPTM2OjQyNDI9Y3plQDE3OjA6MDo1NjM1
OjgzOTU6NjE5NTg6MApPY2tvIHwgVDI7Q0VTS0UgUkFESU9LT01VTklLQUNFOjU1NDAwMDpC
OEQwRzhTMVQzMlkwUDA6VDoyNzUwMDo0MjAxPTM2OjQyMDI9Y3plQDE3OjA6MDoxMDI4Ojgz
OTU6NjE5NTg6MApQcmltYSB8IFQyO0NFU0tFIFJBRElPS09NVU5JS0FDRTo1NTQwMDA6QjhE
MEc4UzFUMzJZMFAwOlQ6Mjc1MDA6NDA0MT0zNjo0MDQyPWN6ZUAxNyw0MDQzPWN6ZTo0MDUw
OjA6Nzg2OjgzOTU6NjE5NTg6MApQcmltYSBDT09MIHwgVDI7Q0VTS0UgUkFESU9LT01VTklL
QUNFOjU1NDAwMDpCOEQwRzhTMVQzMlkwUDA6VDoyNzUwMDo0MDYxPTM2OjQwNjI9Y3plQDE3
OjQwNzA6MDo3ODc6ODM5NTo2MTk1ODowCkJhcnJhbmRvdiBOZXdzIHwgVDI7Q0VTS0UgUkFE
SU9LT01VTklLQUNFOjU1NDAwMDpCOEQwRzhTMVQzMlkwUDA6VDoyNzUwMDo0MjYxPTM2OjQy
NjI9Y3plQDE3OjA6MDoyMDU5OjgzOTU6NjE5NTg6MApOb2UgVFYgfCBUMjtDRVNLRSBSQURJ
T0tPTVVOSUtBQ0U6NTU0MDAwOkI4RDBHOFMxVDMyWTBQMDpUOjI3NTAwOjQzMDE9MzY6NDMw
Mj1jemVAMTc6MDowOjEyODI6ODM5NTo2MTk1ODowClNsYWdyIDIgfCBUMjtDRVNLRSBSQURJ
T0tPTVVOSUtBQ0U6NTU0MDAwOkI4RDBHOFMxVDMyWTBQMDpUOjI3NTAwOjQzMjE9MzY6NDMy
Mj1jemVAMTc6MDowOjU2Mzc6ODM5NTo2MTk1ODowCk5PVkEgQ0lORU1BIHwgVDI7Q0VTS0Ug
UkFESU9LT01VTklLQUNFOjU1NDAwMDpCOEQwRzhTMVQzMlkwUDA6VDoyNzUwMDo0MDIxPTM2
OjQwMjI9Y3plQDE3OjQwMzA6MDo1MjA6ODM5NTo2MTk1ODowCk5PVkEgfCBUMjtDRVNLRSBS
QURJT0tPTVVOSUtBQ0U6NTU0MDAwOkI4RDBHOFMxVDMyWTBQMDpUOjI3NTAwOjQwMDE9MzY6
NDAwMj1jemVAMTcsNDAwMz1jemU6NDAxMDowOjUxOTo4Mzk1OjYxOTU4OjAKU2V6bmFtLmN6
IFRWIHwgVDI7Q0VTS0UgUkFESU9LT01VTklLQUNFOjU1NDAwMDpCOEQwRzhTMVQzMlkwUDA6
VDoyNzUwMDo1MzQxPTM2OjUzNDI9Y3plQDE3OjA6MDo2OTE1OjgzOTU6NjE5NTg6MApQcmlt
YSBLUklNSSB8IFQyO0NFU0tFIFJBRElPS09NVU5JS0FDRTo1NTQwMDA6QjhEMEc4UzFUMzJZ
MFAwOlQ6Mjc1MDA6NTI4MT0zNjo1MjgyPWN6ZUAxNzo1MjkwOjA6Nzg5OjgzOTU6NjE5NTg6
MApQcm9nbGFzIHwgVDI7Q0VTS0UgUkFESU9LT01VTklLQUNFOjU1NDAwMDpCOEQwRzhTMVQz
MlkwUDA6VDoyNzUwMDowOjQ1MDI9Y3plQDE3OjA6MDoxNzE1NDo4Mzk1OjYxOTU4OjAK
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  xine_err_out.txt
     Date:  1 May 2019, 19:09
     Size:  562 bytes.
     Type:  Unix-text

--Message-Boundary-25148
Content-type: Application/Octet-stream; name="xine_err_out.txt"; type=Unix-text
Content-disposition: attachment; filename="xine_err_out.txt"
Content-transfer-encoding: BASE64

VGhpcyBpcyB4aW5lIChYMTEgZ3VpKSAtIGEgZnJlZSB2aWRlbyBwbGF5ZXIgdjAuOTkuOS4K
KGMpIDIwMDAtMjAxNCBUaGUgeGluZSBUZWFtLgpGYWlsZWQgdG8gb3BlbiBWRFBBVSBiYWNr
ZW5kIGxpYnZkcGF1X2k5NjUuc286IGNhbm5vdCBvcGVuIHNoYXJlZCBvYmplY3QgZmlsZTog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQp2b192ZHBhdTogQ2FuJ3QgY3JlYXRlIHZkcCBk
ZXZpY2UgOiBObyB2ZHBhdSBpbXBsZW1lbnRhdGlvbi4KbGlidmEgaW5mbzogVkEtQVBJIHZl
cnNpb24gMS40LjAKbGlidmEgaW5mbzogdmFfZ2V0RHJpdmVyTmFtZSgpIHJldHVybnMgMAps
aWJ2YSBpbmZvOiBUcnlpbmcgdG8gb3BlbiAvdXNyL2xpYi94ODZfNjQtbGludXgtZ251L2Ry
aS9pOTY1X2Rydl92aWRlby5zbwpsaWJ2YSBpbmZvOiBGb3VuZCBpbml0IGZ1bmN0aW9uIF9f
dmFEcml2ZXJJbml0XzFfNApsaWJ2YSBlcnJvcjogL3Vzci9saWIveDg2XzY0LWxpbnV4LWdu
dS9kcmkvaTk2NV9kcnZfdmlkZW8uc28gaW5pdCBmYWlsZWQKbGlidmEgaW5mbzogdmFfb3Bl
bkRyaXZlcigpIHJldHVybnMgLTEKCg==
--Message-Boundary-25148
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  more_logs.zip
     Date:  2 May 2019, 16:29
     Size:  61447 bytes.
     Type:  ZIP-archive

--Message-Boundary-25148
Content-type: Application/ZIP; name="more_logs.zip"
Content-disposition: attachment; filename="more_logs.zip"
Content-transfer-encoding: BASE64

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
S59CTNkjnwqEBvOpQ2giDI6FNUNozG/mdDEa3kbgW4rpI+gKoSnfKxxDBwiOuR1DU8LgmNsj
hLa7Xb08q1F6bAVxvCrA1g3mcA6oSQyOyaJBaFSTEJohtLkG6p8n6HVkhh9id1fpZuxNY3Aw
mUDyoCTNcP2Bm9LhbQ8OqjA3EHWKFW8j7qEXB3ZgKTGHXb+ojuLT02Oq7GCeuWCA5s2RU2bh
PEDu5mKkP583JfHrOHIdk8Xgc9oKp7H158gqs/ceoObN3NXAcJNOwXLxmBk7hMYaPCgKc0Lq
fYSq0EdK9ii0YLGyolXRhNbEbB6sFrY3M4bQ5oTA/KoW0taCVEgzk4NrCEsJ89wGXoOpKdG4
SKNVvNPBD5xpsc3VjCoxsJRSNWcH5+CxIy5io+Dm0inALoplPdqE4V4h3+BEOQSP8QgrGiZp
c/95evrk+7gy8NnZ5ZQo9+Vy/61x8dZENUVp+Ysd1o45X1s6W1amKNmcf56OFn8eP11MtFrj
lz9+/XVxPl0+P18cHk2L06NldB69OD56HBP3t6bL9d9y3rMsnX5+udzF5eHl8kvwCzO1tKrh
b+5Nf1wsjoyrvCJ4vni6OP7z9fzSTX4srJzS0qnPD0+fHZ8+m5ZLXExnv67/4XTx20RLml+d
/Xk4HUxP4t706/nZyRQr7y9/HnM5iDU9fict/9cOwlK9Wy9RXb32+Ok/i4MAU8lXVN4/Pl2c
XGfU+v7yZ71tD2tGPa0Zbb1EdfWaE6Nyxejdp5fHZ6ebjDjk/eXPalsOZcWIKawZbb1EdfWa
E6N6xejjs9+OrvGJtM+R1pvGuOYTy5rP1ktUV6858WlXfOI1Mlz3lz/rHbmtyaS4JrP1EtXV
a05k+vTom/Pjk6WCzk4WR39P7y9OL88Pf5s++WCTXY59P8e1YjKv47Jk8VZmWv81HVyF8fZf
o3oQcMYxTI8++/qz6aPDk+Pf/r7Bs7a8X9taR7WVlwRqa49/Pzxc86ytL5m+5hep/vebMFea
Hj35Yfruw/c+/GKTJjHxPjGtiwIxpZcEiClfc6nhV53cGq+ofvHuj9eoxl73V3+s94+9vdo/
9n6NquFXnajy9OjzT7/6+vsfPnxyjWoLfX/1x3r/RuHxK27CazKZJJBpUW8zq/Z1fik1mhbf
ml6cH589fn787PmeZRvebreWfVjfh7JiztMfjo8WZ98t1tPW8p8v/jq+fPp86eyVr7785sOP
6e04nZwdLa6vF3mYt9KGG+9Zlo43x4QUSljWz3A1JBjXGB0SWjSxSzvpIm3Ey7RN3k0XeXSf
5KuLazm87CmnFy/Olu4+n44OLw9fN09lDsv/Dt5rH4SP2/f0hONP4Ztw8GTJ4/prX8ZvwrcU
aP07P4aflr/jyu3agPUwKV6fuB4kxc0R7EESfDWTPUh2xiHtgdC9PqE9VJIbo9mD5Lcxjz1I
fhtD2Ez80nAz1Np53rMsvXUmEQvH8P+wYVxjeNhIJnZlp2GjbAwBpm3qbsNGvWWfLJqz87DB
47w1z9c9y9Llpi4qlbhsGHSlC+Maw7ooJnZtJ120jXiZtum76aKP7tN21kUa5615vu9Zlm43
dcHc0ka9MK4xrItmYdfDLrroYSNepm1oJ110Gt0n7KyLzMO8Fc932rMsHbbOtqmU9H+9MK4x
qoseTOx2Oszom4cZpm12O8zofMs+STTHeF+/itafplKk7/K8ep/aurrtfeoxeIfQW3vnEXS+
G7QalJaEoLz80izr6qYbYsbQRFb4mN5KdzCNIbRZMHrQmvQ8xV6Kg21mSdlSadg2KWqcs4Nl
lCD4VjcoI+gEoQmEQ2hwb8xvDUKT2fIhPcZSZT3WIXIMwTuEThAa25siBC830c0lpvmqqFpX
t7l1CE0Mwc2OMSbqGBzjDm4eMfhW0+t3CI8QukFowjbHDO9WtP55L5KmVymR60EII9wChKYI
wRlCm/a+eZdb4c2b3FJ+7T1uq3WHr1O1K22zwTfOh3raeO/auMTwMcCWP0laeaf3rvvme9em
bXZ777rn0X1sN3fqaL35tpKFpA3p6sLMur4x74bgbEVrxuUehNvxSyxtzLidTuZGrc1WNnoo
uUihjGHMWkNfG0WTFa1/PyY36fsxw2Ak52HH0mPEc6oO3IIVrXouS6qo1UUVZBYtVr2w8jBH
beoQmhIEv+dkLCkm8+NbZmM3Q1jMUVEn4FCbUIJTKg6eKVa0/gGsIn22PbJHKTAXqgcZN0rS
oFBCcvAMVmjMUZ+jQNNd1VgtMD3mLEg2sct4imkW9C0u2liTVGx8yrA58io9bhI9it0jqcDY
YaHb8k0cQRcrWq9Womf55WWNdX2bLEfZUQihSB+Cph4c+AUrWk+b1KW0YXZgZ1aGPkGIz2CO
ySO2BAe3lS7U49Zq96AHoSuEpgzBzY6dgXqE0ATCYcXnKJ1AcciljmlKT6lKQj1qKeexDWyT
6xAadD6WMfZyMINqMepwF+i1BGGw7Ck5aMJeTNQmWjJLmuXBnDDS41F6IYcu9fjSr2hbd7Cd
bwyhKVnhapdjyfstc3Uwzk7PVm9GjaNSszSfVYqK9tMIP4pWuOr9KDk/9OrALlvRg99klmoe
Y6dPp+JbFp362Pq2bjPKjpr9KVij5AiOTREfUFJq9FBOsKL1mik5j2JxcR5b4WpD7PJXV1Fx
qQpkhav8gtiwY/KgB0tPKws9OrAjs/ZsHWPUuNarpIymlLw8Qo7YCr/lkrRJl6QtOtCLVrSe
9b1LWd/YgV2G0AlCNytan8BzFAtODA6uIbN1auQ4tJGUHqJXrGidnairrOmqDK5fUxGiU0so
Y+vblDeEpmiFq8bFJrWSOGaaeqCRiaWD76ZNsHXIegwdrPDbLv3kdlDzmHlD9wNnanFseeMc
MgRvEDpBaIw5trfZbi2mqUvTWw48qBlbkx5Cm/2q6pXkjKDhjLAds43yy5QFejlHj4QyK2OO
dGQrWpVlFV3DoTu4xhw422w3hLbXeSwnZjAc1ARhjusQ2izIGUL+b3NXshtJEUR/pS5IY4Eg
IyPXlriwiAOrALFJHIzdDJYGG2wzSHw95ZkxrrYjh5f9sqZ9QUjjF/nixZZVXZUFV2J7sqek
1rVKjiM6Becd1+PhjGw2iiRqbUrSiA6PZ3ybXo4P6YUSD9/HYPSQT+/3soOTsjlc1dytxuRs
dqWHXaHQiqLbD1+5HuG7yEUKLRTaUehAocVT8ISi2xen3hv3yF0OA4IqnLIVRbdvioiat2zy
COfoeursZOJ66GUU3RRPghjiqY8D2EUUfRDtAoWGlceGf7c09hfLUmfYWtbVh5oM5VWi9K0A
NbQ9+CU16IWQB7ATReHNnVkMxdiZZfU2va7nUEVQeN+nJ3wqbgC9hKLbmR2tO421PgZy0WpI
KQWbW9cDOoqim1kXksFN3QBu4lF4c9DYzw6lqo+CnvdOjJLQEkfQQ9FNdlqiwS7HEeLBeQdt
q/vQsDLYz33ikbfsxe98S0b//1syoOWwY7jua7bucxxsjYgW9eFxsFV98/190d637FvswhFi
ea/jYOvyOFhomf2Og625d519j4Od7QXmGGOZnnxwfDn/wenF8+mL7d9Xtx8SkfDyqOIPNXzk
PlH/eQrflh9fHmT86l/v/kDDy7/4xr38m5EM/fTk6+3Ts4vz42fnZ9P19tkcjn+204c/PTqm
Oj355tnx08vJPzpqYXry5Yeffjl9/MNXX3/8zaOjF2fl/piH2BQfHbUXHxfYTt9+9+iY5ZvC
uL6ce8NfV2cnj5HhPCy++vL7j78+FLfFh3MafMSJvH3zn/f9Rpz4uy/mGP+kN/90j0PpHhqt
sZePENPp/lCO2Xk3l7fcjmXQSvdYTvf4eeN6KDrZYyzPqMW4hJbx+4zlGda7juw9ljV38zaV
vwEdIablfmbUEJenLoM2OvNixkDsdK+80EW8oGXCfnkRetfRvfMi1m7eLeXDEWJa7+eFxlKq
n56kV4kBGulODN2hV8xbY9HFvRIjLgIGLZP2S4zUu07EfvlowvfMq246EaXTvkmTzSfaY729
n4muANwr6EXD3gE/M/Wi4bRH7tj2wgOFThQaFr15wzRb7+GmkuOAhBKPwrseCs45jCBHobmg
ZwpN5itXLFy+Cqcb3kKB55X2SMfgnPVciQ5IRy4luPZJylooNJnN+JB/fK7D+bhGJXKLs1GD
ZW+VYvLZ+MGqSPEDihEOa9/vkEO4ccKT/ZdMGjjqa8A518kOC0etlVEaSjFSKpUheyFOWTIr
YG1WuGqBK32NeuBUh/O5lVLees8iBBmQUNxuhgspucfk0PBQbj/faz9fI9p5RdZ+ibQYczO5
PuvIk1ndcFj612R0gh9I3MN+qmoEJ6s7/BUALt4aTZgcIFwXhmtuhbXJjOfmB6k6h+Z0Yz2H
s739zL0ztugxxZAH1DJ5VcqJA2uzRhviCoKTjVSd0+1hRksPvFJobu1CocVRcI66UGjS8Te0
ePtMNm/sFP870Rc1DzbYPvgh0Vw+co4rhSZ7iEQKDnNvJaSKiLE9TiEOyEiuQcK+rSHsIVOK
QycU3XVuTCphQEKQdS6wMs10T848sjPqAO9gdqRzq8APWS5wynJdpv2LdTAyPgcdMpUp9BuK
SlMZl7KhjI8yQhnYuSY9qUY1q9QR9Lh6yhSa7ZNw4FdIWXiPzBXzKk2QQsOOt8/AUG9NXlcH
pDOXkNwml8xmLixcLXCycY7TCWWfz6gjuiMXE7K/cSGFx846QYk1VavKSz54WDhduVIhGz/c
oNpHPxX72O6DR4XbHZOlhgu7Qk6QnZ/cBnHCHTRqcJNaY3FyE8Ytzq1NBo1bnEt2eO3XHL9a
rEM8i3Mjbo6QnYB2z3tXep4z6KLHNUm23rgNDazsGotzwnH9ncxIrlxZOOf6IWUneyy3OLmd
eVCovgctysEjBxcOTqFJ6oGCewrNOY5Tbx/5XpIxlvPtL8mofXD0dMETim5/7yf7nqncxU7g
wLdvMDvrA/1hADlOeD6tkrN8S5pHKE82OjhuazS6jKLbXz3UbGRNdnGAsnjg15ghHBruFhy6
FRfVYN55Uy86IjJwRbcIRvNJZak2Oe0ipyi8Sa6oGuI5ySPoRQpOO2cf35nVxxHOeQ7OaSOB
ghcKLRyaoy4OhTdnpPps5HwUGZAWcNJi3bALzaVUptCHXBvOCOwnii40tzaXLZzmZBnCTaC9
C6/O6s4uDChDuDk32VmPyNQ4okVwyU7rbr4RnYOMkB3PCnI/w0mzxlziGgHXhN5QRq0Rco46
JzpOvX2jo1Rr++xG9Am4h62wleAKkdteckHl1sZ3l+SuvtmdY1Ero8a0Zy6leOdqDYZzkssA
5zjfuD7ErX3IwYOP3Ne8a+LFiqpLjevs0EWQQnsU3ft2aqoDfIsouslOkzfYxZAGsCsouv1a
XDYfvpIB5GjpGnfKpYY+di37ORvmcx7huzgU3vkIqR9ArlLoRKGFzoqswdjQBSeSB2hDV5R5
7Vb8iLhxfZZEKwWHow5e9/VGJUtKZq2XAXGB2WHbmi40HNVmk41qKJOydwOU4QOXvLPoaR1B
j2YXokUujODG1RveZlfo8XAP5faDK1QTPLVXQAvseLuUrZ+/w5D9DNxnVthxwOj2lqHrpKvY
Q04CBxcKHlF0e49t3WouI5QpFNqj6KZn6mOwRkdqbcZSDz+l0A9aRV4FPeRjtL3sBKaHVfvj
ck5ReJOeuGrcEfDicxpA8IH4pZNfDMUH646Fc68ERFfAukIXWig0rY2Ieb9ERQYoI4GDKwen
0CR1FN2Mi0vBfIuwqB8QmYSimzWVzB90R9STDBBPqrfEi8kNIAiLh43ZLjTXbGDmLWWrGfc6
JvAVRTfZqXiDXahpALsB2rlqsEtVHwM78+6sSA4DyJFzgMt5iQeFU2g4qivoxvkN1/IaCQPv
ilYQ3VNoTnQu4PjcXSPinOdcvhxUN3KXy+X6IVUXjjqpG1flXMhJ3bigcdTJtbnFOTRZ5Zzn
3Fggk5Vb/KHntQsuHJxbvVBobm3WcwrNUYdla9+rTsa1zu0FEGp9BV0kcHAKrRSaCynnN5wQ
j68SOMeFi1mm0OIPCa8U2h0QLRycCzlXplzCcCHDZ22z7ZsnEubs4oDGD7PD9lBd6EO2IC6Z
uc4Nd5DXHGEg1hfH6oitAMyOQ7fPUzFcS3lErnNRw+dtM2xVrZvV6vIA5+D+2v6BpxrsxBcd
wI4cHviGoal9ycHQPvg0wjsOzWkD9+CmNM4no5toDSOk4bSBS7bdKl21WmUeUXOkc9zGgpt/
3JYIzthmly+uWJ9KLT7LiMDA4jS7oaj9LajohnQMuKFhFyG+68NqMLqtTg7VUqfqq2mBroB1
xE44hU4ouiVO9Mk6ECH6ksMAcWB+UN13eyeizgx9STLAO5gf1Jf6vfM1WGWv4tMA7yqFFqXg
D9DdZ/T2PTLpu87upNmJVmsfI0HEDeAnHoU3CQbvo0UwuDqAYKLQuHvYwO1WJ9QaxeiaLjod
oA6fXlLMkeedjuAnkYJXFN10L7tieFeqH+EcrD42z7ud87Fa3vma0gD34MprNlZnPUvtvRvR
WMnChuFt8V0US/wgnW2v3ViT1fhjkj77q+QuXNdN72owvPMqYYB3MDuy62OXz77rRM9MoSVS
cEXR7XniXTYvocKreYKugPXMXn7eJSvtZtCbZIf12y60o9BvKGu4hG/f4k3ZWTmXh0S1UGjx
KLzlXhFrzmgaUU+BQguXdLAyXLG1W5V94SKxjpAW5gfO5z44F1i4JMm0aIYmhWJGRvyAyHDa
VArNxpVr1NyI4XQjt0Wk5xx3sh7gmLdbleZgFkQsBy8IvNzJAblGXsChWYP7YVsJheaow+j2
bTWt1bqtVtyILR8ZV7ie2qf6mW8nupD7nBv0Wbo+7/G9RzO62XpYJsYB5ODNfFO6qsm67SMp
DKBHDhoubfU+uveoTXHJWWPK/XemCroC1rG60JFCS+DgtLa5mr/bJzdAWE+hM4pu3+gslm8p
pQG+cUnjKHSl0FxUDskczgiwixnwoPXn6eTbb/xNUj29uJ4kSLqx98LI1TtTSNkyf7WPaSc7
lgtiOFkup5+n0+3zs5Pt9MLiL3/9+uv2crr+7XJ7fDptz0/nenjyx9np+zcc3pmu5/+7AR0h
puPPt+auro+vrzaT1heSPMlvHU1/XW1PQSP/8bvcnmzPnv8/vft9NYaF5a/mcj9+uv307Hoz
nR5vf784n/6cNVsg1G80Glw0/zxt/3g6o66Pp78vz67/Y3Lj4OX1LZfs0y0Vze9Mf1yeXbz/
7OLvI26J2VlzgR2zN+4aZoPDmC9VDO6OOrlGI05hpyEEv9Fk2a0Y94Uood5RJ5ewVQ91x+ys
SDXMRsWYLzWJ2qAeN+r61mioHnfmfvQbzZbdftXjQnVyCVv1WHfMNhRJe6ieFqqTazRUTwvV
08b5jVo1lME6XYiSF2VKLmGrnt2O2bhRscwGjPlSkxzuqJNrNFTPYWlX/EatOq0F474QpZY7
6uQStuq1LM2+mBgPzSYB82WhSZJFwpBr2Kon2ckY7zfBGXY9yP1OlOQX1MklTNWT32UeN6qW
2f5cT36R6+QaDdX9Tq7rLIkYdjVh3BeiaLqjTi5hq65px2zcaLDMglW61EQXZUqu0VBdd+o0
uE2Mje371fHzs/On03vPjy/fOzk++W373vyv8//9/u7NaoCRMG+FP9u+tHLyw9n59ut583q9
fUUQNLDA3VwuXF48e62DNyDEwTAL9+kHH02XXaYfaJcs02FxBXA1X4mfzTv2347PT5/9T3Bu
oNAC8zD/9XJmPFuZ3Htuuv7r/P9Nz/P8X1BLAwQUAAAACAAtmaFOfpxOjAQvAADmPAQAHQAA
AHZkcl94aW5lX3Zhci1sb2ctbWVzc2FnZXMubG9n7J1bb+NEGIbv+RWjvaGVNo7Hh5zuCixn
2EJKuVitkGtPE1PHDrbTA7+ecdKSphvge+30rZBWWqXbtJnvmbHzvOOxnX7yQ3SnlFY6nHj2
31AtMxPPi+urSF0n5US98wJ//F6df/GzujZllRa58pzAcVVVR2VtEuHr4yIxlalVWqlPfzn7
sjf6VPXUVV7c5MIGsiJK0nxmf7qapflE9VdV2c/Si779pf7myar53n7bu01z41SFswYF2+9f
R9t2LfFq6cRFftmplWJVxqbq3E6SVuaPuHMzVVx2biOeR3lusu59qtOFKbs3ExeLRZQn3Rsq
TRwvDtBOZR+W86Kquzd1Ze4WUVwW3VuKo0VpqmWRV9je+MX5Z+rk9JsHATRvYvfWDd3P1FHj
hZuoUherNKvVTVrPNz86ORa2fVkWeW3yRLl9Vy3L4jq1omgq9s5erx+99ZfPN4+bCj+dTr97
/dPJD3rQPPpe8zgI1s94o+aLFw7U0atpmqWxxf0+uqjUNPX0YPRKjFWsLJNedz0x12lshC9M
87ROoyz987GsGiGpI9cZO8HxRE2Ly/omKo26iCqT2F+K7i6i+EqtKvua5neltaye6nWZMl1E
5d09qKoL5YEtxKuyNHmtqqs0b17/KoujsnolbGX/O3tuFqbqrxvqJeYyWmW10zwp7l0TME9G
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
yKhELsSoRCzEqEQsyKiiC6dbrgRLm++wbjGe6Odcy5Y2360HxLQFUo2JBaQaEwtJNSYXkGpM
LCDVmFhIqjG5gFRjYgGpxsRCUk0T0xYxKhELMSoRCzIqkQsxKhELMSoRCzIqkQsxKhELMSoR
CzEq875SwKhMLMCoTCzEqEwuwKhMLMCoTCzEqEwuwKhMLMCoTCzIqETTI0YlYiFGJWJBRiVy
IUYlYiFGJWJBRiVyIUYlYiFGJWIhRmXe5w4YlYkFGJWJhRiVyQUYlYkFGJWJhRiVyQUYlYkF
GJWJBRlV9DctWp9bkzXf6dya7ENA2vdA9Knxdbqw+MWqVjfzNDPq/m+h1wVUK+j4ucFoiWfe
D4EEZWIBCcrEQhKUyQUkKBMLSFAmFpKgTC4gQZlYQIIysZAEZX4qAGJUIhZiVCIWZFQiF2JU
IhZiVCIWZFQiF2JUIhZiVCIWZFTRrZCtZ/QB8a8zIsImYiHCJmJBwiZyIcImYiHCJmJBwiZy
IcImYiHCJmJBwhZ9zOuB1khEtbqtkYiWfFrnj+zTXw4zWrJanUYrFP29jvajRTwVBaQ1EwtI
ayYWktZMLiCtmVhAWjOxkLRmcgFpzcQC0pqJhaR1+PznZELRTWHtM+FxQPdXVdnP0ov+LFn4
zUPvtleZqkqL/J3Wo2Z0j968OVbm2uR1oFRPTe/y02nfa75GyzqNK3VWrOL5aZRM7AiWDcXF
ajbZPKt+Xy2WKjG1iWs7GpFlT9IqjsrEJE43rKkxal7Xy2rS799Ed5lt27ksjbnfNxy7zzQt
pPlyVfeTIu5rR3vOoF83XMso6TVodkfoxauyKsrKmdeLTF0WZYMbpVnVDe/jqLXB+zhqE9+d
uKIzmQeY4za1hthQMLZQCyz2FgJ3INaogVgfR60N1kuO2jPMOGwJ7WIjQNowKBZ5w2gfw2ON
GohFHjXP403spUsSZCzpkgQZS7wkQeaSLkmQsaRLEmQs8ZIEmUu6JEHGki5JkLHESxK+S73f
ADEqEQsxKhELMiqRCzEqEQsxKhELMiqRCzEqEQsxKhELMmrI40KMSsRCjErEgoxK5EKMSsRC
jErEgoxK5EKMSsRCjErEQozqiy6laHdOq2n+mT+FsClBzCogE5hYQCYwsZBMYHIBmcDEAjKB
iYVkApMLyAQmFpAJTCwoE4gXZCJGJWIhRiViQUYlciFGJWIhRiViQUYlciFGJWIhRiViyY2q
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
AlS46ARI/kgATOgEwSdalsAXvnSC4A4Hmxg1ATr2ZQK2wzHAdC1L4Fd6WN6K3BfJkvB9kSyB
4y+dAMlbBGwlRSZg8hedAIWaThBfRbIf+9AJkPyoCVCq8wiQCZ0gPpsyE6MmQAlbJ4ivYNhS
jUzA5D2C2Dhg8h4BulF1AiTvEcTGAZP3CGIrebZYZhEwE6MmQMlCJ0DyHgEqvXQCJH8kACYu
MgEqfT2C34+cx3X7sdm9fVRtqtf17qRIk9PrkxurzbK5OZmczPK8mF+bFVkxTa5dW5xOuj/a
tFfeffvr693neH+SfMrz+WKWLhf1tWVyeXJ9Nk2T4mqzez19vWne1dOnb+r1evrd0K1e4Oos
STo739R6mNW+rXf12V8+51epK/te6mSWzrLTzjG3ttsHm7PVq6ptdk8P222za6/cuXv7+f3T
yZPvmv2s5WlbtYf946ZdLVf17kFbv+s/4zzvP+LV6nPVdjRXv/13J7VqNv2fXN03y/Zjtatf
HLZnVVu/qD5Uq3X1cl0P8CHv3Xp26+Hp5LDp9fpZ0Dcbk+ZDvVt36qtXzeb/m+mv4HJX12f1
/m3bbKf3uvnV9/tkdjKbLXq796ruH8867R9Xsbspnv+0V716f1jt6snLw36yqd7Vk0u/7orH
1aFdrQ/7S398AlRN6OGF5L3wQib+heALUEsBAj8AFAAAAAgALJmhTuplOfo5hQAA33wFABoA
JAAAAAAAAAAgAAAAAAAAAHZkcl92YWFwaWRldmljZV9zdHJhY2UudHh0CgAgAAAAAAABABgA
ALoGoEAA1QHSGkp6VADVAdIaSnpUANUBUEsBAj8AFAAAAAgALJmhTsTvqWHCOQAApZ8DABoA
JAAAAAAAAAAgAAAAcYUAAHZkcl94aW5lX3Zhci1sb2ctZGVidWcubG9nCgAgAAAAAAABABgA
ALoGoEAA1QGcCZt6VADVAZwJm3pUANUBUEsBAj8AFAAAAAgALZmhTn6cTowELwAA5jwEAB0A
JAAAAAAAAAAgAAAAa78AAHZkcl94aW5lX3Zhci1sb2ctbWVzc2FnZXMubG9nCgAgAAAAAAAB
ABgAAOc3oUAA1QEfmrd6VADVAR+at3pUANUBUEsFBgAAAAADAAMARwEAAKruAAAAAA==

--Message-Boundary-25148--
