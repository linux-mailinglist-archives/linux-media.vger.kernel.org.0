Return-Path: <linux-media+bounces-42020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31666B49076
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E683D34643B
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 13:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6D530C61C;
	Mon,  8 Sep 2025 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GbhZ0XD0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAD830C610;
	Mon,  8 Sep 2025 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339687; cv=none; b=tAznhjvPB4wSc8RjQAOlxOGdqgUztYUU8GYgwYSelftXV5R3fIaGrPqGxji7fm5T/VGz7hVQO26njsAQTujMnJxpZwHDWgUSj61GqutQB5AXw/HeawSIkjm0oHd8/JtTD6FZOkvYqWqX+r3zxYl1fZagpq70nJu0aYd3Uzo1G3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339687; c=relaxed/simple;
	bh=wHggapqJICaSM8/iNe9G74o9fPLBPTYrGqblVhG//7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iA44YUeI2ZuOGj6KOaZcyLnE7pzLOumyJAhBlCkre1g2Ecx6E3OZxvgQId8EVTnqS6vyz5s/2zUgO+XHOjfUNSIR+ip9i8h2qTGI3nEiWpeFvGxm6NqjrHz1ubhaXqKsoFGau9m9yxnS9p9WGodbha8f4rTlVAHqoY+ZVt7rU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GbhZ0XD0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-134-76-nat.elisa-mobile.fi [85.76.134.76])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 55B3B99F;
	Mon,  8 Sep 2025 15:53:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757339611;
	bh=wHggapqJICaSM8/iNe9G74o9fPLBPTYrGqblVhG//7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GbhZ0XD0hWKtHy4IpQ1dNRteB207gfeKbKmf9q6jJIcTHdh7hlb48H4xSSMcS2Y4V
	 xlacvt1rDEG0KLQOTQ5Yq/z6irQ+lurNBdZ5Tc273NufrkABRaFWdONrNH7e3mQ8wY
	 7fCljMjik0uyNkAK7LeyBGsoRsynLE40j7h2ge1E=
Date: Mon, 8 Sep 2025 15:54:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 07/10] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <20250908135421.GG26062@pendragon.ideasonboard.com>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-7-d58d5a694afc@linux.dev>
 <aLYISb07ziGDmFGS@kekkonen.localdomain>
 <uzgdukvgqkpg5koehz6kzxg6dfjes7p5ntd5oyqgqpr7gz5otd@ykwax6c2bo6x>
 <20250907201839.GC19568@pendragon.ideasonboard.com>
 <20250907202154.GE19568@pendragon.ideasonboard.com>
 <ylnynvtb6jpuvahyjvot4o7igkzikzrokhgjn4xsbyepidn22k@err5jg65ubfo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ylnynvtb6jpuvahyjvot4o7igkzikzrokhgjn4xsbyepidn22k@err5jg65ubfo>

On Mon, Sep 08, 2025 at 01:57:48PM +0200, Richard Leitner wrote:
> On Sun, Sep 07, 2025 at 10:21:54PM +0200, Laurent Pinchart wrote:
> > On Sun, Sep 07, 2025 at 10:18:40PM +0200, Laurent Pinchart wrote:
> > > On Wed, Sep 03, 2025 at 08:54:42AM +0200, Richard Leitner wrote:
> > > > On Mon, Sep 01, 2025 at 11:55:37PM +0300, Sakari Ailus wrote:
> > > > > On Mon, Sep 01, 2025 at 05:05:12PM +0200, Richard Leitner wrote:
> > > > > > Add V4L2_CID_FLASH_DURATION support using the "strobe_frame_span"
> > > > > > feature of the sensor. This is implemented by transforming the given µs
> > > > > > value by an interpolated formula to a "span step width" value and
> > > > > > writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
> > > > > > PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).
> > > 
> > > You name the register OV9282_REG_FLASH_DURATION below. Is
> > > "FLASH_DURATION" a term found in the datasheet ?
> 
> No, the datasheet named the registers strobe_frame_span. I guess it may
> be clearer to name it OV9282_REG_STROBE_FRAME_SPAN then... I will update
> the series accordingly. Thanks for the catch!
> 
> > > > > > 
> > > > > > The maximum control value is set to the period of the current default
> > > > > > framerate.
> > > 
> > > Should it be adjusted based on the sensor configuration ?
> > 
> > I've now noticed patch 10/10.
> 
> Is this a problem? Should those patches be merged? The reason for this
> being a separate patch is it based on review by Sakari and therefore
> joined the series in v4. I left it in a separate patch as IMHO it's
> easier to review this way. But I'm open for merging it into this one if
> that's preferred.

It's fine as a separate patch.

> > > > > > 
> > > > > > All register values are based on the OV9281 datasheet v1.53 (jan 2019)
> > > > > > and tested using an ov9281 VisionComponents module.
> > > > > > 
> > > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > > ---
> > > > > >  drivers/media/i2c/ov9282.c | 31 ++++++++++++++++++++++++++++++-
> > > > > >  1 file changed, 30 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > > > index ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb..c405e3411daf37cf98d5af3535702f8321394af5 100644
> > > > > > --- a/drivers/media/i2c/ov9282.c
> > > > > > +++ b/drivers/media/i2c/ov9282.c
> > > > > > @@ -97,6 +97,10 @@
> > > > > >  #define OV9282_REG_MIPI_CTRL00	0x4800
> > > > > >  #define OV9282_GATED_CLOCK	BIT(5)
> > > > > >  
> > > > > > +/* Flash/Strobe control registers */
> > > > > > +#define OV9282_REG_FLASH_DURATION	0x3925
> > > > > > +#define OV9282_FLASH_DURATION_DEFAULT	0x0000001a
> > > > > > +
> > > > > >  /* Input clock rate */
> > > > > >  #define OV9282_INCLK_RATE	24000000
> > > > > >  
> > > > > > @@ -687,6 +691,25 @@ static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool en
> > > > > >  				current_val);
> > > > > >  }
> > > > > >  
> > > > > > +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> > > > > > +{
> > > > > > +	/*
> > > > > > +	 * Calculate "strobe_frame_span" increments from a given value (µs).
> > > > > > +	 * This is quite tricky as "The step width of shift and span is
> > > > > > +	 * programmable under system clock domain.", but it's not documented
> > > > > > +	 * how to program this step width (at least in the datasheet available
> > > > > > +	 * to the author at time of writing).
> > > > > > +	 * The formula below is interpolated from different modes/framerates
> > > > > > +	 * and should work quite well for most settings.
> > > > > > +	 */
> > > > > > +	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> > > 
> > > I wonder if the register value ends up being expressed as a number of
> > > lines.
> 
> I'm not sure... As mentioned in the comment this is not clearly
> documented in the datasheet. Tbh, I don't think it's "number of lines",
> but I can do some more measurements just to be sure...

Based on the above formula, the register value is

	val = time (s) * 192e6 / line length

I would guess that the pixel rate is 192MPixel/s, which would lead to
the the register value expressed as a number of lines.

> > > > > > +
> > > > > > +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
> > > > > > +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
> > > > > > +	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 2, 1, (val >> 8) & 0xff);
> > > > > > +	return ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 3, 1, val & 0xff);
> > > 
> > > The CCI helpers would make this much simpler.
> 
> As mentioned in the cover letter I'm planning to do the migration to
> v4l2-cci helpers in a seprate series. If that's fine with you I prefer
> to stick to this plan :)

That's all fine. Thank you for the continuous improvements to the driver
:-)

> > > > > The bitwise and operation is redundant.
> > > > 
> > > > True. Thanks for the catch!
> > > > 
> > > > > Could you do this in a single write?
> > > > 
> > > > I've implemented this in single byte writes due to some "special
> > > > behaviour" of the vision components ov9281 modules. On those modules
> > > > single byte interactions seem broken in some cases. Maybe Laurent knows
> > > > more about this and the current state, as he was/is in contact with VC.
> > > > 
> > > > See also: https://lore.kernel.org/all/918ce2ca-55ff-aff8-ea6c-0c17f566d59d@online.de/
> > > > 
> > > > Nonetheless, thanks for the pointer. I haven't documented this
> > > > accordingly. I will try to reproduce the issue again and either change
> > > > this to a single write or add a describing comment.
> > > > 
> > > > > Also error handling is (largely) missing.
> > > > 
> > > > Good catch. Thanks.
> > > > 
> > > > > > +}
> > > > > > +
> > > > > >  /**
> > > > > >   * ov9282_set_ctrl() - Set subdevice control
> > > > > >   * @ctrl: pointer to v4l2_ctrl structure
> > > > > > @@ -756,6 +779,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > > >  	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
> > > > > >  		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
> > > > > >  		break;
> > > > > > +	case V4L2_CID_FLASH_DURATION:
> > > > > > +		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
> > > > > > +		break;
> > > > > >  	default:
> > > > > >  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> > > > > >  		ret = -EINVAL;
> > > > > > @@ -1346,7 +1372,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > > > > >  	u32 lpfr;
> > > > > >  	int ret;
> > > > > >  
> > > > > > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> > > > > > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> > > > > >  	if (ret)
> > > > > >  		return ret;
> > > > > >  
> > > > > > @@ -1414,6 +1440,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > > > > >  	/* Flash/Strobe controls */
> > > > > >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> > > > > >  
> > > > > > +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > > > > > +			  0, 13900, 1, 8);
> > > > > > +
> > > > > >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> > > > > >  	if (!ret) {
> > > > > >  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
Regards,

Laurent Pinchart

