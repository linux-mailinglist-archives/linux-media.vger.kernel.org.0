Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B0B4474FE
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 19:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236139AbhKGSvC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 13:51:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:35084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233686AbhKGSvA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 13:51:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A31F460E94;
        Sun,  7 Nov 2021 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636310897;
        bh=UXttkNCa6lBObOVrSyhUfsI6/Q2HGzz4UFRXcq7Vb3k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bGAisXT41CK0uh0W0uUwQ/b+1RdT7HrqGuiKJw3HU+0SR6ShZE8M9wgNTSe85aY3A
         r1tPqdLrjfUQzOg7LZEE3Jco6Aolf4J0HOqdFI//VX2QuJAXjfM9jZEa4/VP87MSK6
         XsEr/LRIdUi24GJuG2bNHikwoBemG3AgSHEhp1nJuXpgkSrJVnSa4goNDPUrHw1rR+
         tHmjPbp5Qylqt9TI9mlYCXJ/EJX5NPYHtd0LIzGA8UvCWLA1l96zf/pyEqSyhd91En
         fyAzNorYRZ7T0ySnelThdoxLL69JueRS+rP2hmva3+J89m7+pqg7h71RYOntsBmz30
         /2MHJmNWT5rAA==
Date:   Sun, 7 Nov 2021 18:48:11 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        libcamera-devel@lists.libcamera.org
Subject: Re: [RFC] media: Auto exposure/gain support for atomisp / libcamera
 integration ?
Message-ID: <20211107184811.7c8a0d1b@sal.lan>
In-Reply-To: <20211107175013.355188-1-hdegoede@redhat.com>
References: <20211107175013.355188-1-hdegoede@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun,  7 Nov 2021 18:50:13 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi All,
> 
> Now that we have the atomisp2 driver running on some devices like
> the Asus T101HA; and with the exposure + gain controls for the ov2680
> sensor found on that laptop fixed:
> 
> https://lore.kernel.org/linux-media/20211107171549.267583-1-hdegoede@redhat.com/

Thanks for that! Yeah, those controls are needed in order to get a
more realistic image.

> I believe we need to start thinking about various userspace API
> concerns. Thanks to Mauro's great work on various V4L2 API things
> are starting to work (somewhat) with regular V4L2 apps, but we really
> also need some processing / 3A stuff to make the cameras really
> usable.

True.

> 
> The most important thing needed is automatic exposure + gain control,
> ATM this relies on a custom ATOMISP ioctl, but I believe that we can
> just export the controls as regular v4l2 controls on the sensor subdev,
> at least for the ov2680 the exposure is already exported this way
> but it is read-only. Does anyone see any problems with just making
> these normal v4l2 controls on the sensor subdev ?

While it is in staging, I don't see any troubles, but we need
to think a little bit about that before moving it out of staging.

Yet, one thing that it makes sense would be to allow multiple
opens at the /dev/video?. This way, external apps could touch
controls while the video is streaming, just like a normal V4L2
device.

> We can then simulate the custom ATOMISP ioctl through the subdevs,
> or we can just remove it alltogether.

For now, I would keep it.

> Once we have the controls available this way I think we should write
> a libcamera plugin, > which like the older versions of the Rasberry Pi
> plugin (if I've understood things correctly) won't use the MC framework
> for now. 

Sounds like a plan to me, but I guess we'll need to solve support for
MMAP too, before adding an experimental plugin on libcamera.

> I believe we first need to understand the atomisp code better
> before we add MC support (*).
>
> *) I do believe that in the end MC support makes sense at least
> to tie together the 

I do think it should be exposing pipelines via MC. See, there are
two separate things here:

a. expose internal pipelines and subdevs via MC;
b. be MC-centric or video-centric device. See item 1.1.1 at [1]

  [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/open.html

The UVC driver exposes its internal topology via MC but it is a
video-centric device. There are other devices that do that too.

I do think we should implement (a).

It seems that we're reaching a consensus that further studies are 
needed before doing (b).

So, I guess that, for now, we should let the driver to register
their subdevs, but keep the control video-centric. We could then
experiment with AAA using subdevs, and try to get a better picture
about what should be done next with regards to MC.

> But I still believe that an (experimental)
> plugin would be good, both to get something usable so that we can get
> more testers / more people interested in contributing.
> Another reason is to have another use-case where apps need to support
> libcamera to work properly (like on IPU3 devices) which will hopefully
> motivate people working on apps to put more effort in supporting libcamera
> (preferably through the new pipewire libcamera plugin so that things
> will also work in a flatpack sandbox).

I didn't play yet with libcamera, but if we have an experimental
plugin to support the devices I have, I could add support for it on
Camorama. After my addition of USERPTR at camorama, I was able to confine
most of V4L2 and libv4l stuff on a single file, abstracting other parts 
from the rest of camorama code. So, maybe it won't be too complex to
make it also support libcamera. I'll see when time comes.

> ###
> 
> On other thing which I'm wondering about is the need to call S_INPUT to
> select front / back in this list from Mauro:
> 
> 	$ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> 	/dev/video0:	Name             : ATOMISP ISP CAPTURE output
> 	/dev/video1:	Name             : ATOMISP ISP VIEWFINDER output
> 	/dev/video2:	Name             : ATOMISP ISP PREVIEW output
> 	/dev/video3:	Name             : ATOMISP ISP VIDEO output
> 	/dev/video4:	Name             : ATOMISP ISP ACC
> 	/dev/video5:	Name             : ATOMISP ISP MEMORY input
> 	/dev/video6:	Name             : ATOMISP ISP CAPTURE output
> 	/dev/video7:	Name             : ATOMISP ISP VIEWFINDER output
> 	/dev/video8:	Name             : ATOMISP ISP PREVIEW output
> 	/dev/video9:	Name             : ATOMISP ISP VIDEO output
> 	/dev/video10:	Name             : ATOMISP ISP ACC
> 
> I notice that everything is listed twice, 

I didn't double-check, but I guess it is because video5-10 are devs
meant to support metadata, as the code calls V4L register device
function only 5 times. So, they're actually pairs of video0-4.

The plus side is that video5-10 could be used to send something that
would help AAA algorithms.

> I wonder if we can use /dev/video2
> with input 0 together with /dev/video8 for input 1, if that is possible then
> we might set a different default input on each.
> 
> And maybe also make them /dev/video0 (already done I see) and /dev/video1,
> possibly combined with a module-option to hide the others for now. This
> should make things better for regular apps.

Yeah, it makes sense to have one separate device per sensor, assuming
that it would be possible to stream from both sensors at the same time.

If just one sensor can be enabled, then I would stick with just one
device and use S_INPUT to change the source pad - on video-centric
control. If we move it to MC-centric, then the MC-aware app/library
will be able to setup the right pad anyway.

> OTOH if we go the libcamera
> route then this is not really necessary I guess?
