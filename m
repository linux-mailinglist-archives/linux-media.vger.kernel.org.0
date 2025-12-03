Return-Path: <linux-media+bounces-48123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42732C9DF48
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 07:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E12E04E1648
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 06:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137D02957B6;
	Wed,  3 Dec 2025 06:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lMzIWKnt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C210425B31D;
	Wed,  3 Dec 2025 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764744442; cv=none; b=XlZeCQGxvbEXwKFek5WFh98a/I/Mfg/9sOdyIIKp8Eied6cxKtx/cg/P/tnvvH1sE3CzMYKdblHUz8p0U+WwNbgdrxAbDK6pgSL7XvQ3CD9I3xcjKD0EFubh1QJM/7jgfv6bE+lXMIT677s+6kiRhOweJzVTKfbOTzbtmSBRCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764744442; c=relaxed/simple;
	bh=QFP/FJlc0IIbed06JHMcpNSVIjtKamnsBKBK7bhw5iI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=edO/fGq1HEcYAcK6yv1KcVNaBH0aHlM4RgNxebG3V32CDeiDjCO9sU+g1JIc9wszW23eGQYbSOajEkkigjqvn84qJNcEeA3necJcj908Fx7FtOrnolZFL25edZ3J+zlw/6HTLxsehSVd4sF9vI3/hbSvg9Ihk5BCIJ4+fbrmB0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lMzIWKnt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:14e0:17fd:e3c6:810:1656])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08E291574;
	Wed,  3 Dec 2025 07:45:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764744303;
	bh=QFP/FJlc0IIbed06JHMcpNSVIjtKamnsBKBK7bhw5iI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lMzIWKntD7uODLV+rHFvDt8oP02q1e/ndrtApTWYpvaeXXt7P4BZ2VcscgDYO/1MT
	 go9JCBLSda8nWCEeKRZOip6sDotKBIrAyCxuvoLJ7fMd6w2/X9MfMEq2FD1kwpn1hE
	 NkAT9n8OrzOl00jgvi01SQ+NIHvS6/c532N+gCsI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5e2lwyzel45ejbb4mch2johetncaj7arpidjst2tjpatseklvn@vlv6hnwzfmwj>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com> <20251118-b4-rpi-ov5647-v2-16-5e78e7cb7f9b@ideasonboard.com> <5e2lwyzel45ejbb4mch2johetncaj7arpidjst2tjpatseklvn@vlv6hnwzfmwj>
Subject: Re: [PATCH v2 16/16] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Ivan T. Ivanov <iivanov@suse.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 03 Dec 2025 12:17:11 +0530
Message-ID: <176474443195.1636185.14924967141075849275@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Jacopo

Quoting Jacopo Mondi (2025-12-01 21:20:39)
> Hi Jai
>=20
> On Tue, Nov 18, 2025 at 05:33:09PM +0530, Jai Luthra wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > The link frequency can vary between modes, so add it as a
> > control.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5647.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 71107d74f2900b39233a52b29a229282bd087963..de27e76b487957bfa0a0723=
59f28194425950eaf 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] =3D {
> >
> >  #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
> >
> > +#define FREQ_INDEX_FULL              0
> > +#define FREQ_INDEX_VGA               1
> > +static const s64 ov5647_link_freqs[] =3D {
> > +     [FREQ_INDEX_FULL]       =3D 218750000,
> > +     [FREQ_INDEX_VGA]        =3D 208333000,
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
>=20
> I now read again v1 13/13 and this mode seems to have a different pixel
> rate and a lower link freq ?
>=20

Indeed, I had already sent a v2 before that discussion, and was waiting for
more comments (and 6.19-rc1 tag) before sending a v3:
https://lore.kernel.org/all/176347245796.268162.1039078457352251254@freya/

> > +             .link_freq_index =3D FREQ_INDEX_VGA,
> >               .hts            =3D 1852,
> >               .vts            =3D 0x1f8,
> >               .reg_list       =3D ov5647_640x480_10bpp,
> > @@ -927,6 +940,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *s=
d,
> >                                        sensor->exposure->minimum,
> >                                        exposure_max, sensor->exposure->=
step,
> >                                        exposure_def);
> > +
> > +             __v4l2_ctrl_s_ctrl(sensor->link_freq, mode->link_freq_ind=
ex);
> >       }
> >       *fmt =3D mode->format;
> >       /* The code we pass back must reflect the current h/vflips. */
> > @@ -1236,7 +1251,7 @@ static int ov5647_init_controls(struct ov5647 *se=
nsor)
> >       int hblank, exposure_max, exposure_def;
> >       struct device *dev =3D &client->dev;
> >
> > -     v4l2_ctrl_handler_init(&sensor->ctrls, 13);
> > +     v4l2_ctrl_handler_init(&sensor->ctrls, 14);
> >
> >       v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> >                         V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> > @@ -1292,6 +1307,13 @@ static int ov5647_init_controls(struct ov5647 *s=
ensor)
> >       sensor->vflip =3D v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_=
ops,
> >                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> >
> > +     sensor->link_freq =3D
> > +             v4l2_ctrl_new_int_menu(&sensor->ctrls, NULL, V4L2_CID_LIN=
K_FREQ,
> > +                                    ARRAY_SIZE(ov5647_link_freqs) - 1,=
 0,
>=20
> The default control value should follow the default mode.
> You can use mode->link_req_index to retrieve it
>=20

Will do.

> > +                                    ov5647_link_freqs);
> > +     if (sensor->link_freq)
> > +             sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> >       v4l2_fwnode_device_parse(dev, &props);
> >
> >       v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
> >
> > --
> > 2.51.1
> >

Thanks,
    Jai

