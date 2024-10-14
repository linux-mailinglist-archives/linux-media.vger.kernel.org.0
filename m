Return-Path: <linux-media+bounces-19607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 435E799C9E4
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 14:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01FC228128F
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 12:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049B11A0714;
	Mon, 14 Oct 2024 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="t+wvj3H/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8595F19F421
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728908269; cv=none; b=QlvMsLGAp/0/QpVLOFB1jhUK0kTxbZsrS5NpRXisZGY3vpHTBvQu5BXPcAjenhdXlRK8bAQJafXAimAGnZC/E+UBZ/7KxBdQtJPDzvG9NC1AI2vpfuxE6fhJ3+apuX0kUkPQzBm35bripKPDs+WvUIRRaIJAYVtlPZmwHvu4v6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728908269; c=relaxed/simple;
	bh=BKWT4xTpzvC091bOMckE4TiY0nDiFZWdOGWqQ+v/Fvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Syu+9q3nOdjx7NfTdL2FnktwfN75rlD7rO6sPimhlEDsCu5fyLr+DCbtdq/4dm5bJbVizQ+rnE9Hw7QF7UmTrsDC76LHIWNSPnh+0SuF1R6HzpxPHklpcbrCKxccxFoJmG1wNrfqKJ9DpekFKVZyJlirVmTR5MJUjnknNWZokAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=t+wvj3H/; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e34fa656a2so21341397b3.1
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1728908265; x=1729513065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkdKaHxBP7KzvOXiMJveozDKUIEVKEKEjLIXGgNZvMU=;
        b=t+wvj3H/Xj4tRPmmsdBG4X4uIA7xrV4WYngzEDDb1hTT/vAsOHFI4swPGvY52qIApk
         VqjX6rfLkTo9+KASihorzsv81NS9SjlT/+7lUvVc8Ph1nnIuUk+++hLrBfJTWu2BRf83
         //VBaJvE6C9WkMHWZ6xd6dObWfU3jm4Yw1mFRfcHqxM5tcaAlnEg32Wa00MKrIbk6eYb
         XTTuwLa8Lpp1LJDKQJeXk8g7FCboiY2Kkhl+8Fp/OMoYlXqzly8kfWPCiDAvLlGeExoA
         qFs1I+VWJz02tEQDHoUEizNWCq8UdpGxKVMITtjd8qmA6hA3O190GIBW1t22XUTZj7v4
         s5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728908265; x=1729513065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkdKaHxBP7KzvOXiMJveozDKUIEVKEKEjLIXGgNZvMU=;
        b=sibJmxg++YSN4RKS9CtW09/g1maZG1uDXM3gJxVuYU3/4u+E4ORKkD4zX4QiYqg4DO
         zX43SqYLyjtRGhADGDK5WivC0tg2bStai8iYqgCecvtAbpWT2TO3wXYjvhb6wJKgBf1n
         cZp+klWPP8hD4oQUSDCewJyDz86grGb9h4nK1Vo/cjMjiqcvz05+xMz7uNF1DXeUmLuB
         Le47NBLI9iYJ19vwBStfECaKcPRa7uzsUVlRIVH3nqc8gFQFJbaI7QUYlt/0TFWYVLc7
         OF7g1+3tz07NWEGg8w+H8xv0mXsRqbOT3+BLALIu312/NhbwiL+dEFwMH995bd5Ums5C
         ZwDg==
X-Forwarded-Encrypted: i=1; AJvYcCVqHUrdatK0FDIARTDD8pFmZa7hwtGRlYRSWazZvMRCpAeBuAVUs4nvu6uxVrrdGmtzPKayFWqWQHG5Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7m+6DBIciTBBwG8d/fbt3GagjK6ojwS9azwq60mXWs3mbxQg8
	RNFop4/HSaa67484xfLROcUrIkGmxXqBVp6aXfSMBN7CuonW0xPi/r7PPDAVYnnZiXGcb10yC5j
	t6XdbXJlIi5eKkA8Bm+rCWtiI28Xkt2N3FQo/EQ==
X-Google-Smtp-Source: AGHT+IGSIj1FzNQCAGscHuX8o4fSwfh7sUm4xqqsweu41F7ysgUXUtGEOYnZhXQf6CGGewMOZ2I2VYdc5GVhINSyJrE=
X-Received: by 2002:a05:690c:6381:b0:6e3:36cc:eb74 with SMTP id
 00721157ae682-6e3644c016dmr58573017b3.32.1728908265410; Mon, 14 Oct 2024
 05:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
 <20240902-imx214-v1-8-c96cba989315@apitzsch.eu> <CAPybu_2VPDTHb=nOaze7bwLvEEGxcS1zK=su5vpfLNao59Gwfw@mail.gmail.com>
 <CAPY8ntCOWxXXmkahhMwx4E74LAtFQKrUxmJOrERm2F7KqiiOyg@mail.gmail.com>
 <CAPY8ntDnbbhseYHynU=09Ziev9qeFZ074yPodWPUGZ9xbWCd2Q@mail.gmail.com>
 <d92f1239050e7c9f30c685c86eed37ff940d78ff.camel@apitzsch.eu>
 <CAPY8ntC6LPOM_RQSvSbButsh59S8t8ic16jAgNN3q7w9SycpBw@mail.gmail.com> <2708cb8aaefe0c1860bddf3ec34630831195fcd3.camel@apitzsch.eu>
In-Reply-To: <2708cb8aaefe0c1860bddf3ec34630831195fcd3.camel@apitzsch.eu>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 14 Oct 2024 13:17:29 +0100
Message-ID: <CAPY8ntDD2_LzOPp1aWU-PyyhsdcY+TWPPOw3=GkL1GOzh15Lpg@mail.gmail.com>
Subject: Re: [PATCH 08/13] media: i2c: imx214: Add vblank and hblank controls
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Sat, 12 Oct 2024 at 22:46, Andr=C3=A9 Apitzsch <git@apitzsch.eu> wrote:
>
> Hi Dave,
>
> Am Montag, dem 07.10.2024 um 18:29 +0100 schrieb Dave Stevenson:
> > Hi Andre
> >
> > On Sun, 6 Oct 2024 at 22:41, Andr=C3=A9 <git@apitzsch.eu> wrote:
> > >
> > > Hi Dave,
> > >
> > > Am Freitag, dem 13.09.2024 um 18:40 +0100 schrieb Dave Stevenson:
> > > > On Thu, 12 Sept 2024 at 15:51, Dave Stevenson
> > > > <dave.stevenson@raspberrypi.com> wrote:
> > > > >
> > > > > Hi Andr=C3=A9 & Ricardo
> > > > >
> > > > > On Thu, 12 Sept 2024 at 14:41, Ricardo Ribalda Delgado
> > > > > <ribalda@kernel.org> wrote:
> > > > > >
> > > > > > Hi
> > > > > >
> > > > > > Arent you missing some chage in enum_frame_interval?
> > > > >
> > > > > Raw sensors shouldn't be using [enum|set|get]_frame_interval at
> > > > > all
> > > > > https://www.kernel.org/doc/html/latest/userspace-api/media/driver=
s/camera-sensor.html#frame-interval-configuration
> > > > >
> > > > > The question now is how to handle the backwards compatibility
> > > > > for
> > > > > any userspace app that might be using this driver and expecting
> > > > > to
> > > > > use the frame_interval calls.
> > > > > Seeing as it only ever allowed a fixed value of 30fps, leaving
> > > > > it
> > > > > as is with a comment as to why it is there would be reasonable
> > > > > in
> > > > > my view.
> > >
> > > Should the comment be added in this commit?
> > > And what exactly should the comment say?
> >
> > Add it to imx214_enum_frame_interval.
> > Something along the lines of:
> > Raw sensors should be using the VBLANK and HBLANK controls to
> > determine the frame rate. However this driver was initially added
> > using the [S|G|ENUM]_FRAME_INTERVAL ioctls with a fixed rate of
> > 30fps.
> > Retain the frame_interval ops for backwards compatibility, but they
> > do nothing.
> >
> > > > >
> > > > > > On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via=
 B4 Relay
> > > > > > <devnull+git.apitzsch.eu@kernel.org> wrote:
> > > > > > >
> > > > > > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > > > > >
> > > > > > > Add vblank control to allow changing the framerate /
> > > > > > > higher exposure values.
> > > > > > >
> > > > > > > The vblank and hblank controls are needed for libcamera
> > > > > > > support.
> > > > > > >
> > > > > > > While at it, fix the minimal exposure time according to the
> > > > > > > datasheet.
> > > > > > >
> > > > > > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/imx214.c | 112
> > > > > > > ++++++++++++++++++++++++++++++++++++---------
> > > > > > >  1 file changed, 91 insertions(+), 21 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/i2c/imx214.c
> > > > > > > b/drivers/media/i2c/imx214.c
> > > > > > > index 3b422cddbdce..9f5a57aebb86 100644
> > > > > > > --- a/drivers/media/i2c/imx214.c
> > > > > > > +++ b/drivers/media/i2c/imx214.c
> > > > > > > @@ -34,11 +34,18 @@
> > > > > > >
> > > > > > >  /* V-TIMING internal */
> > > > > > >  #define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> > > > > > > +#define IMX214_VTS_MAX                 0xffff
> > > > > > > +
> > > > > > > +#define IMX214_VBLANK_MIN              4
> > > > > > > +
> > > > > > > +/* HBLANK control - read only */
> > > > > > > +#define IMX214_PPL_DEFAULT             5008
> > > > > > >
> > > > > > >  /* Exposure control */
> > > > > > >  #define IMX214_REG_EXPOSURE            CCI_REG16(0x0202)
> > > > > > > -#define IMX214_EXPOSURE_MIN            0
> > > > > > > -#define IMX214_EXPOSURE_MAX            3184
> > > > > > > +#define IMX214_EXPOSURE_OFFSET         10
> > > > > > > +#define IMX214_EXPOSURE_MIN            1
> > > > > > > +#define IMX214_EXPOSURE_MAX            (IMX214_VTS_MAX -
> > > > > > > IMX214_EXPOSURE_OFFSET)
> > > > > > >  #define IMX214_EXPOSURE_STEP           1
> > > > > > >  #define IMX214_EXPOSURE_DEFAULT                3184
> > > > > > >  #define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> > > > > > > @@ -189,6 +196,8 @@ struct imx214 {
> > > > > > >         struct v4l2_ctrl_handler ctrls;
> > > > > > >         struct v4l2_ctrl *pixel_rate;
> > > > > > >         struct v4l2_ctrl *link_freq;
> > > > > > > +       struct v4l2_ctrl *vblank;
> > > > > > > +       struct v4l2_ctrl *hblank;
> > > > > > >         struct v4l2_ctrl *exposure;
> > > > > > >         struct v4l2_ctrl *unit_size;
> > > > > > >
> > > > > > > @@ -205,8 +214,6 @@ static const struct cci_reg_sequence
> > > > > > > mode_4096x2304[] =3D {
> > > > > > >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> > > > > > >         { IMX214_REG_HDR_RES_REDUCTION,
> > > > > > > IMX214_HDR_RES_REDU_THROUGH },
> > > > > > >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > > > > > > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > > > > > > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> > > > > > >         { IMX214_REG_X_ADD_STA, 56 },
> > > > > > >         { IMX214_REG_Y_ADD_STA, 408 },
> > > > > > >         { IMX214_REG_X_ADD_END, 4151 },
> > > > > > > @@ -277,8 +284,6 @@ static const struct cci_reg_sequence
> > > > > > > mode_1920x1080[] =3D {
> > > > > > >         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> > > > > > >         { IMX214_REG_HDR_RES_REDUCTION,
> > > > > > > IMX214_HDR_RES_REDU_THROUGH },
> > > > > > >         { IMX214_REG_EXPOSURE_RATIO, 1 },
> > > > > > > -       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> > > > > > > -       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> > > > > > >         { IMX214_REG_X_ADD_STA, 1144 },
> > > > > > >         { IMX214_REG_Y_ADD_STA, 1020 },
> > > > > > >         { IMX214_REG_X_ADD_END, 3063 },
> > > > > > > @@ -362,6 +367,7 @@ static const struct cci_reg_sequence
> > > > > > > mode_table_common[] =3D {
> > > > > > >         { IMX214_REG_ORIENTATION, 0 },
> > > > > > >         { IMX214_REG_MASK_CORR_FRAMES,
> > > > > > > IMX214_CORR_FRAMES_MASK
> > > > > > > },
> > > > > > >         { IMX214_REG_FAST_STANDBY_CTRL, 1 },
> > > > > > > +       { IMX214_REG_LINE_LENGTH_PCK, IMX214_PPL_DEFAULT },
> > > > > > >         { CCI_REG8(0x4550), 0x02 },
> > > > > > >         { CCI_REG8(0x4601), 0x00 },
> > > > > > >         { CCI_REG8(0x4642), 0x05 },
> > > > > > > @@ -465,18 +471,24 @@ static const struct cci_reg_sequence
> > > > > > > mode_table_common[] =3D {
> > > > > > >  static const struct imx214_mode {
> > > > > > >         u32 width;
> > > > > > >         u32 height;
> > > > > > > +
> > > > > > > +       /* V-timing */
> > > > > > > +       unsigned int vts_def;
> > > > > > > +
> > > > > > >         unsigned int num_of_regs;
> > > > > > >         const struct cci_reg_sequence *reg_table;
> > > > > > >  } imx214_modes[] =3D {
> > > > > > >         {
> > > > > > >                 .width =3D 4096,
> > > > > > >                 .height =3D 2304,
> > > > > > > +               .vts_def =3D 3194,
> > > > > > >                 .num_of_regs =3D ARRAY_SIZE(mode_4096x2304),
> > > > > > >                 .reg_table =3D mode_4096x2304,
> > > > > > >         },
> > > > > > >         {
> > > > > > >                 .width =3D 1920,
> > > > > > >                 .height =3D 1080,
> > > > > > > +               .vts_def =3D 3194,
> > > > > > >                 .num_of_regs =3D ARRAY_SIZE(mode_1920x1080),
> > > > > > >                 .reg_table =3D mode_1920x1080,
> > > > > > >         },
> > > > > > > @@ -629,6 +641,37 @@ static int imx214_set_format(struct
> > > > > > > v4l2_subdev *sd,
> > > > > > >         __crop->width =3D mode->width;
> > > > > > >         __crop->height =3D mode->height;
> > > > > > >
> > > > > > > +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > > > > > +               int exposure_max;
> > > > > > > +               int exposure_def;
> > > > > > > +               int hblank;
> > > > > > > +
> > > > > > > +               /* Update limits and set FPS to default */
> > > > > > > +               __v4l2_ctrl_modify_range(imx214->vblank,
> > > > > > > IMX214_VBLANK_MIN,
> > > > > > > +                                        IMX214_VTS_MAX -
> > > > > > > mode-
> > > > > > > > height, 1,
> > > > > > > +                                        mode->vts_def -
> > > > > > > mode-
> > > > > > > > height);
> > > > > > > +               __v4l2_ctrl_s_ctrl(imx214->vblank,
> > > > > > > +                                  mode->vts_def - mode-
> > > > > > > > height);
> > > > > > > +
> > > > > > > +               /* Update max exposure while meeting
> > > > > > > expected
> > > > > > > vblanking */
> > > > > > > +               exposure_max =3D mode->vts_def -
> > > > > > > IMX214_EXPOSURE_OFFSET;
> > > > > > > +               exposure_def =3D (exposure_max <
> > > > > > > IMX214_EXPOSURE_DEFAULT) ?
> > > > > > > +                       exposure_max :
> > > > > > > IMX214_EXPOSURE_DEFAULT;
> > > > > > > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > > > > > > +                                        imx214->exposure-
> > > > > > > > minimum,
> > > > > > > +                                        exposure_max,
> > > > > > > imx214-
> > > > > > > > exposure->step,
> > > > > > > +                                        exposure_def);
> > > > > > > +
> > > > > > > +               /*
> > > > > > > +                * Currently PPL is fixed to
> > > > > > > IMX214_PPL_DEFAULT, so hblank
> > > > > > > +                * depends on mode->width only, and is not
> > > > > > > changeble in any
> > > > > > > +                * way other than changing the mode.
> > > > > > > +                */
> > > > > > > +               hblank =3D IMX214_PPL_DEFAULT - mode->width;
> > > > > > > +               __v4l2_ctrl_modify_range(imx214->hblank,
> > > > > > > hblank, hblank, 1,
> > > > > > > +                                        hblank);
> > > > > > > +       }
> > > > > > > +
> > > > > > >         return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > @@ -678,8 +721,25 @@ static int imx214_set_ctrl(struct
> > > > > > > v4l2_ctrl *ctrl)
> > > > > > >  {
> > > > > > >         struct imx214 *imx214 =3D container_of(ctrl->handler,
> > > > > > >                                              struct imx214,
> > > > > > > ctrls);
> > > > > > > +       const struct v4l2_mbus_framefmt *format;
> > > > > > > +       struct v4l2_subdev_state *state;
> > > > > > >         int ret;
> > > > > > >
> > > > > > > +       state =3D
> > > > > > > v4l2_subdev_get_locked_active_state(&imx214-
> > > > > > > > sd);
> > > > > > > +       format =3D v4l2_subdev_state_get_format(state, 0);
> > > > > > > +
> > > > > > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > > > > > > +               int exposure_max, exposure_def;
> > > > > > > +
> > > > > > > +               /* Update max exposure while meeting
> > > > > > > expected
> > > > > > > vblanking */
> > > > > > > +               exposure_max =3D format->height + ctrl->val -
> > > > > > > IMX214_EXPOSURE_OFFSET;
> > > > > > > +               exposure_def =3D min(exposure_max,
> > > > > > > IMX214_EXPOSURE_DEFAULT);
> > > > > > > +               __v4l2_ctrl_modify_range(imx214->exposure,
> > > > > > > +                                        imx214->exposure-
> > > > > > > > minimum,
> > > > > > > +                                        exposure_max,
> > > > > > > imx214-
> > > > > > > > exposure->step,
> > > > > > > +                                        exposure_def);
> > > > > > > +       }
> > > > > > > +
> > > > > > >         /*
> > > > > > >          * Applying V4L2 control value only happens
> > > > > > >          * when power is up for streaming
> > > > > > > @@ -691,7 +751,10 @@ static int imx214_set_ctrl(struct
> > > > > > > v4l2_ctrl *ctrl)
> > > > > > >         case V4L2_CID_EXPOSURE:
> > > > > > >                 cci_write(imx214->regmap,
> > > > > > > IMX214_REG_EXPOSURE,
> > > > > > > ctrl->val, &ret);
> > > > > > >                 break;
> > > > > > > -
> > > > > > > +       case V4L2_CID_VBLANK:
> > > > > > > +               cci_write(imx214->regmap,
> > > > > > > IMX214_REG_FRM_LENGTH_LINES,
> > > > > > > +                         format->height + ctrl->val,
> > > > > > > &ret);
> > > > >
> > > > > My datasheet says this register is "set up in multiples of 2".
> > > > > (LINE_LENGTH_PCK for HBLANK is "set in multiples of 8")
> > > > >
> > > > > I don't have one of these modules, but is that saying only
> > > > > multiples
> > > > > of 2 are permitted (in which case the step size for the control
> > > > > needs
> > > > > to reflect that), or that setting a value of N is interpreted
> > > > > by
> > > > > the
> > > > > hardware as 2N?
> > > > > Do all the numbers with PIXEL_RATE work out correctly in the
> > > > > frame
> > > > > rate calcs?
> > > >
> > > > Answering my own question, PIXEL_RATE looks dubious.
> > > >
> > > > The original code had LINE_LENGTH_PCK as 5008, and
> > > > FRAME_LENGTH_LINES as 3194. If enum_frame_intervals is to be
> > > > believed, then it delivered 30fps.
> > > > 5008 * 3194 * 30 =3D 479,866,560 Pix/s.
> > > >
> > > > The driver defines IMX214_DEFAULT_LINK_FREQ 480000000, and then
> > > > IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) /
> > > > 10), which works out as 384MPix/s. (Presumably the 8 is 4 lanes
> > > > and DDR, but it's not obvious)
> > > >
> > > > Parsing the PLL registers with the defined 24MHz input. We're in
> > > > single PLL mode, so MIPI frequency is directly linked to pixel
> > > > rate.
> > > > VTCK ends up being 1200MHz, and VTPXCK and OPPXCK both are
> > > > 120MHz.
> > > > Section 5.3 "Frame rate calculation formula" says "Pixel rate
> > > > [pixels/s] =3D VTPXCK [MHz] * 4", so 120 * 4 =3D 480MPix/s, which
> > > > basically agrees with my number above.
> > > >
> > > > 3.1.4. MIPI global timing setting says "Output bitrate =3D OPPXCK *
> > > > reg  0x113[7:0]", so 120MHz * 10, or 1200Mbit/s. That would be a
> > > > link frequency of 600MHz due to DDR.
> > > > That also matches to 480MPix/s * 10bpp / 4 lanes / 2 for DDR
>
> Is it okay, if I use the three sections above for the commit message of
> the fix-link-frequency commit?

Fine by me.

> > > >
> > > > Registers 0x0820-0823 are meant to define the target CSI2
> > > > bitrate, and are set to 0x12c00000, or 314,572,800 decimal. I
> > > > can't get that to square with the above.
> > > >
>
> According the manual, the registers 0x0820-0823 represent an unsigned
> 32-bit real, where the first 16 bit seem to represent the integer part
> and the last 16 bit the fractional part. This means 0x12c00000 is
> 4800.0 Mbit/s, which is equal to 480MPix/s * 10bpp.

My datasheet doesn't appear to have the clarification, just that it is
"Target frequency (32-bit unsigned Real)".
Your numbers work out perfectly though, which is always a good thing.

> > > >
> > > > So my conclusion is that both PIXEL_RATE and LINK_FREQUENCY are
> > > > wrong, however the relationship used to define them looks to be
> > > > correct.
> > > > Correct IMX214_DEFAULT_LINK_FREQ to 600MHz, and all should be
> > > > good.
> > >
> > > Will do that. Should it be done in this commit or in a separat one?
> >
> > A separate one as it is independent of adding VBLANK and HBLANK
> > controls. Ideally it should come before this patch as then hopefully
> > everything actually works correctly when you add them.
> >
> > > > However you almost certainly want to set IMX214_VBLANK_MIN to
> > > > something significantly greater than 4.
> > >
> > > Any recommendation for the new IMX214_VBLANK_MIN value?
> >
> > As my comment below, the datasheet lists 30fps as the max frame rate
> > for full res, therefore IMX214_VBLANK_MIN being correct for that
> > seems reasonable. 890 appears to be the value for that, but I haven't
> > verified that all the numbers do then work out.
> >
> > Out of interest, what platform are you testing this on, and where are
> > you getting the sensor from? I'm always happy to tinker with sensors
> > that I can get working on a Pi, and I think the Arducam DepthAI Oak
> > module should work, but haven't picked one up yet.
>
> The sensor is part of my mobile phone[1], which I use for testing.

Fair enough.

> By the way, do you (or anyone else) happen to have the documentation
> for the Samsung s5k5e2?

No, I rarely see any information on Samsung sensors these days.
I may be totally misremembering, but I seem to recall the ones I did
deal with 10 years ago followed the CCS spec, so it might be worth
dumping registers to see if they do follow.

  Dave

> Andr=C3=A9
>
>
> [1] https://wiki.postmarketos.org/wiki/BQ_Aquaris_M5_(bq-piccolo)
>
> >
> >   Dave
> >
> > > Best regards,
> > > Andr=C3=A9
> > >
> > > >
> > > >   Dave
> > > >
> > > > > Reading the spec sheet that 30fps is the max frame rate at full
> > > > > res
> > > > > (4096x2304), and the driver was setting a value of 3194 to this
> > > > > register, I don't see it being interpreted as 2N. Then again
> > > > > having
> > > > > VBLANK at 890 seems pretty high.
> > > > >
> > > > > > > +               break;
> > > > > > >         default:
> > > > > > >                 ret =3D -EINVAL;
> > > > > > >         }
> > > > > > > @@ -714,8 +777,11 @@ static int imx214_ctrls_init(struct
> > > > > > > imx214
> > > > > > > *imx214)
> > > > > > >                 .width =3D 1120,
> > > > > > >                 .height =3D 1120,
> > > > > > >         };
> > > > > > > +       const struct imx214_mode *mode =3D &imx214_modes[0];
> > > > > > >         struct v4l2_fwnode_device_properties props;
> > > > > > >         struct v4l2_ctrl_handler *ctrl_hdlr;
> > > > > > > +       int exposure_max, exposure_def;
> > > > > > > +       int hblank;
> > > > > > >         int ret;
> > > > > > >
> > > > > > >         ret =3D v4l2_fwnode_device_parse(imx214->dev,
> > > > > > > &props);
> > > > > > > @@ -723,7 +789,7 @@ static int imx214_ctrls_init(struct
> > > > > > > imx214
> > > > > > > *imx214)
> > > > > > >                 return ret;
> > > > > > >
> > > > > > >         ctrl_hdlr =3D &imx214->ctrls;
> > > > > > > -       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 6);
> > > > > > > +       ret =3D v4l2_ctrl_handler_init(&imx214->ctrls, 8);
> > > > > > >         if (ret)
> > > > > > >                 return ret;
> > > > > > >
> > > > > > > @@ -739,22 +805,26 @@ static int imx214_ctrls_init(struct
> > > > > > > imx214 *imx214)
> > > > > > >         if (imx214->link_freq)
> > > > > > >                 imx214->link_freq->flags |=3D
> > > > > > > V4L2_CTRL_FLAG_READ_ONLY;
> > > > > > >
> > > > > > > -       /*
> > > > > > > -        * WARNING!
> > > > > > > -        * Values obtained reverse engineering blobs and/or
> > > > > > > devices.
> > > > > > > -        * Ranges and functionality might be wrong.
> > > > > > > -        *
> > > > > > > -        * Sony, please release some register set
> > > > > > > documentation
> > > > > > > for the
> > > > > > > -        * device.
> > > > > > > -        *
> > > > > > > -        * Yours sincerely, Ricardo.
> > > > > > > -        */
> > > > > >
> > > > > > I would like to keep this comment until there is a public
> > > > > > document available.
> > > > >
> > > > > I suspect you'll be waiting forever for a document to be
> > > > > officially
> > > > > released.
> > > > >
> > > > > I have a datasheet for IMX214, and I believe Kieran and Jacopo
> > > > > do
> > > > > too.
> > > > > Which specific values do you wish to be verified?
> > > > >
> > > > > >
> > > > > > > +       /* Initial vblank/hblank/exposure parameters based
> > > > > > > on
> > > > > > > current mode */
> > > > > > > +       imx214->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > > > > > > &imx214_ctrl_ops,
> > > > > > > +                                          V4L2_CID_VBLANK,
> > > > > > > IMX214_VBLANK_MIN,
> > > > >
> > > > > IMX214_VBLANK_MIN being 4 feels plausible, but pretty low.
> > > > > I read the datasheet to say there are 4 embedded data lines per
> > > > > image.
> > > > > Seeing as you have STATS data output enabled as well that makes
> > > > > 5
> > > > > lines of non-image data per frame, but you're only adding
> > > > > blanking
> > > > > time for 4 lines.
> > > > >
> > > > > As noted above, I think you've also increased the max frame
> > > > > rate
> > > > > significantly above that quoted by Sony. Has that been actually
> > > > > exercised and confirmed to function correctly?
> > > > >
> > > > >   Dave
> > > > >
> > > > > > > +                                          IMX214_VTS_MAX -
> > > > > > > mode->height, 1,
> > > > > > > +                                          mode->vts_def -
> > > > > > > mode->height);
> > > > > > > +
> > > > > > > +       hblank =3D IMX214_PPL_DEFAULT - mode->width;
> > > > > > > +       imx214->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > > > > > > &imx214_ctrl_ops,
> > > > > > > +                                          V4L2_CID_HBLANK,
> > > > > > > hblank, hblank,
> > > > > > > +                                          1, hblank);
> > > > > > > +       if (imx214->hblank)
> > > > > > > +               imx214->hblank->flags |=3D
> > > > > > > V4L2_CTRL_FLAG_READ_ONLY;
> > > > > > > +
> > > > > > > +       exposure_max =3D mode->vts_def -
> > > > > > > IMX214_EXPOSURE_OFFSET;
> > > > > > > +       exposure_def =3D min(exposure_max,
> > > > > > > IMX214_EXPOSURE_DEFAULT);
> > > > > > >         imx214->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr,
> > > > > > > &imx214_ctrl_ops,
> > > > > > >
> > > > > > > V4L2_CID_EXPOSURE,
> > > > > > > -
> > > > > > > IMX214_EXPOSURE_MIN,
> > > > > > > -
> > > > > > > IMX214_EXPOSURE_MAX,
> > > > > > > +
> > > > > > > IMX214_EXPOSURE_MIN, exposure_max,
> > > > > > >
> > > > > > > IMX214_EXPOSURE_STEP,
> > > > > > > -
> > > > > > > IMX214_EXPOSURE_DEFAULT);
> > > > > > > +                                            exposure_def);
> > > > > > >
> > > > > > >         imx214->unit_size =3D
> > > > > > > v4l2_ctrl_new_std_compound(ctrl_hdlr,
> > > > > > >                                 NULL,
> > > > > > >
> > > > > > > --
> > > > > > > 2.46.0
> > > > > > >
> > > > > > >
> > > > > >
> > >
>

