Return-Path: <linux-media+bounces-31398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A11B4AA4679
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B291BA4C3D
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C77D220685;
	Wed, 30 Apr 2025 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eyCZ9Z7e"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB14221DA1
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004190; cv=none; b=CKT2od4fTrRThNrKjXW7Zng7NHCIj9GJT2SA9PN+ZyQH/dDzmjjwCeIdOmAJNO038cPhs+CsyfaIxBjhAl2mKOboJ3wrRbJVTbkuOtg4FcCtt8BRmvxONL34RdIIWmleVfKssDGPjD15d2ICYigS3IvyKK8FxB0X5wcWdBMt3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004190; c=relaxed/simple;
	bh=e4VAosr0IColf0a/CAOwD0TIFn3zHD6ZO9SpkXnE7kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvNKzes1IvFioCB4XHhAwZSIUVi4GS35XkPfmrU+ZJrFpICKX//SXfbsUfIUtfq46xFNwsTIBlw+RYf+DNRSi6zVIJOqbAzJ6BgwyAGKvuybaZcTS0FUI8SOaNRLKtsL4Wd+y9kYPI+kILUJnpruYzwq6gwbFJrvGxuPgpvdZ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eyCZ9Z7e; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 30 Apr 2025 11:09:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746004175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCRBRZZ/FbaHEC4RagoiZb8qIZ+TxSNDeJF2W7TvLAU=;
	b=eyCZ9Z7e8YR2Rw072GaF3/+eIOxnaOFEvCAWB0Oin1QOD91c3RZq8vaMArKTKiFB0oWClh
	2o/WsYstSvqxQzoZWbwgqN+sjthWAeFBFge56eABRNoxpPxiFGgW41ejk1uyQ9AJZE4xtX
	qmPGcn6ezL+h8O51QC5MjQ++J0YKDWU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 8/9] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <t7lnqmhufsyf5ygfkfyllvxpm4h2qdxotgi2lcfoxlhxjpejjd@mf2poxik2zje>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
 <20250429-ov9282-flash-strobe-v3-8-2105ce179952@linux.dev>
 <aBHe-55_U3bYTXyG@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBHe-55_U3bYTXyG@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

thanks for the review!

On Wed, Apr 30, 2025 at 08:27:39AM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> On Tue, Apr 29, 2025 at 02:59:13PM +0200, Richard Leitner wrote:
> > Add V4L2_CID_FLASH_DURATION support using the "strobe_frame_span"
> > feature of the sensor. This is implemented by transforming the given µs
> > value by an interpolated formula to a "span step width" value and
> > writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
> > PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).
> > 
> > The maximum control value is set to the period of the current default
> > framerate.
> > 
> > All register values are based on the OV9281 datasheet v1.53 (jan 2019)
> > and tested using an ov9281 VisionComponents module.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 35edbe1e0efb61a0e03da0ed817c4c4ec0ae9c35..5ddbfc51586111fbd2e17b739fb3d28bfb0aee1e 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -97,6 +97,10 @@
> >  #define OV9282_REG_MIPI_CTRL00	0x4800
> >  #define OV9282_GATED_CLOCK	BIT(5)
> >  
> > +/* Flash/Strobe control registers */
> > +#define OV9282_REG_FLASH_DURATION	0x3925
> > +#define OV9282_FLASH_DURATION_DEFAULT	0x0000001A
> > +
> >  /* Input clock rate */
> >  #define OV9282_INCLK_RATE	24000000
> >  
> > @@ -687,6 +691,24 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> >  				current_val);
> >  }
> >  
> > +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
> > +{
> > +	/* Calculate "strobe_frame_span" increments from a given value (µs).
> 
> /*
>  * Multi-line
>  * comment.
>  */

sure. will adapt that in v4.

> 
> > +	 * This is quite tricky as "The step width of shift and span is
> > +	 * programmable under system clock domain.", but it's not documented
> > +	 * how to program this step width (at least in the datasheet available
> > +	 * to the author at time of writing).
> > +	 * The formula below is interpolated from different modes/framerates
> > +	 * and should work quite well for most settings.
> > +	 */
> > +	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> > +
> > +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
> > +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
> > +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 2, 1, (val >> 8) & 0xff);
> > +	return ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 3, 1, val & 0xff);
> 
> The granularity of the hardware supported values is lower than that of the
> control. Could you add try_ctrl op to provide the actual value back to the
> user space?

Tbh, I've never implemented a try_ctrl before, but sure. I will dig into it and
add it for the ov9282 FLASH_DURATION in v4.

> 
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -756,6 +778,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_FLASH_LED_MODE:
> >  		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
> >  		break;
> > +	case V4L2_CID_FLASH_DURATION:
> > +		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
> > +		break;
> >  	default:
> >  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >  		ret = -EINVAL;
> > @@ -1418,6 +1443,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  			       (1 << V4L2_FLASH_LED_MODE_TORCH),
> >  			       V4L2_FLASH_LED_MODE_NONE);
> >  
> > +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> 
> Should the number of controls in the handler be updated?

What do you mean by "number of controls in the handler" exactly? Which
handler?

> > +			  0, 13900, 1, 8);
> > +
> >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >  	if (!ret) {
> >  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

regards;rl

