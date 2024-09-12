Return-Path: <linux-media+bounces-18205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 505D2976AED
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28A91F26A44
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF9B1B9834;
	Thu, 12 Sep 2024 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OT2Goibc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456601B9826;
	Thu, 12 Sep 2024 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148423; cv=none; b=uYqqaEVoKE6t0uzSetXV9X7QKhak8MPtIwpoRFUq5cj5gUD7I3JMcXOLFiGqpnE+1yXHdfBHVodMLzI6/Kq982JUJcgCezyfRXoIMKSdOLgZdtaig9ktvBUji+iUCvxAv1GAOdIbgnDl43WTZ7iT4B75+9Py2oe0vFGXoHkYgVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148423; c=relaxed/simple;
	bh=qxtIxS5YjK/HcOHqWqqJ+2UDG0bDrzbXfuzCossThek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZcofY0Go+DcGF2k9s57mRr7/mM1/H+gpkJxukhmt4Ht1m3f547svpmH+BpRZNPUgbz3fpQgz/dtqJrMaEqyflJSbIp1ilmzjAtwGiXLRj8Q05Kno2KuQnTUu3vk6wKcRI2OyaEywn1wjJT5r6CsopG3dDr+0T12MwuzZ1A2fmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OT2Goibc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC18C4CECD;
	Thu, 12 Sep 2024 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148422;
	bh=qxtIxS5YjK/HcOHqWqqJ+2UDG0bDrzbXfuzCossThek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OT2Goibc62E9LdWm47NV/z55Z/0okxCoN625VdiyV8Wt+DkG8zLdqfWHBVaUlvBLo
	 DP6D2Nvwd9/AqywsvAnubzyGaLKO9+mMkon+Pr1Ob3usqPZaBWPYiCx/8hSabX9Ej1
	 DAhAVi6OYkOaFmEmEOep9oZlfAWXIfMKj1oKAcKve+N65jYiyTWHJlSbXQRlSYF6No
	 gEkZNXDnNtfPu285kahrzMc1uOOm3z1f87knUb8LWznAXBk2dKXqMY3yPG/8bKA6qy
	 JpXurJt5BCl8sReBpWhkmbPj2jJdnAKbixug3y/J3WufusimFMBPmO2lwi3CkuAQVg
	 bbGdKgpnLbjlQ==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-710e14e2134so439447a34.0;
        Thu, 12 Sep 2024 06:40:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5vSq6rdJ3lUjc5c6NT24plnbRker0RvQIXj2pSTNS/9wRvvD5DUlgH+uDVi8zmHmJGxN7i0TZZLzvdik=@vger.kernel.org, AJvYcCVHoH3Fz/HxYSBlQrjUm70H7ARLq/QV8zQxR1fd+yeVrMcbKPahTb3AYD+ZeV6R8IYI/dwKl7CEQN+pX0w=@vger.kernel.org, AJvYcCXfpP3ZzZP2J+XQDmpnwxBcebXkrXr8LYcAD963zL2E/KTLazycNhE/soOnrodrCN8CcZlatkn+1YcblVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0SLYPr+7bfU90wbPKhDcIsiU+6d4As92jc2l4hpYA/oinqXM/
	qgRY+KPvnVjuwEgCSVN/elQk8XH6topQawhFU8omYlTnMgTgyW6gIZcQIZ4/QaCFwUnMlamlGK+
	nR3NnJP9zlkMgA1A/zNtl2ky/f6w=
X-Google-Smtp-Source: AGHT+IEv+J8gw7V9S3v4Oae4wszUxgkesmSD3aOtBLoxYMbe/c0EkZmZTzIDQvZvalBrFVpsnh0DT88oW2MOSUA+e9U=
X-Received: by 2002:a05:6358:3204:b0:1aa:c492:1d34 with SMTP id
 e5c5f4694b2df-1bb23ddff9fmr128136755d.23.1726148422149; Thu, 12 Sep 2024
 06:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-10-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-10-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:05 +0200
X-Gmail-Original-Message-ID: <CAPybu_3MgPka8uuHjx8zxY7u7XRjSnob3WRDMKtqGfP-sPEwhg@mail.gmail.com>
Message-ID: <CAPybu_3MgPka8uuHjx8zxY7u7XRjSnob3WRDMKtqGfP-sPEwhg@mail.gmail.com>
Subject: Re: [PATCH 10/13] media: i2c: imx214: Implement vflip/hflip controls
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> The imx214 sensor supports horizontal and vertical flipping. Add
> appropriate controls to the driver.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 73 ++++++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 65 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 733f55257585..4a1433728cd5 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -30,7 +30,6 @@
>  #define IMX214_DEFAULT_LINK_FREQ 480000000
>  #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10=
)
>  #define IMX214_FPS 30
> -#define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
>
>  /* V-TIMING internal */
>  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> @@ -186,6 +185,22 @@ static const char * const imx214_supply_name[] =3D {
>
>  #define IMX214_NUM_SUPPLIES ARRAY_SIZE(imx214_supply_name)
>
> +/*
> + * The supported formats.
> + * This table MUST contain 4 entries per format, to cover the various fl=
ip
> + * combinations in the order
> + * - no flip
> + * - h flip
> + * - v flip
> + * - h&v flips
> + */
> +static const u32 imx214_mbus_formats[] =3D {
> +       MEDIA_BUS_FMT_SRGGB10_1X10,
> +       MEDIA_BUS_FMT_SGRBG10_1X10,
> +       MEDIA_BUS_FMT_SGBRG10_1X10,
> +       MEDIA_BUS_FMT_SBGGR10_1X10,
> +};
> +
>  struct imx214 {
>         struct device *dev;
>         struct clk *xclk;
> @@ -202,6 +217,8 @@ struct imx214 {
>         struct v4l2_ctrl *vblank;
>         struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *vflip;
> +       struct v4l2_ctrl *hflip;
>         struct v4l2_ctrl *unit_size;
>
>         struct regulator_bulk_data      supplies[IMX214_NUM_SUPPLIES];
> @@ -339,7 +356,6 @@ static const struct cci_reg_sequence mode_table_commo=
n[] =3D {
>
>         /* global setting */
>         /* basic config */
> -       { IMX214_REG_ORIENTATION, 0 },
>         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
>         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
>         { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
> @@ -518,11 +534,29 @@ static int __maybe_unused imx214_power_off(struct d=
evice *dev)
>         return 0;
>  }
>
> +/* Get bayer order based on flip setting. */
> +static u32 imx214_get_format_code(struct imx214 *imx214, u32 code)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(imx214_mbus_formats); i++)
> +               if (imx214_mbus_formats[i] =3D=3D code)
> +                       break;
> +
> +       if (i >=3D ARRAY_SIZE(imx214_mbus_formats))
> +               i =3D 0;

i will have values between 0 and 3, so  (i & ~3) is always 0.
You can remove the loop and the code argument.


> +
> +       i =3D (i & ~3) | (imx214->vflip->val ? 2 : 0) |
> +           (imx214->hflip->val ? 1 : 0);
> +
> +       return imx214_mbus_formats[i];
> +}
> +
>  static void imx214_update_pad_format(struct imx214 *imx214,
>                                      const struct imx214_mode *mode,
>                                      struct v4l2_mbus_framefmt *fmt, u32 =
code)
>  {
> -       fmt->code =3D IMX214_MBUS_CODE;
> +       fmt->code =3D imx214_get_format_code(imx214, code);
>         fmt->width =3D mode->width;
>         fmt->height =3D mode->height;
>         fmt->field =3D V4L2_FIELD_NONE;
> @@ -538,10 +572,12 @@ static int imx214_enum_mbus_code(struct v4l2_subdev=
 *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
>  {
> -       if (code->index > 0)
> +       struct imx214 *imx214 =3D to_imx214(sd);
> +
> +       if (code->index >=3D (ARRAY_SIZE(imx214_mbus_formats) / 4))
>                 return -EINVAL;
>
> -       code->code =3D IMX214_MBUS_CODE;
> +       code->code =3D imx214_get_format_code(imx214, imx214_mbus_formats=
[code->index * 4]);
>
>         return 0;
>  }
> @@ -550,7 +586,11 @@ static int imx214_enum_frame_size(struct v4l2_subdev=
 *subdev,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_frame_size_enum *fse=
)
>  {
> -       if (fse->code !=3D IMX214_MBUS_CODE)
> +       struct imx214 *imx214 =3D to_imx214(subdev);
> +       u32 code;
> +
> +       code =3D imx214_get_format_code(imx214, fse->code);
> +       if (fse->code !=3D code)
>                 return -EINVAL;
>
>         if (fse->index >=3D ARRAY_SIZE(imx214_modes))
> @@ -708,6 +748,7 @@ static int imx214_entity_init_state(struct v4l2_subde=
v *subdev,
>         struct v4l2_subdev_format fmt =3D { };
>
>         fmt.which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FOR=
MAT_ACTIVE;
> +       fmt.format.code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
>         fmt.format.width =3D imx214_modes[0].width;
>         fmt.format.height =3D imx214_modes[0].height;
>
> @@ -750,6 +791,11 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_EXPOSURE:
>                 cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val,=
 &ret);
>                 break;
> +       case V4L2_CID_HFLIP:
> +       case V4L2_CID_VFLIP:
> +               cci_write(imx214->regmap, IMX214_REG_ORIENTATION,
> +                         imx214->hflip->val | imx214->vflip->val << 1, &=
ret);
> +               break;
>         case V4L2_CID_VBLANK:
>                 cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
>                           format->height + ctrl->val, &ret);
> @@ -788,7 +834,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                 return ret;
>
>         ctrl_hdlr =3D &imx214->ctrls;
> -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
> +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 10);
>         if (ret)
>                 return ret;
>
> @@ -825,6 +871,16 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                                              IMX214_EXPOSURE_STEP,
>                                              exposure_def);
>
> +       imx214->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> +       if (imx214->hflip)
> +               imx214->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +       imx214->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> +       if (imx214->vflip)
> +               imx214->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
>         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
>                                 NULL,
>                                 V4L2_CID_UNIT_CELL_SIZE,
> @@ -1034,6 +1090,7 @@ static int imx214_enum_frame_interval(struct v4l2_s=
ubdev *subdev,
>                                 struct v4l2_subdev_state *sd_state,
>                                 struct v4l2_subdev_frame_interval_enum *f=
ie)
>  {
> +       struct imx214 *imx214 =3D to_imx214(subdev);
>         const struct imx214_mode *mode;
>
>         if (fie->index !=3D 0)
> @@ -1043,7 +1100,7 @@ static int imx214_enum_frame_interval(struct v4l2_s=
ubdev *subdev,
>                                 ARRAY_SIZE(imx214_modes), width, height,
>                                 fie->width, fie->height);
>
> -       fie->code =3D IMX214_MBUS_CODE;
> +       fie->code =3D imx214_get_format_code(imx214, fie->code);
>         fie->width =3D mode->width;
>         fie->height =3D mode->height;
>         fie->interval.numerator =3D 1;
>
> --
> 2.46.0
>
>

