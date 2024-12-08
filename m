Return-Path: <linux-media+bounces-22840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B419E87F5
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 21:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE2018829D6
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 20:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ED4192B74;
	Sun,  8 Dec 2024 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/35IJES"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D522C6F7;
	Sun,  8 Dec 2024 20:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733691559; cv=none; b=I2EB605b/VMnoEmC0KYFTWAO3AjS1BytqlELN5hf9hhLG/o1Kx1o0a3qoPADnFmmUXWPgrKJH7y6dNmhfhEcer5B7TkvSthstX5K/cMrEt6o+cfZXU7qV/uBD1VDR+yXaoWwTat5lJyK7o+hC4MQTdvdMs2TpMqHm2XUpQah35Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733691559; c=relaxed/simple;
	bh=+fPE909xOL1WSSAeVJVYz1SeYddsUMY3xFJJv9uJnSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvZVyJs++peTXC88nPwM96QuZTugvaGxKGq3nJE6B4U/5YkHovgUrnslC/jw3nEQTaMbuNXBDGMflp5phj4hKDZ2NHmDzAxd49gqz1/UpnWVyNzyVO4gDzx+Zojv/YazrCawYr6naUERmvtqTZ/aa+wQsKTxbreLYoWd0QvuLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/35IJES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2B4C4AF0B;
	Sun,  8 Dec 2024 20:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733691558;
	bh=+fPE909xOL1WSSAeVJVYz1SeYddsUMY3xFJJv9uJnSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T/35IJESsByRxxykBheGUM+NElUbVQardRk6P0Hn2EpE1zlYTLQEaN6IPjmC+A6aG
	 uJv3yJ0qSWls4stEYQo75937vgrINm2Aco+ID6RHCdOqXeLfA/HK27A/RMd2ogLtw0
	 8MSW4ByJ30fD/D5dO1TUE8phxrwXkNAsxUqAZBZH326v5ks1gjtxhTSJ8bunzWwCiB
	 SPjdweElRM5Nd/OMMnt/oeplHa9J5dWD5CGjyFHK8QYpRlsKXlIOJDcXGh7ZkNcl/x
	 TqbBNH59cMLSLuY0egukXHu+VT71yfo4pU14vtE5eTIQlreCf0A7p0RsuyCViLw4Io
	 o2pS7YILeuFxg==
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-515fc239405so1357551e0c.0;
        Sun, 08 Dec 2024 12:59:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8hm4jp609Q/Wjnrhrm7cKZdMeO4hbf44nBzBaCq86noZNQ8dBbUV7++zEvpO67XcYpCRXe1km5UMc9dg=@vger.kernel.org, AJvYcCVHU1oFi//Pons1FQU05IwJ3ubV8nUSsSOyGJlaa8mk1IKRKTqYWIqpQPbja3roPQu12lX/H3ZAqhFxdlc=@vger.kernel.org, AJvYcCWwRpvX5xQ6pGNCz3BBcAWjJgbz5sADiMtttDyijt/VHJBkejqcoz/FoczSjLJzcnCnazNjrNmyjCPKmZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgwgqq7/qgr/+ydylIe5iHOcIOYXfFj3I57Rcn3BgJSzTgMXJD
	9i2IkzhZ+VSZgYJ/XRWZ41vCCkjNVdphoZk8m68CnI7IWMl36S8tZl5WzWJa1daYvsuLzecrkiF
	7o+ctzq2M8H0clW46TJXxe1gmrAY=
X-Google-Smtp-Source: AGHT+IHLDVqtBQhiwIXzdcS4s1DOvLlXMEACRqCsd3w/lw9reLwrqmCXrXpqdz46ajVIsEdy8XfimWMq9OxRDtDarWY=
X-Received: by 2002:a05:6122:829f:b0:50d:35d9:ad60 with SMTP id
 71dfb90a1353d-515fca12be6mr9389252e0c.5.1733691557388; Sun, 08 Dec 2024
 12:59:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu> <20241207-imx214-v3-7-ab60af7ee915@apitzsch.eu>
In-Reply-To: <20241207-imx214-v3-7-ab60af7ee915@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Sun, 8 Dec 2024 21:59:01 +0100
X-Gmail-Original-Message-ID: <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
Message-ID: <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] media: i2c: imx214: Add vblank and hblank controls
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In general it looks good to me (besides the comments, ignore the nits
if you want to).

I'd recommend that you test with lockdep to make sure that we are not
missing anything, and I'd like to hear back from Sakari regarding the
get_locked_active

Thanks!

On Sat, Dec 7, 2024 at 9:48=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Add vblank control to allow changing the framerate /
> higher exposure values.
>
> The vblank and hblank controls are needed for libcamera support.
>
> While at it, fix the minimal exposure time according to the datasheet.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 106 +++++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 94 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index f1c72db0775eaf4810f762e8798d301c5ad9923c..a7f49dbafe0f54af3c02f5534=
460fdee88a22fe2 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -34,11 +34,17 @@
>
>  /* V-TIMING internal */
>  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> +#define IMX214_VTS_MAX                 0xffff
> +
> +#define IMX214_VBLANK_MIN              890
> +
> +/* HBLANK control - read only */
> +#define IMX214_PPL_DEFAULT             5008
>
>  /* Exposure control */
>  #define IMX214_REG_EXPOSURE            CCI_REG16(0x0202)
> -#define IMX214_EXPOSURE_MIN            0
> -#define IMX214_EXPOSURE_MAX            3184
> +#define IMX214_EXPOSURE_OFFSET         10
> +#define IMX214_EXPOSURE_MIN            1
>  #define IMX214_EXPOSURE_STEP           1
>  #define IMX214_EXPOSURE_DEFAULT                3184
>  #define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> @@ -187,6 +193,8 @@ struct imx214 {
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *pixel_rate;
>         struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *exposure;
>         struct v4l2_ctrl *unit_size;
>
> @@ -202,8 +210,6 @@ static const struct cci_reg_sequence mode_4096x2304[]=
 =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
>         { IMX214_REG_X_ADD_STA, 56 },
>         { IMX214_REG_Y_ADD_STA, 408 },
>         { IMX214_REG_X_ADD_END, 4151 },
> @@ -274,8 +280,6 @@ static const struct cci_reg_sequence mode_1920x1080[]=
 =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
>         { IMX214_REG_X_ADD_STA, 1144 },
>         { IMX214_REG_Y_ADD_STA, 1020 },
>         { IMX214_REG_X_ADD_END, 3063 },
> @@ -359,6 +363,7 @@ static const struct cci_reg_sequence mode_table_commo=
n[] =3D {
>         { IMX214_REG_ORIENTATION, 0 },
>         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
>         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
>         { CCI_REG8(0x4550), 0x02 },
>         { CCI_REG8(0x4601), 0x00 },
>         { CCI_REG8(0x4642), 0x05 },
> @@ -462,18 +467,24 @@ static const struct cci_reg_sequence mode_table_com=
mon[] =3D {
>  static const struct imx214_mode {
>         u32 width;
>         u32 height;
> +
> +       /* V-timing */
> +       unsigned int vts_def;
> +
>         unsigned int num_of_regs;
>         const struct cci_reg_sequence *reg_table;
>  } imx214_modes[] =3D {
>         {
>                 .width =3D 4096,
>                 .height =3D 2304,
> +               .vts_def =3D 3194,
>                 .num_of_regs =3D ARRAY_SIZE(mode_4096x2304),
>                 .reg_table =3D mode_4096x2304,
>         },
>         {
>                 .width =3D 1920,
>                 .height =3D 1080,
> +               .vts_def =3D 3194,
>                 .num_of_regs =3D ARRAY_SIZE(mode_1920x1080),
>                 .reg_table =3D mode_1920x1080,
>         },
> @@ -626,9 +637,36 @@ static int imx214_set_format(struct v4l2_subdev *sd,
>         __crop->width =3D mode->width;
>         __crop->height =3D mode->height;
>
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> +               int exposure_max;
> +               int exposure_def;
> +               int hblank;
> +
>                 imx214->cur_mode =3D mode;
>
> +               /* Update FPS limits */
nit: Update blank limits
> +               __v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLANK_MI=
N,
> +                                        IMX214_VTS_MAX - mode->height, 2=
,
> +                                        mode->vts_def - mode->height);

Is the handler->lock held when we call this function? Can you try
running the code with lockdep?
> +
> +               /* Update max exposure while meeting expected vblanking *=
/
> +               exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET;
> +               exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFAUL=
T);
> +               __v4l2_ctrl_modify_range(imx214->exposure,
> +                                        imx214->exposure->minimum,
> +                                        exposure_max, imx214->exposure->=
step,
> +                                        exposure_def);
> +
> +               /*
> +                * Currently PPL is fixed to IMX214_PPL_DEFAULT, so hblan=
k
> +                * depends on mode->width only, and is not changeable in =
any
> +                * way other than changing the mode.
> +                */
> +               hblank =3D IMX214_PPL_DEFAULT - mode->width;
> +               __v4l2_ctrl_modify_range(imx214->hblank, hblank, hblank, =
1,
> +                                        hblank);
> +       }
> +
>         return 0;
>  }
>
> @@ -678,8 +716,25 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct imx214 *imx214 =3D container_of(ctrl->handler,
>                                              struct imx214, ctrls);
> +       const struct v4l2_mbus_framefmt *format;
> +       struct v4l2_subdev_state *state;
>         int ret;
>
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               int exposure_max, exposure_def;
> +
> +               state =3D v4l2_subdev_get_locked_active_state(&imx214->sd=
);

Sakari, I see that other drivers assume that the active is locked in
set_ctrl. Is this correct?

> +               format =3D v4l2_subdev_state_get_format(state, 0);
> +
> +               /* Update max exposure while meeting expected vblanking *=
/
> +               exposure_max =3D format->height + ctrl->val - IMX214_EXPO=
SURE_OFFSET;
> +               exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFAUL=
T);
> +               __v4l2_ctrl_modify_range(imx214->exposure,
> +                                        imx214->exposure->minimum,
> +                                        exposure_max, imx214->exposure->=
step,
> +                                        exposure_def);
> +       }
> +
>         /*
>          * Applying V4L2 control value only happens
>          * when power is up for streaming
> @@ -691,7 +746,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_EXPOSURE:
>                 cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val,=
 &ret);
>                 break;
> -
> +       case V4L2_CID_VBLANK:
 No need to read the format here?
                      format =3D v4l2_subdev_state_get_format(state, 0);
> +               cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
> +                         format->height + ctrl->val, &ret);
> +               break;
>         default:
>                 ret =3D -EINVAL;
>         }
> @@ -714,8 +772,11 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                 .width =3D 1120,
>                 .height =3D 1120,
>         };
> +       const struct imx214_mode *mode =3D &imx214_modes[0];
>         struct v4l2_fwnode_device_properties props;
>         struct v4l2_ctrl_handler *ctrl_hdlr;
> +       int exposure_max, exposure_def;
> +       int hblank;
>         int ret;
>
>         ret =3D v4l2_fwnode_device_parse(imx214->dev, &props);
> @@ -723,7 +784,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                 return ret;
>
>         ctrl_hdlr =3D &imx214->ctrls;
> -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
>         if (ret)
>                 return ret;
>
> @@ -749,12 +810,27 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>          *
>          * Yours sincerely, Ricardo.
>          */
> +
> +       /* Initial vblank/hblank/exposure parameters based on current mod=
e */
> +       imx214->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> +                                          V4L2_CID_VBLANK, IMX214_VBLANK=
_MIN,
> +                                          IMX214_VTS_MAX - mode->height,=
 2,
> +                                          mode->vts_def - mode->height);
> +
> +       hblank =3D IMX214_PPL_DEFAULT - mode->width;
> +       imx214->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> +                                          V4L2_CID_HBLANK, hblank, hblan=
k,
> +                                          1, hblank);
> +       if (imx214->hblank)
> +               imx214->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET;
> +       exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFAULT);
>         imx214->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_op=
s,
>                                              V4L2_CID_EXPOSURE,
> -                                            IMX214_EXPOSURE_MIN,
> -                                            IMX214_EXPOSURE_MAX,
> +                                            IMX214_EXPOSURE_MIN, exposur=
e_max,
nit: I think it looks nicer with exposure_max in the next line, but
ignore if you prefer this way :)
>                                              IMX214_EXPOSURE_STEP,
> -                                            IMX214_EXPOSURE_DEFAULT);
> +                                            exposure_def);
>
>         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
>                                 NULL,
> @@ -876,6 +952,12 @@ static int imx214_get_frame_interval(struct v4l2_sub=
dev *subdev,
>         return 0;
>  }
>
> +/*
> + * Raw sensors should be using the VBLANK and HBLANK controls to determi=
ne
> + * the frame rate. However this driver was initially added using the
> + * [S|G|ENUM]_FRAME_INTERVAL ioctls with a fixed rate of 30fps.
> + * Retain the frame_interval ops for backwards compatibility, but they d=
o nothing.
> + */

Now that these controls are useless... maybe we can do a dev_warn_once
when the user calls it to leave some output in dmesg?
>  static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
>                                 struct v4l2_subdev_state *sd_state,
>                                 struct v4l2_subdev_frame_interval_enum *f=
ie)
>
> --
> 2.47.1
>
>

