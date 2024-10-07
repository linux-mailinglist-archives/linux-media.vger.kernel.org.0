Return-Path: <linux-media+bounces-19167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F6A99350B
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 19:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E15532848F1
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 17:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF9C1DA0FC;
	Mon,  7 Oct 2024 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pVF9mPZc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1571DD86B
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 17:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728322211; cv=none; b=dQhUzlogQYma2HjlfNcpcfc5/sPzvOBVWVFoM+jH1PnG2wkYDp4jZCWKT35StArfo//cWllzifanT0M0yyLTbwFKOz4jOa9bnpi5zNIBolD4EjSrT6bZZtqn/9BvJL2bX6COA8IMB/A/dwBJwEKH4wh30suF1Kya3MuzlNodCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728322211; c=relaxed/simple;
	bh=8hlcnTRJ/1JYcrusZUnGzQSHGvz2U5VxVZcKBQqX35o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4Rb+5oy4Bg27HCXlpVANkGo8hgKVkNgqQHVg1oAPnPX9MPpTGZPIgXxLczioaB0Xii6ySgQo0lbODb7nk18eldcNyIINcpYQXomx8QIBOVe8ymdMblgG/f5M3MozcNqkCO0vgVTy81xaUaPWhL5thdRBx72411PIigfkzyEoC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pVF9mPZc; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e260754066cso4305668276.1
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2024 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1728322208; x=1728927008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkmZa5pItA3Q/yLVlMbytb2/d6W6TQy1cD8RlnZseNE=;
        b=pVF9mPZcU90gDaIbs09Wnpgr5L9CK8N06BW2JPSVRkwk3Q8X4pj5twHTvyWE7WGemW
         uUsv0QtcZh8XVtYhGSdaZdy34F1wlfmSBNpf35Hj9dCgdefaus/fuauf+oTdryp0SNfd
         Dl82R9wG2C9FVu6BPrcN5Zai0un2z1Qp3E7UPicJUh7H3SPSDtC8I1TGpNm69hq51TEf
         NArgmaEFLls/1AeR/peMI+FrW5lMBj81SiIRU46WKsFvpDhOYqChKjZspms9SGXXs9EQ
         aTmb7m0ne/ncbuxf95W8XzEhfFNrH44Q6P7awPT1AIziBB5Av86H78xvNX6sJKtqgON0
         qCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728322208; x=1728927008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkmZa5pItA3Q/yLVlMbytb2/d6W6TQy1cD8RlnZseNE=;
        b=IyQJ6pN88f/7J4cchQEETh/vwQqm5eSbBHdHuP3oXStJWVCNCtepghfgzkRlFeZ35S
         UQtRkVZyoKQ6QXTdGn4s5hN2lB0iNv3KMgoMey2O1wBWaaf0hUxMGASzGh8QefEWNbeb
         q3Ke/GkDetzp2jz1D2Wwmx+b94UIIZtXIXGPuhzd3itzZqV2SfriUwZfPf/4neRuRmJ7
         kdy9aV0vraLcI6heBZH+dVVYAWaHQGB8XJrm4dRdWoJrfZvDLwc+UGQRUH/pYRg8LpNM
         P+PY8D+jgkput//E5EHQwmWkEZ125g7YQHosa3PR6jtffys11kiLMx7CvYbE74UPF9B9
         w/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6affvaVIBOwTXrnehIrYXVrpTdAiMpm+LICaNpQB9OM0wr9CrK+XiikfmUGqlIfl/vt2NejUMBfabg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziZNGzZWSDhtr2kjCYZ6S84eN2/A7tsy5j98YYsYU9nFkm9uem
	3GCpBVw9juza7IFgWn3mpjNn7IOTc+EsgD+kSsZIDRFbqMG7jgdFZnq8UPIjFskqYXNCLEKweQ+
	BCJA8XmpJN3IVeYv3VPzwrkma/1XWGED6KcwCncJov5OlpAH4A34=
X-Google-Smtp-Source: AGHT+IG318GeEICio2vWXbXYn2vG+fyWZJVDWXW6VYTCcJ7tDua9jWGQFUhXH1zfO3Orq4VccXb5plQzOm9U+lpjlms=
X-Received: by 2002:a05:6902:168e:b0:e11:6a73:9008 with SMTP id
 3f1490d57ef6-e28936c7b3dmr8239834276.3.1728322208133; Mon, 07 Oct 2024
 10:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
 <20240902-imx214-v1-8-c96cba989315@apitzsch.eu> <CAPybu_2VPDTHb=nOaze7bwLvEEGxcS1zK=su5vpfLNao59Gwfw@mail.gmail.com>
 <CAPY8ntCOWxXXmkahhMwx4E74LAtFQKrUxmJOrERm2F7KqiiOyg@mail.gmail.com>
 <CAPY8ntDnbbhseYHynU=09Ziev9qeFZ074yPodWPUGZ9xbWCd2Q@mail.gmail.com> <d92f1239050e7c9f30c685c86eed37ff940d78ff.camel@apitzsch.eu>
In-Reply-To: <d92f1239050e7c9f30c685c86eed37ff940d78ff.camel@apitzsch.eu>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Oct 2024 18:29:52 +0100
Message-ID: <CAPY8ntC6LPOM_RQSvSbButsh59S8t8ic16jAgNN3q7w9SycpBw@mail.gmail.com>
Subject: Re: [PATCH 08/13] media: i2c: imx214: Add vblank and hblank controls
To: =?UTF-8?B?QW5kcsOp?= <git@apitzsch.eu>
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre

On Sun, 6 Oct 2024 at 22:41, Andr=C3=A9 <git@apitzsch.eu> wrote:
>
> Hi Dave,
>
> Am Freitag, dem 13.09.2024 um 18:40 +0100 schrieb Dave Stevenson:
> > On Thu, 12 Sept 2024 at 15:51, Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Andr=C3=A9 & Ricardo
> > >
> > > On Thu, 12 Sept 2024 at 14:41, Ricardo Ribalda Delgado
> > > <ribalda@kernel.org> wrote:
> > > >
> > > > Hi
> > > >
> > > > Arent you missing some chage in enum_frame_interval?
> > >
> > > Raw sensors shouldn't be using [enum|set|get]_frame_interval at all
> > > https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/ca=
mera-sensor.html#frame-interval-configuration
> > >
> > > The question now is how to handle the backwards compatibility for
> > > any userspace app that might be using this driver and expecting to
> > > use the frame_interval calls.
> > > Seeing as it only ever allowed a fixed value of 30fps, leaving it
> > > as is with a comment as to why it is there would be reasonable in
> > > my view.
>
> Should the comment be added in this commit?
> And what exactly should the comment say?

Add it to imx214_enum_frame_interval.
Something along the lines of:
Raw sensors should be using the VBLANK and HBLANK controls to
determine the frame rate. However this driver was initially added
using the [S|G|ENUM]_FRAME_INTERVAL ioctls with a fixed rate of 30fps.
Retain the frame_interval ops for backwards compatibility, but they do noth=
ing.

> > >
> > > > On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 =
Relay
> > > > <devnull+git.apitzsch.eu@kernel.org> wrote:
> > > > >
> > > > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > > >
> > > > > Add vblank control to allow changing the framerate /
> > > > > higher exposure values.
> > > > >
> > > > > The vblank and hblank controls are needed for libcamera
> > > > > support.
> > > > >
> > > > > While at it, fix the minimal exposure time according to the
> > > > > datasheet.
> > > > >
> > > > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > > > ---
> > > > >  drivers/media/i2c/imx214.c | 112
> > > > > ++++++++++++++++++++++++++++++++++++---------
> > > > >  1 file changed, 91 insertions(+), 21 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx214.c
> > > > > b/drivers/media/i2c/imx214.c
> > > > > index 3b422cddbdce..9f5a57aebb86 100644
> > > > > --- a/drivers/media/i2c/imx214.c
> > > > > +++ b/drivers/media/i2c/imx214.c
> > > > > @@ -34,11 +34,18 @@
> > > > >
> > > > >  /* V-TIMING internal */
> > > > >  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> > > > > +#define IMX214_VTS_MAX                 0xffff
> > > > > +
> > > > > +#define IMX214_VBLANK_MIN              4
> > > > > +
> > > > > +/* HBLANK control - read only */
> > > > > +#define IMX214_PPL_DEFAULT             5008
> > > > >
> > > > >  /* Exposure control */
> > > > >  #define IMX214_REG_EXPOSURE            CCI_REG16(0x0202)
> > > > > -#define IMX214_EXPOSURE_MIN            0
> > > > > -#define IMX214_EXPOSURE_MAX            3184
> > > > > +#define IMX214_EXPOSURE_OFFSET         10
> > > > > +#define IMX214_EXPOSURE_MIN            1
> > > > > +#define IMX214_EXPOSURE_MAX            (IMX214_VTS_MAX -
> > > > > IMX214_EXPOSURE_OFFSET)
> > > > >  #define IMX214_EXPOSURE_STEP           1
> > > > >  #define IMX214_EXPOSURE_DEFAULT                3184
> > > > >  #define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> > > > > @@ -189,6 +196,8 @@ struct imx214 {
> > > > >         struct v4l2_ctrl_handler ctrls;
> > > > >         struct v4l2_ctrl *pixel_rate;
> > > > >         struct v4l2_ctrl *link_freq;
> > > > > +       struct v4l2_ctrl *vblank;
> > > > > +       struct v4l2_ctrl *hblank;
> > > > >         struct v4l2_ctrl *exposure;
> > > > >         struct v4l2_ctrl *unit_size;
> > > > >
> > > > > @@ -205,8 +214,6 @@ static const struct cci_reg_sequence
> > > > > mode_4096x2304[] =3D {
> > > > >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> > > > >         { IMX214_REG_HDR_RES_REDUCTION,
> > > > > IMX214_HDR_RES_REDU_THROUGH },
> > > > >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > > > > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > > > > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> > > > >         { IMX214_REG_X_ADD_STA, 56 },
> > > > >         { IMX214_REG_Y_ADD_STA, 408 },
> > > > >         { IMX214_REG_X_ADD_END, 4151 },
> > > > > @@ -277,8 +284,6 @@ static const struct cci_reg_sequence
> > > > > mode_1920x1080[] =3D {
> > > > >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> > > > >         { IMX214_REG_HDR_RES_REDUCTION,
> > > > > IMX214_HDR_RES_REDU_THROUGH },
> > > > >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > > > > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > > > > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> > > > >         { IMX214_REG_X_ADD_STA, 1144 },
> > > > >         { IMX214_REG_Y_ADD_STA, 1020 },
> > > > >         { IMX214_REG_X_ADD_END, 3063 },
> > > > > @@ -362,6 +367,7 @@ static const struct cci_reg_sequence
> > > > > mode_table_common[] =3D {
> > > > >         { IMX214_REG_ORIENTATION, 0 },
> > > > >         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK
> > > > > },
> > > > >         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> > > > > +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
> > > > >         { CCI_REG8(0x4550), 0x02 },
> > > > >         { CCI_REG8(0x4601), 0x00 },
> > > > >         { CCI_REG8(0x4642), 0x05 },
> > > > > @@ -465,18 +471,24 @@ static const struct cci_reg_sequence
> > > > > mode_table_common[] =3D {
> > > > >  static const struct imx214_mode {
> > > > >         u32 width;
> > > > >         u32 height;
> > > > > +
> > > > > +       /* V-timing */
> > > > > +       unsigned int vts_def;
> > > > > +
> > > > >         unsigned int num_of_regs;
> > > > >         const struct cci_reg_sequence *reg_table;
> > > > >  } imx214_modes[] =3D {
> > > > >         {
> > > > >                 .width =3D 4096,
> > > > >                 .height =3D 2304,
> > > > > +               .vts_def =3D 3194,
> > > > >                 .num_of_regs =3D ARRAY_SIZE(mode_4096x2304),
> > > > >                 .reg_table =3D mode_4096x2304,
> > > > >         },
> > > > >         {
> > > > >                 .width =3D 1920,
> > > > >                 .height =3D 1080,
> > > > > +               .vts_def =3D 3194,
> > > > >                 .num_of_regs =3D ARRAY_SIZE(mode_1920x1080),
> > > > >                 .reg_table =3D mode_1920x1080,
> > > > >         },
> > > > > @@ -629,6 +641,37 @@ static int imx214_set_format(struct
> > > > > v4l2_subdev *sd,
> > > > >         __crop->width =3D mode->width;
> > > > >         __crop->height =3D mode->height;
> > > > >
> > > > > +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > > > +               int exposure_max;
> > > > > +               int exposure_def;
> > > > > +               int hblank;
> > > > > +
> > > > > +               /* Update limits and set FPS to default */
> > > > > +               __v4l2_ctrl_modify_range(imx214->vblank,
> > > > > IMX214_VBLANK_MIN,
> > > > > +                                        IMX214_VTS_MAX - mode-
> > > > > >height, 1,
> > > > > +                                        mode->vts_def - mode-
> > > > > >height);
> > > > > +               __v4l2_ctrl_s_ctrl(imx214->vblank,
> > > > > +                                  mode->vts_def - mode-
> > > > > >height);
> > > > > +
> > > > > +               /* Update max exposure while meeting expected
> > > > > vblanking */
> > > > > +               exposure_max =3D mode->vts_def -
> > > > > IMX214_EXPOSURE_OFFSET;
> > > > > +               exposure_def =3D (exposure_max <
> > > > > IMX214_EXPOSURE_DEFAULT) ?
> > > > > +                       exposure_max : IMX214_EXPOSURE_DEFAULT;
> > > > > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > > > > +                                        imx214->exposure-
> > > > > >minimum,
> > > > > +                                        exposure_max, imx214-
> > > > > >exposure->step,
> > > > > +                                        exposure_def);
> > > > > +
> > > > > +               /*
> > > > > +                * Currently PPL is fixed to
> > > > > IMX214_PPL_DEFAULT, so hblank
> > > > > +                * depends on mode->width only, and is not
> > > > > changeble in any
> > > > > +                * way other than changing the mode.
> > > > > +                */
> > > > > +               hblank =3D IMX214_PPL_DEFAULT - mode->width;
> > > > > +               __v4l2_ctrl_modify_range(imx214->hblank,
> > > > > hblank, hblank, 1,
> > > > > +                                        hblank);
> > > > > +       }
> > > > > +
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > @@ -678,8 +721,25 @@ static int imx214_set_ctrl(struct
> > > > > v4l2_ctrl *ctrl)
> > > > >  {
> > > > >         struct imx214 *imx214 =3D container_of(ctrl->handler,
> > > > >                                              struct imx214,
> > > > > ctrls);
> > > > > +       const struct v4l2_mbus_framefmt *format;
> > > > > +       struct v4l2_subdev_state *state;
> > > > >         int ret;
> > > > >
> > > > > +       state =3D v4l2_subdev_get_locked_active_state(&imx214-
> > > > > >sd);
> > > > > +       format =3D v4l2_subdev_state_get_format(state, 0);
> > > > > +
> > > > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > > > > +               int exposure_max, exposure_def;
> > > > > +
> > > > > +               /* Update max exposure while meeting expected
> > > > > vblanking */
> > > > > +               exposure_max =3D format->height + ctrl->val -
> > > > > IMX214_EXPOSURE_OFFSET;
> > > > > +               exposure_def =3D min(exposure_max,
> > > > > IMX214_EXPOSURE_DEFAULT);
> > > > > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > > > > +                                        imx214->exposure-
> > > > > >minimum,
> > > > > +                                        exposure_max, imx214-
> > > > > >exposure->step,
> > > > > +                                        exposure_def);
> > > > > +       }
> > > > > +
> > > > >         /*
> > > > >          * Applying V4L2 control value only happens
> > > > >          * when power is up for streaming
> > > > > @@ -691,7 +751,10 @@ static int imx214_set_ctrl(struct
> > > > > v4l2_ctrl *ctrl)
> > > > >         case V4L2_CID_EXPOSURE:
> > > > >                 cci_write(imx214->regmap, IMX214_REG_EXPOSURE,
> > > > > ctrl->val, &ret);
> > > > >                 break;
> > > > > -
> > > > > +       case V4L2_CID_VBLANK:
> > > > > +               cci_write(imx214->regmap,
> > > > > IMX214_REG_FRM_LENGTH_LINES,
> > > > > +                         format->height + ctrl->val, &ret);
> > >
> > > My datasheet says this register is "set up in multiples of 2".
> > > (LINE_LENGTH_PCK for HBLANK is "set in multiples of 8")
> > >
> > > I don't have one of these modules, but is that saying only
> > > multiples
> > > of 2 are permitted (in which case the step size for the control
> > > needs
> > > to reflect that), or that setting a value of N is interpreted by
> > > the
> > > hardware as 2N?
> > > Do all the numbers with PIXEL_RATE work out correctly in the frame
> > > rate calcs?
> >
> > Answering my own question, PIXEL_RATE looks dubious.
> >
> > The original code had LINE_LENGTH_PCK as 5008, and FRAME_LENGTH_LINES
> > as 3194. If enum_frame_intervals is to be believed, then it delivered
> > 30fps.
> > 5008 * 3194 * 30 =3D 479,866,560 Pix/s.
> >
> > The driver defines IMX214_DEFAULT_LINK_FREQ 480000000, and then
> > IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10),
> > which works out as 384MPix/s. (Presumably the 8 is 4 lanes and DDR,
> > but it's not obvious)
> >
> > Parsing the PLL registers with the defined 24MHz input. We're in
> > single PLL mode, so MIPI frequency is directly linked to pixel rate.
> > VTCK ends up being 1200MHz, and VTPXCK and OPPXCK both are 120MHz.
> > Section 5.3 "Frame rate calculation formula" says "Pixel rate
> > [pixels/s] =3D VTPXCK [MHz] * 4", so 120 * 4 =3D 480MPix/s, which
> > basically agrees with my number above.
> >
> > 3.1.4. MIPI global timing setting says "Output bitrate =3D OPPXCK * reg
> > 0x113[7:0]", so 120MHz * 10, or 1200Mbit/s. That would be a link
> > frequency of 600MHz due to DDR.
> > That also matches to 480MPix/s * 10bpp / 4 lanes / 2 for DDR
> >
> > Registers 0x0820-0823 are meant to define the target CSI2 bitrate,
> > and are set to 0x12c00000, or 314,572,800 decimal. I can't get that
> > to square with the above.
> >
> >
> > So my conclusion is that both PIXEL_RATE and LINK_FREQUENCY are
> > wrong, however the relationship used to define them looks to be
> > correct.
> > Correct IMX214_DEFAULT_LINK_FREQ to 600MHz, and all should be good.
>
> Will do that. Should it be done in this commit or in a separat one?

A separate one as it is independent of adding VBLANK and HBLANK
controls. Ideally it should come before this patch as then hopefully
everything actually works correctly when you add them.

> > However you almost certainly want to set IMX214_VBLANK_MIN to
> > something significantly greater than 4.
>
> Any recommendation for the new IMX214_VBLANK_MIN value?

As my comment below, the datasheet lists 30fps as the max frame rate
for full res, therefore IMX214_VBLANK_MIN being correct for that seems
reasonable. 890 appears to be the value for that, but I haven't
verified that all the numbers do then work out.

Out of interest, what platform are you testing this on, and where are
you getting the sensor from? I'm always happy to tinker with sensors
that I can get working on a Pi, and I think the Arducam DepthAI Oak
module should work, but haven't picked one up yet.

  Dave

> Best regards,
> Andr=C3=A9
>
> >
> >   Dave
> >
> > > Reading the spec sheet that 30fps is the max frame rate at full res
> > > (4096x2304), and the driver was setting a value of 3194 to this
> > > register, I don't see it being interpreted as 2N. Then again having
> > > VBLANK at 890 seems pretty high.
> > >
> > > > > +               break;
> > > > >         default:
> > > > >                 ret =3D -EINVAL;
> > > > >         }
> > > > > @@ -714,8 +777,11 @@ static int imx214_ctrls_init(struct imx214
> > > > > *imx214)
> > > > >                 .width =3D 1120,
> > > > >                 .height =3D 1120,
> > > > >         };
> > > > > +       const struct imx214_mode *mode =3D &imx214_modes[0];
> > > > >         struct v4l2_fwnode_device_properties props;
> > > > >         struct v4l2_ctrl_handler *ctrl_hdlr;
> > > > > +       int exposure_max, exposure_def;
> > > > > +       int hblank;
> > > > >         int ret;
> > > > >
> > > > >         ret =3D v4l2_fwnode_device_parse(imx214->dev, &props);
> > > > > @@ -723,7 +789,7 @@ static int imx214_ctrls_init(struct imx214
> > > > > *imx214)
> > > > >                 return ret;
> > > > >
> > > > >         ctrl_hdlr =3D &imx214->ctrls;
> > > > > -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> > > > > +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
> > > > >         if (ret)
> > > > >                 return ret;
> > > > >
> > > > > @@ -739,22 +805,26 @@ static int imx214_ctrls_init(struct
> > > > > imx214 *imx214)
> > > > >         if (imx214->link_freq)
> > > > >                 imx214->link_freq->flags |=3D
> > > > > V4L2_CTRL_FLAG_READ_ONLY;
> > > > >
> > > > > -       /*
> > > > > -        * WARNING!
> > > > > -        * Values obtained reverse engineering blobs and/or
> > > > > devices.
> > > > > -        * Ranges and functionality might be wrong.
> > > > > -        *
> > > > > -        * Sony, please release some register set documentation
> > > > > for the
> > > > > -        * device.
> > > > > -        *
> > > > > -        * Yours sincerely, Ricardo.
> > > > > -        */
> > > >
> > > > I would like to keep this comment until there is a public
> > > > document available.
> > >
> > > I suspect you'll be waiting forever for a document to be officially
> > > released.
> > >
> > > I have a datasheet for IMX214, and I believe Kieran and Jacopo do
> > > too.
> > > Which specific values do you wish to be verified?
> > >
> > > >
> > > > > +       /* Initial vblank/hblank/exposure parameters based on
> > > > > current mode */
> > > > > +       imx214->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > > > > &imx214_ctrl_ops,
> > > > > +                                          V4L2_CID_VBLANK,
> > > > > IMX214_VBLANK_MIN,
> > >
> > > IMX214_VBLANK_MIN being 4 feels plausible, but pretty low.
> > > I read the datasheet to say there are 4 embedded data lines per
> > > image.
> > > Seeing as you have STATS data output enabled as well that makes 5
> > > lines of non-image data per frame, but you're only adding blanking
> > > time for 4 lines.
> > >
> > > As noted above, I think you've also increased the max frame rate
> > > significantly above that quoted by Sony. Has that been actually
> > > exercised and confirmed to function correctly?
> > >
> > >   Dave
> > >
> > > > > +                                          IMX214_VTS_MAX -
> > > > > mode->height, 1,
> > > > > +                                          mode->vts_def -
> > > > > mode->height);
> > > > > +
> > > > > +       hblank =3D IMX214_PPL_DEFAULT - mode->width;
> > > > > +       imx214->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > > > > &imx214_ctrl_ops,
> > > > > +                                          V4L2_CID_HBLANK,
> > > > > hblank, hblank,
> > > > > +                                          1, hblank);
> > > > > +       if (imx214->hblank)
> > > > > +               imx214->hblank->flags |=3D
> > > > > V4L2_CTRL_FLAG_READ_ONLY;
> > > > > +
> > > > > +       exposure_max =3D mode->vts_def - IMX214_EXPOSURE_OFFSET;
> > > > > +       exposure_def =3D min(exposure_max,
> > > > > IMX214_EXPOSURE_DEFAULT);
> > > > >         imx214->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > > > > &imx214_ctrl_ops,
> > > > >                                              V4L2_CID_EXPOSURE,
> > > > > -
> > > > > IMX214_EXPOSURE_MIN,
> > > > > -
> > > > > IMX214_EXPOSURE_MAX,
> > > > > +
> > > > > IMX214_EXPOSURE_MIN, exposure_max,
> > > > >
> > > > > IMX214_EXPOSURE_STEP,
> > > > > -
> > > > > IMX214_EXPOSURE_DEFAULT);
> > > > > +                                            exposure_def);
> > > > >
> > > > >         imx214->unit_size =3D
> > > > > v4l2_ctrl_new_std_compound(ctrl_hdlr,
> > > > >                                 NULL,
> > > > >
> > > > > --
> > > > > 2.46.0
> > > > >
> > > > >
> > > >
>

