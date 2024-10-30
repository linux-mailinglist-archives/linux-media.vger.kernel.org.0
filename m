Return-Path: <linux-media+bounces-20591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D29B62BC
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 13:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51C152842C3
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517051EABBB;
	Wed, 30 Oct 2024 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1zjYHYC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C05E1E7C37;
	Wed, 30 Oct 2024 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290437; cv=none; b=X8TPlnv5XjZWdGM5ZSRiH0l2SImMppKM/OyvP/599AjPPGvplnfmGnJoG8rwj2vZDPl6Jqz8NSwv0Lxq6DI/cCJOXboE6Eynr2pJN2HPsn57VZtTDti61lMqbkuVbGdiKUmXm7xkD+k/R8WhVgGNTZQPAOnBCdlhcoeXUEv39Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290437; c=relaxed/simple;
	bh=GdAzj4jgO10z+tRB6fVzWdX2dwObyUMs2rKcZqXCd/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA7PtPPEX6TLciESaAB11ngc41yP8uDlS4MqnK3JaMrk68jznkB/ePGmiUn6m4WXpGclLsRznDusmk1q1YSZmi5JVc+WCGZOwE3E2/we47sRSYWj/Ss7M7jil7eQ70L2oB2cgASR1fMrX5qWXTolE1YG6BdtbNiJT30PlXltFjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1zjYHYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177F9C4CEE5;
	Wed, 30 Oct 2024 12:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730290437;
	bh=GdAzj4jgO10z+tRB6fVzWdX2dwObyUMs2rKcZqXCd/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E1zjYHYCSkbxnQnrMnhkeC9CUeu5CjCwJnmgfGG97FVY97sTLs9wseLWIovNcXE5b
	 yRoa2JroG6Nrv3za56eYx2nRV9tCb1RLRBwMVziOGqfXoIu6vyOdkUHVPOG75FMU03
	 aMH//50PUqLcv2dT4+/otZg9PE2PhgAvSrG/DiZArjKFoj2WzOZhyrWyCsemSyh6rF
	 jHPHTzQ48vkNZMIUQjHgHvG4x4gyPniszvbayPhAU8yCR9jHHTthuzE0rOH3JEtb00
	 cJwDBXh8VLNUETthgkhYH8K66VTfo3pim/eUNULAt38eCJKvwrD6k671Psfj6y4m/J
	 ItCIyS9hXFYTw==
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4a482407e84so2139720137.0;
        Wed, 30 Oct 2024 05:13:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOTXoQ/HrFzkQzgbqNTaRVB/u5Gheyw7BhqwBmxO4tgaFXh03V4Ud+LR7UtwFCHCIm0VWO043asr3L5fQ=@vger.kernel.org, AJvYcCXSqL0gotJjfeXJKpMh/jzSBNiYFC7UBwdPKgO3nDEoCxb4Senu/GYoweh3FmGJ3yxV0dn7ZqNsHKsi/vc=@vger.kernel.org, AJvYcCXa4aar8kyEpYLSKfvPqtlBmI85QZD0SlTBPmyxyS075GhssasmZUquRmInWpLyoYrMob+n8v81kO0NSWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdj+/7fNxa8hA6bRg6k4n9wqIc2H7iQTg4VccO9FYGezlXDfxX
	gCUFrL13xvZFeoLF5nupXzJZi+fxMhERG2y8KAXYWlE04JyUGlEv+mtE9vKL9/paT+sDPaWBA6r
	j/OiFDtOKVxeI5kLlX4Y4ocxvmus=
X-Google-Smtp-Source: AGHT+IEEkBH7dcE3EuxxBOQ2YVeyUGO16scQe2vBo9mODwguwXMRL1PwHbM6SuJRfaZUz9RNZfK/S5OyHyiiOSV1sD4=
X-Received: by 2002:a05:6102:374f:b0:4a4:8a29:a902 with SMTP id
 ada2fe7eead31-4a8cfb42fa8mr13974672137.3.1730290436135; Wed, 30 Oct 2024
 05:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu> <20241021-imx214-v2-10-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-10-fbd23e99541e@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Wed, 30 Oct 2024 13:13:39 +0100
X-Gmail-Original-Message-ID: <CAPybu_3WMzR0hxqLh55Cz0kn1kcR66P5EYQEB_7LJBdMyE5BFA@mail.gmail.com>
Message-ID: <CAPybu_3WMzR0hxqLh55Cz0kn1kcR66P5EYQEB_7LJBdMyE5BFA@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] media: i2c: imx214: Implement vflip/hflip controls
To: git@apitzsch.eu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 12:14=E2=80=AFAM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> The imx214 sensor supports horizontal and vertical flipping. Add
> appropriate controls to the driver.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/imx214.c | 69 ++++++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 61 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 87a03e292e19ccd71f1b2dcee3409826b2f5cb6f..f2d21c2e8cf84ed25403c98e2=
80073f32e50e758 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -30,7 +30,6 @@
>  #define IMX214_DEFAULT_LINK_FREQ 600000000
>  #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10=
)
>  #define IMX214_FPS 30
> -#define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
>
>  /* V-TIMING internal */
>  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> @@ -189,6 +188,22 @@ static const char * const imx214_supply_name[] =3D {
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
> @@ -204,6 +219,10 @@ struct imx214 {
>         struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *exposure;
>         struct v4l2_ctrl *unit_size;
> +       struct {
> +               struct v4l2_ctrl *hflip;
> +               struct v4l2_ctrl *vflip;
> +       };
>
>         const struct imx214_mode *cur_mode;
>
> @@ -339,7 +358,6 @@ static const struct cci_reg_sequence mode_table_commo=
n[] =3D {
>
>         /* global setting */
>         /* basic config */
> -       { IMX214_REG_ORIENTATION, 0 },
>         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
>         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
>         { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
> @@ -518,11 +536,21 @@ static int __maybe_unused imx214_power_off(struct d=
evice *dev)
>         return 0;
>  }
>
> +/* Get bayer order based on flip setting. */
> +static u32 imx214_get_format_code(struct imx214 *imx214)
> +{
> +       unsigned int i;
> +
> +       i =3D (imx214->vflip->val ? 2 : 0) | (imx214->hflip->val ? 1 : 0)=
;
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
> +       fmt->code =3D imx214_get_format_code(imx214);
>         fmt->width =3D mode->width;
>         fmt->height =3D mode->height;
>         fmt->field =3D V4L2_FIELD_NONE;
> @@ -538,10 +566,12 @@ static int imx214_enum_mbus_code(struct v4l2_subdev=
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
> +       code->code =3D imx214_get_format_code(imx214);
>
>         return 0;
>  }
> @@ -550,7 +580,11 @@ static int imx214_enum_frame_size(struct v4l2_subdev=
 *subdev,
>                                   struct v4l2_subdev_state *sd_state,
>                                   struct v4l2_subdev_frame_size_enum *fse=
)
>  {
> -       if (fse->code !=3D IMX214_MBUS_CODE)
> +       struct imx214 *imx214 =3D to_imx214(subdev);
> +       u32 code;
> +
> +       code =3D imx214_get_format_code(imx214);
> +       if (fse->code !=3D code)
>                 return -EINVAL;
>
>         if (fse->index >=3D ARRAY_SIZE(imx214_modes))
> @@ -713,6 +747,7 @@ static int imx214_entity_init_state(struct v4l2_subde=
v *subdev,
>         struct v4l2_subdev_format fmt =3D { };
>
>         fmt.which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FOR=
MAT_ACTIVE;
> +       fmt.format.code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
>         fmt.format.width =3D imx214_modes[0].width;
>         fmt.format.height =3D imx214_modes[0].height;
>
> @@ -755,6 +790,11 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
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
> @@ -793,7 +833,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                 return ret;
>
>         ctrl_hdlr =3D &imx214->ctrls;
> -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
> +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 10);
>         if (ret)
>                 return ret;
>
> @@ -830,6 +870,18 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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
> +       v4l2_ctrl_cluster(2, &imx214->hflip);
> +
>         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
>                                 NULL,
>                                 V4L2_CID_UNIT_CELL_SIZE,
> @@ -1023,6 +1075,7 @@ static int imx214_enum_frame_interval(struct v4l2_s=
ubdev *subdev,
>                                 struct v4l2_subdev_state *sd_state,
>                                 struct v4l2_subdev_frame_interval_enum *f=
ie)
>  {
> +       struct imx214 *imx214 =3D to_imx214(subdev);
>         const struct imx214_mode *mode;
>
>         if (fie->index !=3D 0)
> @@ -1032,7 +1085,7 @@ static int imx214_enum_frame_interval(struct v4l2_s=
ubdev *subdev,
>                                 ARRAY_SIZE(imx214_modes), width, height,
>                                 fie->width, fie->height);
>
> -       fie->code =3D IMX214_MBUS_CODE;
> +       fie->code =3D imx214_get_format_code(imx214);
>         fie->width =3D mode->width;
>         fie->height =3D mode->height;
>         fie->interval.numerator =3D 1;
>
> --
> 2.47.0
>
>

