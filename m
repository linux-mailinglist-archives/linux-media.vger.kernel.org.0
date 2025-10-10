Return-Path: <linux-media+bounces-44157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A2BCC6B9
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8581035522A
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77502D73B2;
	Fri, 10 Oct 2025 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YfGoA2WX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1712D661E
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760089557; cv=none; b=s+92S6sbzZPFrp8eL/am/ogjgkF1hrI6Q5O6Op+otLI3kfEryvP/BEyWxXcuUdoGFI3P5iL7eYdc/JGIfOzMr/hI4N1CNMQGl1PlTXD4WXepo5N8TEwARvFh8b4iehN1P0DwO1wFKrjI0d4XJRO5m1TEVLcFlF4PwePqNGg9yqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760089557; c=relaxed/simple;
	bh=Fg3OSnxnx4Qub5sZTMRnJ8/d0FjHUiqOO1KXCwtWsQE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mjKGyjAHeZ3XoCLVmW7XWw37mLdBxY34TlmCLopKXpbdMH7qoYodfGHakUv2PETQ/1pLox+pgImuQLySVZdiTDukGZGhpmhB3ze62Ik2s0XYrBEAQOLBZcx+QqOSqU/1fYeF1jnTTmaP5MyyYATnfENXd/H86N10zp7QtXBK/MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YfGoA2WX reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:22d7:7fc4:7ab4:3e13])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D27072C5;
	Fri, 10 Oct 2025 11:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760089457;
	bh=Fg3OSnxnx4Qub5sZTMRnJ8/d0FjHUiqOO1KXCwtWsQE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YfGoA2WXECQgjOguxea6LpFgXoXfPGVSqmi6tKlGAVLBQjjCP7fZ5inXtMP+T49s/
	 deMkbCh4/yWAJVcIIcfATbpoRcCVMb54AO17UstYfGoVW8mJ8z9t+5EEi+82MKTnDB
	 FZ0i96KmnrEKm/+IO0x0QiIT3DT1oqnjTl/LVM0A=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <mseqfltfao5jqubs22asrzzrj2tnsf5bdmlvsmncwj4ss3gxmu@wk2lmramiy3a>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com> <osdr2eavm23pzxrd73v4xscdtaafon3vllhzcg5r6eoqwclsfk@xgfnicn6iboj> <aM1J9LsbpueEr30x@kekkonen.localdomain> <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf> <aN4lQPK5Mqve2bUI@kekkonen.localdomain> <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76> <r3kv25lxbyjtuufb2ze27wp5gbqnbgnps2ytk2gy2qkaeiijdd@ydn4ptkze2qp> <aN_MdmDhQPyLnQqD@kekkonen.localdomain> <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce> <mseqfltfao5jqubs22asrzzrj2tnsf5bdmlvsmncwj4ss3gxmu@wk2lmramiy3a>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration models, raw sensor model
From: Stefan Klug <stefan.klug@ideasonboard.com>
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
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <"sta nislaw.gruszka"@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 10 Oct 2025 11:45:49 +0200
Message-ID: <176008954951.211618.7730648133265251067@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Sakari, hi Jacopo,

Quoting Jacopo Mondi (2025-10-07 16:01:11)
> Hi again Sakari,
>    cc Kieran and Stefan
>=20
> Stefan and Kieran brought to my attention a use case I would like to
> discuss with you
>=20
> On Fri, Oct 03, 2025 at 03:25:19PM +0200, Jacopo Mondi wrote:
> > Hi Sakari,
> >
> > On Fri, Oct 03, 2025 at 04:15:34PM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> >
> > [snip]
> >
> > > > >
> > > >
> > > > A recent discussion on libcamera made me wonder a few things
> > > >
> > > > https://patchwork.libcamera.org/patch/24547/
> > > >
> > > > In the current world (pre-RAW sensor model) the situation can be
> > > > summarized as
> > > >
> > > > TGT_NATIVE_SIZE =3D full pixel array (readable and non readable)
> > > > TGT_CROP_BOUNDS =3D readable pixel array (visible and non visibile =
pixels)
> > >
> > > Crop bounds is generally the same as native size.
> > >
> >
> > I checked two sensors datasheet for this yesterday and both of them
> > had parts of the pixel array that cannot be read out
> >
> > > > TGT_CROP_DEFAULT =3D visible pixels
> > >
> > > The default could exclude not-so-great pixels, too.
> > >
> >
> > ok, suggested pixel array area used for image capture purposes then
> >
> > > > TGT_CROP =3D analgoue crop
> > >
> > > This could include digital crop as well.
> > >
> >
> > Yes it might, not all sensor drivers behaves the same indeed
> >
> > > >
> > > > where:
> > > > - visibile =3D pixels used for image capture purpose
> > > > - non-visible =3D optically black, dummies etc
> > > >
> > > > With the RAW sensor model:
> > > >
> > > > format(1/0) =3D readable pixel array (visible and non visible)
> > > > TGT_CROP_DEFAULT(1/0) =3D visible pixel area
> > > > TGT_CROP(1/0) =3D analogue crop
> > > > TGT_COMPOSE(1/0) =3D binning/skipping
> > > >
> > > > Have we lost the ability to report the full pixel array size (reada=
ble
> > > > and not readable) ? Is this intentional ? As if pixels cannot be re=
ad
> > > > out they basically do no exist, and the information on the actual
> > > > number of pixels (including non readable ones) should be kept
> > > > somewhere else (like the libcamera sensor properties database) ?
> > >
> > > I'd keep this information in the user space if needed. There's little
> > > software could presumably do with this information.
> > >
> >
> > Agreed, there is no value I can think of in having this information in
> > drivers
> >
>=20
> So, Kieran and Stefan are working with a sensor whose driver was
> initially upstreamed with a wrong "readable pixel array"
> (TGT_CROP_BOUNDS). The developer later realized there was more of the
> pixel array to read and there was a use for the non-image pixels like
> OB ones.
>=20
> With the current model this is fine (sort of), as all rectangles are
> expressed with the TGT_NATIVE size reference. TGT_BOUNDS might
> increases but TGT_CROP_DEFAULT and TGT_CROP are still valid both in the
> driver but also in userspace, which might have encoded some known
> "tested" configurations.
>=20
> With the new model we lose the information reported by TGT_NATIVE and
> all rectangles will be expressed with the format on 1/0 as reference.
> If the format changes because we later find out there were portions of
> the pixel array that could have been read out, all other rectangles
> will have to change as well, both in the driver (which is ok-ish) but
> also in userspace, which we have no control on.
>=20
> Stefan and Kieran could elaborate more on this, but basically, the
> physical array is the only fixed reference we could actually count on.
> Other rectangles, are subject to the driver developer understanding of
> how the device work, which as we know very well, can change over time.
>=20
> Now, if you agree this is something to be concerned on, I presume the
> fix is quite easy
>=20
>          format(1/0) =3D physical pixel array size
>          TGT_CROP_BOUNDS(1/0) =3D readable pixel array (visible and non v=
isible)
>          TGT_CROP_DEFAULT(1/0) =3D visible pixel area
>          TGT_CROP(1/0) =3D analogue crop
>          TGT_COMPOSE(1/0) =3D binning/skipping
>=20
> which basically only require re-introducing the use of CROP_BOUNDS in
> the RAW camera model specification.

Thanks Jacopo for writing that up. Maybe a little addition on that
matter. To our (especially Kierans) experience all the rectangles tend
to be unexpectedly difficult to handle when you try to configure the
sensors in a pixel perfect manner (having binned and non binned modes
cover exactly the same area in all possible flipping configurations).
The datasheets I'm aware of use the physical pixel array as common
coordinate system to describe the geometry. Adding the readable pixel
array as "artificial" coordinate system makes it difficult to match the
values reported by a v4l driver with the datasheets at hand.

Another time where this comes into play is lens shading correction where
you would want to describe the LSC against one reference coordinate
system that ideally never ever changes.

To add to the confusion I'd love to have another rectangle added to the
list. I don't have a proper name for it. The intent would be to
distinguish between the "readable pixel array" and the "light exposed
pixel array". So the list would become:

    format(1/0) =3D physical pixel array size
    TGT_CROP_BOUNDS(1/0) =3D readable pixel array (visible and non visible)
    TGT_CROP_VISIBLE(1/0) =3D visible pixel area including "flesh" for ISP
    TGT_CROP_DEFAULT(1/0) =3D Recommended "good" pixels
    TGT_CROP(1/0) =3D analogue crop
    TGT_COMPOSE(1/0) =3D binning/skipping

The idea is to be able to capture a larger image from the sensor for ISP
processing and then cut it down to CROP_DEFAULT. This way we can prevent
interpolation seams at the edges. Maybe the naming is bad and we should
make CROP_BOUNDS the recommended area and add CROP_READABLE to denote
the readable pixels...

>=20
> What do you think ?

Best regards,
Stefan

>=20
> > > >
> > > > All the discussion about readable/non-readable, visible/non-visibile
> > > > and active and inactive areas make me think we would benefit from
> > > > presenting a small glossary at the beginning of the "Sensor pixel
> > > > array size, cropping and binning" paragraph ?
> > >
> > > The text does not discuss active or inactive areas. I'd add some term=
s into
> > > the main glossary if needed -- they are used outside this file, too.
> > >
> > > --
> > > Regards,
> > >
> > > Sakari Ailus

