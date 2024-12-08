Return-Path: <linux-media+bounces-22843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6A29E8813
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 22:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A945E281188
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 21:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C014197A6C;
	Sun,  8 Dec 2024 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0PxlYG2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188619539F;
	Sun,  8 Dec 2024 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733692808; cv=none; b=XlIT6zOFN1cQZsREbzq+Krjxr+83l+Nz6/9Ji+ezjKHUgy/ZBdkVfTl82eJCdecM1MqQ+HI6chDuURQg8p9ukEqJKCgvrOsQIQRWOYAERMaBGeemxzkOikde3R+ozJSJl5Uw5Nqj7msNNC0kPrfDv3bqbbuTeSpMpXNIMdeGlRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733692808; c=relaxed/simple;
	bh=wIW+JFihL//iGZ5HvtbeKBYPkZZaH/4gSrwRmP8cFjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gu2G+GuXR0IWNEVJ9bV2b43JBIYCqS2+Ws0adSqGrUU0JxPuxo9K9nIPctVFCncyiLCozQokJc9loj4larWhSGnvXD3hLGolRVFza3nMYMnfrXtlR8Ywc4ONMqpeCPne49KmJq0I5CjroxEneYYc+nuAkU0OkTor+Pz5LVD3nAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0PxlYG2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4BAC4CEE2;
	Sun,  8 Dec 2024 21:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733692808;
	bh=wIW+JFihL//iGZ5HvtbeKBYPkZZaH/4gSrwRmP8cFjo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c0PxlYG2gfLgEXPjAnsP+xFNNopHIiAhEkTiwr+Tjs9YQHPwt1iA0Xk+Ix1LcDmqT
	 3K+BXe3KZmRlTo6yofClo0AqXv+M4AWF9oWiSyC5lNotLhdP8agi25yzfmV6euWuYT
	 9YqCRLpwhYmfObrb3taW6RQDhGWK1vyPBkdnktwRFC7yRrIxBPJwoJPE1ARvt9fd9V
	 jdDupmfR9wu7tpL6K9WcvqAV8P4HsKxnvD+cJTUTweNivql7Ur/i6KMW8g0gt0/2yj
	 4LfQTNIsSmztxOu1ug/iAh4Kw1XiSC1U8twxJ/fReQ7sftBIuNC5y5fVM/olVjTq9T
	 M+AJU0U5/xkww==
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afe1009960so385163137.0;
        Sun, 08 Dec 2024 13:20:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+S5+9ehPagcnCcXU4PZS4DGCNflOYzmUvcIP56cGwXQqG/6C3P7HCsoiORJa2lQq1nB5QV2GisAQ5RCA=@vger.kernel.org, AJvYcCUM0JAkyaTnGCsOLetznAMGYZYAyhvXrry+l3yT+vBu3cnCDwbm8bbn5QReEUWBlsUpW7YCva4IWv4akes=@vger.kernel.org, AJvYcCUnUPB52sM7z0n/ikJbWaYLXyH7VUmIeIR4noRMQ5Ni77Oh2cm4VGvQDQM3tlnvaXxBONisueswZ7g1t00=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTm9/XENKpEl1A8nNBtPgh9VEiF/iuX9h9rm95+v61m5e59Hp
	Wo/MGwQWz8Z9jYsigI9L6rCh9LNJSlT67DbEkHJSmiYzvwIO80T26Q+cb60yC6AXtgzJE7DUzsC
	gsCX9JoYlHHoz7Yksfj6KXleVxQ8=
X-Google-Smtp-Source: AGHT+IEAEQtQ/0qOA/qy1SI4QszuXuAGYuv9A2rmXdIICft0a3QIdyGkMq5+81siMjQPr3J6ej4/tQz/oSUGC5ClSes=
X-Received: by 2002:a05:6102:3ed0:b0:4af:f541:912f with SMTP id
 ada2fe7eead31-4aff54192b6mr1592867137.10.1733692807428; Sun, 08 Dec 2024
 13:20:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
 <20241207-imx214-v3-7-ab60af7ee915@apitzsch.eu> <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
In-Reply-To: <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Sun, 8 Dec 2024 22:19:51 +0100
X-Gmail-Original-Message-ID: <CAPybu_0Nk+p1rikH_t_zpEHx=KGnXfG+npr-XEnwtA4EnfJjuQ@mail.gmail.com>
Message-ID: <CAPybu_0Nk+p1rikH_t_zpEHx=KGnXfG+npr-XEnwtA4EnfJjuQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] media: i2c: imx214: Add vblank and hblank controls
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 9:59=E2=80=AFPM Ricardo Ribalda Delgado
<ribalda@kernel.org> wrote:
>
> In general it looks good to me (besides the comments, ignore the nits
> if you want to).
>
> I'd recommend that you test with lockdep to make sure that we are not
> missing anything, and I'd like to hear back from Sakari regarding the
> get_locked_active
>
> Thanks!
>
> On Sat, Dec 7, 2024 at 9:48=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
> <devnull+git.apitzsch.eu@kernel.org> wrote:
> >
> > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >
> > Add vblank control to allow changing the framerate /
> > higher exposure values.
> >
> > The vblank and hblank controls are needed for libcamera support.
> >
> > While at it, fix the minimal exposure time according to the datasheet.
> >
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> >  drivers/media/i2c/imx214.c | 106 +++++++++++++++++++++++++++++++++++++=
+++-----
> >  1 file changed, 94 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index f1c72db0775eaf4810f762e8798d301c5ad9923c..a7f49dbafe0f54af3c02f55=
34460fdee88a22fe2 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -34,11 +34,17 @@
> >
> >  /* V-TIMING internal */
> >  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> > +#define IMX214_VTS_MAX                 0xffff
> > +
> > +#define IMX214_VBLANK_MIN              890
> > +
> > +/* HBLANK control - read only */
> > +#define IMX214_PPL_DEFAULT             5008
> >
> >  /* Exposure control */
> >  #define IMX214_REG_EXPOSURE            CCI_REG16(0x0202)
> > -#define IMX214_EXPOSURE_MIN            0
> > -#define IMX214_EXPOSURE_MAX            3184
> > +#define IMX214_EXPOSURE_OFFSET         10
> > +#define IMX214_EXPOSURE_MIN            1
> >  #define IMX214_EXPOSURE_STEP           1
> >  #define IMX214_EXPOSURE_DEFAULT                3184
> >  #define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> > @@ -187,6 +193,8 @@ struct imx214 {
> >         struct v4l2_ctrl_handler ctrls;
> >         struct v4l2_ctrl *pixel_rate;
> >         struct v4l2_ctrl *link_freq;
> > +       struct v4l2_ctrl *vblank;
> > +       struct v4l2_ctrl *hblank;
> >         struct v4l2_ctrl *exposure;
> >         struct v4l2_ctrl *unit_size;
> >
> > @@ -202,8 +210,6 @@ static const struct cci_reg_sequence mode_4096x2304=
[] =3D {
> >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> >         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
> >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> >         { IMX214_REG_X_ADD_STA, 56 },
> >         { IMX214_REG_Y_ADD_STA, 408 },
> >         { IMX214_REG_X_ADD_END, 4151 },
> > @@ -274,8 +280,6 @@ static const struct cci_reg_sequence mode_1920x1080=
[] =3D {
> >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> >         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
> >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> >         { IMX214_REG_X_ADD_STA, 1144 },
> >         { IMX214_REG_Y_ADD_STA, 1020 },
> >         { IMX214_REG_X_ADD_END, 3063 },
> > @@ -359,6 +363,7 @@ static const struct cci_reg_sequence mode_table_com=
mon[] =3D {
> >         { IMX214_REG_ORIENTATION, 0 },
> >         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
> >         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> > +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
> >         { CCI_REG8(0x4550), 0x02 },
> >         { CCI_REG8(0x4601), 0x00 },
> >         { CCI_REG8(0x4642), 0x05 },
> > @@ -462,18 +467,24 @@ static const struct cci_reg_sequence mode_table_c=
ommon[] =3D {
> >  static const struct imx214_mode {
> >         u32 width;
> >         u32 height;
> > +
> > +       /* V-timing */
> > +       unsigned int vts_def;
> > +
> >         unsigned int num_of_regs;
> >         const struct cci_reg_sequence *reg_table;
> >  } imx214_modes[] =3D {
> >         {
> >                 .width =3D 4096,
> >                 .height =3D 2304,
> > +               .vts_def =3D 3194,
> >                 .num_of_regs =3D ARRAY_SIZE(mode_4096x2304),
> >                 .reg_table =3D mode_4096x2304,
> >         },
> >         {
> >                 .width =3D 1920,
> >                 .height =3D 1080,
> > +               .vts_def =3D 3194,
> >                 .num_of_regs =3D ARRAY_SIZE(mode_1920x1080),
> >                 .reg_table =3D mode_1920x1080,
> >         },
> > @@ -626,9 +637,36 @@ static int imx214_set_format(struct v4l2_subdev *s=
d,
> >         __crop->width =3D mode->width;
> >         __crop->height =3D mode->height;
> >
> > -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +               int exposure_max;
> > +               int exposure_def;
> > +               int hblank;
> > +
> >                 imx214->cur_mode =3D mode;
> >
> > +               /* Update FPS limits */
> nit: Update blank limits
> > +               __v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLANK_=
MIN,
> > +                                        IMX214_VTS_MAX - mode->height,=
 2,
> > +                                        mode->vts_def - mode->height);
>
> Is the handler->lock held when we call this function? Can you try
> running the code with lockdep?
> > +
> > +               /* Update max exposure while meeting expected vblanking=
 */
> > +               exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET=
;
> > +               exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFA=
ULT);
> > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > +                                        imx214->exposure->minimum,
> > +                                        exposure_max, imx214->exposure=
->step,
> > +                                        exposure_def);
> > +
> > +               /*
> > +                * Currently PPL is fixed to IMX214_PPL_DEFAULT, so hbl=
ank
> > +                * depends on mode->width only, and is not changeable i=
n any
> > +                * way other than changing the mode.
> > +                */
> > +               hblank =3D IMX214_PPL_DEFAULT - mode->width;
> > +               __v4l2_ctrl_modify_range(imx214->hblank, hblank, hblank=
, 1,
> > +                                        hblank);
> > +       }
> > +
> >         return 0;
> >  }
> >
> > @@ -678,8 +716,25 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >         struct imx214 *imx214 =3D container_of(ctrl->handler,
> >                                              struct imx214, ctrls);
> > +       const struct v4l2_mbus_framefmt *format;
> > +       struct v4l2_subdev_state *state;
> >         int ret;
> >
> > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               int exposure_max, exposure_def;
> > +
> > +               state =3D v4l2_subdev_get_locked_active_state(&imx214->=
sd);
>
> Sakari, I see that other drivers assume that the active is locked in
> set_ctrl. Is this correct?

imx214->sd.state_lock =3D imx214->ctrls.lock;

So I guess it is fine :)


>
> > +               format =3D v4l2_subdev_state_get_format(state, 0);
> > +
> > +               /* Update max exposure while meeting expected vblanking=
 */
> > +               exposure_max =3D format->height + ctrl->val - IMX214_EX=
POSURE_OFFSET;
> > +               exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFA=
ULT);
> > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > +                                        imx214->exposure->minimum,
> > +                                        exposure_max, imx214->exposure=
->step,
> > +                                        exposure_def);
> > +       }
> > +
> >         /*
> >          * Applying V4L2 control value only happens
> >          * when power is up for streaming
> > @@ -691,7 +746,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
> >         case V4L2_CID_EXPOSURE:
> >                 cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->va=
l, &ret);
> >                 break;
> > -
> > +       case V4L2_CID_VBLANK:
>  No need to read the format here?
>                       format =3D v4l2_subdev_state_get_format(state, 0);
> > +               cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
> > +                         format->height + ctrl->val, &ret);
> > +               break;
> >         default:
> >                 ret =3D -EINVAL;
> >         }
> > @@ -714,8 +772,11 @@ static int imx214_ctrls_init(struct imx214 *imx214=
)
> >                 .width =3D 1120,
> >                 .height =3D 1120,
> >         };
> > +       const struct imx214_mode *mode =3D &imx214_modes[0];
> >         struct v4l2_fwnode_device_properties props;
> >         struct v4l2_ctrl_handler *ctrl_hdlr;
> > +       int exposure_max, exposure_def;
> > +       int hblank;
> >         int ret;
> >
> >         ret =3D v4l2_fwnode_device_parse(imx214->dev, &props);
> > @@ -723,7 +784,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
> >                 return ret;
> >
> >         ctrl_hdlr =3D &imx214->ctrls;
> > -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> > +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
> >         if (ret)
> >                 return ret;
> >
> > @@ -749,12 +810,27 @@ static int imx214_ctrls_init(struct imx214 *imx21=
4)
> >          *
> >          * Yours sincerely, Ricardo.
> >          */
> > +
> > +       /* Initial vblank/hblank/exposure parameters based on current m=
ode */
> > +       imx214->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_op=
s,
> > +                                          V4L2_CID_VBLANK, IMX214_VBLA=
NK_MIN,
> > +                                          IMX214_VTS_MAX - mode->heigh=
t, 2,
> > +                                          mode->vts_def - mode->height=
);
> > +
> > +       hblank =3D IMX214_PPL_DEFAULT - mode->width;
> > +       imx214->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_op=
s,
> > +                                          V4L2_CID_HBLANK, hblank, hbl=
ank,
> > +                                          1, hblank);
> > +       if (imx214->hblank)
> > +               imx214->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +       exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET;
> > +       exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFAULT);
> >         imx214->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_=
ops,
> >                                              V4L2_CID_EXPOSURE,
> > -                                            IMX214_EXPOSURE_MIN,
> > -                                            IMX214_EXPOSURE_MAX,
> > +                                            IMX214_EXPOSURE_MIN, expos=
ure_max,
> nit: I think it looks nicer with exposure_max in the next line, but
> ignore if you prefer this way :)
> >                                              IMX214_EXPOSURE_STEP,
> > -                                            IMX214_EXPOSURE_DEFAULT);
> > +                                            exposure_def);
> >
> >         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
> >                                 NULL,
> > @@ -876,6 +952,12 @@ static int imx214_get_frame_interval(struct v4l2_s=
ubdev *subdev,
> >         return 0;
> >  }
> >
> > +/*
> > + * Raw sensors should be using the VBLANK and HBLANK controls to deter=
mine
> > + * the frame rate. However this driver was initially added using the
> > + * [S|G|ENUM]_FRAME_INTERVAL ioctls with a fixed rate of 30fps.
> > + * Retain the frame_interval ops for backwards compatibility, but they=
 do nothing.
> > + */
>
> Now that these controls are useless... maybe we can do a dev_warn_once
> when the user calls it to leave some output in dmesg?
> >  static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
> >                                 struct v4l2_subdev_state *sd_state,
> >                                 struct v4l2_subdev_frame_interval_enum =
*fie)
> >
> > --
> > 2.47.1
> >
> >

