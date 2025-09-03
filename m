Return-Path: <linux-media+bounces-41628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045BB415A1
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 08:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EF21188F523
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 06:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BA12D879E;
	Wed,  3 Sep 2025 06:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xKPAlruC"
X-Original-To: linux-media@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB0D42A80
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882491; cv=none; b=AFnKyIMq32Lyuhx0drtGVIc7wlbhjY+MNaElB2CcF9DDKXYnoIdx8NYM4xkN6xPhO1uzNISgljrMk/a1waLBTERc6fcgPMdEX/kl4XW1UTsf1e3VGztG5/B9oE+6Tc+KfauP+jsmTe/Wf2L5HyP0dZzxzBAuFl/GmsUMnuvlQ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882491; c=relaxed/simple;
	bh=fx9m8I+bnFu6YFqFIx8UzjaVPlzpct3IdUYNb8nf/uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYPZhspsIDYR2QrEMmwtOAf0zMfGVnkSCyaOI/IehC6LMbZd5auoeNqQQM/P1/Hvs/lvWAJq7Mi/9bIDyb7CPqvxZnTKIX0EmXIsNpldKbTJwmbL6zowsfWycBXCId2AqzIVO27ilmSfpQDT38dTCfQFKx3lXhEwnVPQxD6ckU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xKPAlruC; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 3 Sep 2025 08:54:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756882485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4jFDaRtvJdeG/8DPwr/WLJ5E2a7HLkN/FvmStdNByxk=;
	b=xKPAlruCZjj2Mj1AUXwCnLy195uqzzKwiHsPQRsCw3LOYQMrOqW3jxIAaEDYsVw6eTFp9c
	afwPlHF8zwt3lqrtZzTL4tcJnvXxXIE+N42gHWpcwiD2UJjiWMMWbTJZYtH9h7sj96xeLB
	2YrsStw+6mj/lLJIsqtaPM1D2e4QkhU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 07/10] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <uzgdukvgqkpg5koehz6kzxg6dfjes7p5ntd5oyqgqpr7gz5otd@ykwax6c2bo6x>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-7-d58d5a694afc@linux.dev>
 <aLYISb07ziGDmFGS@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLYISb07ziGDmFGS@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

thanks again for the review :)

On Mon, Sep 01, 2025 at 11:55:37PM +0300, Sakari Ailus wrote:
> Hi Richard,
> 
> On Mon, Sep 01, 2025 at 05:05:12PM +0200, Richard Leitner wrote:
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
> >  drivers/media/i2c/ov9282.c | 31 ++++++++++++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb..c405e3411daf37cf98d5af3535702f8321394af5 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -97,6 +97,10 @@
> >  #define OV9282_REG_MIPI_CTRL00	0x4800
> >  #define OV9282_GATED_CLOCK	BIT(5)
> >  
> > +/* Flash/Strobe control registers */
> > +#define OV9282_REG_FLASH_DURATION	0x3925
> > +#define OV9282_FLASH_DURATION_DEFAULT	0x0000001a
> > +
> >  /* Input clock rate */
> >  #define OV9282_INCLK_RATE	24000000
> >  
> > @@ -687,6 +691,25 @@ static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool en
> >  				current_val);
> >  }
> >  
> > +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> > +{
> > +	/*
> > +	 * Calculate "strobe_frame_span" increments from a given value (µs).
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
> The bitwise and operation is redundant.

True. Thanks for the catch!

> 
> Could you do this in a single write?

I've implemented this in single byte writes due to some "special
behaviour" of the vision components ov9281 modules. On those modules
single byte interactions seem broken in some cases. Maybe Laurent knows
more about this and the current state, as he was/is in contact with VC.

See also: https://lore.kernel.org/all/918ce2ca-55ff-aff8-ea6c-0c17f566d59d@online.de/

Nonetheless, thanks for the pointer. I haven't documented this
accordingly. I will try to reproduce the issue again and either change
this to a single write or add a describing comment.

> 
> Also error handling is (largely) missing.

Good catch. Thanks.

> 
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -756,6 +779,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
> >  		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
> >  		break;
> > +	case V4L2_CID_FLASH_DURATION:
> > +		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
> > +		break;
> >  	default:
> >  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >  		ret = -EINVAL;
> > @@ -1346,7 +1372,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	u32 lpfr;
> >  	int ret;
> >  
> > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -1414,6 +1440,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	/* Flash/Strobe controls */
> >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> >  
> > +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
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

