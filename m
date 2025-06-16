Return-Path: <linux-media+bounces-35009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E358FADBCB1
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 00:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFCB13AB255
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 22:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E2D226D18;
	Mon, 16 Jun 2025 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TDKuN8hZ"
X-Original-To: linux-media@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9111C2236FC
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750111932; cv=none; b=cRZc9Qk1fIAEsgG2K/J6W0DadUbCNSA6pTUF9ZVndd/jjM92MpnLyiPkBGAUC0EwMtgJugkibaRTcmqtCcgO7i+3mtoqTUSd3Z3eio4LsVznLd6FVX8S3L3v+EGea/xAUVRQ3QeaQtLv+LRXCukeiGlgxwqifH77aFfXnFQH/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750111932; c=relaxed/simple;
	bh=z27b+y8IAQVhC5dT+anpQ1qNUaOyNff9dkszwQOUIik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8aynFUGApU4v3dZ1dBpVZdOcelGgS58fQZLyF246efvzlokxsdaVD87yJELJxShFs82Rt9lCUiExmFH5+ZevSoWp8dCAy+yiKNZh+LvOjYpaJ03XOqdr/uUSXL6dpPInNoSD+p5yniFkR0Wdv878LXGeAyrFGS+XiuoTFoj914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TDKuN8hZ; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 17 Jun 2025 00:11:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pbm1b9LBgDfXKudtas1By4N/SakHI/JM8t8mVTU1hE=;
	b=TDKuN8hZ097Ub/FhBuz7VWmhzzl8zAWBw/2k5gomhb8wUCpfEaJg/xWigwZ/IhBMQIw6uV
	U8/3MH+9BxKcx9qcUPG9/wvUQyqrD+kRJOtPMQjAWkdNTCQu8p/2c8dMikTMaWii4ekyUV
	L+5FR3Ibm9e1uMvQTUhHBnHFaQtakFw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 08/10] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <iszi4xwmlefn2bz5k4kmlxqhcwrm7trzkr56z73rkwgbsj2e7u@rhxbkwaztrq6>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-8-72b299c1b7c9@linux.dev>
 <aDTOsR_ctSsySEsr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDTOsR_ctSsySEsr@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

thanks also for reviewing this patch :-)

On Mon, May 26, 2025 at 08:27:29PM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> On Wed, May 07, 2025 at 09:51:37AM +0200, Richard Leitner wrote:
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
> > index b6de96997426f7225a061bfdc841aa062e8d0891..0bbdf08d7cda8f72e05fdc292aa69a4c821e4e03 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -97,6 +97,10 @@
> >  #define OV9282_REG_MIPI_CTRL00	0x4800
> >  #define OV9282_GATED_CLOCK	BIT(5)
> >  
> > +/* Flash/Strobe control registers */
> > +#define OV9282_REG_FLASH_DURATION	0x3925
> > +#define OV9282_FLASH_DURATION_DEFAULT	0x0000001A
> 
> Lower case hexadecimals are preferred.

Sure. Will fix that in v5.

> 
> > +
> >  /* Input clock rate */
> >  #define OV9282_INCLK_RATE	24000000
> >  
> > @@ -687,6 +691,25 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> >  				current_val);
> >  }
> >  
> > +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
> 
> I'd use u32 for the value here.

Sounds legit. Will adapt that in v5.

> 
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
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -756,6 +779,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_FLASH_LED_MODE:
> >  		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
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
> > @@ -1418,6 +1444,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  			       (1 << V4L2_FLASH_LED_MODE_TORCH),
> >  			       V4L2_FLASH_LED_MODE_NONE);
> >  
> > +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > +			  0, 13900, 1, 8);
> 
> It'd be nice to calculate the limits based on the relevant parameters
> rather than use a hard-coded value here.

Ok :-)
I will send an updated v5 where the maximum flash duration is set to the
current exposure time in µs tomorrow.

> 
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

thanks & regards;rl

