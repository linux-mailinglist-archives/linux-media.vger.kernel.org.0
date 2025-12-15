Return-Path: <linux-media+bounces-48765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C021BCBCE57
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DF923028DA6
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBFC329E77;
	Mon, 15 Dec 2025 07:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kqDrxyrC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41CD329E5A;
	Mon, 15 Dec 2025 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765785455; cv=none; b=IqskSzSgup5b0vjXBpNO+a/ZrJuNaQPwBHGQEMqnQNx+mtvxwzyuro+KrwY1s/fwCN7TO9f7ce+P1ywvejtp1Sp7P+xaiRulJFvIonyycW3iLDy5I6EHX+c0Q1mttl0few4ArlM5Yf8LkRqCFphLkG9KywZ7Ss46YlgK+u8pX0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765785455; c=relaxed/simple;
	bh=RBPv+F0kBNaTBazonPjUQ87KOjTOggUdwMnpvARONcs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=u4c70tUfehLyFYXLCazfR+AudpudRLWqxxbWo5maysq5Elous4uEykXPXDtZIaCvZb7wadXbhSLf0Q+eHnJwvJmquTBpF2vvx0dhXbqKD46B9pXbUwNEqz+YV4b5WxGRRKZYw5ja5yO6eobLNAEFypyacUkmPX8KWGRBzFGOXDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kqDrxyrC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D040D581;
	Mon, 15 Dec 2025 08:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765785446;
	bh=RBPv+F0kBNaTBazonPjUQ87KOjTOggUdwMnpvARONcs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kqDrxyrCvXiVUQ/vMpozxE0unBumyBLGWK1l/SKd/Kxmhxb1pz8SJTcY0YfF1fcYu
	 HZ3vmRuTjVmNIaFv41tHPw/LrpIGuLh+CRUQL4PzHTpabpv8v+qhkhRJfg8oBAZ9zE
	 xZjHFmRCWqoncO+xjlM/kvVZYnoZSdE7XWPG/N/Q=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-b4-rpi-ov5647-v3-16-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com> <20251215-b4-rpi-ov5647-v3-16-4c25e3c883b2@ideasonboard.com>
Subject: Re: [PATCH v3 16/16] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Ivan T. Ivanov <iivanov@suse.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 15 Dec 2025 13:27:16 +0530
Message-ID: <176578543675.705443.13098668829486807309@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Quoting Jai Luthra (2025-12-15 12:58:12)
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> The link frequency can vary between modes, so add it as a
> control.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 02d751967ab2c4a8dbe4a504738c2c0b36b6cb68..761eb22f53244b6883439f1ed=
a7940b30bed1146 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] =3D {
> =20
>  #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
> =20
> +#define FREQ_INDEX_FULL                0
> +#define FREQ_INDEX_VGA         1
> +static const s64 ov5647_link_freqs[] =3D {
> +       [FREQ_INDEX_FULL]       =3D 218750000,
> +       [FREQ_INDEX_VGA]        =3D 208333000,

Sorry for the noise. Just after sending this I realized that the link
frequency for VGA mode also needs to be updated as mentioned by Dave in
response to [PATCH v1 13/13]

> +};
> +
>  struct regval_list {
>         u16 addr;
>         u8 data;
> @@ -106,6 +113,7 @@ struct ov5647_mode {
>         struct v4l2_mbus_framefmt       format;
>         struct v4l2_rect                crop;
>         u64                             pixel_rate;
> +       unsigned int                    link_freq_index;
>         int                             hts;
>         int                             vts;
>         const struct regval_list        *reg_list;
> @@ -128,6 +136,7 @@ struct ov5647 {
>         struct v4l2_ctrl                *exposure;
>         struct v4l2_ctrl                *hflip;
>         struct v4l2_ctrl                *vflip;
> +       struct v4l2_ctrl                *link_freq;
>  };
> =20
>  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -376,6 +385,7 @@ static const struct ov5647_mode ov5647_modes[] =3D {
>                         .height         =3D 1944
>                 },
>                 .pixel_rate     =3D 87500000,
> +               .link_freq_index =3D FREQ_INDEX_FULL,
>                 .hts            =3D 2844,
>                 .vts            =3D 0x7b0,
>                 .reg_list       =3D ov5647_2592x1944_10bpp,
> @@ -397,6 +407,7 @@ static const struct ov5647_mode ov5647_modes[] =3D {
>                         .height         =3D 1080,
>                 },
>                 .pixel_rate     =3D 87500000,
> +               .link_freq_index =3D FREQ_INDEX_FULL,
>                 .hts            =3D 2416,
>                 .vts            =3D 0x450,
>                 .reg_list       =3D ov5647_1080p30_10bpp,
> @@ -418,6 +429,7 @@ static const struct ov5647_mode ov5647_modes[] =3D {
>                         .height         =3D 1944,
>                 },
>                 .pixel_rate     =3D 87500000,
> +               .link_freq_index =3D FREQ_INDEX_FULL,
>                 .hts            =3D 1896,
>                 .vts            =3D 0x59b,
>                 .reg_list       =3D ov5647_2x2binned_10bpp,
> @@ -438,7 +450,8 @@ static const struct ov5647_mode ov5647_modes[] =3D {
>                         .width          =3D 2560,
>                         .height         =3D 1920,
>                 },
> -               .pixel_rate     =3D 55000000,
> +               .pixel_rate     =3D 58333000,

And this should go in as a separate Fixes commit before this patch.

I will fix these and send a v4 in a couple of days.

Thanks,
Jai

> +               .link_freq_index =3D FREQ_INDEX_VGA,
>                 .hts            =3D 1852,
>                 .vts            =3D 0x1f8,
>                 .reg_list       =3D ov5647_640x480_10bpp,
> @@ -927,6 +940,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>                                          sensor->exposure->minimum,
>                                          exposure_max, sensor->exposure->=
step,
>                                          exposure_def);
> +
> +               __v4l2_ctrl_s_ctrl(sensor->link_freq, mode->link_freq_ind=
ex);
>         }
>         *fmt =3D mode->format;
>         /* The code we pass back must reflect the current h/vflips. */
> @@ -1231,7 +1246,7 @@ static int ov5647_init_controls(struct ov5647 *sens=
or)
>         int hblank, exposure_max, exposure_def;
>         struct device *dev =3D &client->dev;
> =20
> -       v4l2_ctrl_handler_init(&sensor->ctrls, 13);
> +       v4l2_ctrl_handler_init(&sensor->ctrls, 14);
> =20
>         v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>                           V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1287,6 +1302,14 @@ static int ov5647_init_controls(struct ov5647 *sen=
sor)
>         sensor->vflip =3D v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_=
ops,
>                                           V4L2_CID_VFLIP, 0, 1, 1, 0);
> =20
> +       sensor->link_freq =3D
> +               v4l2_ctrl_new_int_menu(&sensor->ctrls, NULL, V4L2_CID_LIN=
K_FREQ,
> +                                      ARRAY_SIZE(ov5647_link_freqs) - 1,
> +                                      sensor->mode->link_freq_index,
> +                                      ov5647_link_freqs);
> +       if (sensor->link_freq)
> +               sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
>         v4l2_fwnode_device_parse(dev, &props);
> =20
>         v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
>=20
> --=20
> 2.52.0
>

