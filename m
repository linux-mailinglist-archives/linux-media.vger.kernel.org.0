Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC029454F15
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 22:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240885AbhKQVLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 16:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240787AbhKQVJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 16:09:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7371CC061570
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 13:05:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (85-76-119-172-nat.elisa-mobile.fi [85.76.119.172])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D22322CF;
        Wed, 17 Nov 2021 22:05:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637183156;
        bh=OlYdjaQzN+YhkslFfG7DxMuCqewSQ2WHcb5inTSNuRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZFnYxoq164DVrqNqZf8WnPLiWHZadBY+xE/2cTYIiE8TvjIq/DDowPEsvM/LXOD5X
         iKcnxmgHv6j1k59BLPoi/dtl+TrsYUBpBnRPpQhxsAE7/+PKTGGcUbd9WhZtrptNeP
         YWdI3ExrK5b/CK7y+J3/98ywvUGJg8gyCYfYlJDk=
Date:   Wed, 17 Nov 2021 23:05:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        andrey.i.trufanov@gmail.com, linux-staging@lists.linux.dev,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        libcamera-devel@lists.libcamera.org,
        Nable <nable.maininbox@googlemail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        linux-media@vger.kernel.org
Subject: Re: [libcamera-devel] [RFC] media: Auto exposure/gain support for
 atomisp / libcamera integration ?
Message-ID: <YZVumG+WmoNfh+BX@pendragon.ideasonboard.com>
References: <20211107175013.355188-1-hdegoede@redhat.com>
 <20211107184811.7c8a0d1b@sal.lan>
 <163716984014.4034367.5258883684773687291@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163716984014.4034367.5258883684773687291@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 05:24:00PM +0000, Kieran Bingham wrote:
> Quoting Mauro Carvalho Chehab (2021-11-07 18:48:11)
> > Em Sun,  7 Nov 2021 18:50:13 +0100 Hans de Goede escreveu:
> > 
> > > Hi All,
> > > 
> > > Now that we have the atomisp2 driver running on some devices like
> > > the Asus T101HA; and with the exposure + gain controls for the ov2680
> > > sensor found on that laptop fixed:
> > > 
> > > https://lore.kernel.org/linux-media/20211107171549.267583-1-hdegoede@redhat.com/
> > 
> > Thanks for that! Yeah, those controls are needed in order to get a
> > more realistic image.
> > 
> > > I believe we need to start thinking about various userspace API
> > > concerns. Thanks to Mauro's great work on various V4L2 API things
> > > are starting to work (somewhat) with regular V4L2 apps, but we really
> > > also need some processing / 3A stuff to make the cameras really
> > > usable.
> > 
> > True.
> > 
> > > The most important thing needed is automatic exposure + gain control,
> > > ATM this relies on a custom ATOMISP ioctl, but I believe that we can
> > > just export the controls as regular v4l2 controls on the sensor subdev,
> > > at least for the ov2680 the exposure is already exported this way
> > > but it is read-only. Does anyone see any problems with just making
> > > these normal v4l2 controls on the sensor subdev ?
> > 
> > While it is in staging, I don't see any troubles, but we need
> > to think a little bit about that before moving it out of staging.
> > 
> > Yet, one thing that it makes sense would be to allow multiple
> > opens at the /dev/video?. This way, external apps could touch
> > controls while the video is streaming, just like a normal V4L2
> > device.
> 
> This is where libcamera sits as a "Raison d'être"
> 
> An IPA alongside the pipeline handler runs the algorithms (we have
> existing open source examples in both the RPi and IPU3 ... and to some
> degree the RKISP), so that applications do not have to have some
> external thing touching the controls.

And applications *must not* touch the controls behind libcamera's back.

This being said, the V4L2 API allows multiple opens, so the atomisp2
driver needs to implement that to pass v4l2-compliance. It just
shouldn't be used.

> > > We can then simulate the custom ATOMISP ioctl through the subdevs,
> > > or we can just remove it alltogether.
> > 
> > For now, I would keep it.

Why so ? Who uses that custom ioctl with mainline ? We should expose
sensor controls on the sensor subdev and drop redundant custom APIs.
It's not just about libcamera, nobody expects custom ioctls to set
sensor controls.

> > > Once we have the controls available this way I think we should write
> > > a libcamera plugin, > which like the older versions of the Rasberry Pi
> > > plugin (if I've understood things correctly) won't use the MC framework
> > > for now. 

libcamera requires an MC device to enumerate cameras (the Raspberry Pi
drivers have supported this from their very first day in libcamera), so
you need at least that. The pipeline doesn't strictly need to be
controlled through MC, but I see no reason to use legacy APIs here.

> That's the part that confuses me on the atomisp - does it have separate
> (non-v4l2-subdev) drivers for all it's sensors currently?

It has custom sensor drivers which need to be split out and moved to
drivers/media/i2c/ (or replaced with drivers already present in that
directory).

> > Sounds like a plan to me, but I guess we'll need to solve support for
> > MMAP too, before adding an experimental plugin on libcamera.
> 
> libcamera heavily uses MediaController to identify the pipelines. Is it
> feasible to at least add a Media device to be able to enumerate the
> pipeline/devices?
> 
> From what I recall having done that for RPi, it doesn't take much to do
> that?

It should be trivial. I'd take it one step further and register entities
for the sensor and ISP. This should be trivial too, and will allow
locating the sensor subdev device node easily.

> > > I believe we first need to understand the atomisp code better
> > > before we add MC support (*).
> > >
> > > *) I do believe that in the end MC support makes sense at least
> > > to tie together the 
> > 
> > I do think it should be exposing pipelines via MC. See, there are
> > two separate things here:
> > 
> > a. expose internal pipelines and subdevs via MC;
> > b. be MC-centric or video-centric device. See item 1.1.1 at [1]
> > 
> >   [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/open.html
> > 
> > The UVC driver exposes its internal topology via MC but it is a
> > video-centric device. There are other devices that do that too.
> > 
> > I do think we should implement (a).
> 
> aha, yes, essentially that's what I was saying above ;-)
> 
> > It seems that we're reaching a consensus that further studies are 
> > needed before doing (b).
> > 
> > So, I guess that, for now, we should let the driver to register
> > their subdevs, but keep the control video-centric. We could then
> > experiment with AAA using subdevs, and try to get a better picture
> > about what should be done next with regards to MC.

Moving sensor control from a video node to a subdev node should be easy.
I'd start doing so already, you'll then be able to use the libcamera
CameraSensor class in the pipeline handler.

The harder part with MC is to control the full pipeline, but we don't
need to do so, we can have a monolothic entity for the ISP in the media
graph, and use custom ioctls to control it.

> > > But I still believe that an (experimental)
> > > plugin would be good, both to get something usable so that we can get
> > > more testers / more people interested in contributing.
> > > Another reason is to have another use-case where apps need to support
> > > libcamera to work properly (like on IPU3 devices) which will hopefully
> > > motivate people working on apps to put more effort in supporting libcamera
> > > (preferably through the new pipewire libcamera plugin so that things
> > > will also work in a flatpack sandbox).
> > 
> > I didn't play yet with libcamera, but if we have an experimental
> > plugin to support the devices I have, I could add support for it on
> > Camorama. After my addition of USERPTR at camorama, I was able to confine
> > most of V4L2 and libv4l stuff on a single file, abstracting other parts 
> > from the rest of camorama code. So, maybe it won't be too complex to
> > make it also support libcamera. I'll see when time comes.
> > 
> > > ###
> > > 
> > > On other thing which I'm wondering about is the need to call S_INPUT to
> > > select front / back in this list from Mauro:
> > > 
> > >       $ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> > >       /dev/video0:    Name             : ATOMISP ISP CAPTURE output
> > >       /dev/video1:    Name             : ATOMISP ISP VIEWFINDER output
> > >       /dev/video2:    Name             : ATOMISP ISP PREVIEW output
> > >       /dev/video3:    Name             : ATOMISP ISP VIDEO output
> > >       /dev/video4:    Name             : ATOMISP ISP ACC
> > >       /dev/video5:    Name             : ATOMISP ISP MEMORY input
> > >       /dev/video6:    Name             : ATOMISP ISP CAPTURE output
> > >       /dev/video7:    Name             : ATOMISP ISP VIEWFINDER output
> > >       /dev/video8:    Name             : ATOMISP ISP PREVIEW output
> > >       /dev/video9:    Name             : ATOMISP ISP VIDEO output
> > >       /dev/video10:   Name             : ATOMISP ISP ACC
> > > 
> > > I notice that everything is listed twice, 
> >
> > I didn't double-check, but I guess it is because video5-10 are devs
> > meant to support metadata, as the code calls V4L register device
> > function only 5 times. So, they're actually pairs of video0-4.
> > 
> > The plus side is that video5-10 could be used to send something that
> > would help AAA algorithms.
> >
> > > I wonder if we can use /dev/video2
> > > with input 0 together with /dev/video8 for input 1, if that is possible then
> > > we might set a different default input on each.
> > > 
> > > And maybe also make them /dev/video0 (already done I see) and /dev/video1,
> > > possibly combined with a module-option to hide the others for now. This
> > > should make things better for regular apps.
> > 
> > Yeah, it makes sense to have one separate device per sensor, assuming
> > that it would be possible to stream from both sensors at the same time.
> 
> Is that why there are two sets of devices? to support two sensors?
> 
> I see 'ViewFinder' and 'Preview' devices, that sounds like multiple
> stream support, which we cover in libcamera.
> 
> a libcamera pipeline handler should expose a camera object for each
> sensor, and wrap all the devices so that the applications deal only with
> a 'camera' rather than trying to determine if they shoudl be looking at
> the capture/viewfinder/preview outputs...

This needs to be investigated to figure out what it corresponds to. It
could indeed be that the hardware has two pipelines that can be operated
in parallel, one for each sensor. Or it could be that the driver
registers different video nodes for the two sensors, but make them
mutually exclusive, in which case half of the video nodes need to be
dropped. The only thing I've been told is that the atomisp2 is an inline
ISP.

> > If just one sensor can be enabled, then I would stick with just one
> > device and use S_INPUT to change the source pad - on video-centric
> > control. If we move it to MC-centric, then the MC-aware app/library
> > will be able to setup the right pad anyway.
> > 
> > > OTOH if we go the libcamera
> > > route then this is not really necessary I guess?
> 
> If anyone wants to try creating a Pipeline Handler for this, I have a
> set of 'documentation patches' at :
> 
> https://git.libcamera.org/libcamera/vivid.git/log/
> 
> These hopefully walk through the core steps of constructing a basic
> pipeline handler, which should be enough to get started with. Of course,
> it's based around a single vivid device, and I'd expect the AtomISP to be
> more complicated, but there are other pipelines to inspect once getting
> to that point.

-- 
Regards,

Laurent Pinchart
