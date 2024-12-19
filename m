Return-Path: <linux-media+bounces-23842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA69F85B4
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 21:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4424A16857A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDBE1DC990;
	Thu, 19 Dec 2024 20:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csVtJdF7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22301DC985;
	Thu, 19 Dec 2024 20:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734639339; cv=none; b=H6EfmZU/d7rNLxO+0Osv0kiswvUh4Kmy6tWQeyI1Z+U6KI+M1GW7sjP/uDy+HGtzCUvhLouVKbppxQY5ZXqUUbn/2aeCC+qF/xZpiYXYjLrg6UXm5kx9RAd937CJmZHrg+E0QAfZf9sA7BmVZolR6KHwpYtXRspwTXoGxRntgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734639339; c=relaxed/simple;
	bh=s55+Xa+U4p/HLnw0PSVFKiq1ZeNqsw8UinsREMLPwzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVIol4FG+RzsFgGBd4cE7J6tIAwdeYqo4eH3FenhPdn4OxS0yDTPwuCJSXhOKWJkNYBRSHTHmMhZTYJ0hZwObJMMCV1rUL2ncOG3QH2xpKeaH1+DcGqdBMgzq3wi+BMlwOs3mawj23uJxZH/MYGXwnUDk8+v+BqmQd1OyIDXaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csVtJdF7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3748EC4CED6;
	Thu, 19 Dec 2024 20:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734639339;
	bh=s55+Xa+U4p/HLnw0PSVFKiq1ZeNqsw8UinsREMLPwzs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=csVtJdF7SNCzG5AK2UG/1oftfQJ+SmNh2sQpxxW6koZlKYwx5wNe0OC5JM6jAaq0z
	 nnWFsdH288ZTNrQcKDAJwwOb9918gPCdWPJcORutcp2usJ6eoRU5RFTuACVhlqGml+
	 eOEVm1Mn6SyazIXGOLYiMJmN/2rJyUaz2zRCs3lounBeydCS/rNWsUjuITjdO8PmdD
	 5lwKtBLERqr4RN3C+h0AeCaY3fE4UQmuXHX9ETm5ajTV/geuOB8hlWcuDlP28ZLDHd
	 jqb/pB/iaYkPcN8gL5uKABkk4nTvkj0PjvE9c6rGwLij8DIoloQ0s67rUYbOtZFOmJ
	 8YYLGC3b7rKSw==
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afed12283eso691952137.1;
        Thu, 19 Dec 2024 12:15:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqAueShWyAIxwe0CLot9YnHL/KoiMExN/mGeYUjeBvuEYUPmOEj0poN2xTL1j0vfz8EMl573d+2ylOCEA=@vger.kernel.org, AJvYcCXEg09TZXC43JshohAlGp+EfosC4183k8O5SK+L0KdYeImaDZEiDeD0JfCm52sCc5rCZPT/sLhejNEJrX8=@vger.kernel.org, AJvYcCXJexHKtsEq9HGTQ7XUxx03m+/TuVaCAqAqHSHtQq/Py5z0QI9JgD4KbfZb+yqR40GJ48kfSeh9ssAWsBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy7G6k6QumIv7OZaa626T5kG5iDnJXfb7MzXOoShmIS9juhaQj
	p2O5UqB89ddpM6smNNrfa8l1xLpmDpME4/ELDIw4r7fHhL2aNmMnRgxrfdPVcdEzMZofAodY5/Y
	L2HcGfqPUqZ2jAlTGtPZOvDb4YAw=
X-Google-Smtp-Source: AGHT+IGCOO+OZb2PZIprBqRfMxd0i5WRdy5NKFZKYG5l2A2V+Re+M5FJY8YOJqR/MWPwetGVSRz3CqDUILXizPJC3pc=
X-Received: by 2002:a05:6102:3e83:b0:4b2:5d16:2902 with SMTP id
 ada2fe7eead31-4b2cc323e38mr729641137.6.1734639338251; Thu, 19 Dec 2024
 12:15:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu> <20241217-imx214-v5-7-387f52adef4d@apitzsch.eu>
In-Reply-To: <20241217-imx214-v5-7-387f52adef4d@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 19 Dec 2024 21:15:22 +0100
X-Gmail-Original-Message-ID: <CAPybu_2K0eimAVsH+SbE_QJ492AGUhE8MxOJnqEnow_G2i1GYw@mail.gmail.com>
Message-ID: <CAPybu_2K0eimAVsH+SbE_QJ492AGUhE8MxOJnqEnow_G2i1GYw@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] media: i2c: imx214: Add vblank and hblank controls
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 10:39=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
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
>  drivers/media/i2c/imx214.c | 108 +++++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 98 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 4f6c4f845a7ab36c7674a4ce8c1664d48e46c4d0..81d4ef67bcb5c660dfaab1203=
9f8c683d7a7d683 100644
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
> @@ -200,8 +208,6 @@ static const struct cci_reg_sequence mode_4096x2304[]=
 =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
>         { IMX214_REG_X_ADD_STA, 56 },
>         { IMX214_REG_Y_ADD_STA, 408 },
>         { IMX214_REG_X_ADD_END, 4151 },
> @@ -272,8 +278,6 @@ static const struct cci_reg_sequence mode_1920x1080[]=
 =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
>         { IMX214_REG_X_ADD_STA, 1144 },
>         { IMX214_REG_Y_ADD_STA, 1020 },
>         { IMX214_REG_X_ADD_END, 3063 },
> @@ -357,6 +361,7 @@ static const struct cci_reg_sequence mode_table_commo=
n[] =3D {
>         { IMX214_REG_ORIENTATION, 0 },
>         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
>         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
>         { CCI_REG8(0x4550), 0x02 },
>         { CCI_REG8(0x4601), 0x00 },
>         { CCI_REG8(0x4642), 0x05 },
> @@ -460,18 +465,24 @@ static const struct cci_reg_sequence mode_table_com=
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
> @@ -625,6 +636,34 @@ static int imx214_set_format(struct v4l2_subdev *sd,
>         __crop->width =3D mode->width;
>         __crop->height =3D mode->height;
>
> +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> +               int exposure_max;
> +               int exposure_def;
> +               int hblank;
> +
> +               /* Update blank limits */
> +               __v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLANK_MI=
N,
> +                                        IMX214_VTS_MAX - mode->height, 2=
,
> +                                        mode->vts_def - mode->height);
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
> @@ -674,8 +713,26 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct imx214 *imx214 =3D container_of(ctrl->handler,
>                                              struct imx214, ctrls);
> +       const struct v4l2_mbus_framefmt *format =3D NULL;
> +       struct v4l2_subdev_state *state;
>         int ret;
>
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               int exposure_max, exposure_def;
> +
> +               state =3D v4l2_subdev_get_locked_active_state(&imx214->sd=
);
> +               format =3D v4l2_subdev_state_get_format(state, 0);
> +
> +               /* Update max exposure while meeting expected vblanking *=
/
> +               exposure_max =3D
> +                       format->height + ctrl->val - IMX214_EXPOSURE_OFFS=
ET;
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
> @@ -687,7 +744,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_EXPOSURE:
>                 cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val,=
 &ret);
>                 break;
> -
> +       case V4L2_CID_VBLANK:
> +               cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
> +                         format->height + ctrl->val, &ret);
> +               break;
>         default:
>                 ret =3D -EINVAL;
>         }
> @@ -710,8 +770,11 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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
> @@ -719,7 +782,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                 return ret;
>
>         ctrl_hdlr =3D &imx214->ctrls;
> -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
>         if (ret)
>                 return ret;
>
> @@ -745,12 +808,28 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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
>                                              IMX214_EXPOSURE_MIN,
> -                                            IMX214_EXPOSURE_MAX,
> +                                            exposure_max,
>                                              IMX214_EXPOSURE_STEP,
> -                                            IMX214_EXPOSURE_DEFAULT);
> +                                            exposure_def);
>
>         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
>                                 NULL,
> @@ -879,12 +958,21 @@ static int imx214_get_frame_interval(struct v4l2_su=
bdev *subdev,
>         return 0;
>  }
>
> +/*
> + * Raw sensors should be using the VBLANK and HBLANK controls to determi=
ne
> + * the frame rate. However this driver was initially added using the
> + * [S|G|ENUM]_FRAME_INTERVAL ioctls with a fixed rate of 30fps.
> + * Retain the frame_interval ops for backwards compatibility, but they d=
o
> + * nothing.
> + */
>  static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
>                                 struct v4l2_subdev_state *sd_state,
>                                 struct v4l2_subdev_frame_interval_enum *f=
ie)
>  {
>         const struct imx214_mode *mode;
>
> +       dev_warn_once(imx214->dev, "frame_interval functions return an un=
reliable value for compatibility reasons. Use the VBLANK and HBLANK control=
s to determine the correct frame rate.\n");
Please make sure that the series is bisectable:
https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/68347904=
/artifacts/junit/0007-570c1fc5ead96a1cac9f1f83b4826d2ab0a606c6%20bisect%20b=
uild.err.txt

> +
>         if (fie->index !=3D 0)
>                 return -EINVAL;
>
>
> --
> 2.47.1
>
>

