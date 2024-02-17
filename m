Return-Path: <linux-media+bounces-5346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA1E859063
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAA8F28216D
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532E07C0B1;
	Sat, 17 Feb 2024 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D9s9UGXB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5085D42A96
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708182432; cv=none; b=UAxRFvKaX9QMkpv6xBXE5qwpny/R4qoHdFyb9LNunkdIpTTWvyp2H8Bc7wCqbO1QShgr2Vfx4J3WXgxa2fv5y9tcBNldmOiTJoXh4M/WrTjYq1U3QLu4YAv9p03vfIKj21R4M0oGf8NKTxtQO+XTu1TgWgCBjxZMR3jv7Li4fHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708182432; c=relaxed/simple;
	bh=JbE3wXIcUUGrObT5bjCKQoodjnLB+rH/PAhB4g6BTjs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qOdLIj9gjV8RVzfiZjVd4g9MF1hHwlRFlj/RZrB7t5PC1xfaVkAE3++w+zfWQ8cld83Fg7nFbMf9rbIj4J6U/3OqfGGDzB3RjTWawQiLqmhyVu3WTeMUv/N/Fq+8Ub1nLkMPPGTaxWqaLQlutkYs2TIHyQ1RRSGd8ei5v4Nn1kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D9s9UGXB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39B816B3;
	Sat, 17 Feb 2024 16:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708182424;
	bh=JbE3wXIcUUGrObT5bjCKQoodjnLB+rH/PAhB4g6BTjs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=D9s9UGXB5oxeiLcTPwMWoDy6KTrwknQTLTrGHYKNWDeogo2ht9N6In0NeP+1Tfm6c
	 DJH7ZEXpZHjWixNFD8nlDTEsS6UJzcv2SXh+o8Y4yv96+4K9c7AFvRhkdJ9vOp1tkf
	 klbQ//sI5iaqFVoI02lFeoATmQxZzpyYOxA08viM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240217112438.15240-3-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-3-hdegoede@redhat.com>
Subject: Re: [PATCH 2/9] media: atomisp: Rename atomisp_set_crop_and_fmt()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:07:06 +0000
Message-ID: <170818242655.1206667.4153866878574644630@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-17 11:24:31)
> Rename atomisp_set_crop_and_fmt() to atomisp_set_sensor_crop_and_fmt()
> to make clear that it operates on the sensor subdev.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/st=
aging/media/atomisp/pci/atomisp_cmd.c
> index 8593ba90605f..eb37bb6e41f9 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3721,9 +3721,9 @@ void atomisp_get_padding(struct atomisp_device *isp=
, u32 width, u32 height,
>         *padding_h =3D max_t(u32, *padding_h, min_pad_h);
>  }
> =20
> -static int atomisp_set_crop_and_fmt(struct atomisp_device *isp,
> -                                   struct v4l2_mbus_framefmt *ffmt,
> -                                   int which)
> +static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
> +                                          struct v4l2_mbus_framefmt *ffm=
t,
> +                                          int which)

I went to look this up and I only see atomisp_set_crop() so I guess I've
missed some patches.

Does the atomisp use the usual v4l2-subdev drivers for sensors? or are
they separate for now ?

I'm curious about how it's handling the binning in that function, but
that's not specific to this patch which looks reasonable so far so:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  {
>         struct atomisp_input_subdev *input =3D &isp->inputs[isp->asd.inpu=
t_curr];
>         struct v4l2_subdev_selection sel =3D {
> @@ -3817,7 +3817,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, str=
uct v4l2_pix_format *f,
> =20
>         dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.h=
eight);
> =20
> -       ret =3D atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_T=
RY);
> +       ret =3D atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_F=
ORMAT_TRY);
>         if (ret)
>                 return ret;
> =20
> @@ -4263,7 +4263,7 @@ static int atomisp_set_fmt_to_snr(struct video_devi=
ce *vdev, const struct v4l2_p
> =20
>         /* Disable dvs if resolution can't be supported by sensor */
>         if (asd->params.video_dis_en && asd->run_mode->val =3D=3D ATOMISP=
_RUN_MODE_VIDEO) {
> -               ret =3D atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_=
FORMAT_TRY);
> +               ret =3D atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_=
SUBDEV_FORMAT_TRY);
>                 if (ret)
>                         return ret;
> =20
> @@ -4281,7 +4281,7 @@ static int atomisp_set_fmt_to_snr(struct video_devi=
ce *vdev, const struct v4l2_p
>                 }
>         }
> =20
> -       ret =3D atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_A=
CTIVE);
> +       ret =3D atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_F=
ORMAT_ACTIVE);
>         if (ret)
>                 return ret;
> =20
> --=20
> 2.43.0
>

