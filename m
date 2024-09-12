Return-Path: <linux-media+bounces-18224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD1976D8E
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 17:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A22EA1C23DE6
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAB81BAEF1;
	Thu, 12 Sep 2024 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dlI1bMjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F6D1BBBDC
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154192; cv=none; b=KqGFr3E2pqBo/H6IzuE+xSaCCoPXSrePkreQkhOWNygIbjCv8LmOGbFMMUm3rOrLYU91a1fP2FOAS6bug6Mdc/AsBL15KX+GS/oXecXuFr6bwvSDExz6EX/rlVf1ZYtfLX+khlQnVdXsqeC1MaT/ItqSe/YemdEy/v5CcrYDERY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154192; c=relaxed/simple;
	bh=rTjIdXGqTtWh6DCGbfiplFxev2qSYEs+DpLwF9tjrwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErDzciHY25yXbeadR/RyXJL8/BLxgVHhyQZHMcBX/JC7UvF9pjdlq2FscXnggFwdF/CKbQLQK3RZhq6kVIziZpRfra2PGG2wGZIlcoolQKBUj84XtmFr3yzlzBk+O4MAEdB/9khinHB3UokalTECbH7O8RBAzHetdsGahpxJbmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dlI1bMjQ; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e1d0e1bffc8so1133091276.1
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1726154189; x=1726758989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jDXM/8JYc74GeqomisgcAX27KJrohlYuCAxmOfiyHE=;
        b=dlI1bMjQdJQtqQNxiXmBkb5qMhB/Eqw97E1hayar0drl7f1SblvzmyTtaalGHx1Zl7
         oCH0GeTPEBg7QGxxaniQ1j4So/uBk9OUTFYAHXXOrT2yxNtKKW60L0fNXm4UCpOqWTfZ
         go4dTXcFmjhBqQ9RsMbHN2Fz4+Kfaz1B9HEgNK5s17Vdq1ZLW+BLM4A2TlVPlR0STlFL
         9qB0B2RwNe0cmlvXIAyrNbQezwF5FjQvHK7ZuK1GILrMcOQeBwjOYdb5diaZy4k/qtv/
         TwJrV+b/Hyr5bmpLOR+G0qAFIdbRGmvbTEx1w+1hA3kr1IZK6rLuZWbvCAEcgiZlYVCF
         vMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726154189; x=1726758989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jDXM/8JYc74GeqomisgcAX27KJrohlYuCAxmOfiyHE=;
        b=NKt/6gZGRr/MooQgiZi77eXJNozdybT64UJhrRF0V7ywYnPgdV0RRB/rUOJafgF+kC
         GnJL0c5UjkTjJLZFtg8iown1f3HOUIGbcMxP+29DvMt3dvCKfvfs2Xtn8d7wwtYQLNo0
         CHzTW+2ffvnqG8z3C0XCeXLYdgpE+uWhWPa/qd/p+pS3dhVJA5fLUNaEGuD5rg84nX26
         mjpXju6ZVhtfcUbgEtS3pYA8rxG+dkzE+VHUY0k8q6Xy2BS86jsP0nedQBADPeSJZcO1
         rD4GRaksk5MXjDDzU5PwCcprfFIn6NMwsPL+r1eWXZEon07Ch8iwBSDYnQQqzJRVCeVl
         14bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9hYxr14Ll7RIM8rBeX/PIgpmoSW6CqZg0mAOTTdTpBJQkyBB2HPWUcyZpZ0te6MO+yDgyfeQu5x2gAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+XATn9/vQISG0c5MWsv1CQCnEe5x/MykSFMecv79fp0F/nrL
	L+H8bVd0khxzTOeiItHLJK6g3h2cAu0B5/NBnT9qFkMNn7931UcUorKfJjVTSxxLYhksVyPvy7U
	3+99dnIAPVoAA/Jdtx7/JqwW65GdiXLnbT91qbA==
X-Google-Smtp-Source: AGHT+IHUOVEIikRTp4j+VV9CsLzlAMQU/EfA+K9ougOAUrzzUXwDf5IHXBGuxgEuzZwwJAlz4uNTezgk08+2j1j4E6o=
X-Received: by 2002:a05:6902:e0e:b0:e11:6961:2fdf with SMTP id
 3f1490d57ef6-e1d9dbd22c7mr2934644276.33.1726154189157; Thu, 12 Sep 2024
 08:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-10-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-10-c96cba989315@apitzsch.eu>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Sep 2024 16:16:13 +0100
Message-ID: <CAPY8ntCjaJBmmjjbHz8PaT=eZQY0-BTjM==foMwZWpPTDHtcfg@mail.gmail.com>
Subject: Re: [PATCH 10/13] media: i2c: imx214: Implement vflip/hflip controls
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Mon, 2 Sept 2024 at 22:54, Andr=C3=A9 Apitzsch via B4 Relay
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

A minor optimisation.
Currently a VIDIOC_S_EXT_CTRLS with both HFLIP and VFLIP in the list
will call your set_ctrl function twice, which gives a redundant update
to the register.
Define the two controls as a cluster via v4l2_ctrl_cluster(), and
you'll only get called once.

See ccs-core.c or imx290.c for an example, and docs at
https://www.kernel.org/doc/html/latest/driver-api/media/v4l2-controls.html#=
control-clusters

  Dave

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
>

