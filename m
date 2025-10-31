Return-Path: <linux-media+bounces-46082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C72C25C55
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 16:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49E6E3AD65C
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 15:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D62230D14;
	Fri, 31 Oct 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FVPrdUHS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE691DC198;
	Fri, 31 Oct 2025 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761923315; cv=none; b=IFo2qF6Bb083wrbP56xEP+RSJ1ohe3OHvR6j+gSY5U54xwaHRca3kbzdsz4EwJyJk3EqJ2CUSNP7ZwFdjg3ExrQwGxffbplw82cwJo9M1BjhLQaC1GKkQUPSeHHL543sZQPxt8I/HY1tyrmJFCALKRvt3Zhe3DV8Wj8tgO0P3ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761923315; c=relaxed/simple;
	bh=+0fVAVV8CjLZmynXrrG3nwndOiUEsEKbv4bJrqEDm4Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=B1tNHHOULvNW1kr98THuBNlteUlZrYsm7/Pe2hMJ5yOTEPWxWasBd7pLUls7krQFxJpCSDWkjUvodRe5vp4D6ElnZcdQUY+F5doVEA22KkiV64+2uWv8KUlzauo7yALGPHGtdp1VchtAN6dG2xLV7KU4hkOefHQkU8Z31YWwklQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FVPrdUHS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77EB1520;
	Fri, 31 Oct 2025 16:06:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761923199;
	bh=+0fVAVV8CjLZmynXrrG3nwndOiUEsEKbv4bJrqEDm4Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FVPrdUHSPwpG9UHeAD08omvYfUTMtQpZCwfs1dunml3+sBPsCr3t/RH49saIRs9iu
	 u/5VuvXYYl3yOzoDRoPCVHOq3OZ/gn57+POohG8KrZILVsoOQ8UvhwZlV68syJ+uPs
	 wYoen17Wx0DGXoPT0DFcCDIH7B5E7C9o7q85awz8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251031114835.113026-3-tarang.raval@siliconsignals.io>
References: <20251031114835.113026-1-tarang.raval@siliconsignals.io> <20251031114835.113026-3-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v1 2/2] media: i2c: imx219: Replace exposure magic value with named constant
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, sakari.ailus@linux.intel.com
Date: Fri, 31 Oct 2025 15:08:27 +0000
Message-ID: <176192330798.567526.14611830953271874355@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Tarang Raval (2025-10-31 11:48:35)
> Introduce IMX219_EXPOSURE_OFFSET (4) and use it instead of the literal
> '4' when computing the maximum coarse exposure. The IMX219 datasheet
> specifies the maximum storage time as frame_length_lines - 4.
> (Ref: Datasheet section 5-7-1)
>=20
> Also fix one indentation issue for consistency.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/imx219.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 40693635c0c3..e87d5a18fe87 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -68,6 +68,7 @@
>  #define IMX219_EXPOSURE_STEP           1
>  #define IMX219_EXPOSURE_DEFAULT                0x640
>  #define IMX219_EXPOSURE_MAX            65535
> +#define IMX219_EXPOSURE_OFFSET                 4
> =20
>  /* V_TIMING internal */
>  #define IMX219_REG_FRM_LENGTH_A                CCI_REG16(0x0160)
> @@ -450,9 +451,9 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 int exposure_max, exposure_def;
> =20
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max =3D format->height + ctrl->val - 4;
> +               exposure_max =3D format->height + ctrl->val - IMX219_EXPO=
SURE_OFFSET;
>                 exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT)=
 ?
> -                       exposure_max : IMX219_EXPOSURE_DEFAULT;
> +                               exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 ret =3D __v4l2_ctrl_modify_range(imx219->exposure,
>                                                imx219->exposure->minimum,
>                                                exposure_max,
> @@ -579,9 +580,9 @@ static int imx219_init_controls(struct imx219 *imx219)
>                                            IMX219_LLP_MIN - mode->width,
>                                            IMX219_LLP_MAX - mode->width, =
1,
>                                            IMX219_LLP_MIN - mode->width);
> -       exposure_max =3D mode->fll_def - 4;
> +       exposure_max =3D mode->fll_def - IMX219_EXPOSURE_OFFSET;
>         exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> -               exposure_max : IMX219_EXPOSURE_DEFAULT;
> +                       exposure_max : IMX219_EXPOSURE_DEFAULT;
>         imx219->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_op=
s,
>                                              V4L2_CID_EXPOSURE,
>                                              IMX219_EXPOSURE_MIN, exposur=
e_max,
> @@ -900,9 +901,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *=
sd,
>                         return ret;
> =20
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max =3D mode->fll_def - 4;
> +               exposure_max =3D mode->fll_def - IMX219_EXPOSURE_OFFSET;
>                 exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT)=
 ?
> -                       exposure_max : IMX219_EXPOSURE_DEFAULT;
> +                               exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 ret =3D __v4l2_ctrl_modify_range(imx219->exposure,
>                                                imx219->exposure->minimum,
>                                                exposure_max,
> --=20
> 2.34.1
>

