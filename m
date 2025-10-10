Return-Path: <linux-media+bounces-44169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 816B8BCC9F3
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 12:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F2C42355103
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 10:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9642868A1;
	Fri, 10 Oct 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p8c7dA3u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC83E28136F
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093805; cv=none; b=ufo4YKjvQNi8e1SRtDVJEh0MFZD+qeJgY4stVwfUgWzBXUwfui74VHBw0I2FOvU8hl2yA4S7jcEDtdxRMtAQsU7Yzt0r2SAVGUkMIA/hr0yPxvNTOw3U3tE3cIowQjvTxQ4eQptmZib8dUGelVR3Q3i9UQmCyRcKdtOEUBJZlgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093805; c=relaxed/simple;
	bh=YBfQLBPpCdOoJV/gzUeLJYUYb6dV63M4sLsdO3yP0Ww=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NGyWB56MAdxUusJHeGpDtnJpM5TErG+AsQfBk+6c9G9g8xR0GaLQOMpNgNC6MeEnSyCry4T6c2usH1afpgEDccJYyha/KhUoRF+oRj2/nPmizhfG1HblvOzCSx8oYGmXeApKo1pIwwqfbKwUmufvsdr5WNRNlsTDDGhJ4Kd82fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p8c7dA3u reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21A30593;
	Fri, 10 Oct 2025 12:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760093705;
	bh=YBfQLBPpCdOoJV/gzUeLJYUYb6dV63M4sLsdO3yP0Ww=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=p8c7dA3uzkBlgh+GwwubUVSgUN5mcSo58NVmdNytqtSWu8SFvpDYXX3e3KJQPHs2/
	 wabfTkKmp6dbZZJ7rimEdMDBpO5t+esK5bsHyTwhjR/SflzWz82qSVQtl++LvfXe+r
	 Ybigiin71McGzf4w9o6Gb5B4ieJlgX9seMPp5u+Q=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176008954951.211618.7730648133265251067@localhost>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com> <aM1J9LsbpueEr30x@kekkonen.localdomain> <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf> <aN4lQPK5Mqve2bUI@kekkonen.localdomain> <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76> <r3kv25lxbyjtuufb2ze27wp5gbqnbgnps2ytk2gy2qkaeiijdd@ydn4ptkze2qp> <aN_MdmDhQPyLnQqD@kekkonen.localdomain> <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce> <mseqfltfao5jqubs22asrzzrj2tnsf5bdmlvsmncwj4ss3gxmu@wk2lmramiy3a> <176008954951.211618.7730648133265251067@localhost>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration models, raw sensor model
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Stanislaw Gruszka <"sta nislaw.gruszka"@linux.intel.com>,
	Mehdi Djait <"m ehdi.djait"@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Stefan Klug <stefan.klug@ideasonboard.com>
Date: Fri, 10 Oct 2025 11:56:37 +0100
Message-ID: <176009379794.935713.4919963263447609305@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Stefan Klug (2025-10-10 10:45:49)
> Hi Sakari, hi Jacopo,
>=20
> Quoting Jacopo Mondi (2025-10-07 16:01:11)
> > Hi again Sakari,
> >    cc Kieran and Stefan
> >=20
> > Stefan and Kieran brought to my attention a use case I would like to
> > discuss with you
> >=20
> > On Fri, Oct 03, 2025 at 03:25:19PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari,
> > >
> > > On Fri, Oct 03, 2025 at 04:15:34PM +0300, Sakari Ailus wrote:
> > > > Hi Jacopo,
> > >
> > > [snip]
> > >
> > > > > >
> > > > >
> > > > > A recent discussion on libcamera made me wonder a few things
> > > > >
> > > > > https://patchwork.libcamera.org/patch/24547/
> > > > >
> > > > > In the current world (pre-RAW sensor model) the situation can be
> > > > > summarized as
> > > > >
> > > > > TGT_NATIVE_SIZE =3D full pixel array (readable and non readable)
> > > > > TGT_CROP_BOUNDS =3D readable pixel array (visible and non visibil=
e pixels)
> > > >
> > > > Crop bounds is generally the same as native size.
> > > >
> > >
> > > I checked two sensors datasheet for this yesterday and both of them
> > > had parts of the pixel array that cannot be read out
> > >
> > > > > TGT_CROP_DEFAULT =3D visible pixels
> > > >
> > > > The default could exclude not-so-great pixels, too.
> > > >
> > >
> > > ok, suggested pixel array area used for image capture purposes then
> > >
> > > > > TGT_CROP =3D analgoue crop
> > > >
> > > > This could include digital crop as well.
> > > >
> > >
> > > Yes it might, not all sensor drivers behaves the same indeed
> > >
> > > > >
> > > > > where:
> > > > > - visibile =3D pixels used for image capture purpose
> > > > > - non-visible =3D optically black, dummies etc
> > > > >
> > > > > With the RAW sensor model:
> > > > >
> > > > > format(1/0) =3D readable pixel array (visible and non visible)
> > > > > TGT_CROP_DEFAULT(1/0) =3D visible pixel area
> > > > > TGT_CROP(1/0) =3D analogue crop
> > > > > TGT_COMPOSE(1/0) =3D binning/skipping
> > > > >
> > > > > Have we lost the ability to report the full pixel array size (rea=
dable
> > > > > and not readable) ? Is this intentional ? As if pixels cannot be =
read
> > > > > out they basically do no exist, and the information on the actual
> > > > > number of pixels (including non readable ones) should be kept
> > > > > somewhere else (like the libcamera sensor properties database) ?
> > > >
> > > > I'd keep this information in the user space if needed. There's litt=
le
> > > > software could presumably do with this information.
> > > >
> > >
> > > Agreed, there is no value I can think of in having this information in
> > > drivers
> > >
> >=20
> > So, Kieran and Stefan are working with a sensor whose driver was
> > initially upstreamed with a wrong "readable pixel array"
> > (TGT_CROP_BOUNDS). The developer later realized there was more of the
> > pixel array to read and there was a use for the non-image pixels like
> > OB ones.
> >=20
> > With the current model this is fine (sort of), as all rectangles are
> > expressed with the TGT_NATIVE size reference. TGT_BOUNDS might
> > increases but TGT_CROP_DEFAULT and TGT_CROP are still valid both in the
> > driver but also in userspace, which might have encoded some known
> > "tested" configurations.
> >=20
> > With the new model we lose the information reported by TGT_NATIVE and
> > all rectangles will be expressed with the format on 1/0 as reference.
> > If the format changes because we later find out there were portions of
> > the pixel array that could have been read out, all other rectangles
> > will have to change as well, both in the driver (which is ok-ish) but
> > also in userspace, which we have no control on.
> >=20
> > Stefan and Kieran could elaborate more on this, but basically, the
> > physical array is the only fixed reference we could actually count on.
> > Other rectangles, are subject to the driver developer understanding of
> > how the device work, which as we know very well, can change over time.
> >=20
> > Now, if you agree this is something to be concerned on, I presume the
> > fix is quite easy
> >=20
> >          format(1/0) =3D physical pixel array size
> >          TGT_CROP_BOUNDS(1/0) =3D readable pixel array (visible and non=
 visible)
> >          TGT_CROP_DEFAULT(1/0) =3D visible pixel area
> >          TGT_CROP(1/0) =3D analogue crop
> >          TGT_COMPOSE(1/0) =3D binning/skipping
> >=20
> > which basically only require re-introducing the use of CROP_BOUNDS in
> > the RAW camera model specification.
>=20
> Thanks Jacopo for writing that up. Maybe a little addition on that
> matter. To our (especially Kierans) experience all the rectangles tend
> to be unexpectedly difficult to handle when you try to configure the
> sensors in a pixel perfect manner (having binned and non binned modes
> cover exactly the same area in all possible flipping configurations).
> The datasheets I'm aware of use the physical pixel array as common
> coordinate system to describe the geometry. Adding the readable pixel
> array as "artificial" coordinate system makes it difficult to match the
> values reported by a v4l driver with the datasheets at hand.
>=20
> Another time where this comes into play is lens shading correction where
> you would want to describe the LSC against one reference coordinate
> system that ideally never ever changes.
>=20
> To add to the confusion I'd love to have another rectangle added to the
> list. I don't have a proper name for it. The intent would be to
> distinguish between the "readable pixel array" and the "light exposed
> pixel array". So the list would become:
>=20
>     format(1/0) =3D physical pixel array size
>     TGT_CROP_BOUNDS(1/0) =3D readable pixel array (visible and non visibl=
e)
>     TGT_CROP_VISIBLE(1/0) =3D visible pixel area including "flesh" for ISP
>     TGT_CROP_DEFAULT(1/0) =3D Recommended "good" pixels
>     TGT_CROP(1/0) =3D analogue crop
>     TGT_COMPOSE(1/0) =3D binning/skipping
>=20
> The idea is to be able to capture a larger image from the sensor for ISP
> processing and then cut it down to CROP_DEFAULT. This way we can prevent
> interpolation seams at the edges. Maybe the naming is bad and we should
> make CROP_BOUNDS the recommended area and add CROP_READABLE to denote
> the readable pixels...

I think this is important - and in IMX283 - it seems to be exactly what
the datasheet is ultimately recommending.

> > What do you think ?
>=20
> Best regards,
> Stefan
>=20
> >=20
> > > > >
> > > > > All the discussion about readable/non-readable, visible/non-visib=
ile
> > > > > and active and inactive areas make me think we would benefit from
> > > > > presenting a small glossary at the beginning of the "Sensor pixel
> > > > > array size, cropping and binning" paragraph ?

Oh yes, some sort of nicely interpretable description of "this rectangle
is expected to be this equivalent set of pixels" would be helpful. I've
found it so hard to identify which the right rectangle is here :D


I'm also weary that we might need to find a way to convey the
relationship between binning mode restrictions/offsets too.

The IMX283 2x2 and 3x3 binning modes produce offset outputs:

vwinpos is the coordinate programmed to the sensor to get a position -
and we have tooling in camshark that lets us determine the exact pixels
we capture from any mode to see what was really produced by the sensor:


```
'Sensor Native' ?
pixel (row)   -8 -7 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7  8  9  10 11 =
12 13 14 15 16
native pixels  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  =
|  |  |  |  |


vwinpos       -4    -3    -2    -1     0     1     2     3     4     5     =
6     7     8
no-binning     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  =
|  |  |  |  |


vwinpos             -3          -2          -1           0           1     =
      2     =20
/2 binning     |     |     |     |     |     |     |     |     |     |     =
|     |     |


vwinpos        0                 1                 2                 3     =
            4
/3 binning     |        |        |        |        |        |        |     =
   |        |
```


To fix this - I'm moving the current '0' position for IMX283 to -2 in
the non binned modes.

That gives me a coordinate system where at least I can define an
alignment for 2x2 and 3x3 binning every 12 pixels (as the lowest common
multiplier).

But - also murkies the water from the above rectanges as this sensor
turns out to have 48 lines of pixels (24 bayer pair lines) 'less than
zero' ... or at least those are the ones that are visible in light. I
can read further below zero but only for black pixels.

So in otherwords - I can't even make a corresponding coordinate
rectangle that exactly matches the 'all readable' pixels or 'all
illuminated pixels' ... Ayeeeeee...

My lesson/take on this: Don't trust the datasheets. They lie :D

--
Kieran




> > > >
> > > > The text does not discuss active or inactive areas. I'd add some te=
rms into
> > > > the main glossary if needed -- they are used outside this file, too.
> > > >
> > > > --
> > > > Regards,
> > > >
> > > > Sakari Ailus

