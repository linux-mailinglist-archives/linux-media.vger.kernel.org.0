Return-Path: <linux-media+bounces-27550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F5A4F70F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 368B3164DF3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242061D7E42;
	Wed,  5 Mar 2025 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TE0DTZPA"
X-Original-To: linux-media@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E5249E5
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156043; cv=none; b=XqlwIKVGBwfkCjf4tHjLEXJj3YjGTdNcNG9pSyBYaI1xFuphCCYoPQZqjo/VBioAhmOBtfTevnwgFF+CrxrMcl3MPXRuypLGi98Jf7ZKUB4YRSGDlB+++zjFzdfn9xdkVZs3hhQvoF79yDMdPSaK3l6vfgYSy+PyZ0WTnOKU+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156043; c=relaxed/simple;
	bh=xUBbBcwbZqUD8Vm7e59Q9x1gr2CHqGZKe8rVhv4iKc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZHMaCPn6u8uYZXSLiXOiBji5Fg/uYLVHGS7xwQ+s+v9CZ5Gt1HwDGnH3y9cY9rErRLpCYdQ5AbUeQYvbmP9O7V3UkUxoAd7xrUGfs7UW/ftzTmruIn6B+q0bNBzM2G8clD90L1GFes//jFhe3/nUz9TMLFhKeFdR1+3L4hu9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TE0DTZPA; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 5 Mar 2025 07:27:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741156035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LFOzxyIWi+Af1k95MeLykF95QwfQQ5HvrGk7FuDDePY=;
	b=TE0DTZPA9LYDv8nR49q/MIOQuU4h0vO0VcNuHXWB9PJGzK2BqkPm+++pm1gOGMPcYtRMAp
	lICXaXP5ib6Wo8A16mNaZE3wJQX8uJYVKDnb7Kuu+UzPJrn1DwCTlrQq30otC1Dbp3SsjT
	DS0k+pxiba0nyUyO0f6FXNwshvzRtyw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <plphzp7nebljvmmgg66awjumdsabydaduxpcthjstogbgew64w@f6nrszdkt3db>
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
 <20250303-ov9282-flash-strobe-v1-2-0fd57a1564ba@linux.dev>
 <CAPY8ntAQnN+Ea4oMKK5RkCa+EZMwbCjX4uJx2ex5E=peuz0vAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAQnN+Ea4oMKK5RkCa+EZMwbCjX4uJx2ex5E=peuz0vAA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Dave,
thanks for the review.
I really appreciate your quick responses.

On Tue, Mar 04, 2025 at 05:27:34PM +0000, Dave Stevenson wrote:
> Hi Richard
> 
> On Mon, 3 Mar 2025 at 22:59, Richard Leitner <richard.leitner@linux.dev> wrote:
> >
> > Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> > feature of the sensor. This implements following modes:
> >
> >  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
> >  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
> >
> > All values are based on the OV9281 datasheet v1.53 (january 2019) and
> > tested using an ov9281 VisionComponents module.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index f42e0d439753e74d14e3a3592029e48f49234927..c98ba466e9aea29baff0b13578d760bf69c958c5 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -192,6 +192,7 @@ struct ov9282_mode {
> >   * @exp_ctrl: Pointer to exposure control
> >   * @again_ctrl: Pointer to analog gain control
> >   * @pixel_rate: Pointer to pixel rate control
> > + * @flash_led_mode: Pointer to flash led mode control
> >   * @vblank: Vertical blanking in lines
> >   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
> >   * @cur_mode: Pointer to current selected sensor mode
> > @@ -214,6 +215,7 @@ struct ov9282 {
> >                 struct v4l2_ctrl *again_ctrl;
> >         };
> >         struct v4l2_ctrl *pixel_rate;
> > +       struct v4l2_ctrl *flash_led_mode;
> 
> As with 3/3, you only use this control from within ov9282_set_ctrl
> where you are given the struct v4l2_ctrl, so there is no need to store
> it in the device state structure.

Sure. Thanks for bringing this up. Will fix that in v2.

> 
> >         u32 vblank;
> >         bool noncontinuous_clock;
> >         const struct ov9282_mode *cur_mode;
> > @@ -670,6 +672,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> >                                 current_val);
> >  }
> >
> > +static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> > +{
> > +       u32 current_val;
> > +       int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > +                                 &current_val);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (mode == V4L2_FLASH_LED_MODE_FLASH)
> > +               current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
> > +       else
> > +               current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
> > +
> > +       return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > +                               current_val);
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -736,6 +755,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
> >                                        (ctrl->val + ov9282->cur_mode->width) >> 1);
> >                 break;
> > +       case V4L2_CID_FLASH_LED_MODE:
> > +               ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
> > +               break;
> >         default:
> >                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >                 ret = -EINVAL;
> > @@ -1391,6 +1413,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >                                                 OV9282_TIMING_HTS_MAX - mode->width,
> >                                                 1, hblank_min);
> >
> > +       /* Flash/Strobe controls */
> > +       ov9282->flash_led_mode = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> > +                                                       V4L2_CID_FLASH_LED_MODE,
> > +                                                       V4L2_FLASH_LED_MODE_TORCH,
> > +                                                       (1 << V4L2_FLASH_LED_MODE_TORCH),
> > +                                                       V4L2_FLASH_LED_MODE_NONE);
> > +
> >         ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >         if (!ret) {
> >                 /* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> >
> > --
> > 2.47.2
> >
> >

regards;rl

