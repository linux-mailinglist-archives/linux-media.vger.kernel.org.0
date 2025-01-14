Return-Path: <linux-media+bounces-24716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7394DA1066C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 13:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64DF43A8782
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 12:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E693F22DC3A;
	Tue, 14 Jan 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="K/5s9l/t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49045236ED3
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736856980; cv=none; b=P9IY/g3MINoPHv9TqJ+VksyB9I14yuFb84COm4d/vrnWfkzc/JgN2+qYW0iJpdh+sf/GjLddgNC3Z2RZLE7pTArtX+XLKG6wgDHNXBiDF4ONlaexhb6rO0Y1OzEepeHXAjI/BlDZo80YnQjpUQ1ffUPx8fXsLGCBDGT1pIonkXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736856980; c=relaxed/simple;
	bh=GOj1U/0U6EzkmyNlT1beZvihyQCIR+x5qr/R+pVK8Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irq8+EB7WRgWP4u8S6mxzULdwTNuCd/lD3pjtOAkZAWxpBzYbD8dqQ+NtC4tEg7yNnL7PS17vVzq4Yp4biiBpB1hpWclgGwMSdc7Vu90lLyPVwEnPmNiewl5cFuGcI+DlRN/LW66/27mnAVg2OfgnXG+MGCZr+FgXcbgN1UfC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=K/5s9l/t; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e460717039fso7511543276.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 04:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736856976; x=1737461776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1E7PqafsbJ6nYeJeQAd7NjdDoCFfNOE3TSU6aFY0xo=;
        b=K/5s9l/t7UJGoThYwZX1DDko/rxqTixK5Dc1H/xUpogCh2yiTRQXvhYGIjHOawXkrp
         f+EznCEaXDAh4cAsUzHE6NX53AI+X/syqEzqb/ptyFuoUvJ0j6BP1XzmvaJ92tJN2YGl
         mbqM9WhRaVdkKjfbChvlAhTYLjkpq1D5DJDDBgGj3SXIPvRPrbUotWi1B6ujpd45Rl37
         4s42ETyrjTtAhSoIK89LfdV1ZwrXd8u3jHiYMXZXfoNLxRyR9H09fm2j/Wy+yiYCiONE
         8V/sR2Cu9h7mU3bBYvC6P4cJ7rh5su7NcVMmVLZxfizd9FgivYSJzi1wjQcaQRSFyv0o
         +n1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736856976; x=1737461776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1E7PqafsbJ6nYeJeQAd7NjdDoCFfNOE3TSU6aFY0xo=;
        b=sqrKZR5uupwr0d4gN3WZbfdQECiE/SgXcZwY8poN8gPz/HSY1HfBAdEcJk0y+uUXY6
         pEe+iJwN3TPkWDp2s7CU4KChP6LUoRG4Vl21EG2f5Xv252YDT7suqEZzK8WFoGQfxmbu
         sA1dxGUs3sS9y330R0wqkP+iWgpauzHzYQEwX07IdATvXNelK8pF7ugSF+EpozAGT8xX
         ljLzOkfiMC9SyQr0I5LgB3mOc9T1BSMMuv+/J3zuQNaojTU1Q1dVUfDvhbGQ1IcXX41M
         rqJ1QYNtHoBCZWmKLpslt6Ulj+/ktJm22rIB/KlCGRd0MSzGI2CR4gEUazYXRnZe2bkI
         1TNA==
X-Forwarded-Encrypted: i=1; AJvYcCXMQ+YjzwZXMo2MT0D1VbCFaBfDrKiefu85UEJHeCa1Wa8qXpKf4wnn2TUF4fUdrkS08+dxkjsFk274LA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6jYTsRDbKArLXa04tJ2ccCZCp2aYsbAwRBwQCSy8kjEJf20Xm
	X0QBh5ZEE9lK0ePluA90fF7DIYya6Ocs4pjcFD/DGWphSFU0KL4XJnkclMXk29vwOh4zRwcmpvK
	bw9bC0nX/wY+yNTQMi6I1vwp9EcI096X2yuAfTQ==
X-Gm-Gg: ASbGncsuC+KMgnKygbK9WftiiA/wwgGFstNTI3tlOLYBRAqf5qjOxbXtJ3fu/nDcoj/
	RzHCCSH7MBiuVLDU57HzzkMlD1dfPbdaGeNWGMA==
X-Google-Smtp-Source: AGHT+IHfTd0MJ+g1NLCSc+JlFT3EQP8Sy3EIDRDMZ5l+0g05Js1fU74DTbYE1sTzMFbBHSqwkI6W2Uvy9l8M5KRMfgE=
X-Received: by 2002:a05:690c:6a81:b0:6ef:81c0:5b56 with SMTP id
 00721157ae682-6f53122492amr203253557b3.14.1736856976246; Tue, 14 Jan 2025
 04:16:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
 <20250109-media-imx415-v1-3-366ba6a234ab@raspberrypi.com> <AS4PR08MB773533B9D04BE15F51548FEBF7182@AS4PR08MB7735.eurprd08.prod.outlook.com>
In-Reply-To: <AS4PR08MB773533B9D04BE15F51548FEBF7182@AS4PR08MB7735.eurprd08.prod.outlook.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jan 2025 12:15:58 +0000
X-Gm-Features: AbW1kvYBbn5HrYnea0kt7Ir5QogylBe_rZTbF1A4g7S6UeE5COjvr1okh1zFjwo
Message-ID: <CAPY8ntDxCZnoaVY3-TsbsFgsj=WAwLa74vGQrf7xU2M2YgrVzg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx415: Link frequencies are not
 exclusive to num lanes
To: Gerald Loacker <Gerald.Loacker@wolfvision.net>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Michael Riesch <Michael.Riesch@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gerald

On Tue, 14 Jan 2025 at 11:02, Gerald Loacker
<Gerald.Loacker@wolfvision.net> wrote:
>
> Hi Dave,
>
> Thanks for the insight into the imx415 architecture and for implementing
> this correctly.

Please note that the insight is from external inspection rather than
having any specific knowledge of the insides of the sensor.
Having worked with imx290 before, all the Starvis sensors seem to
follow the same pattern. I don't know about the Starvis2 sensors
though.

> I've tested the 4-lane 891 Mbit/s mode (supported_modes[2]), and with the
> modification described below, it worked fine for me.

Thanks for testing!

> > -----Urspr=C3=BCngliche Nachricht-----
> > Von: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Gesendet: Donnerstag, 9. Januar 2025 12:17
> > An: Sakari Ailus <sakari.ailus@linux.intel.com>; Michael Riesch
> > <Michael.Riesch@wolfvision.net>; Mauro Carvalho Chehab
> > <mchehab@kernel.org>
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Dave Ste=
venson
> > <dave.stevenson@raspberrypi.com>
> > Betreff: [PATCH 3/3] media: i2c: imx415: Link frequencies are not exclu=
sive to num
> > lanes
> >
> > The link frequencies are equally valid in 2 or 4 lane modes, but
> > they change the hmax_min value for the mode as the MIPI block
> > has to have sufficient time to send the pixel data for each line.
> >
> > Remove the association with number of lanes, and add hmax_min
> > configuration for both lane options.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx415.c | 53 ++++++++++++++++++++++----------------=
-------
> > -
> >  1 file changed, 25 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> > index e23b41027987..1071900416d2 100644
> > --- a/drivers/media/i2c/imx415.c
> > +++ b/drivers/media/i2c/imx415.c
> > @@ -452,9 +452,8 @@ static const struct imx415_clk_params
> > imx415_clk_params[] =3D {
> >       },
> >  };
> >
> > -/* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
> > -static const struct cci_reg_sequence imx415_mode_2_720[] =3D {
> > -     { IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > +/* 720 Mbps CSI configuration */
> > +static const struct cci_reg_sequence imx415_linkrate_720mbps[] =3D {
> >       { IMX415_TCLKPOST, 0x006F },
> >       { IMX415_TCLKPREPARE, 0x002F },
> >       { IMX415_TCLKTRAIL, 0x002F },
> > @@ -466,9 +465,8 @@ static const struct cci_reg_sequence
> > imx415_mode_2_720[] =3D {
> >       { IMX415_TLPX, 0x0027 },
> >  };
> >
> > -/* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
> > -static const struct cci_reg_sequence imx415_mode_2_1440[] =3D {
> > -     { IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > +/* 1440 Mbps CSI configuration */
> > +static const struct cci_reg_sequence imx415_linkrate_1440mbps[] =3D {
> >       { IMX415_TCLKPOST, 0x009F },
> >       { IMX415_TCLKPREPARE, 0x0057 },
> >       { IMX415_TCLKTRAIL, 0x0057 },
> > @@ -480,9 +478,8 @@ static const struct cci_reg_sequence
> > imx415_mode_2_1440[] =3D {
> >       { IMX415_TLPX, 0x004F },
> >  };
> >
> > -/* all-pixel 4-lane 891 Mbps 30 Hz mode */
> > -static const struct cci_reg_sequence imx415_mode_4_891[] =3D {
> > -     { IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +/* 891 Mbps CSI configuration */
> > +static const struct cci_reg_sequence imx415_linkrate_891mbps[] =3D {
> >       { IMX415_TCLKPOST, 0x007F },
> >       { IMX415_TCLKPREPARE, 0x0037 },
> >       { IMX415_TCLKTRAIL, 0x0037 },
> > @@ -501,8 +498,7 @@ struct imx415_mode_reg_list {
> >
> >  struct imx415_mode {
> >       u64 lane_rate;
> > -     u32 lanes;
> > -     u32 hmax_min;
> > +     u32 hmax_min[2];
> >       struct imx415_mode_reg_list reg_list;
> >  };
> >
> > @@ -510,29 +506,26 @@ struct imx415_mode {
> >  static const struct imx415_mode supported_modes[] =3D {
> >       {
> >               .lane_rate =3D 720000000,
> > -             .lanes =3D 2,
> > -             .hmax_min =3D 2032,
> > +             .hmax_min =3D { 2032, 1066 },
>
> 1016?

I'd taken the number from the datasheet. (My copy was found off a
websearch at https://www.alldatasheet.com/datasheet-pdf/download/1643695/SO=
NY/IMX415.html)

All-pixel mode List of Setting Register.
Page 54, 2 lanes, 720Mbit/s for 15.74fps lists HMAX as 7F0h =3D 2032
Page 55, 4 lanes, 720Mbit/s for 30.01fps lists HMAX as 42Ah =3D 1066

1016 may work, but with LP<>HS transitions on D-PHY often being time
related rather than bitrate, it doesn't always follow.
My preference is to follow the datasheet here as the extra FPS is
unlikely to be useful - most users will want 30fps.

> >               .reg_list =3D {
> > -                     .num_of_regs =3D ARRAY_SIZE(imx415_mode_2_720),
> > -                     .regs =3D imx415_mode_2_720,
> > +                     .num_of_regs =3D ARRAY_SIZE(imx415_linkrate_720mb=
ps),
> > +                     .regs =3D imx415_linkrate_720mbps,
> >               },
> >       },
> >       {
> >               .lane_rate =3D 1440000000,
> > -             .lanes =3D 2,
> > -             .hmax_min =3D 1066,
> > +             .hmax_min =3D { 1066, 533 },
> >               .reg_list =3D {
> > -                     .num_of_regs =3D ARRAY_SIZE(imx415_mode_2_1440),
> > -                     .regs =3D imx415_mode_2_1440,
> > +                     .num_of_regs =3D ARRAY_SIZE(imx415_linkrate_1440m=
bps),
> > +                     .regs =3D imx415_linkrate_1440mbps,
> >               },
> >       },
> >       {
> >               .lane_rate =3D 891000000,
> > -             .lanes =3D 4,
> > -             .hmax_min =3D 1100,
> > +             .hmax_min =3D { 1100, 550 },
>
> These values result in a frame rate of 60 Hz, but the MIPI interface can =
only
> transfer 30 fps at 891Mbit/s. Shouldn't it be { 2200, 1100 }?

I've obviously grabbed the wrong column from the datasheet.
As you say:
2 lanes, 891Mbit/s is HMAX of 898h =3D 2200
4 lanes, 891Mbit/s is HMAX of 44Ch =3D 1100.

The module I had been testing with had a 24MHz clock. I've just been
told that one of the modules I have has a 37.125MHz clock source, so I
should be able to verify this mode.
Hopefully I can get a V2 out in the next couple of days.

Cheers,
  Dave

> Regards,
> Gerald
>
> >               .reg_list =3D {
> > -                     .num_of_regs =3D ARRAY_SIZE(imx415_mode_4_891),
> > -                     .regs =3D imx415_mode_4_891,
> > +                     .num_of_regs =3D ARRAY_SIZE(imx415_linkrate_891mb=
ps),
> > +                     .regs =3D imx415_linkrate_891mbps,
> >               },
> >       },
> >  };
> > @@ -782,7 +775,8 @@ static int imx415_ctrls_init(struct imx415 *sensor)
> >  {
> >       struct v4l2_fwnode_device_properties props;
> >       struct v4l2_ctrl *ctrl;
> > -     u64 lane_rate =3D supported_modes[sensor->cur_mode].lane_rate;
> > +     const struct imx415_mode *cur_mode =3D &supported_modes[sensor-
> > >cur_mode];
> > +     u64 lane_rate =3D cur_mode->lane_rate;
> >       u32 exposure_max =3D IMX415_PIXEL_ARRAY_HEIGHT +
> >                          IMX415_PIXEL_ARRAY_VBLANK -
> >                          IMX415_EXPOSURE_OFFSET;
> > @@ -823,7 +817,7 @@ static int imx415_ctrls_init(struct imx415 *sensor)
> >                         IMX415_AGAIN_MAX, IMX415_AGAIN_STEP,
> >                         IMX415_AGAIN_MIN);
> >
> > -     hblank_min =3D (supported_modes[sensor->cur_mode].hmax_min *
> > +     hblank_min =3D (cur_mode->hmax_min[sensor->num_data_lanes =3D=3D =
2 ? 0 :
> > 1] *
> >                     IMX415_HMAX_MULTIPLIER) - IMX415_PIXEL_ARRAY_WIDTH;
> >       hblank_max =3D (IMX415_HMAX_MAX * IMX415_HMAX_MULTIPLIER) -
> >                    IMX415_PIXEL_ARRAY_WIDTH;
> > @@ -885,7 +879,12 @@ static int imx415_set_mode(struct imx415 *sensor, =
int
> > mode)
> >                           IMX415_NUM_CLK_PARAM_REGS,
> >                           &ret);
> >
> > -     return 0;
> > +     ret =3D cci_write(sensor->regmap, IMX415_LANEMODE,
> > +                     sensor->num_data_lanes =3D=3D 2 ? IMX415_LANEMODE=
_2 :
> > +                                                   IMX415_LANEMODE_4,
> > +                     NULL);
> > +
> > +     return ret;
> >  }
> >
> >  static int imx415_setup(struct imx415 *sensor, struct v4l2_subdev_stat=
e *state)
> > @@ -1296,8 +1295,6 @@ static int imx415_parse_hw_config(struct imx415
> > *sensor)
> >               }
> >
> >               for (j =3D 0; j < ARRAY_SIZE(supported_modes); ++j) {
> > -                     if (sensor->num_data_lanes !=3D supported_modes[j=
].lanes)
> > -                             continue;
> >                       if (bus_cfg.link_frequencies[i] * 2 !=3D
> >                           supported_modes[j].lane_rate)
> >                               continue;
> >
> > --
> > 2.34.1
> >
>

