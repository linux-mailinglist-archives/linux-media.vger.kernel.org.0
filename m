Return-Path: <linux-media+bounces-18220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A334E976CB3
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 16:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 252C51F24F4E
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606151B29D8;
	Thu, 12 Sep 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Yze7yuSK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B75C47F6B
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152694; cv=none; b=bjhpSBdWsvF4uI7OANAS3ltnTeeUjbPGu0STo0s1LNN5AY1HSBem4UqiVo6cV5VjQdroAPQwt32LLZqNhkqEaWjOACUtSaf1k0dL4uEUnBktm9AL/5HgJ8XB/nSilaT8RPOx8WRUcD/8YgXxd1h0ycBb5j9rJTVMiNhHU7OptwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152694; c=relaxed/simple;
	bh=RZQFypfeX9TrywRPmW6cwL/Krnv3GLCAD6r6CrtTv84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzzN2d7xgvNW6R3QqRnmp47zittNa17NYxQcEstcoRfiKUAXLPiQOaHEKC98BslYyxaxQkz8aVKFypOTO2OZw4R9iuK+bDeXGi7+P7vroLhAUm5WnzdxqqyEYP3QTgZ52b3Kq6S54KVfO+BVIWtBSWiRDbwGUBKHqFdCrfMO8Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Yze7yuSK; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e1d74e6c8d8so970167276.1
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1726152691; x=1726757491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6Va2xPqOEk33E5AfH0xgYcrVCi0r5AOnG5DFPjSBkw=;
        b=Yze7yuSK6rSyhkj1fqVKME8BmjLiLw3r8S/MlnZa95F/WTx1xa55NlTyz0jOSTyVFV
         QlbWwX4pr9QVCuVZKzmnk3/OWT26RxmDDY5PrR4uy5U4v4rQ4usGyt7VgLgK0cfja88i
         fO/ihEMGI+7wyQ3M0AaiVcfXGY2veqOd6psZlSq5JhaMqHPGROw5WKhMKHlXJlqbAuZA
         Hm39v+49vydKU5CB7jmLhzc7X2kXkS8hqfFilJyEZ5oqBkrk3PnAq+EJJ6wKIbgu6b09
         qUk7VwXxLT4Q8DXmCFDKCcj7Wp/hN5Ca/5cocodcjjW5I5zFNNQhsbeUz1N0lK4XRv26
         Cl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152691; x=1726757491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6Va2xPqOEk33E5AfH0xgYcrVCi0r5AOnG5DFPjSBkw=;
        b=eD9D3HYOFqAJEZ9tnJatNahigNVFtXxtJU8hdqT5kxktW79c/mSC0Nm34DDX2FQ+CX
         1rUbCp4XglfAv8vkyo5c2rETTE/gDkvhB4x3EuKYkaAWPMopkCo2DhBd26eLCUKXGpVm
         RH9zk7sBBdfe9R7j8CnmLVwucqVzeLkdedTCpBVIFK1G0xNsqgzGANCqDSsl3syH8q4c
         N8qJ3+EPLo9vRUX9mtcwn5HMdjq9LHX3mDsi2QOuFmSTL1qhd83p3fjliNDJxfy61wTh
         90/WjgdVKI6cgY/kIoWbJEPgP9n7Z/58EHnNc2uMg2Zx68o+7pA80eOCYs2BY8SzhqbD
         v+xw==
X-Forwarded-Encrypted: i=1; AJvYcCV6VwURFT4XvQLx77Lls7AzE4tvQx4kwPjv/9VavuynfYCUa5zpXhhCysnLN5uDvMAqw7w9HieWVfLEGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8TVorNzllK9A3QruF72Er1lgFE8n4NYja75YxaTkb9fUWXav
	lxNNTW9WMaK+NRqou0BSheiEbZmgPn9mK6idKuZdTLiGfjXcE5mFv/vCkYprR5OvmCuKdoEPORg
	4Iw4irBVwvO7NePCzOYLVnz4RyUcrX6LqAOmXdg==
X-Google-Smtp-Source: AGHT+IEatxtcvEOjJNOQA46gP6GIxTqwpTb5hmrMYGSwB3W/GOrd22Z+Dw5WS5G4QCwUjFk66AYg9sgvV5OEHtby7E4=
X-Received: by 2002:a05:6902:1081:b0:e1a:85df:832c with SMTP id
 3f1490d57ef6-e1d9db9c8fdmr2379333276.12.1726152690986; Thu, 12 Sep 2024
 07:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
 <20240902-imx214-v1-8-c96cba989315@apitzsch.eu> <CAPybu_2VPDTHb=nOaze7bwLvEEGxcS1zK=su5vpfLNao59Gwfw@mail.gmail.com>
In-Reply-To: <CAPybu_2VPDTHb=nOaze7bwLvEEGxcS1zK=su5vpfLNao59Gwfw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Sep 2024 15:51:15 +0100
Message-ID: <CAPY8ntCOWxXXmkahhMwx4E74LAtFQKrUxmJOrERm2F7KqiiOyg@mail.gmail.com>
Subject: Re: [PATCH 08/13] media: i2c: imx214: Add vblank and hblank controls
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: git@apitzsch.eu, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9 & Ricardo

On Thu, 12 Sept 2024 at 14:41, Ricardo Ribalda Delgado
<ribalda@kernel.org> wrote:
>
> Hi
>
> Arent you missing some chage in enum_frame_interval?

Raw sensors shouldn't be using [enum|set|get]_frame_interval at all
https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-s=
ensor.html#frame-interval-configuration

The question now is how to handle the backwards compatibility for any
userspace app that might be using this driver and expecting to use the
frame_interval calls.
Seeing as it only ever allowed a fixed value of 30fps, leaving it as
is with a comment as to why it is there would be reasonable in my
view.

> On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
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
> >  drivers/media/i2c/imx214.c | 112 ++++++++++++++++++++++++++++++++++++-=
--------
> >  1 file changed, 91 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 3b422cddbdce..9f5a57aebb86 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -34,11 +34,18 @@
> >
> >  /* V-TIMING internal */
> >  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> > +#define IMX214_VTS_MAX                 0xffff
> > +
> > +#define IMX214_VBLANK_MIN              4
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
> > +#define IMX214_EXPOSURE_MAX            (IMX214_VTS_MAX - IMX214_EXPOSU=
RE_OFFSET)
> >  #define IMX214_EXPOSURE_STEP           1
> >  #define IMX214_EXPOSURE_DEFAULT                3184
> >  #define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> > @@ -189,6 +196,8 @@ struct imx214 {
> >         struct v4l2_ctrl_handler ctrls;
> >         struct v4l2_ctrl *pixel_rate;
> >         struct v4l2_ctrl *link_freq;
> > +       struct v4l2_ctrl *vblank;
> > +       struct v4l2_ctrl *hblank;
> >         struct v4l2_ctrl *exposure;
> >         struct v4l2_ctrl *unit_size;
> >
> > @@ -205,8 +214,6 @@ static const struct cci_reg_sequence mode_4096x2304=
[] =3D {
> >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> >         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
> >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> >         { IMX214_REG_X_ADD_STA, 56 },
> >         { IMX214_REG_Y_ADD_STA, 408 },
> >         { IMX214_REG_X_ADD_END, 4151 },
> > @@ -277,8 +284,6 @@ static const struct cci_reg_sequence mode_1920x1080=
[] =3D {
> >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> >         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
> >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> >         { IMX214_REG_X_ADD_STA, 1144 },
> >         { IMX214_REG_Y_ADD_STA, 1020 },
> >         { IMX214_REG_X_ADD_END, 3063 },
> > @@ -362,6 +367,7 @@ static const struct cci_reg_sequence mode_table_com=
mon[] =3D {
> >         { IMX214_REG_ORIENTATION, 0 },
> >         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
> >         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> > +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
> >         { CCI_REG8(0x4550), 0x02 },
> >         { CCI_REG8(0x4601), 0x00 },
> >         { CCI_REG8(0x4642), 0x05 },
> > @@ -465,18 +471,24 @@ static const struct cci_reg_sequence mode_table_c=
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
> > @@ -629,6 +641,37 @@ static int imx214_set_format(struct v4l2_subdev *s=
d,
> >         __crop->width =3D mode->width;
> >         __crop->height =3D mode->height;
> >
> > +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +               int exposure_max;
> > +               int exposure_def;
> > +               int hblank;
> > +
> > +               /* Update limits and set FPS to default */
> > +               __v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLANK_=
MIN,
> > +                                        IMX214_VTS_MAX - mode->height,=
 1,
> > +                                        mode->vts_def - mode->height);
> > +               __v4l2_ctrl_s_ctrl(imx214->vblank,
> > +                                  mode->vts_def - mode->height);
> > +
> > +               /* Update max exposure while meeting expected vblanking=
 */
> > +               exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET=
;
> > +               exposure_def =3D (exposure_max < IMX214_EXPOSURE_DEFAUL=
T) ?
> > +                       exposure_max : IMX214_EXPOSURE_DEFAULT;
> > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > +                                        imx214->exposure->minimum,
> > +                                        exposure_max, imx214->exposure=
->step,
> > +                                        exposure_def);
> > +
> > +               /*
> > +                * Currently PPL is fixed to IMX214_PPL_DEFAULT, so hbl=
ank
> > +                * depends on mode->width only, and is not changeble in=
 any
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
> > @@ -678,8 +721,25 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >         struct imx214 *imx214 =3D container_of(ctrl->handler,
> >                                              struct imx214, ctrls);
> > +       const struct v4l2_mbus_framefmt *format;
> > +       struct v4l2_subdev_state *state;
> >         int ret;
> >
> > +       state =3D v4l2_subdev_get_locked_active_state(&imx214->sd);
> > +       format =3D v4l2_subdev_state_get_format(state, 0);
> > +
> > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               int exposure_max, exposure_def;
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
> > @@ -691,7 +751,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
> >         case V4L2_CID_EXPOSURE:
> >                 cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->va=
l, &ret);
> >                 break;
> > -
> > +       case V4L2_CID_VBLANK:
> > +               cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
> > +                         format->height + ctrl->val, &ret);

My datasheet says this register is "set up in multiples of 2".
(LINE_LENGTH_PCK for HBLANK is "set in multiples of 8")

I don't have one of these modules, but is that saying only multiples
of 2 are permitted (in which case the step size for the control needs
to reflect that), or that setting a value of N is interpreted by the
hardware as 2N?
Do all the numbers with PIXEL_RATE work out correctly in the frame rate cal=
cs?

Reading the spec sheet that 30fps is the max frame rate at full res
(4096x2304), and the driver was setting a value of 3194 to this
register, I don't see it being interpreted as 2N. Then again having
VBLANK at 890 seems pretty high.

> > +               break;
> >         default:
> >                 ret =3D -EINVAL;
> >         }
> > @@ -714,8 +777,11 @@ static int imx214_ctrls_init(struct imx214 *imx214=
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
> > @@ -723,7 +789,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
> >                 return ret;
> >
> >         ctrl_hdlr =3D &imx214->ctrls;
> > -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> > +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
> >         if (ret)
> >                 return ret;
> >
> > @@ -739,22 +805,26 @@ static int imx214_ctrls_init(struct imx214 *imx21=
4)
> >         if (imx214->link_freq)
> >                 imx214->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> >
> > -       /*
> > -        * WARNING!
> > -        * Values obtained reverse engineering blobs and/or devices.
> > -        * Ranges and functionality might be wrong.
> > -        *
> > -        * Sony, please release some register set documentation for the
> > -        * device.
> > -        *
> > -        * Yours sincerely, Ricardo.
> > -        */
>
> I would like to keep this comment until there is a public document availa=
ble.

I suspect you'll be waiting forever for a document to be officially release=
d.

I have a datasheet for IMX214, and I believe Kieran and Jacopo do too.
Which specific values do you wish to be verified?

>
> > +       /* Initial vblank/hblank/exposure parameters based on current m=
ode */
> > +       imx214->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_op=
s,
> > +                                          V4L2_CID_VBLANK, IMX214_VBLA=
NK_MIN,

IMX214_VBLANK_MIN being 4 feels plausible, but pretty low.
I read the datasheet to say there are 4 embedded data lines per image.
Seeing as you have STATS data output enabled as well that makes 5
lines of non-image data per frame, but you're only adding blanking
time for 4 lines.

As noted above, I think you've also increased the max frame rate
significantly above that quoted by Sony. Has that been actually
exercised and confirmed to function correctly?

  Dave

> > +                                          IMX214_VTS_MAX - mode->heigh=
t, 1,
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
> >                                              IMX214_EXPOSURE_STEP,
> > -                                            IMX214_EXPOSURE_DEFAULT);
> > +                                            exposure_def);
> >
> >         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
> >                                 NULL,
> >
> > --
> > 2.46.0
> >
> >
>

