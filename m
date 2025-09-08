Return-Path: <linux-media+bounces-42002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92717B49015
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77396188A8B7
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 13:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC8030BB98;
	Mon,  8 Sep 2025 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fTqkyte5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A629D22FE0D;
	Mon,  8 Sep 2025 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339281; cv=none; b=h0ULL7w5Il/D3bQVEEuV9DSV+IBvjasVOBX/wnCVzBxYMaX/wv2jR2ppFIAalJh1GlU6TgjGPbaPLH8lB3RkXEfhD/ArAYeAfz++N2cPQ6/4JmepfeRP7UWiLQD2xG24a+p4Udg5zvQm2fPYf3HVTBKPTQUR1lJXq6pNMOt5d/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339281; c=relaxed/simple;
	bh=aUU66mA1SxFB9c1Xi8NaJzcoy+mG8NTkYHR2h/BbdPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVbitxIijqGN58T/1dKoV9SR0v4awNHZflUfSVIPxWMxO52KUEUWsKYrGuHeCFbLhSgWl+ipmq2p9VtwVQDvJiJlGXylD/jMqpLJ/j+2xUxG9lyViovD/c+cxOffpVht9NXnoqLNrYsC2cjL+biBx28/ZNq+Eb3fiGOXZdLGpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fTqkyte5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-134-76-nat.elisa-mobile.fi [85.76.134.76])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 27D3599F;
	Mon,  8 Sep 2025 15:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757339205;
	bh=aUU66mA1SxFB9c1Xi8NaJzcoy+mG8NTkYHR2h/BbdPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTqkyte5OOIGKga37FfYPeMr1IQ5EiGVQ+IBQHB92MRiHaidHv6oDufsdGrVCMFN5
	 sWZgaOL1tL0MhNRUVX1jB41MvOqK98J0qmnJv6+9ms+VVg+x1q69pVgulMlNgwLh78
	 8SdL7NyMg05j/XLhJDSM5nRMhIb9GMrSPUNHr000=
Date: Mon, 8 Sep 2025 15:47:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 06/10] media: i2c: ov9282: add hardware strobe signal
 v4l2 control
Message-ID: <20250908134735.GF26062@pendragon.ideasonboard.com>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-6-d58d5a694afc@linux.dev>
 <aLYIq6GxLgPM6ReC@kekkonen.localdomain>
 <ieqhz2bpvtnej7odzjz3laiudbib3q6j656ed5s7zk4n2nxafh@ci7sdkmdni7d>
 <20250907200811.GB19568@pendragon.ideasonboard.com>
 <czhubfkhxayxbmn7hpgxjjqpylgo5c7jbrzobzxq65ruza2zfx@fhlxv2q63a5a>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <czhubfkhxayxbmn7hpgxjjqpylgo5c7jbrzobzxq65ruza2zfx@fhlxv2q63a5a>

On Mon, Sep 08, 2025 at 02:09:06PM +0200, Richard Leitner wrote:
> On Sun, Sep 07, 2025 at 10:08:11PM +0200, Laurent Pinchart wrote:
> > On Wed, Sep 03, 2025 at 08:58:04AM +0200, Richard Leitner wrote:
> > > On Mon, Sep 01, 2025 at 11:57:15PM +0300, Sakari Ailus wrote:
> > > > On Mon, Sep 01, 2025 at 05:05:11PM +0200, Richard Leitner wrote:
> > > > > Add V4L2_CID_FLASH_HW_STROBE_SIGNAL enable/disable support using the
> > > > > "strobe output enable" feature of the sensor.
> > > > > 
> > > > > All values are based on the OV9281 datasheet v1.53 (january 2019) and
> > > > > tested using an ov9281 VisionComponents module.
> > > > > 
> > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > ---
> > > > >  drivers/media/i2c/ov9282.c | 25 ++++++++++++++++++++++++-
> > > > >  1 file changed, 24 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > > index f42e0d439753e74d14e3a3592029e48f49234927..ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb 100644
> > > > > --- a/drivers/media/i2c/ov9282.c
> > > > > +++ b/drivers/media/i2c/ov9282.c
> > > > > @@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> > > > >  				current_val);
> > > > >  }
> > > > >  
> > > > > +static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool enable)
> > > > > +{
> > > > > +	u32 current_val;
> > > > > +	int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > > > > +				  &current_val);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > 
> > > > Please don't do assignments in variable declaration if that involves error
> > > > handling.
> > > 
> > > Sure. Will fix that!
> > > 
> > > > > +
> > > > > +	if (enable)
> > > > > +		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
> > > > > +	else
> > > > > +		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
> > > > > +
> > > > > +	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > > > > +				current_val);
> > 
> > It would be nice to cache the register value instead of reading it back.
> > Regmap may help (and then the driver should use the CCI helpers). This
> > can be done separately.
> 
> Currently all set_ctrl calls in the ov9282 driver have this
> read/modify/write pattern. As mentioned in the cover letter I'm planning
> to migrate to cci helpers in a future series to keep the set smaller.
> But if you prefer the migration in this series I can try to rebase on
> it?

No, it's fine on top. I ask for enough yak-shaving already :-)

> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * ov9282_set_ctrl() - Set subdevice control
> > > > >   * @ctrl: pointer to v4l2_ctrl structure
> > > > > @@ -736,6 +753,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > >  		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
> > > > >  				       (ctrl->val + ov9282->cur_mode->width) >> 1);
> > > > >  		break;
> > > > > +	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
> > > > > +		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
> > > > > +		break;
> > > > >  	default:
> > > > >  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> > > > >  		ret = -EINVAL;
> > > > > @@ -1326,7 +1346,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > > > >  	u32 lpfr;
> > > > >  	int ret;
> > > > >  
> > > > > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > > > > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> > > > >  	if (ret)
> > > > >  		return ret;
> > > > >  
> > > > > @@ -1391,6 +1411,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > > > >  						OV9282_TIMING_HTS_MAX - mode->width,
> > > > >  						1, hblank_min);
> > > > >  
> > > > > +	/* Flash/Strobe controls */
> > > > > +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> > > > 
> > > > This seems rather long.
> > > 
> > > It's exactly 100 chars wide, so from a policy point of view it should be
> > > fine ;-). But I'm also fine with breaking it to 80 if you prefer?
> > 
> > That's the usual policy in V4L2, yes. 80 columns is the preferred soft
> > limit.
> 
> So I should break this line in this case? Tbh I'm often unsure on
> breaking on 80 or 100... Personally 100 is fine for me, but that's
> "your" subsystem/driver, so I guess it's your descision ;-)

Sakari is even more strict than me about line lengths :-)

It a line is just a couple of charaters about 80 columns and doesn't
have a nice split point I would avoid breaking it as I feel the result
would be less readable.

In this particular case, breaking the line would lead to

	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
			  V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);


which I think is OK. It's very subjective of course.

> > > > > +
> > > > >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> > > > >  	if (!ret) {
> > > > >  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> > > > > 

-- 
Regards,

Laurent Pinchart

