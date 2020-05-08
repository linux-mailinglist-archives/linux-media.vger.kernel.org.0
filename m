Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E611CB08F
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 15:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgEHNfX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 09:35:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbgEHNfW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 09:35:22 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA8CE208CA;
        Fri,  8 May 2020 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588944922;
        bh=Lqtj+yUekpXazjTKcniMdh7PrMPgodrcIdpRjX6AbM4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XO5nc9rC+f5PezTAjEQWKePC5IAVkI2GI5TW8Nmz+jMHJ3Bq4nWqQhhIBmTXVh2LS
         K+u59974a43dsegMwoJ/9HpWUT7vQXCdFBlxAsIpm6jTWCAU0Z9hc8398LbGb5nsSe
         OhidlMAuVT/6nkGi1AePYoIV6hOD2yNo7+h5Xv5c=
Date:   Fri, 8 May 2020 15:35:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v9 1/5] media: open.rst: better document device node
 naming
Message-ID: <20200508153517.3544f768@coco.lan>
In-Reply-To: <ed58ee26-251c-6ea9-e55b-7d1fd34e0f57@xs4all.nl>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
        <dac0e7a2b8511e9fc3499dbf92abebe3eb6eb6da.1588943181.git.mchehab+huawei@kernel.org>
        <ed58ee26-251c-6ea9-e55b-7d1fd34e0f57@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 8 May 2020 15:24:33 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 08/05/2020 15:10, Mauro Carvalho Chehab wrote:
> > Right now, only kAPI documentation describes the device naming.
> > However, such description is needed at the uAPI too. Add it,
> > and describe how to get an unique identify for a given device. =20
>=20
> identifier
>=20
> >=20
> > Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  .../userspace-api/media/v4l/open.rst          | 43 +++++++++++++++++--
> >  1 file changed, 40 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documenta=
tion/userspace-api/media/v4l/open.rst
> > index 38046ef20141..86816b247a17 100644
> > --- a/Documentation/userspace-api/media/v4l/open.rst
> > +++ b/Documentation/userspace-api/media/v4l/open.rst
> > @@ -14,12 +14,14 @@ Opening and Closing Devices
> >  ***************************
> > =20
> > =20
> > -Device Naming
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +.. _v4l2_device_naming:
> > +
> > +V4L2 Device Node Naming
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  V4L2 drivers are implemented as kernel modules, loaded manually by the
> >  system administrator or automatically when a device is first discovere=
d.
> > -The driver modules plug into the "videodev" kernel module. It provides
> > +The driver modules plug into the ``videodev`` kernel module. It provid=
es
> >  helper functions and a common application interface specified in this
> >  document.
> > =20
> > @@ -30,6 +32,41 @@ option CONFIG_VIDEO_FIXED_MINOR_RANGES. In that case=
 minor numbers
> >  are allocated in ranges depending on the device node type (video, radi=
o,
> >  etc.).
> > =20
> > +The device nodes supported by the Video4Linux subsystem are:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +Default device node name Usage
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +``/dev/videoX``		 Video input/output devices =20
>=20
> Also metadata input/output devices.
>=20
> I would prefer capture/output given the traditional names that V4L2 uses.
>=20
> > +``/dev/vbiX``		 Vertical blank data (i.e. closed captions, teletext)
> > +``/dev/radioX``		 Radio tuners and modulators
> > +``/dev/swradioX``	 Software Defined Radio tuners and modulators
> > +``/dev/v4l-touchX``	 Touch sensors
> > +``/dev/v4l-sudevX``	 Video sub-devices (used by sensors and other I2C =
=20
>=20
> sudevX -> subdevX
>=20
> You made this typo in more places, it's best to search and replace.
>=20
> > +			 devices)\ [#]_ =20
>=20
> That suggests that subdevs are i2c devices, they can be any processing bl=
ock on
> any bus.

For all the above: Ok. Will address at the next version.


>=20
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +Where ``X`` is a non-negative number.
> > +
> > +.. note::
> > +
> > +   1. The actual device node name is system-dependent, as udev rules m=
ay apply.
> > +   2. There is no guarantee that ``X`` will remain the same for the sa=
me
> > +      device, as the number depends on the device driver's probe order.
> > +      If you need an unique name, udev default rules produce
> > +      ``/dev/v4l/by-id/`` and ``/dev/v4l/by-path/`` directories contai=
ning
> > +      links that can be used uniquely to identify a V4L2 device node::
> > +
> > +	$ tree /dev/v4l
> > +	/dev/v4l
> > +	=E2=94=9C=E2=94=80=E2=94=80 by-id
> > +	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 usb-OmniVision._USB=
_Camera-B4.04.27.1-video-index0 -> ../../video0
> > +	=E2=94=94=E2=94=80=E2=94=80 by-path
> > +	    =E2=94=94=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0:2:1.0-video-in=
dex0 -> ../../video0
> > +
> > +.. [#] **V4L2 sub-device nodes** (e. g. ``/dev/v4l-sudevX``) use a dif=
ferent
> > +       set of system calls, as covered at :ref:`subdev`.
> > +
> >  Many drivers support "video_nr", "radio_nr" or "vbi_nr" module
> >  options to select specific video/radio/vbi node numbers. This allows t=
he
> >  user to request that the device node is named e.g. /dev/video5 instead=
 =20
>=20
> It looks like there is a missing period at the end of the sentence.

The full sentence here is:

	Many drivers support "video_nr", "radio_nr" or "vbi_nr" module
	options to select specific video/radio/vbi node numbers. This allows the
	user to request that the device node is named e.g. /dev/video5 instead
	of leaving it to chance. When the driver supports multiple devices of
	the same type more than one device node number can be assigned,
	separated by commas:

This paragraph (untouched by this patch) sounds ok to me ;-)

Thanks,
Mauro
