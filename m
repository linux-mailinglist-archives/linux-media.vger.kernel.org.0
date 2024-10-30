Return-Path: <linux-media+bounces-20589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD039B625F
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E28D1F21DF5
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DCC1E7C07;
	Wed, 30 Oct 2024 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sz0XMCTK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7CC1E6DE1;
	Wed, 30 Oct 2024 11:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730289449; cv=none; b=Wsl7kWsMsnardkpdMgiakcGYCz0Nd9jG27ZkIbLBxa6mH2NlSmU1YQRBD2TU0oyVr6b3AUhtY6CYZFpneYGtm48aMZfWmmGp7x7STJXD2flBarQ4OrWBfa5T7FGbmYd20RWSqxJVdTWewRphJw7C5ZQwl8IYLtVn9X1poG++ApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730289449; c=relaxed/simple;
	bh=QCMg29osKeFn+fk9AtsIXRUSkPWFNurKMc4JYa7dDRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gR33WrOK4UbaTwbK2Z3HpjaG9b6oZrT9vwKn58swxrOda8gKrUll1KUL04HJKjhK3Hi0ggDoZRYv2mo1e7l38WV7VlntNLx/JJ9lHvtTod3het3j+XiNhS38wcbjvuiRn+IKzZupF2fzWR8/JqynNKjZ3gf6pA66vkyW/3+YU5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sz0XMCTK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1101C4CEE3;
	Wed, 30 Oct 2024 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730289449;
	bh=QCMg29osKeFn+fk9AtsIXRUSkPWFNurKMc4JYa7dDRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sz0XMCTKYKw/Uywfv5Gwy3+QE328/g79jLrWQ9B7PAo8cwOkVIxgTg9BOq/1O3nJr
	 w3zbC2OTYvPl+N90ydz1IdZBAwdNT2//YKLKH+YcrZvzCy7Ms5pdoD9fdZRP/P1drv
	 0Ns52DOee6Ur5ot++Jdh7Ikj6Ob5Bh5SUdyqlrv0TtnC7P/2FmNxN+xQZ8OK7HxP3Z
	 yjgvV3+t64wVp6/MvoDSQPQu1wyglSfOnCcNpPvQQaQEHYn8PhJxbY+13t1v6WClWw
	 3+SlgdwgFclTaf/ODtRknX26hjR+WoU+Kv6lNYSjS+QK7aOurYKF7xvY4bLSOkZyAm
	 y1nbO2fMHQCTg==
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-50d35639d0aso2023787e0c.0;
        Wed, 30 Oct 2024 04:57:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEqh2cYT+NbHvt7mVfXUIpNgw0xw/jGEVsoSR3m66aF0vi+XRpQmItrH3xXDCTfE3RihvYUo9tqDnMuI4=@vger.kernel.org, AJvYcCXA/uxg7S6PwbYqegg+cYyv0CkBB9hWysXDEKyyIr6K8w9CDAZ/V8h3fZjueKfaIgXXT8DEOVHS3T3sL4I=@vger.kernel.org, AJvYcCXuXSVOdePZf3iEbOG6D5dYd9bvxz8qX64NQjC6a+unA+moNH9U1QKhViwtCbJeg1idbJoyjY0HFz1vHss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQKnhhNXeG5twE1Iw1cdLqgPOK6bU06t+0dPG3g1qSoFz4F+v
	dS85w6mH+SU98JuDlFUj3zQgmM4zEXxHeeccud7tw9fWovADR9Up+bdTqhf+E+kU1ovx9Fhuu00
	MjEj5B8taAHdUIJFValR0oubYUxk=
X-Google-Smtp-Source: AGHT+IHWMDJjtkzpiHvyncGcKjvaw3LiNvtppkptwQtVV1tqX7otcXvCH3nRRk5lVeKDmw1Uixdp6QFu/7gUnk4HL3s=
X-Received: by 2002:a05:6122:200d:b0:4f5:199b:2a61 with SMTP id
 71dfb90a1353d-510150e5219mr12531010e0c.9.1730289447920; Wed, 30 Oct 2024
 04:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu> <20241021-imx214-v2-8-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-8-fbd23e99541e@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Wed, 30 Oct 2024 12:57:10 +0100
X-Gmail-Original-Message-ID: <CAPybu_1qO9ZJSO3EQwb_ggtTysZpqg6gQXABYW8ekH-UwUp8bQ@mail.gmail.com>
Message-ID: <CAPybu_1qO9ZJSO3EQwb_ggtTysZpqg6gQXABYW8ekH-UwUp8bQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] media: i2c: imx214: Add vblank and hblank controls
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
> Add vblank control to allow changing the framerate /
> higher exposure values.
>
> The vblank and hblank controls are needed for libcamera support.
>
> While at it, fix the minimal exposure time according to the datasheet.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 119 ++++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 97 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 497baad616ad7374a92a3da2b7c1096b1d72a0c7..cb443d8bee6fe72dc9378b2c2=
d3caae09f8642c5 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -34,11 +34,18 @@
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
> +#define IMX214_EXPOSURE_MAX            (IMX214_VTS_MAX - IMX214_EXPOSURE=
_OFFSET)
this definition is never used
>  #define IMX214_EXPOSURE_STEP           1
>  #define IMX214_EXPOSURE_DEFAULT                3184
>  #define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> @@ -187,6 +194,8 @@ struct imx214 {
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *pixel_rate;
>         struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *exposure;
>         struct v4l2_ctrl *unit_size;
>
> @@ -202,8 +211,6 @@ static const struct cci_reg_sequence mode_4096x2304[]=
 =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
>         { IMX214_REG_X_ADD_STA, 56 },
>         { IMX214_REG_Y_ADD_STA, 408 },
>         { IMX214_REG_X_ADD_END, 4151 },
> @@ -274,8 +281,6 @@ static const struct cci_reg_sequence mode_1920x1080[]=
 =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
>         { IMX214_REG_X_ADD_STA, 1144 },
>         { IMX214_REG_Y_ADD_STA, 1020 },
>         { IMX214_REG_X_ADD_END, 3063 },
> @@ -359,6 +364,7 @@ static const struct cci_reg_sequence mode_table_commo=
n[] =3D {
>         { IMX214_REG_ORIENTATION, 0 },
>         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
>         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
>         { CCI_REG8(0x4550), 0x02 },
>         { CCI_REG8(0x4601), 0x00 },
>         { CCI_REG8(0x4642), 0x05 },
> @@ -462,18 +468,24 @@ static const struct cci_reg_sequence mode_table_com=
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
> @@ -629,9 +641,39 @@ static int imx214_set_format(struct v4l2_subdev *sd,
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
> +               /* Update limits and set FPS to default */
> +               __v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLANK_MI=
N,
> +                                        IMX214_VTS_MAX - mode->height, 2=
,
> +                                        mode->vts_def - mode->height);
> +               __v4l2_ctrl_s_ctrl(imx214->vblank,
> +                                  mode->vts_def - mode->height);

Do we need to set FPS to default?

> +
> +               /* Update max exposure while meeting expected vblanking *=
/
> +               exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET;
> +               exposure_def =3D (exposure_max < IMX214_EXPOSURE_DEFAULT)=
 ?
> +                       exposure_max : IMX214_EXPOSURE_DEFAULT;
exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFAULT);
> +               __v4l2_ctrl_modify_range(imx214->exposure,
> +                                        imx214->exposure->minimum,
> +                                        exposure_max, imx214->exposure->=
step,
> +                                        exposure_def);
> +
> +               /*
> +                * Currently PPL is fixed to IMX214_PPL_DEFAULT, so hblan=
k
> +                * depends on mode->width only, and is not changeble in a=
ny
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
> @@ -681,8 +723,25 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct imx214 *imx214 =3D container_of(ctrl->handler,
>                                              struct imx214, ctrls);
> +       const struct v4l2_mbus_framefmt *format;
> +       struct v4l2_subdev_state *state;
>         int ret;
>
> +       state =3D v4l2_subdev_get_locked_active_state(&imx214->sd);
> +       format =3D v4l2_subdev_state_get_format(state, 0);
> +
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               int exposure_max, exposure_def;
Not sure if the compiler will like it, but have you tried to set state
and format under this if?

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
> @@ -694,7 +753,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
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
> @@ -717,8 +779,11 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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
> @@ -726,7 +791,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                 return ret;
>
>         ctrl_hdlr =3D &imx214->ctrls;
> -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
>         if (ret)
>                 return ret;
>
> @@ -742,22 +807,26 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         if (imx214->link_freq)
>                 imx214->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>
> -       /*
> -        * WARNING!
> -        * Values obtained reverse engineering blobs and/or devices.
> -        * Ranges and functionality might be wrong.
> -        *
> -        * Sony, please release some register set documentation for the
> -        * device.
> -        *
> -        * Yours sincerely, Ricardo.
> -        */
Please keep my message ;)


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
>                                              IMX214_EXPOSURE_STEP,
> -                                            IMX214_EXPOSURE_DEFAULT);
> +                                            exposure_def);
>
>         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
>                                 NULL,
> @@ -879,6 +948,12 @@ static int imx214_get_frame_interval(struct v4l2_sub=
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
>  static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
>                                 struct v4l2_subdev_state *sd_state,
>                                 struct v4l2_subdev_frame_interval_enum *f=
ie)
>
> --
> 2.47.0
>
>

