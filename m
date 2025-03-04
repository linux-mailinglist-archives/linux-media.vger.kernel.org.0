Return-Path: <linux-media+bounces-27516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96DA4EA1A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E520188D115
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EB828D075;
	Tue,  4 Mar 2025 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="E6EzY9Pq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFEF28D062
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 17:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109434; cv=none; b=onaFhRmFtWYpgfzuCOcqp2EppBB9MWCWbr4ALmR6/mo1gZGXmldVTrOKMIxdIucyjnzsPiNE4KyxNRUWRgNTqZgL7MEylcNEAyWP+aLBYqBu72CgUMFqh6xBsUxI/LPYwyL9hUVbOeFvOiGV1ybRSCNlYyfk40MkeWp9blxYXLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109434; c=relaxed/simple;
	bh=/MimLgzOkeZVQ0qnudo2iBOLXLjkGfLE3C7RC7PzUhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUCE3+1ttmSSI6MplJaVx4U3uRw0bCyDAs9lnoFAkCbUNa0GNuVI1Waq+iimMo2DSZoRxMjcwRqBWxyzjGkE9p/BnA52md2jTEg/lkEnK3YK+Zuu5Us3Iu0IE7SVB+NWO1L2oY/7vqXYwUC+lsLRmDwr4bPYX2IdZIdpHoK8XJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=E6EzY9Pq; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fda22908d9so1291097b3.1
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 09:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1741109431; x=1741714231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDr1JU4rjrmAd29gHjYuJqa52Tp7Yy7VB8V6UtGIjM4=;
        b=E6EzY9PqzOE/Gq4vruBivEH2EpizWRgLU3bPoMR5qCAAlZNyqEHJ/WC3iQvwjv+hU+
         rxsNh1dWbAZoXr3GYzwpMH+wVYdigaOp1ZlQ1yRGXZEZLI87OvWV7paekkvQx/BhMTPL
         ApNmP2j7LLWrrZ0V6AmPYZqLSB7pJI+HrJmQzw9fepgm8azmemgqW02NkiZOe3hpRRCT
         rqh4OqQnTaAqLlRO9tPDzyl8MolCXnuO/nmB2P6qmkp3qfHFkHbM22vbpEIQmmGrDSWI
         fgQeea8Be7GCoTlMfF80I9HYvY+Pd/xX+qEMabJR9jbnwbnSdfaXKo+NlJDH6fi2bA73
         f4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109431; x=1741714231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDr1JU4rjrmAd29gHjYuJqa52Tp7Yy7VB8V6UtGIjM4=;
        b=o1F0yYNutXPTnI7juVdkama65o1Srk7syfQ82sCaVzVS+sllOBr+DbhtMF7hT54qZj
         be8cgLVnWin1TieDZs1zbf20L6UdhKTisCebFJ7Zb2Qf5JPlAScxJiYK3xAl3Te8Hjj7
         1gH76GmcN2S+kdbygSDpGuiPFvPNdgL98m4KONfmBsIyC2O1AQdZElTINk635s0oUiib
         cDwduokll5+oIH7xcnbPptYogWN5zwn1eROMVjSXIeuXFTFTbDnF9fcm67Sy6Y8dWKjB
         gRj6WEqK4DI4oPEZyng4c2XxjWOE+Z+2LocqjM5xnbpB1piEfnJbquCECBkrRrrj++Fr
         eqRw==
X-Forwarded-Encrypted: i=1; AJvYcCWid/7EyMCiNIk06kXTDb+Qg+UmLt16kU1iHaS/drmzHDI1Y40AOSyj2QO3W8cYIJ3kbvgOsi/s/Mjvig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Oi7hlfVvduPaA+n4QETPLOEI90Qh5NjdYPObhg6Rbzu1+SIN
	J69H1+TInk6fmcMBu9iSwzbglkd4PLD9wnlBDL9lBE3FPjtCZ6jrfsZ6qrqh3DRxircGGIcpKpg
	OxgeSbpzRtsUKskEXakHMvCy0HzQwT9SLRUrsKg==
X-Gm-Gg: ASbGncuu+r9PjvLN0EMACfVsn9FY+LuTl+0jwzK52EcyAH46+GIhYGHSdc5D8yFNC/b
	ZeaFIJLCMN7o0od0tUpG9a2fEO9Wmwm9ZADVxtaplV90rjP9Dds3AtNWep8vLFpkV++zeJnzWFd
	bgAT8nRspe1fAFAaT4dij03HttP1FUJUECCgtYLcdgjGzC8Q9tDeIX6FSrlw==
X-Google-Smtp-Source: AGHT+IHoe8Pf800ippst3atd5UkKCeNJyQvx6Zqdxo7eA7WeSUeOn3+UZl/mrwDPrHD8eE4M5V0v5LKstwtThEyEVtY=
X-Received: by 2002:a05:690c:8901:b0:6fb:9280:5bf4 with SMTP id
 00721157ae682-6fda303b75amr1321447b3.30.1741109430959; Tue, 04 Mar 2025
 09:30:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
 <20250303-ov9282-flash-strobe-v1-3-0fd57a1564ba@linux.dev> <CAPY8ntBBiuQtKErZ1+zDD5HBwjPRdBryduuB3XnhCZAdPC88GA@mail.gmail.com>
In-Reply-To: <CAPY8ntBBiuQtKErZ1+zDD5HBwjPRdBryduuB3XnhCZAdPC88GA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 4 Mar 2025 17:30:13 +0000
X-Gm-Features: AQ5f1Jr74Y28pnuf1UaDkJM9dIxyy3_cuYzTsQUh1Sng-6qjEkbmj_o66sqnxHA
Message-ID: <CAPY8ntCiaTMdM_FRo3k9mYrzVnAuJYXrZU70Hf5=fLxButCOmg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov9282: add strobe_timeout v4l2 control
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Mar 2025 at 10:28, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Richard
>
> On Mon, 3 Mar 2025 at 22:59, Richard Leitner <richard.leitner@linux.dev> =
wrote:
> >
> > Add V4L2_CID_FLASH_TIMEOUT support using the "strobe_frame_span"
> > feature of the sensor. This is implemented by transforming the given =
=C2=B5s
> > value by an interpolated formula to a "span step width" value and
> > writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
> > PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).
> >
> > The maximum control value is set to the period of the current framerate=
.
> > This must be changed to a dynamic range as soon as this driver
> > implements the set_frame_interval() pad operation.

Rereading the patch as I'm looking at the whole series.

set_frame_interval() will never be implemented as it is the wrong API
for raw sensors.
See https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/came=
ra-sensor.html#raw-camera-sensors
This driver already implements PIXEL_RATE, HBLANK, and VBLANK for
frame interval configuration.

> >
> > All register values are based on the OV9281 datasheet v1.53 (jan 2019)
> > and tested using an ov9281 VisionComponents module.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index c98ba466e9aea29baff0b13578d760bf69c958c5..f7dfe8987e524b73af7e16e=
12567e96627b4f89a 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -97,6 +97,10 @@
> >  #define OV9282_REG_MIPI_CTRL00 0x4800
> >  #define OV9282_GATED_CLOCK     BIT(5)
> >
> > +/* Flash/Strobe control registers */
> > +#define OV9282_REG_FLASH_DURATION      0x3925
> > +#define OV9282_FLASH_DURATION_DEFAULT  0x0000001A
> > +
> >  /* Input clock rate */
> >  #define OV9282_INCLK_RATE      24000000
> >
> > @@ -193,6 +197,7 @@ struct ov9282_mode {
> >   * @again_ctrl: Pointer to analog gain control
> >   * @pixel_rate: Pointer to pixel rate control
> >   * @flash_led_mode: Pointer to flash led mode control
> > + * @flash_timeout: Pointer to flash timeout control
> >   * @vblank: Vertical blanking in lines
> >   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
> >   * @cur_mode: Pointer to current selected sensor mode
> > @@ -216,6 +221,7 @@ struct ov9282 {
> >         };
> >         struct v4l2_ctrl *pixel_rate;
> >         struct v4l2_ctrl *flash_led_mode;
> > +       struct v4l2_ctrl *flash_timeout;
>
> You only access this in ov9282_set_ctrl where you already have the
> struct v4l2_ctrl, so there is no need to store this in the main device
> state.
>
>   Dave
>
> >         u32 vblank;
> >         bool noncontinuous_clock;
> >         const struct ov9282_mode *cur_mode;
> > @@ -689,6 +695,24 @@ static int ov9282_set_ctrl_flash_led_mode(struct o=
v9282 *ov9282, int mode)
> >                                 current_val);
> >  }
> >
> > +static int ov9282_set_ctrl_flash_timeout(struct ov9282 *ov9282, int va=
lue)
> > +{
> > +       /* Calculate "strobe_frame_span" increments from a given value =
(=C2=B5s).
> > +        * This is quite tricky as "The step width of shift and span is
> > +        * programmable under system clock domain.", but it's not docum=
ented
> > +        * how to program this step width (at least in the datasheet av=
ailable
> > +        * to the author at time of writing).
> > +        * The formula below is interpolated from different modes/frame=
rates
> > +        * and should work quite well for most settings.
> > +        */
> > +       u32 val =3D value * 192 / (ov9282->cur_mode->width + ov9282->hb=
lank_ctrl->val);
> > +
> > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> =
24) & 0xff);
> > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val=
 >> 16) & 0xff);
> > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 2, 1, (val=
 >> 8) & 0xff);
> > +       return ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 3, =
1, val & 0xff);
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -758,6 +782,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >         case V4L2_CID_FLASH_LED_MODE:
> >                 ret =3D ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->va=
l);
> >                 break;
> > +       case V4L2_CID_FLASH_TIMEOUT:
> > +               ret =3D ov9282_set_ctrl_flash_timeout(ov9282, ctrl->val=
);
> > +               break;
> >         default:
> >                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >                 ret =3D -EINVAL;
> > @@ -1420,6 +1447,10 @@ static int ov9282_init_controls(struct ov9282 *o=
v9282)
> >                                                         (1 << V4L2_FLAS=
H_LED_MODE_TORCH),
> >                                                         V4L2_FLASH_LED_=
MODE_NONE);
> >
> > +       ov9282->flash_timeout =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_=
ctrl_ops,
> > +                                                 V4L2_CID_FLASH_TIMEOU=
T,
> > +                                                 0, 13900, 1, 8);
> > +
> >         ret =3D v4l2_fwnode_device_parse(ov9282->dev, &props);
> >         if (!ret) {
> >                 /* Failure sets ctrl_hdlr->error, which we check afterw=
ards anyway */
> >
> > --
> > 2.47.2
> >
> >

