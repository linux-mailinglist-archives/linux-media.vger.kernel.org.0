Return-Path: <linux-media+bounces-18204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31582976AEA
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63D44B22C17
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2C91B533E;
	Thu, 12 Sep 2024 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TW5idV19"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2068B1B373C;
	Thu, 12 Sep 2024 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148420; cv=none; b=g7SPrOomz2hyNa4RUFTnhONRdf90WK8YNZbaaNq81mt0HdC2v0l9II0jNxe0e2yoyX0yWSiUqjunCXmmtnPkDqFDAT0tJr1sRuW9DsHzAsuGKdSbeiQSnaM8FfPJlzgcT5B10DSiN4B8iy9ptkhGfF8yfdk3Qw6GPrsrJB1bx7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148420; c=relaxed/simple;
	bh=hnuDMFVFKJKzJm+tCSK4hoexSPaAdd90xkmvmu1bfdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/iDFNI34DImc9YofO4nOiFHKoWw9Baf9h3SFhISPpzdyLGBWkzte2hNL7/5bE5chpl6ju80YuWxrygdorlzDtdprbRkg2lxgUfQnacOtXHCklEcs7P11Heux3+pQQlaSGGB+Jn7w4UjVk8vmuGRAoJsKSQ4/5R9Km+elIZqC8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TW5idV19; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74F3C4CECF;
	Thu, 12 Sep 2024 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148419;
	bh=hnuDMFVFKJKzJm+tCSK4hoexSPaAdd90xkmvmu1bfdo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TW5idV19y1HYx7ZqpcIxqiHqM4FEc0E+urqa5UvQp+BaMrfIl/HmuS3eG6mm5wUs+
	 /Vvfh9gI8PHIhbWpE64vqzC6PgPpoNbn2k8vRVycKrbH8DWSHjGgoUBvcQ4Z/v9Cjm
	 Zp7f2igndKwOgJ3IhZ+edz6MZLOi1E7SRj3riPGR4T1tPeNJVfsoSoIzlEuh7nARMg
	 1/BUh3UHOIthp+vd2EFys/uRDL6iMPk7CfDBzUvkgs/zQV4hVzm3b2Hyz48LdPw/hd
	 mxr9jXbLhotOVoIQvf5NeiG3bxy1H7YshdDLk16nrEpyY8umnKQzSuTKKa+ClDc3hg
	 4L4ZfjWIq7AyA==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7093c94435bso375576a34.0;
        Thu, 12 Sep 2024 06:40:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxNqag2wL7f0Bt1dthx5hNGi3dC3u4b6r9WdTGMmv7V9hoJ08FXVjSfKGGJENKP4ApUpxGxSnphmqRUY0=@vger.kernel.org, AJvYcCVZfaHZUBqoUkQOdx+5zpaix8eQMe7lgT/4UYxhD1jYtfpUuo0gVl3Hmw+15FpnRqDxeU2CgyelpsJiqJ8=@vger.kernel.org, AJvYcCXM0+t97fvyN5IkXgZ9CCSDMBL/p2xSr5VQdI2Ee/ksHMchabsTSwsOMYEMUUeQOmvaxWevXDSvxvplLvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdm0cjRWUP4Mhn3n5Krwb9v8FhakgKM0rCivTk1g8n3eYYxTLx
	W0oRsgeETG2l3wbVOL9q3C81MV0ylRKsV3c7+2txIBXuDTawhsn2ZuNJQ9NO7MOND+kifBOMMwp
	EDNTi5x4hFFXPyqpqyHxGsDMBiBs=
X-Google-Smtp-Source: AGHT+IEqo2rAx6xj9RnabfL5LM1QQgdmUiIeQzgwdsuN9M9SN+nWCz4leQciHkzXQpClrAiVsAcxZgej1y4nALC/pzw=
X-Received: by 2002:a05:6830:2802:b0:70a:98d8:34a with SMTP id
 46e09a7af769-7110946185cmr3176900a34.1.1726148419206; Thu, 12 Sep 2024
 06:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-8-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-8-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:02 +0200
X-Gmail-Original-Message-ID: <CAPybu_2VPDTHb=nOaze7bwLvEEGxcS1zK=su5vpfLNao59Gwfw@mail.gmail.com>
Message-ID: <CAPybu_2VPDTHb=nOaze7bwLvEEGxcS1zK=su5vpfLNao59Gwfw@mail.gmail.com>
Subject: Re: [PATCH 08/13] media: i2c: imx214: Add vblank and hblank controls
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Arent you missing some chage in enum_frame_interval?

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
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
>  drivers/media/i2c/imx214.c | 112 ++++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 91 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 3b422cddbdce..9f5a57aebb86 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -34,11 +34,18 @@
>
>  /* V-TIMING internal */
>  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> +#define IMX214_VTS_MAX                 0xffff
> +
> +#define IMX214_VBLANK_MIN              4
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
>  #define IMX214_EXPOSURE_STEP           1
>  #define IMX214_EXPOSURE_DEFAULT                3184
>  #define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> @@ -189,6 +196,8 @@ struct imx214 {
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *pixel_rate;
>         struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *exposure;
>         struct v4l2_ctrl *unit_size;
>
> @@ -205,8 +214,6 @@ static const struct cci_reg_sequence mode_4096x2304[]=
 =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
>         { IMX214_REG_X_ADD_STA, 56 },
>         { IMX214_REG_Y_ADD_STA, 408 },
>         { IMX214_REG_X_ADD_END, 4151 },
> @@ -277,8 +284,6 @@ static const struct cci_reg_sequence mode_1920x1080[]=
 =3D {
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
>         { IMX214_REG_X_ADD_STA, 1144 },
>         { IMX214_REG_Y_ADD_STA, 1020 },
>         { IMX214_REG_X_ADD_END, 3063 },
> @@ -362,6 +367,7 @@ static const struct cci_reg_sequence mode_table_commo=
n[] =3D {
>         { IMX214_REG_ORIENTATION, 0 },
>         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
>         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
>         { CCI_REG8(0x4550), 0x02 },
>         { CCI_REG8(0x4601), 0x00 },
>         { CCI_REG8(0x4642), 0x05 },
> @@ -465,18 +471,24 @@ static const struct cci_reg_sequence mode_table_com=
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
> @@ -629,6 +641,37 @@ static int imx214_set_format(struct v4l2_subdev *sd,
>         __crop->width =3D mode->width;
>         __crop->height =3D mode->height;
>
> +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> +               int exposure_max;
> +               int exposure_def;
> +               int hblank;
> +
> +               /* Update limits and set FPS to default */
> +               __v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLANK_MI=
N,
> +                                        IMX214_VTS_MAX - mode->height, 1=
,
> +                                        mode->vts_def - mode->height);
> +               __v4l2_ctrl_s_ctrl(imx214->vblank,
> +                                  mode->vts_def - mode->height);
> +
> +               /* Update max exposure while meeting expected vblanking *=
/
> +               exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET;
> +               exposure_def =3D (exposure_max < IMX214_EXPOSURE_DEFAULT)=
 ?
> +                       exposure_max : IMX214_EXPOSURE_DEFAULT;
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
> @@ -678,8 +721,25 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
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
> @@ -691,7 +751,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
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
> @@ -714,8 +777,11 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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
> @@ -723,7 +789,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                 return ret;
>
>         ctrl_hdlr =3D &imx214->ctrls;
> -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
>         if (ret)
>                 return ret;
>
> @@ -739,22 +805,26 @@ static int imx214_ctrls_init(struct imx214 *imx214)
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

I would like to keep this comment until there is a public document availabl=
e.



> +       /* Initial vblank/hblank/exposure parameters based on current mod=
e */
> +       imx214->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> +                                          V4L2_CID_VBLANK, IMX214_VBLANK=
_MIN,
> +                                          IMX214_VTS_MAX - mode->height,=
 1,
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
>
> --
> 2.46.0
>
>

