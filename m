Return-Path: <linux-media+bounces-18264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A07978705
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 19:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2D11C241C8
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 17:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C3C83CC7;
	Fri, 13 Sep 2024 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LxxByNP3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449B84A57
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726249274; cv=none; b=E4LGphOUXdlqIHXjEiDDmxiDKS6eM1FvJodaMbnzRJ76ibzVWlNMPOUTUyrHfsmZO73fex/bZyEOUitnm1NXMzpll0r3LkMZ3W0V0Hu8BhZLOanKs0NFN1LMxwwBCzQ+eztR1weXRWa8+N3s1c7dh0uw80pzK6g6wAeXn/M1ylE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726249274; c=relaxed/simple;
	bh=yZHfP3kMI9QG9zQDROsEJS/DMBQfQNiJH9GIAv4b7vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPlTMTyySVCswijYBpWecBCTyjA4sFJHijlZ3f6zrbcaBDJi2Bk7hrw8/+EOQUwnTGwTVElrOMwQGpAe2JcTW2R9nr5SfCTNx8DTN2vr9XSuWmA/ONXhjlS1Mkr1uzBdSJf+Wp2wAc1pS986/Gw7FfuPS4a2o19OdazWgz2RfiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LxxByNP3; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e1cf1a4865aso1093790276.2
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 10:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1726249271; x=1726854071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI6pNgxVdvOzHFV5D5PZF6q7ExUwnpQaO64OezhXm9w=;
        b=LxxByNP3EXemnpyJYpFB9AlmUsC2k4zi5LtO4yGiY2skEKo2P0WINcSqK7maskuqX8
         0VwSiZ+eHyqhTytrXgZ5fkCMOitETfQP9pVHTpjEFit9e7QmqqpmXdRQP/SCMOS9/klX
         6z8uVUueAPFPpnjKwYYxxNe/EychkNbWbr+9iZMWRi7er4I1U4cH/3yhEmmPnYJEoHZI
         OhQYAMO4dLzB9m4+zSFnQZOxxiA0GZ/FqQMy+l0OPzvOw9eyIkZmpto+yHk5ZLBWzhjV
         nuj0wwEBUgYuSAJx892FGr17GKJeQV2Ik6pfrQVixtSXl7naowAefA/3RTzX511G2X12
         YJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726249271; x=1726854071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI6pNgxVdvOzHFV5D5PZF6q7ExUwnpQaO64OezhXm9w=;
        b=QHXop4T/xV23cGoXjcxmZWndTZ9/cGyhRfJRTEcSPj/W592acB5YPZdDA/inyfofaa
         X/+/BlFIexw0PrF55+ZBiukNVtQ7eCwMkpvuxeJSXgDjQZg5r5ptWAQs4/Ii5dfexOFt
         4NSlicY6y6FtZn9E5y1Ft2jRZ/N+JDBTXe3VSW0bw1QQtw3vUbMnI9HC8/6hDikmc1F3
         R5vIEswUjoy3/gnL2QZZYH9o/Nh6NTyPEpCddT0cmZSqailDYfTCzRs3F0slYwrvntE2
         cXs4Q0kiSIg+/aZwHgqj/Pl4em/SXzJapP/gt0IP8sRWDTq+CjdUOqqtWeTBcSYZ3Mup
         +3lg==
X-Forwarded-Encrypted: i=1; AJvYcCWm8KhnmhYYxxLre5IgVkKKRn4VMvw6YK+86u4MO6qlsLt91gEndLosD0F8X7IjmTGySB+EvHjHjcHuuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymJfIQj5nV0ucl5TWJ+ulMujtf88jQh53f82u590HlHdwzVdaL
	zfXVd+fgxpDz74g6XB8m9tJw16VPQiSVPrpvYi+0xNdSZ5ycNgxbYnJqFjo+pV4YvG9MI29Xdnw
	nBOR2v7rBcQafZVpnATGIf/1IMErIJNneKpm7Mg==
X-Google-Smtp-Source: AGHT+IHeRXlWcT+4L8AfV+ZH92f3PDGOws4ASPaQOv+PQI69sQ6rPojXAj0yuxEgi4vUbo09DSW8jQjOV58nnFxd0wk=
X-Received: by 2002:a05:6902:2382:b0:e0b:e1da:e711 with SMTP id
 3f1490d57ef6-e1db017d386mr2975226276.40.1726249270597; Fri, 13 Sep 2024
 10:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
 <20240902-imx214-v1-8-c96cba989315@apitzsch.eu> <CAPybu_2VPDTHb=nOaze7bwLvEEGxcS1zK=su5vpfLNao59Gwfw@mail.gmail.com>
 <CAPY8ntCOWxXXmkahhMwx4E74LAtFQKrUxmJOrERm2F7KqiiOyg@mail.gmail.com>
In-Reply-To: <CAPY8ntCOWxXXmkahhMwx4E74LAtFQKrUxmJOrERm2F7KqiiOyg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 13 Sep 2024 18:40:54 +0100
Message-ID: <CAPY8ntDnbbhseYHynU=09Ziev9qeFZ074yPodWPUGZ9xbWCd2Q@mail.gmail.com>
Subject: Re: [PATCH 08/13] media: i2c: imx214: Add vblank and hblank controls
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: git@apitzsch.eu, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Sept 2024 at 15:51, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Andr=C3=A9 & Ricardo
>
> On Thu, 12 Sept 2024 at 14:41, Ricardo Ribalda Delgado
> <ribalda@kernel.org> wrote:
> >
> > Hi
> >
> > Arent you missing some chage in enum_frame_interval?
>
> Raw sensors shouldn't be using [enum|set|get]_frame_interval at all
> https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera=
-sensor.html#frame-interval-configuration
>
> The question now is how to handle the backwards compatibility for any
> userspace app that might be using this driver and expecting to use the
> frame_interval calls.
> Seeing as it only ever allowed a fixed value of 30fps, leaving it as
> is with a comment as to why it is there would be reasonable in my
> view.
>
> > On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Rela=
y
> > <devnull+git.apitzsch.eu@kernel.org> wrote:
> > >
> > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > >
> > > Add vblank control to allow changing the framerate /
> > > higher exposure values.
> > >
> > > The vblank and hblank controls are needed for libcamera support.
> > >
> > > While at it, fix the minimal exposure time according to the datasheet=
.
> > >
> > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > ---
> > >  drivers/media/i2c/imx214.c | 112 +++++++++++++++++++++++++++++++++++=
+---------
> > >  1 file changed, 91 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > > index 3b422cddbdce..9f5a57aebb86 100644
> > > --- a/drivers/media/i2c/imx214.c
> > > +++ b/drivers/media/i2c/imx214.c
> > > @@ -34,11 +34,18 @@
> > >
> > >  /* V-TIMING internal */
> > >  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> > > +#define IMX214_VTS_MAX                 0xffff
> > > +
> > > +#define IMX214_VBLANK_MIN              4
> > > +
> > > +/* HBLANK control - read only */
> > > +#define IMX214_PPL_DEFAULT             5008
> > >
> > >  /* Exposure control */
> > >  #define IMX214_REG_EXPOSURE            CCI_REG16(0x0202)
> > > -#define IMX214_EXPOSURE_MIN            0
> > > -#define IMX214_EXPOSURE_MAX            3184
> > > +#define IMX214_EXPOSURE_OFFSET         10
> > > +#define IMX214_EXPOSURE_MIN            1
> > > +#define IMX214_EXPOSURE_MAX            (IMX214_VTS_MAX - IMX214_EXPO=
SURE_OFFSET)
> > >  #define IMX214_EXPOSURE_STEP           1
> > >  #define IMX214_EXPOSURE_DEFAULT                3184
> > >  #define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> > > @@ -189,6 +196,8 @@ struct imx214 {
> > >         struct v4l2_ctrl_handler ctrls;
> > >         struct v4l2_ctrl *pixel_rate;
> > >         struct v4l2_ctrl *link_freq;
> > > +       struct v4l2_ctrl *vblank;
> > > +       struct v4l2_ctrl *hblank;
> > >         struct v4l2_ctrl *exposure;
> > >         struct v4l2_ctrl *unit_size;
> > >
> > > @@ -205,8 +214,6 @@ static const struct cci_reg_sequence mode_4096x23=
04[] =3D {
> > >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> > >         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH }=
,
> > >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> > >         { IMX214_REG_X_ADD_STA, 56 },
> > >         { IMX214_REG_Y_ADD_STA, 408 },
> > >         { IMX214_REG_X_ADD_END, 4151 },
> > > @@ -277,8 +284,6 @@ static const struct cci_reg_sequence mode_1920x10=
80[] =3D {
> > >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> > >         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH }=
,
> > >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> > >         { IMX214_REG_X_ADD_STA, 1144 },
> > >         { IMX214_REG_Y_ADD_STA, 1020 },
> > >         { IMX214_REG_X_ADD_END, 3063 },
> > > @@ -362,6 +367,7 @@ static const struct cci_reg_sequence mode_table_c=
ommon[] =3D {
> > >         { IMX214_REG_ORIENTATION, 0 },
> > >         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
> > >         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> > > +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
> > >         { CCI_REG8(0x4550), 0x02 },
> > >         { CCI_REG8(0x4601), 0x00 },
> > >         { CCI_REG8(0x4642), 0x05 },
> > > @@ -465,18 +471,24 @@ static const struct cci_reg_sequence mode_table=
_common[] =3D {
> > >  static const struct imx214_mode {
> > >         u32 width;
> > >         u32 height;
> > > +
> > > +       /* V-timing */
> > > +       unsigned int vts_def;
> > > +
> > >         unsigned int num_of_regs;
> > >         const struct cci_reg_sequence *reg_table;
> > >  } imx214_modes[] =3D {
> > >         {
> > >                 .width =3D 4096,
> > >                 .height =3D 2304,
> > > +               .vts_def =3D 3194,
> > >                 .num_of_regs =3D ARRAY_SIZE(mode_4096x2304),
> > >                 .reg_table =3D mode_4096x2304,
> > >         },
> > >         {
> > >                 .width =3D 1920,
> > >                 .height =3D 1080,
> > > +               .vts_def =3D 3194,
> > >                 .num_of_regs =3D ARRAY_SIZE(mode_1920x1080),
> > >                 .reg_table =3D mode_1920x1080,
> > >         },
> > > @@ -629,6 +641,37 @@ static int imx214_set_format(struct v4l2_subdev =
*sd,
> > >         __crop->width =3D mode->width;
> > >         __crop->height =3D mode->height;
> > >
> > > +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > +               int exposure_max;
> > > +               int exposure_def;
> > > +               int hblank;
> > > +
> > > +               /* Update limits and set FPS to default */
> > > +               __v4l2_ctrl_modify_range(imx214->vblank, IMX214_VBLAN=
K_MIN,
> > > +                                        IMX214_VTS_MAX - mode->heigh=
t, 1,
> > > +                                        mode->vts_def - mode->height=
);
> > > +               __v4l2_ctrl_s_ctrl(imx214->vblank,
> > > +                                  mode->vts_def - mode->height);
> > > +
> > > +               /* Update max exposure while meeting expected vblanki=
ng */
> > > +               exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFS=
ET;
> > > +               exposure_def =3D (exposure_max < IMX214_EXPOSURE_DEFA=
ULT) ?
> > > +                       exposure_max : IMX214_EXPOSURE_DEFAULT;
> > > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > > +                                        imx214->exposure->minimum,
> > > +                                        exposure_max, imx214->exposu=
re->step,
> > > +                                        exposure_def);
> > > +
> > > +               /*
> > > +                * Currently PPL is fixed to IMX214_PPL_DEFAULT, so h=
blank
> > > +                * depends on mode->width only, and is not changeble =
in any
> > > +                * way other than changing the mode.
> > > +                */
> > > +               hblank =3D IMX214_PPL_DEFAULT - mode->width;
> > > +               __v4l2_ctrl_modify_range(imx214->hblank, hblank, hbla=
nk, 1,
> > > +                                        hblank);
> > > +       }
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -678,8 +721,25 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctr=
l)
> > >  {
> > >         struct imx214 *imx214 =3D container_of(ctrl->handler,
> > >                                              struct imx214, ctrls);
> > > +       const struct v4l2_mbus_framefmt *format;
> > > +       struct v4l2_subdev_state *state;
> > >         int ret;
> > >
> > > +       state =3D v4l2_subdev_get_locked_active_state(&imx214->sd);
> > > +       format =3D v4l2_subdev_state_get_format(state, 0);
> > > +
> > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > > +               int exposure_max, exposure_def;
> > > +
> > > +               /* Update max exposure while meeting expected vblanki=
ng */
> > > +               exposure_max =3D format->height + ctrl->val - IMX214_=
EXPOSURE_OFFSET;
> > > +               exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DE=
FAULT);
> > > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > > +                                        imx214->exposure->minimum,
> > > +                                        exposure_max, imx214->exposu=
re->step,
> > > +                                        exposure_def);
> > > +       }
> > > +
> > >         /*
> > >          * Applying V4L2 control value only happens
> > >          * when power is up for streaming
> > > @@ -691,7 +751,10 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctr=
l)
> > >         case V4L2_CID_EXPOSURE:
> > >                 cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->=
val, &ret);
> > >                 break;
> > > -
> > > +       case V4L2_CID_VBLANK:
> > > +               cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES=
,
> > > +                         format->height + ctrl->val, &ret);
>
> My datasheet says this register is "set up in multiples of 2".
> (LINE_LENGTH_PCK for HBLANK is "set in multiples of 8")
>
> I don't have one of these modules, but is that saying only multiples
> of 2 are permitted (in which case the step size for the control needs
> to reflect that), or that setting a value of N is interpreted by the
> hardware as 2N?
> Do all the numbers with PIXEL_RATE work out correctly in the frame rate c=
alcs?

Answering my own question, PIXEL_RATE looks dubious.

The original code had LINE_LENGTH_PCK as 5008, and FRAME_LENGTH_LINES
as 3194. If enum_frame_intervals is to be believed, then it delivered
30fps.
5008 * 3194 * 30 =3D 479,866,560 Pix/s.

The driver defines IMX214_DEFAULT_LINK_FREQ 480000000, and then
IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10),
which works out as 384MPix/s. (Presumably the 8 is 4 lanes and DDR,
but it's not obvious)

Parsing the PLL registers with the defined 24MHz input. We're in
single PLL mode, so MIPI frequency is directly linked to pixel rate.
VTCK ends up being 1200MHz, and VTPXCK and OPPXCK both are 120MHz.
Section 5.3 "Frame rate calculation formula" says "Pixel rate
[pixels/s] =3D VTPXCK [MHz] * 4", so 120 * 4 =3D 480MPix/s, which
basically agrees with my number above.

3.1.4. MIPI global timing setting says "Output bitrate =3D OPPXCK * reg
0x113[7:0]", so 120MHz * 10, or 1200Mbit/s. That would be a link
frequency of 600MHz due to DDR.
That also matches to 480MPix/s * 10bpp / 4 lanes / 2 for DDR

Registers 0x0820-0823 are meant to define the target CSI2 bitrate, and
are set to 0x12c00000, or 314,572,800 decimal. I can't get that to
square with the above.


So my conclusion is that both PIXEL_RATE and LINK_FREQUENCY are wrong,
however the relationship used to define them looks to be correct.
Correct IMX214_DEFAULT_LINK_FREQ to 600MHz, and all should be good.
However you almost certainly want to set IMX214_VBLANK_MIN to
something significantly greater than 4.

  Dave

> Reading the spec sheet that 30fps is the max frame rate at full res
> (4096x2304), and the driver was setting a value of 3194 to this
> register, I don't see it being interpreted as 2N. Then again having
> VBLANK at 890 seems pretty high.
>
> > > +               break;
> > >         default:
> > >                 ret =3D -EINVAL;
> > >         }
> > > @@ -714,8 +777,11 @@ static int imx214_ctrls_init(struct imx214 *imx2=
14)
> > >                 .width =3D 1120,
> > >                 .height =3D 1120,
> > >         };
> > > +       const struct imx214_mode *mode =3D &imx214_modes[0];
> > >         struct v4l2_fwnode_device_properties props;
> > >         struct v4l2_ctrl_handler *ctrl_hdlr;
> > > +       int exposure_max, exposure_def;
> > > +       int hblank;
> > >         int ret;
> > >
> > >         ret =3D v4l2_fwnode_device_parse(imx214->dev, &props);
> > > @@ -723,7 +789,7 @@ static int imx214_ctrls_init(struct imx214 *imx21=
4)
> > >                 return ret;
> > >
> > >         ctrl_hdlr =3D &imx214->ctrls;
> > > -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> > > +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
> > >         if (ret)
> > >                 return ret;
> > >
> > > @@ -739,22 +805,26 @@ static int imx214_ctrls_init(struct imx214 *imx=
214)
> > >         if (imx214->link_freq)
> > >                 imx214->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONL=
Y;
> > >
> > > -       /*
> > > -        * WARNING!
> > > -        * Values obtained reverse engineering blobs and/or devices.
> > > -        * Ranges and functionality might be wrong.
> > > -        *
> > > -        * Sony, please release some register set documentation for t=
he
> > > -        * device.
> > > -        *
> > > -        * Yours sincerely, Ricardo.
> > > -        */
> >
> > I would like to keep this comment until there is a public document avai=
lable.
>
> I suspect you'll be waiting forever for a document to be officially relea=
sed.
>
> I have a datasheet for IMX214, and I believe Kieran and Jacopo do too.
> Which specific values do you wish to be verified?
>
> >
> > > +       /* Initial vblank/hblank/exposure parameters based on current=
 mode */
> > > +       imx214->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_=
ops,
> > > +                                          V4L2_CID_VBLANK, IMX214_VB=
LANK_MIN,
>
> IMX214_VBLANK_MIN being 4 feels plausible, but pretty low.
> I read the datasheet to say there are 4 embedded data lines per image.
> Seeing as you have STATS data output enabled as well that makes 5
> lines of non-image data per frame, but you're only adding blanking
> time for 4 lines.
>
> As noted above, I think you've also increased the max frame rate
> significantly above that quoted by Sony. Has that been actually
> exercised and confirmed to function correctly?
>
>   Dave
>
> > > +                                          IMX214_VTS_MAX - mode->hei=
ght, 1,
> > > +                                          mode->vts_def - mode->heig=
ht);
> > > +
> > > +       hblank =3D IMX214_PPL_DEFAULT - mode->width;
> > > +       imx214->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_=
ops,
> > > +                                          V4L2_CID_HBLANK, hblank, h=
blank,
> > > +                                          1, hblank);
> > > +       if (imx214->hblank)
> > > +               imx214->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +       exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET;
> > > +       exposure_def =3D min(exposure_max, IMX214_EXPOSURE_DEFAULT);
> > >         imx214->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctr=
l_ops,
> > >                                              V4L2_CID_EXPOSURE,
> > > -                                            IMX214_EXPOSURE_MIN,
> > > -                                            IMX214_EXPOSURE_MAX,
> > > +                                            IMX214_EXPOSURE_MIN, exp=
osure_max,
> > >                                              IMX214_EXPOSURE_STEP,
> > > -                                            IMX214_EXPOSURE_DEFAULT)=
;
> > > +                                            exposure_def);
> > >
> > >         imx214->unit_size =3D v4l2_ctrl_new_std_compound(ctrl_hdlr,
> > >                                 NULL,
> > >
> > > --
> > > 2.46.0
> > >
> > >
> >

