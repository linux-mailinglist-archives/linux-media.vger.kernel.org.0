Return-Path: <linux-media+bounces-47270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC471C69139
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 3392228C3F
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 11:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34AA354AD5;
	Tue, 18 Nov 2025 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wEeWmmsf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B32EF66E;
	Tue, 18 Nov 2025 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465318; cv=none; b=sv8izKHMgn/NXggvbcd/j4/HFlLmj21tn+4qlfRSuQhqdKpNqEZGZXwnIEzMp2sGZXjgxAmTAPcmbuSROJosM40Z1PrWrIN6aVSTImpN5GPbeDcv84Mf6z7l4UNGPfRDvnkJQbRlr+o7A1W51KFdLTjynmbbDtXuHok1pM3xDHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465318; c=relaxed/simple;
	bh=MwsiYeVNWnu8b1tHYrVxqOq5O7ZYGI4piiTvA4QwHQ8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HPKSQQGsHPLADx77EowhrGty+N2zpz+Vl+5KrqOIyrBqJ9q3bLOnU4FxpqKeYBqyR5Jnr7du17t0jSyPPEvijbYu5NzAc0bkZb1n+vwKj5nZAIVpZ9nvqPDKZnWuKczVcaB8Wf2RMX3tTANUJfXzM+Lyk7NnyZjxrCF7RqY75q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wEeWmmsf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ED8D1E33;
	Tue, 18 Nov 2025 12:26:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763465188;
	bh=MwsiYeVNWnu8b1tHYrVxqOq5O7ZYGI4piiTvA4QwHQ8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=wEeWmmsftzv6GUk1PCizaWBV8/QO0740vOIouA3Qg3MsEuPU4j2BvsUHwxuXfb6Fx
	 IJZfGmmRfkN6UYpcrz8ZsOqreBiUOAPaMc+7gxfJXFnOncvWqU4pVVI5MeCs4EKriH
	 5dL0fWKZPNMNjpauFNuzDPgtD6pMIbgI7k8Gilb8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <tca3pwpzwqokxpjlv5mjsf3mai6ojlwypve6np53vur4cojd3t@viistqpnzv25>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com> <20251028-b4-rpi-ov5647-v1-13-098413454f5e@ideasonboard.com> <tca3pwpzwqokxpjlv5mjsf3mai6ojlwypve6np53vur4cojd3t@viistqpnzv25>
Subject: Re: [PATCH 13/13] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Ivan T. Ivanov <iivanov@suse.de>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 18 Nov 2025 16:58:26 +0530
Message-ID: <176346530691.268162.12757814341347187181@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Jacopo,

Quoting Jacopo Mondi (2025-11-02 16:59:02)
> Hi Jai
>=20
> On Tue, Oct 28, 2025 at 12:57:24PM +0530, Jai Luthra wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > The link frequency can vary between modes, so add it as a
> > control.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index be0b96c4372ae0c6d8fc57280b195d6069dd7019..dea978305c3c868819780f7=
f631b225f4c1e7756 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] =3D {
> >
> >  #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
> >
> > +#define FREQ_INDEX_FULL              0
> > +#define FREQ_INDEX_VGA               1
> > +static const s64 ov5647_link_freqs[] =3D {
> > +     [FREQ_INDEX_FULL]       =3D 218500000,
>=20
> The full mode pixel rate is set to 87500000, which considering CSI-2
> DDR mode and the 2 lanes in use give me a link freq of 21875000.

Indeed, I get the same value, will update.

>=20
> Do you know where 218500000 comes from ? (it might be perfectly legit,
> I'm not questioning that).
>=20

> > +     [FREQ_INDEX_VGA]        =3D 208333000,

This value should be 137500000 if we do the same calculation using the
pixel rate for the VGA mode. But for the VGA mode, the sensor does 2x2
binning + 2x2 subsampling, which is quite a bit different than other modes.

https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate mentions
that the pixel rate value calculated from the bus link frequency does not
necessarily have to match the PIXEL_RATE control value (which is for the
sensor's internal readout of pixels including blanking).

Ultimately, these values are coming from the BSP where the CFE driver is
using the link frequency control to configure the DPHY-RX rate, so I think
it would be wiser to not reduce the VGA link frequency value, which may
cause issues with DPHY-RX latching. We can always fix it later if needed.

> > +};
> > +
> >  struct regval_list {
> >       u16 addr;
> >       u8 data;
> > @@ -106,6 +113,7 @@ struct ov5647_mode {
> >       struct v4l2_mbus_framefmt       format;
> >       struct v4l2_rect                crop;
> >       u64                             pixel_rate;
> > +     unsigned int                    link_freq_index;
> >       int                             hts;
> >       int                             vts;
> >       const struct regval_list        *reg_list;
> > @@ -128,6 +136,7 @@ struct ov5647 {
> >       struct v4l2_ctrl                *exposure;
> >       struct v4l2_ctrl                *hflip;
> >       struct v4l2_ctrl                *vflip;
> > +     struct v4l2_ctrl                *link_freq;
> >  };
> >
> >  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> > @@ -376,6 +385,7 @@ static const struct ov5647_mode ov5647_modes[] =3D {
> >                       .height         =3D 1944
> >               },
> >               .pixel_rate     =3D 87500000,
> > +             .link_freq_index =3D FREQ_INDEX_FULL,
> >               .hts            =3D 2844,
> >               .vts            =3D 0x7b0,
> >               .reg_list       =3D ov5647_2592x1944_10bpp,
> > @@ -397,6 +407,7 @@ static const struct ov5647_mode ov5647_modes[] =3D {
> >                       .height         =3D 1080,
> >               },
> >               .pixel_rate     =3D 87500000,
> > +             .link_freq_index =3D FREQ_INDEX_FULL,
> >               .hts            =3D 2416,
> >               .vts            =3D 0x450,
> >               .reg_list       =3D ov5647_1080p30_10bpp,
> > @@ -418,6 +429,7 @@ static const struct ov5647_mode ov5647_modes[] =3D {
> >                       .height         =3D 1944,
> >               },
> >               .pixel_rate     =3D 87500000,
> > +             .link_freq_index =3D FREQ_INDEX_FULL,
> >               .hts            =3D 1896,
> >               .vts            =3D 0x59b,
> >               .reg_list       =3D ov5647_2x2binned_10bpp,
> > @@ -439,6 +451,7 @@ static const struct ov5647_mode ov5647_modes[] =3D {
> >                       .height         =3D 1920,
> >               },
> >               .pixel_rate     =3D 55000000,
> > +             .link_freq_index =3D FREQ_INDEX_VGA,
> >               .hts            =3D 1852,
> >               .vts            =3D 0x1f8,
> >               .reg_list       =3D ov5647_640x480_10bpp,
> > @@ -925,6 +938,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *s=
d,
> >                                        sensor->exposure->minimum,
> >                                        exposure_max, sensor->exposure->=
step,
> >                                        exposure_def);
> > +
> > +             __v4l2_ctrl_s_ctrl(sensor->link_freq, mode->link_freq_ind=
ex);
>=20
> Doesn't this cause an error in s_ctrl where the control is not handled
> ?

The framework returns -EACCESS for read-only controls in validate_ctrls()

>=20
> >       }
> >       *fmt =3D mode->format;
> >       /* The code we pass back must reflect the current h/vflips. */
> > @@ -1230,7 +1245,7 @@ static int ov5647_init_controls(struct ov5647 *se=
nsor, struct device *dev)
> >       int hblank, exposure_max, exposure_def;
> >       struct v4l2_fwnode_device_properties props;
> >
> > -     v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> > +     v4l2_ctrl_handler_init(&sensor->ctrls, 10);
> >
> >       v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> >                         V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> > @@ -1290,6 +1305,14 @@ static int ov5647_init_controls(struct ov5647 *s=
ensor, struct device *dev)
> >       if (sensor->vflip)
> >               sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >
> > +     sensor->link_freq =3D
> > +             v4l2_ctrl_new_int_menu(&sensor->ctrls, &ov5647_ctrl_ops,
>=20
> As suggested for PIXEL_RATE, if you make the control read-only you
> should set the control ops to NULL.

Will do in v2.

> > +                                    V4L2_CID_LINK_FREQ,
> > +                                    ARRAY_SIZE(ov5647_link_freqs) - 1,=
 0,
> > +                                    ov5647_link_freqs);
> > +     if (sensor->link_freq)
> > +             sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>=20
> You know, I thought link_freq was set as READ_ONLY by the framework,
> but it's actuallt PIXEL_RATE (you can remove setting the flags
> in the driver if you send a patch to remove the control ops when
> registering PIXEL_RATE).

Will do.

>=20
> Thanks
>   j
>=20
> > +
> >       v4l2_fwnode_device_parse(dev, &props);
> >
> >       v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
> >
> > --
> > 2.51.0
> >

Thanks,
Jai

