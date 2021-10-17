Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962274305C1
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 02:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241322AbhJQA4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Oct 2021 20:56:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241313AbhJQA4p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Oct 2021 20:56:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D456560FDA;
        Sun, 17 Oct 2021 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634432075;
        bh=OEmB551Hy+I9B84wxjtS6fH5Iz7Na56wjkuE9tlgOGU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zn1X4X7cLibXhQTb3hFsVMOA+Y3znbrReV6Pt0apdd4aOKoYdaHsR4r+LuFF7gRkd
         cS2frlPx5p3UL1fVxMm4lQsMVbxlIeA42pYVn/VkbNy72Ld0Xc57hb/x39yKhzX48B
         qzw7x2s9rZNM6XgAEcBu3KTdqco7P3F8APiCrtnQHIHBRrbtl5LUH6p0mB/JZmPLBJ
         RA9s5Wr5FUNmGBZhdL42agZlKb+Lvc/70telBdUicep2BCkNw+sts/h751pgEe3hDk
         e7qHSTQxH+toOWJ1uO4R+pblGVDlcGEFubc106ProwKzaEC4hOzjPMMYCsk2rnPWk9
         oXzoKCFcsZ1eQ==
Date:   Sun, 17 Oct 2021 01:54:31 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Debucquoy Anthony <d.tonitch@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [Update] Grabster AV 350 no audio (now works with tvtime)
Message-ID: <20211017015431.3ccee22b@sal.lan>
In-Reply-To: <YWsNWs0JutJNHAeC@toninux>
References: <YVXA2vZtsdzJD5Vs@toninux>
        <20211001091909.16f24ed9@coco.lan>
        <YWsNWs0JutJNHAeC@toninux>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 16 Oct 2021 19:35:22 +0200
Debucquoy Anthony <d.tonitch@gmail.com> escreveu:

Don't top post. It makes really hard for people to follow the discussions.

This time, I'll re-order the discussion for it to make sense.

> On Fri, Oct 01, 2021 at 09:19:09AM +0200, Mauro Carvalho Chehab wrote:
> > Hi Anthony,
> > 
> > Em Thu, 30 Sep 2021 15:51:22 +0200
> > Debucquoy Anthony <d.tonitch@gmail.com> escreveu:
> >   
> > > Hello,
> > > 
> > > I have currently have a (Grabster AV 350)
> > > [https://www.terratec.de/details.php?artnr=10599&lang=en]
> > > (and 300 that work even less but I will do another thread for it I think) 
> > > 
> > > I can easily get video output out of it with /dev/video0 but the problem
> > > is that I can't get audio by any way  
> > 
> > ...
> >   
> > > [ 7275.368159 ] em28xx 1-8:1.0: Identified as Terratec AV350 (card=68)
> > > [ 7275.368163 ] em28xx 1-8:1.0: analog set to isoc mode.
> > > [ 7275.368192 ] em28xx 1-8:1.0: Registering V4L2 extension
> > > [ 7275.497387 ] tvp5150 9-005c: tvp5150 (4.0) chip found @ 0xb8 (1-8:1.0)
> > > [ 7275.497396 ] tvp5150 9-005c: tvp5150am1 detected.
> > > [ 7278.429769 ] em28xx 1-8:1.0: Config register raw data: 0x50
> > > [ 7278.470775 ] em28xx 1-8:1.0: AC97 vendor ID = 0x83847666
> > > [ 7278.490776 ] em28xx 1-8:1.0: AC97 features = 0x6a90
> > > [ 7278.490782 ] em28xx 1-8:1.0: Sigmatel audio processor detected (stac
> > > 9766)  
> > 
> > The em28xx devices use an external chip for audio, using AC97.
> > 
> > As AC97 is an industry standard, it is possible for board vendors
> > to replace it with different chips. They do that with time, selecting
> > a different chip when they need/want.
> > 
> > The boards entry at the em28xx has configurations for the device that
> > was used at the time the code was introduced, but this may not be
> > the case anymore for a newer device.
> > 
> > Anyway, the AC97 chips have several different entries. From its
> > datasheet:
> > 
> > 	https://www.digchip.com/datasheets/parts/datasheet/649/STAC9766-pdf.php
> > 
> > It sees that it has the following input lines:
> > 
> > 	pc beep
> > 	phone
> > 	aux
> > 	video
> > 	cd
> > 	mic
> > 	line in
> > 
> > They also have a "Master" volume that the driver sets to be in 100%
> > (but some apps and pulseaudio might reduce it to 0%, causing the device
> > to be muted).
> > 
> > Anyway, the AC97 Kernel support will expose all lines reported by the
> > hardware via an ALSA mixer. 
> > 
> > The AV 350 entry assumes that the "line in" mixer entry is the one 
> > containing the audio. So, it will place the volume for such line
> > in 100%.
> > 
> > However, maybe, on your device, some other input was used instead.
> > 
> > If this is the case, all you need to do is to open a mixer, unmute
> > the right line and manually increase the volume.
> > 
> > -
> > 
> > There's a separate issue that might explain why some people
> > are using a different card: some boards require a command to
> > enable some pins (called GPIO). Those are used, among other
> > things, to enable/disable some external chips. In the case of
> > the original AV 350 that was used to add support for it,
> > it used some of those GPIOs to enable the AC97 inputs.
> > If your AV 350 requires a different setting, that will require
> > to patch the Kernel, but it is more likely that the problem on
> > your device is just due to a different AC97 volume.

> Hey, I'm really sorry about Up this thread but I found some things that
> can help but I'm not experimented enough to understand how to make it
> work properly!
> 
> By looking on the net with the info you gave me in the previous message,
> some people have request to try to use tvtime or xawtv !
> 
> So did I! and with tvtime, it was the first time I eared some song out
> of my device!

Ok. It means that there's nothing wrong with the Kernel driver.

What xawtv and tvtime does is that it starts a thread that does
something similar to:

	$ arecord -D hw:1 -r 48000 -c 2 -f S16_LE | aplay -D hw:0

E. g. the thread reads audio from the capture card (in the above
example, hw:1) and sends its output to another device (hw:0, on
the above example).

> this is great news but I can't use it to record as I want!

You need to pass the right alsa device to the video recorder application.

E. g., using a command line command, it would be something like:

	$ mencoder -tv driver=v4l2:device=/dev/video0:norm=pal-b:width=720:height=576:input=0:alsa:adevice=hw.1":amode=1:forceaudio:fps=25 tv:// -o my_output.mpg -oac mp3lame -lameopts cbr:br=224 -ovc lavc -lavcopts dia=-2:vcodec=mpeg4:vbitrate=1500 -noodml

I didn't test, but maybe some app like obs-studio would equally work,
provided that you set the audio input device to the one exported by
the em28xx driver, and that you set the right byte speed (if I'm not mistaken,
most em28xx devices use 48k, but this depends on the AC97 chipset).

> By the way, the sound came out of one of my headset that I don't use but
> is still plug in my pc by usb! this is not the default on pulse neither
> on alsa (at least to my knowledge)!

I guess there are parameters on both xawtv/tvtime to setup the audio
output device, but they offer limited support to control it.

> Then I tried with xawtv and this is the opposite, it doesn't even bother
> to launch (rip) ^^
> 
> So maybe anyone know what tvtime does differently that make my device
> work ? 
> 
> Again, sorry for the up ? :'(
> Hopefully you can undestand!
> 
> Thanks a lot for your help so far!
