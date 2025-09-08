Return-Path: <linux-media+bounces-42025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577AB491FA
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 16:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C973C1712AB
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 14:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED1B3002A2;
	Mon,  8 Sep 2025 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hH9zHq10"
X-Original-To: linux-media@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212ED1CBEAA
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757342860; cv=none; b=o/K1+S68oHLA1T4w+eid+Osi+kyXrVUhBDvJvn6H1g8At0/OogbbXYLySW0XdO4HTuQ241bux9DUS2wUw5bnzGCo95RIXuNLsY+N3E2WOSxJiltatAC9ldoDWi2vjfOSGOnogQrdLbHB6Eco7/W/d3fxnR1soICKA1FVavT7DxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757342860; c=relaxed/simple;
	bh=fV/k7pnGg5U1j/Ho4oLI9YHZEk//tgEhhTH30ME2tYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBho6UsZUB23C9eZjL43bTHyv4IcM8dobhr9YUZHoQMnUvGROVIibGnk9U09L7MRgp9fclv3/jhExVpZOfy3idJ7aoX6BxgG89NS2GP91NBvzEGCu5J7WHMUMqprgC0PFcIf4CQqcwYZ/z1HnT/Cd/tgOojSfpE5NYwXPdfwm2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hH9zHq10; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 8 Sep 2025 16:47:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757342846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YRl/bpkfEMYYMiEprnX/hSTsooigf4G9r5nwDef3AE4=;
	b=hH9zHq10zbNnlFb24ISQS+7skwtXvH/fL/9y3wfq3GY+NxVKis92wv2HmP9GIUHHN+af2S
	HOjMgpWFhQ0wBHADKkLgineq2Lt5dgZ8oUhyL6mGOvCXVCDoQroqdHe6VQAY0FuEe8d7Ca
	T+RPb+bmMipVgKPQ9OGfbGdj0Di6m2I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 06/10] media: i2c: ov9282: add hardware strobe signal
 v4l2 control
Message-ID: <ahhiuf4is3wnukzgaschey6yrea5qfmmggcon42brh2pp2wrzn@aq3wnluvihtl>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-6-d58d5a694afc@linux.dev>
 <aLYIq6GxLgPM6ReC@kekkonen.localdomain>
 <ieqhz2bpvtnej7odzjz3laiudbib3q6j656ed5s7zk4n2nxafh@ci7sdkmdni7d>
 <20250907200811.GB19568@pendragon.ideasonboard.com>
 <czhubfkhxayxbmn7hpgxjjqpylgo5c7jbrzobzxq65ruza2zfx@fhlxv2q63a5a>
 <20250908134735.GF26062@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908134735.GF26062@pendragon.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Sep 08, 2025 at 03:47:35PM +0200, Laurent Pinchart wrote:
> On Mon, Sep 08, 2025 at 02:09:06PM +0200, Richard Leitner wrote:
> > On Sun, Sep 07, 2025 at 10:08:11PM +0200, Laurent Pinchart wrote:
> > > On Wed, Sep 03, 2025 at 08:58:04AM +0200, Richard Leitner wrote:
> > > > On Mon, Sep 01, 2025 at 11:57:15PM +0300, Sakari Ailus wrote:
> > > > > On Mon, Sep 01, 2025 at 05:05:11PM +0200, Richard Leitner wrote:
> > > > > > Add V4L2_CID_FLASH_HW_STROBE_SIGNAL enable/disable support using the
> > > > > > "strobe output enable" feature of the sensor.
> > > > > > 
> > > > > > All values are based on the OV9281 datasheet v1.53 (january 2019) and
> > > > > > tested using an ov9281 VisionComponents module.
> > > > > > 
> > > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > > ---
> > > > > >  drivers/media/i2c/ov9282.c | 25 ++++++++++++++++++++++++-
> > > > > >  1 file changed, 24 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > > > index f42e0d439753e74d14e3a3592029e48f49234927..ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb 100644
> > > > > > --- a/drivers/media/i2c/ov9282.c
> > > > > > +++ b/drivers/media/i2c/ov9282.c
> > > > > > @@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> > > > > >  				current_val);
> > > > > >  }
> > > > > >  
> > > > > > +static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool enable)
> > > > > > +{
> > > > > > +	u32 current_val;
> > > > > > +	int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > > > > > +				  &current_val);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > 
> > > > > Please don't do assignments in variable declaration if that involves error
> > > > > handling.
> > > > 
> > > > Sure. Will fix that!
> > > > 
> > > > > > +
> > > > > > +	if (enable)
> > > > > > +		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
> > > > > > +	else
> > > > > > +		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
> > > > > > +
> > > > > > +	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > > > > > +				current_val);
> > > 
> > > It would be nice to cache the register value instead of reading it back.
> > > Regmap may help (and then the driver should use the CCI helpers). This
> > > can be done separately.
> > 
> > Currently all set_ctrl calls in the ov9282 driver have this
> > read/modify/write pattern. As mentioned in the cover letter I'm planning
> > to migrate to cci helpers in a future series to keep the set smaller.
> > But if you prefer the migration in this series I can try to rebase on
> > it?
> 
> No, it's fine on top. I ask for enough yak-shaving already :-)

:-) great. thanks :-)

> 
> > > > > > +}
> > > > > > +
> > > > > >  /**
> > > > > >   * ov9282_set_ctrl() - Set subdevice control
> > > > > >   * @ctrl: pointer to v4l2_ctrl structure
> > > > > > @@ -736,6 +753,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > > >  		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
> > > > > >  				       (ctrl->val + ov9282->cur_mode->width) >> 1);
> > > > > >  		break;
> > > > > > +	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
> > > > > > +		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
> > > > > > +		break;
> > > > > >  	default:
> > > > > >  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> > > > > >  		ret = -EINVAL;
> > > > > > @@ -1326,7 +1346,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > > > > >  	u32 lpfr;
> > > > > >  	int ret;
> > > > > >  
> > > > > > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > > > > > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> > > > > >  	if (ret)
> > > > > >  		return ret;
> > > > > >  
> > > > > > @@ -1391,6 +1411,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > > > > >  						OV9282_TIMING_HTS_MAX - mode->width,
> > > > > >  						1, hblank_min);
> > > > > >  
> > > > > > +	/* Flash/Strobe controls */
> > > > > > +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> > > > > 
> > > > > This seems rather long.
> > > > 
> > > > It's exactly 100 chars wide, so from a policy point of view it should be
> > > > fine ;-). But I'm also fine with breaking it to 80 if you prefer?
> > > 
> > > That's the usual policy in V4L2, yes. 80 columns is the preferred soft
> > > limit.
> > 
> > So I should break this line in this case? Tbh I'm often unsure on
> > breaking on 80 or 100... Personally 100 is fine for me, but that's
> > "your" subsystem/driver, so I guess it's your descision ;-)
> 
> Sakari is even more strict than me about line lengths :-)
> 
> It a line is just a couple of charaters about 80 columns and doesn't
> have a nice split point I would avoid breaking it as I feel the result
> would be less readable.
> 
> In this particular case, breaking the line would lead to
> 
> 	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> 			  V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> 
> 
> which I think is OK. It's very subjective of course.

Thanks for the clarification. Sure. That's fine for me.
I will adapt the patch accordingly.

> 
> > > > > > +
> > > > > >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> > > > > >  	if (!ret) {
> > > > > >  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> > > > > > 
> 
> -- 
> Regards,
> 
> Laurent Pinchart

thanks & regards;rl

