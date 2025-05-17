Return-Path: <linux-media+bounces-32692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89375ABAC7F
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 22:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85A01189B694
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 20:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246EF215168;
	Sat, 17 May 2025 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IlBNMhOA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13D1A8401
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 20:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747514515; cv=none; b=S2YOC+yVTv2GAUYpndBJcTehQKbUvATBD8Z6hQS5eRcpyjDtmcWzB5z08uSfNZrAz80wxtiIbarn+bNGVLBpo2mzaKe6H0kB3J31m5E8HdzTdiP0vm27AXhOASzCmM9wcARv7HgvL40npZvdS3qMgVPivjhz5E58cyiFVsVhQSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747514515; c=relaxed/simple;
	bh=O6I0cHjlh9oPXPrE12sxsfG9ee4iaShUyGl3Fgq4iEo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HgcrWd2syAKOMsBzQPR2RgF48Dycw56Tu0ZFrTjN6ADzy1nM6jxTEpzT/noydcK/B/2dZEeE5ki2JRzJ/qt0v8ZcxX6AdL9y9nmE9dP3OUB5pPGKfLs6ji+5fr/zf+HiQJxjIoz2kP8K3MxEz57k4+fMrKBRmyRJcAFEJ+HdTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IlBNMhOA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE6D24AD;
	Sat, 17 May 2025 22:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747514491;
	bh=O6I0cHjlh9oPXPrE12sxsfG9ee4iaShUyGl3Fgq4iEo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IlBNMhOA+Xiu1VDT+xJGsvbbHYFG4zc9msbWRHvzcjPhXV4cQov0XIt8FxEmJRjJC
	 b60Fz8FS21DubnUO0e9fywlS5k9NYUSx/YSh9r9Byxqh1E5hhT+ZZjm7urDBtEU7gP
	 33+uNNIu7+LmHvXoJ8vLsaFqBhr4fmTuRDD24Atw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250517114106.43494-7-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com> <20250517114106.43494-7-hdegoede@redhat.com>
Subject: Re: [PATCH 06/23] media: atomisp: gc0310: Add selection API support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 May 2025 21:41:47 +0100
Message-ID: <174751450775.281096.10701361397332094857@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2025-05-17 12:40:49)
> Add support for the selection API as expected by libcamera.
>=20
> Note the driver only supports a single fixed resolution and
> no cropping, so this is a simple read-only implementation.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 42 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 756e56f639b7..7902e732a3ca 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -3,7 +3,7 @@
>   * Support for GalaxyCore GC0310 VGA camera sensor.
>   *
>   * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
> - * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
> + * Copyright (c) 2023-2025 Hans de Goede <hansg@kernel.org>
>   */
> =20
>  #include <linux/delay.h>
> @@ -352,6 +352,43 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
>         return 0;
>  }
> =20
> +static int gc0310_get_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       /* Only the single fixed 656x496 mode is supported, without cropi=
ng */
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP:
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_NATIVE_SIZE:
> +               sel->r.top =3D 0;
> +               sel->r.left =3D 0;
> +               sel->r.width =3D GC0310_NATIVE_WIDTH;
> +               sel->r.height =3D GC0310_NATIVE_HEIGHT;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int gc0310_set_selection(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *state,
> +                               struct v4l2_subdev_selection *sel)
> +{
> +       if (sel->target !=3D V4L2_SEL_TGT_CROP)
> +               return -EINVAL;
> +
> +       /* Only the single fixed 656x496 mode is supported, without cropi=
ng */
> +       sel->r.top =3D 0;
> +       sel->r.left =3D 0;
> +       sel->r.width =3D GC0310_NATIVE_WIDTH;
> +       sel->r.height =3D GC0310_NATIVE_HEIGHT;
> +       return 0;
> +}
> +
>  static int gc0310_detect(struct gc0310_device *sensor)
>  {
>         struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->sd);
> @@ -509,6 +546,8 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_op=
s =3D {
>         .enum_frame_size =3D gc0310_enum_frame_size,
>         .get_fmt =3D gc0310_get_fmt,
>         .set_fmt =3D gc0310_set_fmt,
> +       .get_selection =3D gc0310_get_selection,
> +       .set_selection =3D gc0310_set_selection,

On other sensors I've worked on, we haven't implemented .set_selection()
unless it can be changed. I think this could be simplified here? - Just
the implementation in .get_selection should be enough I think ?

Saves a few lines when it's not configurable.

In imx283.c we have no implementation of .set_selection; though in
imx335.c - we simply set .set_selection =3D imx335_get_selection;

imx415.c also only sets the .get_selection callback ... so maybe I could
already simplify imx335 too!



>         .get_frame_interval =3D gc0310_get_frame_interval,
>  };
> =20
> @@ -671,5 +710,6 @@ static struct i2c_driver gc0310_driver =3D {
>  module_i2c_driver(gc0310_driver);
> =20
>  MODULE_AUTHOR("Lai, Angie <angie.lai@intel.com>");
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>  MODULE_DESCRIPTION("A low-level driver for GalaxyCore GC0310 sensors");
>  MODULE_LICENSE("GPL");
> --=20
> 2.49.0
>

