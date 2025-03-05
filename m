Return-Path: <linux-media+bounces-27551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B04A4F71F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 141A53ABCC5
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6061DD9AC;
	Wed,  5 Mar 2025 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SXfiV1Cd"
X-Original-To: linux-media@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB91DB34E
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156165; cv=none; b=ND1nypulQ6kQQ/Ed0qg9HEYvUgnN2cRACK1MVbe5SV4nomfXH/4FvgFOYI7/+HPWZzVmYP84p0e/Q2RQgMWR63Dx4JMbjeyvk0jJGzEjR9l4JcJ+fiVjVVxkVuFVJXZT8NQSAYtic0ravGouD84yZEFeqvUIaE6wSMgLX+pEj8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156165; c=relaxed/simple;
	bh=o3kW0pNi6ws7nB2jg36SFJnOJzTNTNpMupdRuEa/EbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ij37BouzvPGTdQoBbKP+UItBPRYm+rx3/dGNLzFLQF8THsFVXK0PDQu6KJFoZYcqd382WBlVthDtooGTnMgk3UV1yw7FRHtwivHq0wn6GdhFy/EyHLr/YUkL4+QjMFdKrAf5zqcVuA7Ye8mrmbB5G9LNhGSDrawu2pYcQN7Rn7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SXfiV1Cd; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 5 Mar 2025 07:29:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741156151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTVCGwM23se+4ekAzT7AzWGiwiEjTwV1uOFKhvqzNAY=;
	b=SXfiV1CdXUgC4BpwCUWZ/dVZ/bvdrcEF6cLvhakxEtaYbo7L4CLJs3gTnH6UMxPFgShlKX
	2BELajcHcSmJW/rXUjCg7l72RrRK8b9hLpiclC3j9C/WLFWVTGsnDewDpRoEVvF7pmCxZR
	XeY1Wi5dOXmOAZRJM18tWaE/dj9Fc6k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov9282: add strobe_timeout v4l2 control
Message-ID: <yghyzheyq3c4lv5ukcjuemyapeonxs7dpfz46unazcbmwd2hkf@wokmocjh5yed>
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
 <20250303-ov9282-flash-strobe-v1-3-0fd57a1564ba@linux.dev>
 <CAPY8ntBBiuQtKErZ1+zDD5HBwjPRdBryduuB3XnhCZAdPC88GA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntBBiuQtKErZ1+zDD5HBwjPRdBryduuB3XnhCZAdPC88GA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Mar 04, 2025 at 10:28:45AM +0000, Dave Stevenson wrote:
> Hi Richard
> 
> On Mon, 3 Mar 2025 at 22:59, Richard Leitner <richard.leitner@linux.dev> wrote:
> >
> > Add V4L2_CID_FLASH_TIMEOUT support using the "strobe_frame_span"
> > feature of the sensor. This is implemented by transforming the given µs
> > value by an interpolated formula to a "span step width" value and
> > writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
> > PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).
> >
> > The maximum control value is set to the period of the current framerate.
> > This must be changed to a dynamic range as soon as this driver
> > implements the set_frame_interval() pad operation.
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
> > index c98ba466e9aea29baff0b13578d760bf69c958c5..f7dfe8987e524b73af7e16e12567e96627b4f89a 100644
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

Sure. Thanks for reviewing and pointing this out. Will fix that in v2.

(At least I was consistent and made the same mistakes for both controls ;-))

regards;rl

> 
>   Dave
> 
> >         u32 vblank;
> >         bool noncontinuous_clock;
> >         const struct ov9282_mode *cur_mode;
> > @@ -689,6 +695,24 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> >                                 current_val);
> >  }
> >
> > +static int ov9282_set_ctrl_flash_timeout(struct ov9282 *ov9282, int value)
> > +{
> > +       /* Calculate "strobe_frame_span" increments from a given value (µs).
> > +        * This is quite tricky as "The step width of shift and span is
> > +        * programmable under system clock domain.", but it's not documented
> > +        * how to program this step width (at least in the datasheet available
> > +        * to the author at time of writing).
> > +        * The formula below is interpolated from different modes/framerates
> > +        * and should work quite well for most settings.
> > +        */
> > +       u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> > +
> > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
> > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
> > +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 2, 1, (val >> 8) & 0xff);
> > +       return ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 3, 1, val & 0xff);
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -758,6 +782,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >         case V4L2_CID_FLASH_LED_MODE:
> >                 ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
> >                 break;
> > +       case V4L2_CID_FLASH_TIMEOUT:
> > +               ret = ov9282_set_ctrl_flash_timeout(ov9282, ctrl->val);
> > +               break;
> >         default:
> >                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >                 ret = -EINVAL;
> > @@ -1420,6 +1447,10 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >                                                         (1 << V4L2_FLASH_LED_MODE_TORCH),
> >                                                         V4L2_FLASH_LED_MODE_NONE);
> >
> > +       ov9282->flash_timeout = v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> > +                                                 V4L2_CID_FLASH_TIMEOUT,
> > +                                                 0, 13900, 1, 8);
> > +
> >         ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >         if (!ret) {
> >                 /* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> >
> > --
> > 2.47.2
> >
> >

