Return-Path: <linux-media+bounces-41630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE5B41608
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E3203B1867
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 07:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9038A2DA755;
	Wed,  3 Sep 2025 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NlaunSTV"
X-Original-To: linux-media@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596CB2D9EE1
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756883627; cv=none; b=aIu/J3jDSzWE1ORrw/+A6U+Y6a2+yuLgxNajztqL4+ch6L9we7hw0K/dd4OJFcdXOEj3wl5B4d54qp1GrP67WZTaD98oMGZDiJmKEQEz31Fi7us1l9eaZDC2UPQI4V+TyKU2YpM+m8+ksG2fFfeO2N0tZr3Oagk21bTquSQIbSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756883627; c=relaxed/simple;
	bh=3bsoKh7pwzsjTaE8y+xv/UQl2ol1MZOSQnd3LIiYdj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POzqKbVaUZrJCwnPRnriNRjChgMAgIjeQRN0pqBQqFeIx08B2z8c2iuL8MkSUYvAmU4RqiC2YKVn/TmSUI6mKwX55eh+56u4ESsKPeo73UAWPrKjKvNjEiX2ZPUQ2AC6Wo4qWs4AzCL91Lp7w3nnuw7luAByMyLpaxs2qlQNNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NlaunSTV; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 3 Sep 2025 09:13:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756883623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z440aFv+/UP4+faxOUN6+DJHRq+/eFSfX0QMC17zTLQ=;
	b=NlaunSTVEAIr/y5FSevib/zOXS8KquuauoIXWFDq4X/dFdf2twoKx46sSU6TrBsO6YdB38
	QIhwpDX9MG17xec4UI+aAXuJdkDpbGOtXaiJmhmcBXiNvACmXygjJzqcRM1EpWkH4zJAgn
	WzOF9xGePvmNrCZbI5jCQJStTlL067s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 10/10] media: i2c: ov9282: dynamic flash_duration
 maximum
Message-ID: <j4t7zyhf4zhn5t27os7yxi3chaux3m6bjlxe774crmdmzzm54f@dlk5s5ai7ehc>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-10-d58d5a694afc@linux.dev>
 <aLYNQ4W8f55G_7HP@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLYNQ4W8f55G_7HP@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Tue, Sep 02, 2025 at 12:16:51AM +0300, Sakari Ailus wrote:
> Hi Richard,
> 
> On Mon, Sep 01, 2025 at 05:05:15PM +0200, Richard Leitner wrote:
> > This patch sets the current exposure time as maximum for the
> > flash_duration control. As Flash/Strobes which are longer than the
> > exposure time have no effect.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 30 ++++++++++++++++++++++++++----
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index b104ae77f00e9e7777342e48b7bf3caa6d297f69..3253d9f271cb3caef6d85837ebec4f5beb466a4d 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -198,6 +198,7 @@ struct ov9282_mode {
> >   * @exp_ctrl: Pointer to exposure control
> >   * @again_ctrl: Pointer to analog gain control
> >   * @pixel_rate: Pointer to pixel rate control
> > + * @flash_duration: Pointer to flash duration control
> >   * @vblank: Vertical blanking in lines
> >   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
> >   * @cur_mode: Pointer to current selected sensor mode
> > @@ -220,6 +221,7 @@ struct ov9282 {
> >  		struct v4l2_ctrl *again_ctrl;
> >  	};
> >  	struct v4l2_ctrl *pixel_rate;
> > +	struct v4l2_ctrl *flash_duration;
> >  	u32 vblank;
> >  	bool noncontinuous_clock;
> >  	const struct ov9282_mode *cur_mode;
> > @@ -611,6 +613,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >  					mode->vblank_max, 1, mode->vblank);
> >  }
> >  
> > +static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> > +{
> > +	/* calculate exposure time in µs */
> > +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > +	u32 trow_us = (frame_width * 1000000UL) / ov9282->pixel_rate->val;
> 
> Redundant parentheses.

True. Will fix this. Thanks for the catch.

> 
> > +
> > +	return exposure * trow_us;
> > +}
> > +
> >  /**
> >   * ov9282_update_exp_gain() - Set updated exposure and gain
> >   * @ov9282: pointer to ov9282 device
> > @@ -622,9 +633,10 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >  {
> >  	int ret;
> > +	u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
> >  
> > -	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u",
> > -		exposure, gain);
> > +	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> > +		exposure, exposure_us, gain);
> >  
> >  	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
> >  	if (ret)
> > @@ -635,6 +647,12 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >  		goto error_release_group_hold;
> >  
> >  	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> > +	if (ret)
> > +		goto error_release_group_hold;
> > +
> > +	ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> > +				       0, exposure_us, 1,
> > +				       OV9282_FLASH_DURATION_DEFAULT);
> >  
> >  error_release_group_hold:
> >  	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> > @@ -1420,6 +1438,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	struct v4l2_fwnode_device_properties props;
> >  	struct v4l2_ctrl *ctrl;
> >  	u32 hblank_min;
> > +	u32 exposure_us;
> >  	u32 lpfr;
> >  	int ret;
> >  
> > @@ -1491,8 +1510,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	/* Flash/Strobe controls */
> >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> >  
> > -	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > -			  0, 13900, 1, 8);
> > +	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> > +	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
> > +						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > +						   0, exposure_us,
> > +						   1, OV9282_FLASH_DURATION_DEFAULT);
> 
> Wrap this differently, please, e.g. after '='.

This is wrapped the same way as all other v4l2_ctrl_new_X() calls in
ov9282_init_controls(). Therefore I've chosen to do it this way here
too.

So if I'm going to change this one, IMHO all others should be changed
too (exp_ctrl, again_ctrl, vblank_ctrl, pixel_rate, link_freq_ctrl,
hblank_ctrl). Is this intended?

If so I'm wondering if this would be a suiteable approach?

ov9282->flash_duration =
	v4l2_ctrl_new_std(ctrl_hdlr,
			   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
			   0, exposure_us,
			   1, OV9282_FLASH_DURATION_DEFAULT);

It is fine for checkpatch, but introduces a newline for every ctrl and
tbh I'm not sure if it improves readability?

> 
> >  
> >  	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> >  				      V4L2_CID_FLASH_STROBE_SOURCE,
> > 
> 
> To me the set looks good but I wouldn't mind about having a bit more
> review.

Thanks for your continuous feedback! It improved the series a lot!

Is there anyhthing I can assists/help?

> 
> -- 
> Kind regards,
> 
> Sakari Ailus

regards;rl

