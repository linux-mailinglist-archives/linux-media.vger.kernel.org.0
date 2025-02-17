Return-Path: <linux-media+bounces-26223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6654A3881A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 16:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 790471885C13
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 15:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A797F2253A5;
	Mon, 17 Feb 2025 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y2+mMyHY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1781C216600;
	Mon, 17 Feb 2025 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807298; cv=none; b=UMPlTju6Q3QDIKp+myKIda9ZPku4tqLI9Gj8uYDjNk+S+7F8as14aG0yD31GiJZ/wI2coLwOSLMrCi4zX41UFZUEjgfE9bsVpue//eGJDUc4wD/DJZ9aIAKhTvYjRIlpQHYVRQ0IdsJRN27q7kUyHZQ3mQXC8qqCwhwlc+1CVgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807298; c=relaxed/simple;
	bh=9axMPKOkbMsm7Rwf7o5OUBQXDBtmoYsqMxGtFJ9pkxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/yudyeIKxkBxXMGqQsp/9d+lj2CxrS4DaLHPysMKOXyFGPF1PaaSe8i+CabkDWp5lEWc9g4mBXSVjIXky6pZXpOeEwFhrmBR4e+RwnuGeCeAVRI7n8Egy/EQhT9/hisG6By9uQmEZMZK8mbGOGlS+c92CK01EH8hBLKUPyYk44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y2+mMyHY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.185])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF901D53;
	Mon, 17 Feb 2025 16:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739807210;
	bh=9axMPKOkbMsm7Rwf7o5OUBQXDBtmoYsqMxGtFJ9pkxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2+mMyHYLLdfHlGvI/nHlzIO4wUU4Hs1OgbffqDITwZ/1Vkn9mzZjPPkDSTszQOeW
	 7h4SyySGFDfeh6y6tqVDc55PEVTsrWnDoX63wkSIjZW255Vpd+l2k87fGGLaElQwou
	 wtkA4DrYe6xhEudSoSEOT+zRsOGfm8CZtgHcOnk0=
Date: Mon, 17 Feb 2025 21:17:57 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v7 5/5] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <zrjuuu5fwjnao5zgrofbu5yygl4zsk3dgzi232cmxecnq7n3mt@urv3f2guttus>
References: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
 <20250217-imx219_fixes-v7-5-83c3c63b737e@ideasonboard.com>
 <sejl7xskif6rlpdsg3jhczjwe5gi6rs53ehbyka6omv2zeg7qq@4iis7i2lla5p>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sejl7xskif6rlpdsg3jhczjwe5gi6rs53ehbyka6omv2zeg7qq@4iis7i2lla5p>

Hi Jacopo,

Thanks for the review.

On Feb 17, 2025 at 15:38:12 +0100, Jacopo Mondi wrote:
> Hi Jai
> 
> On Mon, Feb 17, 2025 at 06:57:35PM +0530, Jai Luthra wrote:
> > When the analog binning mode is used for high framerate operation, the
> > pixel rate is effectively doubled. Account for this when setting up the
> > pixel clock rate, and applying the vblank and exposure controls.
> >
> > The previous logic only used analog binning for RAW8, but normal binning
> > limits the framerate on RAW10 480p [1]. So with this patch we switch to
> > using special binning (with 2x pixel rate) wherever possible.
> >
> > [1]: https://github.com/raspberrypi/linux/issues/5493
> >
> > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 80 +++++++++++++++++++++++++++++++---------------
> >  1 file changed, 54 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 418f88386659d494ff674d64ed69b8441d1ee2cd..f97abcc5703ea32f1d6f19a4c0a671a7e978a974 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -296,13 +296,13 @@ static const struct imx219_mode supported_modes[] = {
> >  		.fll_def = 1763,
> >  	},
> >  	{
> > -		/* 2x2 binned 30fps mode */
> > +		/* 2x2 binned 60fps mode */
> >  		.width = 1640,
> >  		.height = 1232,
> >  		.fll_def = 1707,
> >  	},
> >  	{
> > -		/* 640x480 30fps mode */
> > +		/* 640x480 60fps mode */
> >  		.width = 640,
> >  		.height = 480,
> >  		.fll_def = 1707,
> > @@ -357,6 +357,45 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
> >  	return imx219_mbus_formats[i];
> >  }
> >
> > +static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
> > +{
> > +	struct v4l2_subdev_state *state =
> > +		v4l2_subdev_get_locked_active_state(&imx219->sd);
> > +	const struct v4l2_mbus_framefmt *format =
> > +		v4l2_subdev_state_get_format(state, 0);
> > +	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
> > +	u32 hbin = crop->width / format->width;
> > +	u32 vbin = crop->height / format->height;
> > +
> > +	*bin_h = IMX219_BINNING_NONE;
> > +	*bin_v = IMX219_BINNING_NONE;
> > +
> > +	/*
> > +	 * Use analog binning only if both dimensions are binned, as it crops
> > +	 * the other dimension.
> > +	 */
> > +	if (hbin == 2 && vbin == 2) {
> > +		*bin_h = IMX219_BINNING_X2_ANALOG;
> > +		*bin_v = IMX219_BINNING_X2_ANALOG;
> > +
> > +		return;
> > +	}
> > +
> > +	if (hbin == 2)
> > +		*bin_h = IMX219_BINNING_X2;
> > +	if (vbin == 2)
> > +		*bin_v = IMX219_BINNING_X2;
> > +}
> > +
> > +static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
> > +{
> > +	u8 bin_h, bin_v;
> > +
> > +	imx219_get_binning(imx219, &bin_h, &bin_v);
> > +
> > +	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Controls
> >   */
> > @@ -368,10 +407,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >  	const struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_subdev_state *state;
> > +	u32 rate_factor;
> >  	int ret = 0;
> >
> >  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> >  	format = v4l2_subdev_state_get_format(state, 0);
> > +	rate_factor = imx219_get_rate_factor(imx219);
> >
> >  	if (ctrl->id == V4L2_CID_VBLANK) {
> >  		int exposure_max, exposure_def;
> > @@ -400,7 +441,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_EXPOSURE:
> >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -			  ctrl->val, &ret);
> > +			  ctrl->val / rate_factor, &ret);
> >  		break;
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -417,7 +458,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_VBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > -			  format->height + ctrl->val, &ret);
> > +			  (format->height + ctrl->val) / rate_factor, &ret);
> >  		break;
> >  	case V4L2_CID_HBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > @@ -589,7 +630,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  	const struct v4l2_mbus_framefmt *format;
> >  	const struct v4l2_rect *crop;
> >  	unsigned int bpp;
> > -	u64 bin_h, bin_v;
> > +	u8 bin_h, bin_v;
> >  	int ret = 0;
> >
> >  	format = v4l2_subdev_state_get_format(state, 0);
> > @@ -602,7 +643,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  	case MEDIA_BUS_FMT_SBGGR8_1X8:
> >  		bpp = 8;
> >  		break;
> > -
> >  	case MEDIA_BUS_FMT_SRGGB10_1X10:
> >  	case MEDIA_BUS_FMT_SGRBG10_1X10:
> >  	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > @@ -621,26 +661,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> >  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> >
> > -	switch (crop->width / format->width) {
> > -	case 1:
> > -	default:
> > -		bin_h = IMX219_BINNING_NONE;
> > -		break;
> > -	case 2:
> > -		bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > -		break;
> > -	}
> > -
> > -	switch (crop->height / format->height) {
> > -	case 1:
> > -	default:
> > -		bin_v = IMX219_BINNING_NONE;
> > -		break;
> > -	case 2:
> > -		bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > -		break;
> > -	}
> > -
> > +	imx219_get_binning(imx219, &bin_h, &bin_v);
> >  	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> >  	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> >
> > @@ -847,6 +868,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  		int exposure_max;
> >  		int exposure_def;
> >  		int hblank, llp_min;
> > +		int pixel_rate;
> >
> >  		/* Update limits and set FPS to default */
> >  		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > @@ -882,6 +904,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  		 */
> >  		hblank = prev_line_len - mode->width;
> >  		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > +
> > +		/* Scale the pixel rate based on the mode specific factor */
> > +		pixel_rate = imx219_get_pixel_rate(imx219) *
> > +			     imx219_get_rate_factor(imx219);
> 
> Is this correct ? imx219_set_pad_format() operates a subdev state,
> while imx219_get_rate_factor() always operate on the active state.
> 
> It could be argued that controls are always 'active' so using the
> 'active' state for both imx219_get_pixel_rate() and
> imx219_get_rate_factor() is ok.
> 
> However I would rather pass to imx219_get_rate_factor() the current subdev
> state and pass it to imx219_get_binning() as well.
> 

Yeah I assumed the pixel rate control only matters when changing the 
active state, but agree that it is cleaner to pass around the subdev 
state instead of the full internal struct as we only care about format 
and resolution for binning calculations.

Will update in next revision.

> With this
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
> > +		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > +					 pixel_rate, 1, pixel_rate);
> >  	}
> >
> >  	return 0;
> >
> > --
> > 2.48.1
> >
> >

-- 
Thanks,
Jai

