Return-Path: <linux-media+bounces-27552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791EA4F734
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BA3188D70C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682221DE8A3;
	Wed,  5 Mar 2025 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q929eVfK"
X-Original-To: linux-media@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF91DE8A5
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156631; cv=none; b=jUd5lB1SosKNSlNo3YxVq1wWMZ6Bec25kT/xG9TYf7ESqJ/Q3GzMc/7FC4VkwW0zY94OwEfuS7ng+ztZtYhjh4aKBjITN+sTm/+HVBFlRMYheEamBY1PP1DwDse0t1EJd/tEqOJbnAxgNL/jpldmCvcngbsjeX0PbX0/YWZMeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156631; c=relaxed/simple;
	bh=MQ1pDAsTrlBIav0BzasItVZpwgRo6TiIAF5eYti3qoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaedvKdFn3BCmlHDyIjbai49df42vs1Sfp3wn6oux/CWEfHzRt7RQs0OKLuerxcxjcjUggwzW+GyRVc7FacwNGyk2hzpmu7RciS8l5aCtoGggMAYMoBZ1QAhwojN5ULWYqHYADvMBQTTARXlw1CcLfQpZZnGOkTR4rttg/C/r+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q929eVfK; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 5 Mar 2025 07:36:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741156618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Twd6E1UAZBW/twPC+wFFwXwoo7sgq3iDutu+tgt2akA=;
	b=q929eVfKDjfouYEoFUCZveBhmmGsXHnh1PqKb1kbZo2Dza+Zc7KWxiITnp5eGnzw8upk6R
	IGdxzF+jmSHGynmyBwoIDqmNznytx3QX+fiOiagaVrd6bvIkl3vdTpe/uYtgjUNCiYDaOz
	v2nW54CkMO/cTyqj2mHlLH9BUtlDDmQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov9282: add strobe_timeout v4l2 control
Message-ID: <k2r3ro5dx6nneawdt7afonah46yyhztrfcy3i74ftbvfqknegb@efoixtkzkin6>
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
 <20250303-ov9282-flash-strobe-v1-3-0fd57a1564ba@linux.dev>
 <CAPY8ntBBiuQtKErZ1+zDD5HBwjPRdBryduuB3XnhCZAdPC88GA@mail.gmail.com>
 <CAPY8ntCiaTMdM_FRo3k9mYrzVnAuJYXrZU70Hf5=fLxButCOmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntCiaTMdM_FRo3k9mYrzVnAuJYXrZU70Hf5=fLxButCOmg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Dave,

On Tue, Mar 04, 2025 at 05:30:13PM +0000, Dave Stevenson wrote:
> On Tue, 4 Mar 2025 at 10:28, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Richard
> >
> > On Mon, 3 Mar 2025 at 22:59, Richard Leitner <richard.leitner@linux.dev> wrote:
> > >
> > > Add V4L2_CID_FLASH_TIMEOUT support using the "strobe_frame_span"
> > > feature of the sensor. This is implemented by transforming the given µs
> > > value by an interpolated formula to a "span step width" value and
> > > writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
> > > PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).
> > >
> > > The maximum control value is set to the period of the current framerate.
> > > This must be changed to a dynamic range as soon as this driver
> > > implements the set_frame_interval() pad operation.
> 
> Rereading the patch as I'm looking at the whole series.
> 
> set_frame_interval() will never be implemented as it is the wrong API
> for raw sensors.
> See https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#raw-camera-sensors
> This driver already implements PIXEL_RATE, HBLANK, and VBLANK for
> frame interval configuration.

Thanks Dave for bringing this up and sorry for not having known that
before posting this series. It's my first work on camera sensors/v4l2
and altough I have read a ton of docs I somehow missed this one.

So regarding this patch: Should the maximum flash duration be calculated
from the frame interval (as described in the docs)?
Or is a "pretty high" constant maximum value preferred?

regards;rl

> 
> > >
> > > All register values are based on the OV9281 datasheet v1.53 (jan 2019)
> > > and tested using an ov9281 VisionComponents module.
> > >
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  drivers/media/i2c/ov9282.c | 31 +++++++++++++++++++++++++++++++
> > >  1 file changed, 31 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index c98ba466e9aea29baff0b13578d760bf69c958c5..f7dfe8987e524b73af7e16e12567e96627b4f89a 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -97,6 +97,10 @@
> > >  #define OV9282_REG_MIPI_CTRL00 0x4800
> > >  #define OV9282_GATED_CLOCK     BIT(5)
> > >
> > > +/* Flash/Strobe control registers */
> > > +#define OV9282_REG_FLASH_DURATION      0x3925
> > > +#define OV9282_FLASH_DURATION_DEFAULT  0x0000001A
> > > +
> > >  /* Input clock rate */
> > >  #define OV9282_INCLK_RATE      24000000
> > >
> > > @@ -193,6 +197,7 @@ struct ov9282_mode {
> > >   * @again_ctrl: Pointer to analog gain control
> > >   * @pixel_rate: Pointer to pixel rate control
> > >   * @flash_led_mode: Pointer to flash led mode control
> > > + * @flash_timeout: Pointer to flash timeout control
> > >   * @vblank: Vertical blanking in lines
> > >   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
> > >   * @cur_mode: Pointer to current selected sensor mode
> > > @@ -216,6 +221,7 @@ struct ov9282 {
> > >         };
> > >         struct v4l2_ctrl *pixel_rate;
> > >         struct v4l2_ctrl *flash_led_mode;
> > > +       struct v4l2_ctrl *flash_timeout;
> >
> > You only access this in ov9282_set_ctrl where you already have the
> > struct v4l2_ctrl, so there is no need to store this in the main device
> > state.
> >
> >   Dave
> >
> > >         u32 vblank;
> > >         bool noncontinuous_clock;
> > >         const struct ov9282_mode *cur_mode;
> > > @@ -689,6 +695,24 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> > >                                 current_val);
> > >  }
> > >
> > > +static int ov9282_set_ctrl_flash_timeout(struct ov9282 *ov9282, int value)
> > > +{
> > > +       /* Calculate "strobe_frame_span" increments from a given value (µs).
> > > +        * This is quite tricky as "The step width of shift and span is
> > > +        * programmable under system clock domain.", but it's not documented
> > > +        * how to program this step width (at least in the datasheet available
> > > +        * to the author at time of writing).
> > > +        * The formula below is interpolated from different modes/framerates
> > > +        * and should work quite well for most settings.
> > > +        */
> > > +       u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> > > +
> > > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
> > > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
> > > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 2, 1, (val >> 8) & 0xff);
> > > +       return ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 3, 1, val & 0xff);
> > > +}
> > > +
> > >  /**
> > >   * ov9282_set_ctrl() - Set subdevice control
> > >   * @ctrl: pointer to v4l2_ctrl structure
> > > @@ -758,6 +782,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> > >         case V4L2_CID_FLASH_LED_MODE:
> > >                 ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
> > >                 break;
> > > +       case V4L2_CID_FLASH_TIMEOUT:
> > > +               ret = ov9282_set_ctrl_flash_timeout(ov9282, ctrl->val);
> > > +               break;
> > >         default:
> > >                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> > >                 ret = -EINVAL;
> > > @@ -1420,6 +1447,10 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > >                                                         (1 << V4L2_FLASH_LED_MODE_TORCH),
> > >                                                         V4L2_FLASH_LED_MODE_NONE);
> > >
> > > +       ov9282->flash_timeout = v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> > > +                                                 V4L2_CID_FLASH_TIMEOUT,
> > > +                                                 0, 13900, 1, 8);
> > > +
> > >         ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> > >         if (!ret) {
> > >                 /* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> > >
> > > --
> > > 2.47.2
> > >
> > >

