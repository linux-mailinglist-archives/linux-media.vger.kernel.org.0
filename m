Return-Path: <linux-media+bounces-33512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A8AC65D3
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1524E1554
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 09:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA202777E0;
	Wed, 28 May 2025 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xu6n2n/G"
X-Original-To: linux-media@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2961EB193;
	Wed, 28 May 2025 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424323; cv=none; b=oE1zhJlIaEVHdQaZ0eANNr3fGeDtyb67gBQNvuvIE5TjRZpLAmSlcGgkPwbfnZbHPRY+jeOTfR7FWGaV5i/GktCk/YcTXJbY9lURHrtQ9+Cl3RGyXGStB6RbZ23dX7/IZnKbXsNOh9mUYFBrfBRsECW6tIekMhEwOVTG1UoSMCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424323; c=relaxed/simple;
	bh=N1s+EAnE4QksMuJkGOXKpbTVBre+UINn2yE45vNS4fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElcDh+Cg08GPWzQW1LF1QUC9BMKSh204GIWxtoikXHnRXMfLGZK0h34Ve6Ihz26phwndKMbk6T24BK58BG7WKih/TUGNsECTCk1z7Zlukjxsx7s9YAJX7KOTlD5ogLmlYIMH2ADL3Nrlflwx/fd6WpjlUecYcSsOOtbdnDSZTnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xu6n2n/G; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 28 May 2025 11:25:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748424309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI9dqXcHsvuMiIRgJ1QC3uTmfdcNnM4s+Ml7A/VgMkA=;
	b=Xu6n2n/GymRMG8uaqCgeu6oxjq1uhEB73MIy3PcgZuBp+GFEmKqlY0AFQi8Fx4fDkSMcR2
	3W9UB9AgD+AC2XzYBaTyStJg7TTNmoWQQNoCtwYw3S1TONke4tJ8Aq/pmbV7dJPekpC9kb
	VJmZTz83atGdCLiT9qZHZTGkyOMkvqQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 10/10] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <eqtrzwtlptlh5wrma24p2fwm626mwwzlfxl7cwfucbqkg7hyat@s2nnu7mgmijf>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-10-72b299c1b7c9@linux.dev>
 <aDTNd7sswLyBNbzd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDTNd7sswLyBNbzd@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

On Mon, May 26, 2025 at 08:22:15PM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> Thanks for the update.

Thank you for the review!

> 
> On Wed, May 07, 2025 at 09:51:39AM +0200, Richard Leitner wrote:
> > As the granularity of the hardware supported values is lower than the
> > control value, implement a try_ctrl() function for
> > V4L2_CID_FLASH_DURATION. This function calculates the nearest possible
> > µs strobe duration for the given value and returns it back to the
> > caller.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 56 ++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 54 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 09d522d5977ec6fb82028ddb6015f05c9328191d..f75882dcb73bea0e00e2cb37ffc19ec3c3a8b126 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -128,6 +128,8 @@
> >  #define OV9282_REG_MIN		0x00
> >  #define OV9282_REG_MAX		0xfffff
> >  
> > +#define OV9282_STROBE_SPAN_FACTOR	192
> > +
> >  static const char * const ov9282_supply_names[] = {
> >  	"avdd",		/* Analog power */
> >  	"dovdd",	/* Digital I/O power */
> > @@ -691,7 +693,7 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> >  				current_val);
> >  }
> >  
> > -static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
> > +static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> >  {
> >  	/*
> >  	 * Calculate "strobe_frame_span" increments from a given value (µs).
> > @@ -702,7 +704,31 @@ static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
> >  	 * The formula below is interpolated from different modes/framerates
> >  	 * and should work quite well for most settings.
> >  	 */
> > -	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> > +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > +
> > +	return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
> > +}
> > +
> > +static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > +{
> > +	/*
> > +	 * As the calculation in ov9282_us_to_flash_duration uses an integer
> > +	 * divison calculate in ns here to get more precision. Then check if
> > +	 * we need to compensate that divison by incrementing the µs result.
> > +	 */
> > +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > +	u64 ns = value * 1000 * frame_width / OV9282_STROBE_SPAN_FACTOR;
> > +	u32 us = ns / 1000;
> > +	u32 remainder = ns % 1000;
> > +
> > +	if (remainder > 0)
> > +		us++;
> 
> It looks like you're trying to round up here. Wouldn't
> 
> 	return DIV_ROUND_UP(ns, 1000);
> 
> do the same?

Yes, thanks for the suggestion. I wasn't thinking of DIV_ROUND_UP here,
but this makes the code way more readable :-)

Will adapt this in v5.

> 
> > +	return us;
> > +}
> > +
> > +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
> > +{
> > +	u32 val = ov9282_us_to_flash_duration(ov9282, value);
> >  
> >  	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
> >  	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
> > @@ -792,9 +818,35 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	return ret;
> >  }
> >  
> > +static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct ov9282 *ov9282 =
> > +		container_of(ctrl->handler, struct ov9282, ctrl_handler);
> > +
> > +	if (ctrl->id == V4L2_CID_FLASH_DURATION) {
> > +		u32 fd = ov9282_us_to_flash_duration(ov9282, ctrl->val);
> > +		u32 us = ctrl->val;
> > +		u32 us0 = ov9282_flash_duration_to_us(ov9282, fd);
> > +		u32 us1 = ov9282_flash_duration_to_us(ov9282, (fd + 1));
> > +
> > +		if ((us1 - us) < (us - us0))
> 
> Is this missing abs?

IMHO this abs() isn't required here, as the (fd + 1) value should be
always higher than the fd one. But nonetheless it doesn't hurt, so I'll
add it in v5. Thanks!

> 
> > +			ctrl->val = us1;
> > +		else
> > +			ctrl->val = us0;
> > +
> > +		if (us != ctrl->val) {
> > +			dev_dbg(ov9282->dev, "using next valid strobe_duration %u instead of %u\n",
> > +				ctrl->val, us);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /* V4l2 subdevice control ops*/
> >  static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
> >  	.s_ctrl = ov9282_set_ctrl,
> > +	.try_ctrl = ov9282_try_ctrl,
> >  };
> >  
> >  /**
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

thanks & regards;rl

