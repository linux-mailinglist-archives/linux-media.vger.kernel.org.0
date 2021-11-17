Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C3E454BE0
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 18:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239373AbhKQR1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 12:27:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40536 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239358AbhKQR1C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 12:27:02 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9595FE7;
        Wed, 17 Nov 2021 18:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637169842;
        bh=UjahfPXHK+y2Udy1SvQCpf437L9aURf7rYQ2VcMt67s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IGbCHL+dofE8WgbxN1LfkjMvUGaovx/mkC58xNzJ9d7bcZX9Fpdd7dkxT/yPuSjB3
         S7tlGZcgjoyGy/q//PEAr6PVv1QbqRYAzGQiGjv/Tim4dxdf0Rq9eBjwE7KTKRP6Gk
         nZ4B1uJdLhq+OXlDuSwl/gUIEX/EqpyZ66it/Gj4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211107184811.7c8a0d1b@sal.lan>
References: <20211107175013.355188-1-hdegoede@redhat.com> <20211107184811.7c8a0d1b@sal.lan>
Subject: Re: [libcamera-devel] [RFC] media: Auto exposure/gain support for atomisp / libcamera integration ?
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     andrey.i.trufanov@gmail.com, linux-staging@lists.linux.dev,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        libcamera-devel@lists.libcamera.org,
        Nable <nable.maininbox@googlemail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Yury Luneff <yury.lunev@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Wed, 17 Nov 2021 17:24:00 +0000
Message-ID: <163716984014.4034367.5258883684773687291@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Mauro Carvalho Chehab (2021-11-07 18:48:11)
> Em Sun,  7 Nov 2021 18:50:13 +0100
> Hans de Goede <hdegoede@redhat.com> escreveu:
>=20
> > Hi All,
> >=20
> > Now that we have the atomisp2 driver running on some devices like
> > the Asus T101HA; and with the exposure + gain controls for the ov2680
> > sensor found on that laptop fixed:
> >=20
> > https://lore.kernel.org/linux-media/20211107171549.267583-1-hdegoede@re=
dhat.com/
>=20
> Thanks for that! Yeah, those controls are needed in order to get a
> more realistic image.
>=20
> > I believe we need to start thinking about various userspace API
> > concerns. Thanks to Mauro's great work on various V4L2 API things
> > are starting to work (somewhat) with regular V4L2 apps, but we really
> > also need some processing / 3A stuff to make the cameras really
> > usable.
>=20
> True.
>=20
> >=20
> > The most important thing needed is automatic exposure + gain control,
> > ATM this relies on a custom ATOMISP ioctl, but I believe that we can
> > just export the controls as regular v4l2 controls on the sensor subdev,
> > at least for the ov2680 the exposure is already exported this way
> > but it is read-only. Does anyone see any problems with just making
> > these normal v4l2 controls on the sensor subdev ?
>=20
> While it is in staging, I don't see any troubles, but we need
> to think a little bit about that before moving it out of staging.
>=20
> Yet, one thing that it makes sense would be to allow multiple
> opens at the /dev/video?. This way, external apps could touch
> controls while the video is streaming, just like a normal V4L2
> device.

This is where libcamera sits as a "Raison d'=C3=AAtre"

An IPA alongside the pipeline handler runs the algorithms (we have
existing open source examples in both the RPi and IPU3 ... and to some
degree the RKISP), so that applications do not have to have some
external thing touching the controls.

> > We can then simulate the custom ATOMISP ioctl through the subdevs,
> > or we can just remove it alltogether.
>=20
> For now, I would keep it.
>=20
> > Once we have the controls available this way I think we should write
> > a libcamera plugin, > which like the older versions of the Rasberry Pi
> > plugin (if I've understood things correctly) won't use the MC framework
> > for now.=20

That's the part that confuses me on the atomisp - does it have separate
(non-v4l2-subdev) drivers for all it's sensors currently?


> Sounds like a plan to me, but I guess we'll need to solve support for
> MMAP too, before adding an experimental plugin on libcamera.

libcamera heavily uses MediaController to identify the pipelines. Is it
feasible to at least add a Media device to be able to enumerate the
pipeline/devices?

From what I recall having done that for RPi, it doesn't take much to do
that?


> > I believe we first need to understand the atomisp code better
> > before we add MC support (*).
> >
> > *) I do believe that in the end MC support makes sense at least
> > to tie together the=20
>=20
> I do think it should be exposing pipelines via MC. See, there are
> two separate things here:
>=20
> a. expose internal pipelines and subdevs via MC;
> b. be MC-centric or video-centric device. See item 1.1.1 at [1]
>=20
>   [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/op=
en.html
>=20
> The UVC driver exposes its internal topology via MC but it is a
> video-centric device. There are other devices that do that too.
>=20
> I do think we should implement (a).

aha, yes, essentially that's what I was saying above ;-)

=20
> It seems that we're reaching a consensus that further studies are=20
> needed before doing (b).
>=20
> So, I guess that, for now, we should let the driver to register
> their subdevs, but keep the control video-centric. We could then
> experiment with AAA using subdevs, and try to get a better picture
> about what should be done next with regards to MC.
>=20
> > But I still believe that an (experimental)
> > plugin would be good, both to get something usable so that we can get
> > more testers / more people interested in contributing.
> > Another reason is to have another use-case where apps need to support
> > libcamera to work properly (like on IPU3 devices) which will hopefully
> > motivate people working on apps to put more effort in supporting libcam=
era
> > (preferably through the new pipewire libcamera plugin so that things
> > will also work in a flatpack sandbox).
>=20
> I didn't play yet with libcamera, but if we have an experimental
> plugin to support the devices I have, I could add support for it on
> Camorama. After my addition of USERPTR at camorama, I was able to confine
> most of V4L2 and libv4l stuff on a single file, abstracting other parts=20
> from the rest of camorama code. So, maybe it won't be too complex to
> make it also support libcamera. I'll see when time comes.
>=20
> > ###
> >=20
> > On other thing which I'm wondering about is the need to call S_INPUT to
> > select front / back in this list from Mauro:
> >=20
> >       $ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l=
2-ctl -D -d $i|grep Name; done
> >       /dev/video0:    Name             : ATOMISP ISP CAPTURE output
> >       /dev/video1:    Name             : ATOMISP ISP VIEWFINDER output
> >       /dev/video2:    Name             : ATOMISP ISP PREVIEW output
> >       /dev/video3:    Name             : ATOMISP ISP VIDEO output
> >       /dev/video4:    Name             : ATOMISP ISP ACC
> >       /dev/video5:    Name             : ATOMISP ISP MEMORY input
> >       /dev/video6:    Name             : ATOMISP ISP CAPTURE output
> >       /dev/video7:    Name             : ATOMISP ISP VIEWFINDER output
> >       /dev/video8:    Name             : ATOMISP ISP PREVIEW output
> >       /dev/video9:    Name             : ATOMISP ISP VIDEO output
> >       /dev/video10:   Name             : ATOMISP ISP ACC
> >=20
> > I notice that everything is listed twice,=20
>=20
> I didn't double-check, but I guess it is because video5-10 are devs
> meant to support metadata, as the code calls V4L register device
> function only 5 times. So, they're actually pairs of video0-4.
>=20
> The plus side is that video5-10 could be used to send something that
> would help AAA algorithms.
>=20
> > I wonder if we can use /dev/video2
> > with input 0 together with /dev/video8 for input 1, if that is possible=
 then
> > we might set a different default input on each.
> >=20
> > And maybe also make them /dev/video0 (already done I see) and /dev/vide=
o1,
> > possibly combined with a module-option to hide the others for now. This
> > should make things better for regular apps.
>=20
> Yeah, it makes sense to have one separate device per sensor, assuming
> that it would be possible to stream from both sensors at the same time.

Is that why there are two sets of devices? to support two sensors?

I see 'ViewFinder' and 'Preview' devices, that sounds like multiple
stream support, which we cover in libcamera.

a libcamera pipeline handler should expose a camera object for each
sensor, and wrap all the devices so that the applications deal only with
a 'camera' rather than trying to determine if they shoudl be looking at
the capture/viewfinder/preview outputs...


> If just one sensor can be enabled, then I would stick with just one
> device and use S_INPUT to change the source pad - on video-centric
> control. If we move it to MC-centric, then the MC-aware app/library
> will be able to setup the right pad anyway.
>=20
> > OTOH if we go the libcamera
> > route then this is not really necessary I guess?

If anyone wants to try creating a Pipeline Handler for this, I have a
set of 'documentation patches' at :

https://git.libcamera.org/libcamera/vivid.git/log/

These hopefully walk through the core steps of constructing a basic
pipeline handler, which should be enough to get started with. Of course,
it's based around a single vivid device, and I'd expect the AtomISP to be
more complicated, but there are other pipelines to inspect once getting
to that point.


--
Kieran
