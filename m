Return-Path: <linux-media+bounces-33519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEBEAC68FB
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 14:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9671EA20D24
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 12:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680F4283CBF;
	Wed, 28 May 2025 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="btONvrwB"
X-Original-To: linux-media@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E21531E3
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434552; cv=none; b=KKoX+cGZujxcztbcV2UqgiHgq03pT38pkrGJ4DLHcKczlTQMTeeTx99KwoJOJCaX+d89yZVtQOrUR5zCxNdUnfUj7gGYiVqAvL1cO2ZM/UNuP6jQncd2c7vg4W1DNX0JjI24H9LhIYS8TO9JN6I1D7FGETx0VjJusz/9EYYsj+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434552; c=relaxed/simple;
	bh=anNOxNhTmr/QW22GBuugjQkfUTz6mqXQB+pAiBjysSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWHMCYuItgVXb0uahmwBIs/ER37IHG4xGW4qnM7YaDdQQNsy7cI4sIx4xVxFT5KaBa70RzrJJ1beXi/KAnx/HMDCI1zxn973+B7UlOGWD1RujSrq28iqd6hL8Pp13A/RezuOUHkkqnMPB3NAAdacVcH5d6nWtTqeaYbjnwjMvP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=btONvrwB; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 28 May 2025 14:15:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748434538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F5dbCg1gXdtP3wVHnkQdduOjmohgVv2E1pqRMKiFkFE=;
	b=btONvrwBrnIzQe3VF8Tz5lvz+LWsW0C9DgizsnehcMNebYn74vVCsrE6oVFe1PZKGDhCgS
	Xffdnp0Odh9Xk74GrYpqNHsP75mTQ9qqJQEBavrD1pNy7trG2g8glPaUvJp52AepkcyIDd
	yn5mQNpmt46mmzncsfYo4foEJU0ru9o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 07/10] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <ns3aybw7nvxrcowprdwbwcn6zpuybkbfmtv44emy567dryszih@yp4hgpgtbvnt>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-7-72b299c1b7c9@linux.dev>
 <aDTR5JrYIvj2gxHR@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDTR5JrYIvj2gxHR@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Mon, May 26, 2025 at 08:41:08PM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> On Wed, May 07, 2025 at 09:51:36AM +0200, Richard Leitner wrote:
> > Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> > feature of the sensor. This implements following modes:
> 
> The flash LED mode control is, well, setting the flash LED mode. There's no
> LED on the sensor so I think I'd add a new control for this.
> 
> I'd call it V4L2_FLASH_LED_STROBE_ENABLE, and make it a boolean control.
> 
> (My apologies for not giving a better review for this set earlier on.)

No problem. I'm open for discussions all the time ;-)

I'm basically fine with renaming this, but is there any benefit we get
by introducing such a new control?

IMHO V4L2_CID_FLASH_LED_MODE and V4L2_FLASH_LED_STROBE_ENABLE sound
pretty similar and I'm not sure this is "worth" a new v4l2 control.

But of course, you guys are the domain expert, so please feel free to
"overrule" my gut feeling. ;-)

> 
> How does this sensor make use the information? E.g. what's the latching
> point this setting in relation to a given frame?

I'm not sure if I understand you correctly, but the strobe pulse
"starting time" is configurable using registers on the sensor. To keep
this patchset small I've decided to not include this
"strobe_frame_shift" setting (which may be positive or negative) here.

Nonetheless I'm planning to send another series adding more features of
the sensors as soon as this got merged.

IMHO we would need another new v4l2 control for this then (something
like V4L2_FLASH_LED_STROBE_SHIFT).

Does that answer your question?

> 
> > 
> >  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
> >  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
> > 
> > All values are based on the OV9281 datasheet v1.53 (january 2019) and
> > tested using an ov9281 VisionComponents module.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index f42e0d439753e74d14e3a3592029e48f49234927..b6de96997426f7225a061bfdc841aa062e8d0891 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> >  				current_val);
> >  }
> >  
> > +static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> > +{
> > +	u32 current_val;
> > +	int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > +				  &current_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (mode == V4L2_FLASH_LED_MODE_FLASH)
> > +		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
> > +	else
> > +		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
> > +
> > +	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > +				current_val);
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -736,6 +753,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
> >  				       (ctrl->val + ov9282->cur_mode->width) >> 1);
> >  		break;
> > +	case V4L2_CID_FLASH_LED_MODE:
> > +		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
> > +		break;
> >  	default:
> >  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >  		ret = -EINVAL;
> > @@ -1326,7 +1346,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	u32 lpfr;
> >  	int ret;
> >  
> > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -1391,6 +1411,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  						OV9282_TIMING_HTS_MAX - mode->width,
> >  						1, hblank_min);
> >  
> > +	/* Flash/Strobe controls */
> > +	v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> > +			       V4L2_CID_FLASH_LED_MODE,
> > +			       V4L2_FLASH_LED_MODE_TORCH,
> > +			       (1 << V4L2_FLASH_LED_MODE_TORCH),
> > +			       V4L2_FLASH_LED_MODE_NONE);
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

