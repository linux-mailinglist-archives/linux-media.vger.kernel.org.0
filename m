Return-Path: <linux-media+bounces-25981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A09A30432
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC069163048
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 07:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4B71EA7E3;
	Tue, 11 Feb 2025 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SPCboFdW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633726BDB6;
	Tue, 11 Feb 2025 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257865; cv=none; b=cctuK8qpiE+fkW7Ehcg1tZNmH4L9h3Xk0NSElEV4ltqihz2UhqCr8FiZPP/GpkNgKQSj+66q4lEDS8LPxphR2VPxnxQZwi8fKXxjq/7H6l037vk2ZfsPtmQ/BFzo0DjZDD88mUPkfrWxZQVaK5kia2qlvY52MPeMrHrFl6Szrk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257865; c=relaxed/simple;
	bh=+j03FWY7yQm+Yif8GM04TVLM//R9bsc2EP03dfu5lSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7sV9E/3VfmrP5TwrowDbi3Ze8wwTPbvmF002AL0D70nWFfNAAUQemsVgb3JXRKfL/pdakY66osA8lTTLvVjZIEnTUQcNp5Tmq/6psWpKiE6UcprqWuZzekeSAfERAmyuS8zKb5CIS7UyBtnB3jgUr5lqhr+ClFG3PpRPlPT88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SPCboFdW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:30ee:391a:e4dd:1a49:e64:7c19])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54B0322E;
	Tue, 11 Feb 2025 08:09:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739257783;
	bh=+j03FWY7yQm+Yif8GM04TVLM//R9bsc2EP03dfu5lSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPCboFdWQIEmg86bTocoVw0fONJhd5A3QMXjpOBPEL6xLN0hmNMv95HbMJKVeUp3q
	 CZnTuFTpJcAxpihD7Sadj19TQagQ16YkoLolt6dGANWV11EYGoSoYcfc3NyM3natLK
	 x68//ozcnnJ8J3OHCNtrD10HbFF/x26h1vXo0vOA=
Date: Tue, 11 Feb 2025 12:40:48 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v6 5/5] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <skh5wuyyy7fl7ni7ep34pcssrhz3ww2bi2jrmscpj34bitntcq@57zyehidlqr7>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
 <20250204-imx219_fixes-v6-5-84ffa5030972@ideasonboard.com>
 <ubuuob7mb3o5bxoumrxv4rufutgk3lvdmdery6d3bfc6rytfti@tcchhlechzzp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ubuuob7mb3o5bxoumrxv4rufutgk3lvdmdery6d3bfc6rytfti@tcchhlechzzp>

Hi Jacopo,

On Feb 07, 2025 at 17:49:19 +0100, Jacopo Mondi wrote:
> Hi Jai
> 
> On Tue, Feb 04, 2025 at 12:34:40PM +0530, Jai Luthra wrote:
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
> >  drivers/media/i2c/imx219.c | 126 +++++++++++++++++++++++++++++----------------
> >  1 file changed, 81 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index e4aa6e66b673bb7a8942bf8daf27267c2884ec95..c445987de2c3e933ea9c49ba3e00a15663ef5f2e 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -144,6 +144,12 @@
> >  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
> >  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> >
> > +enum binning_mode {
> > +	BINNING_NONE = IMX219_BINNING_NONE,
> > +	BINNING_X2 = IMX219_BINNING_X2,
> > +	BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
> > +};
> > +
> >  /* Mode : resolution and related config&values */
> >  struct imx219_mode {
> >  	/* Frame width */
> > @@ -295,13 +301,13 @@ static const struct imx219_mode supported_modes[] = {
> >  		.fll_def = 1707,
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
> > @@ -356,6 +362,59 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
> >  	return imx219_mbus_formats[i];
> >  }
> >
> > +static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
> > +{
> > +	switch (format->code) {
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		return 8;
> > +
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +	default:
> > +		return 10;
> > +	}
> > +}
> 
> Is this change related ?
> 

Ah I think I split it out as a separate function during a previous 
iteration, but it is not really needed anymore.

> > +
> > +static enum binning_mode imx219_get_binning(struct imx219 *imx219, u8 *bin_h,
> > +					    u8 *bin_v)
> > +{
> > +	struct v4l2_subdev_state *state =
> > +		v4l2_subdev_get_locked_active_state(&imx219->sd);
> > +	const struct v4l2_mbus_framefmt *format =
> > +		v4l2_subdev_state_get_format(state, 0);
> > +	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
> > +
> > +	*bin_h = crop->width / format->width;
> > +	*bin_v = crop->height / format->height;
> > +
> > +	if (*bin_h == 2 && *bin_v == 2)
> > +		return BINNING_ANALOG_X2;
> > +	else if (*bin_h == 2 || *bin_v == 2)
> > +		/*
> > +		 * Don't use analog binning if only one dimension
> > +		 * is binned, as it crops the other dimension
> > +		 */
> > +		return BINNING_X2;
> > +	else
> > +		return BINNING_NONE;
> 
> This function is used in two places, for two different reasons:
> 
> 1) in imx219_get_rate_factor() to know if ANALOG is used
> 2) in imx219_set_framefmt() to calculate what value to write to the
> horizontal/vertical registers
> 
> We now know that ANALOG binning is either applied to both horizontal
> and vertical directions or it is not activated at all.
> 
> I wonder if you should do here
> 
>         u32 hbin = crop->width / format->width;
>         u32 vbin = crop->height / format->height;
> 
>         *h_bin = IMX219_BINNING_NONE;
>         *v_bin = IMX219_BINNING_NONE;
> 
>         /*
>          * Use analog binning if only both dimensions are binned, as the
>          * other dimension is cropped.
>          */
>         if (hbin == 2 && vbin == 2) {
>                 *h_bin = IMX219_BINNING_X2_ANALOG;
>                 *v_bin = IMX219_BINNING_X2_ANALOG;
> 
>                 return;
>         }
> 
>         if (hbin == 2)
>                 *h_bin = IMX219_BINNING_X2;
>         if (vbin == 2)
>                 *v_bin = IMX219_BINNING_X2;
> 
>         return;
> 
> And make the two callers
> 
> imx219_set_framefmt()
> 	imx219_get_binning(imx219, &bin_h, &bin_v);
> 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret)
> 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> 
> imx219_get_rate_factor()
> 	imx219_get_binning(imx219, &bin_h, &bin_v);
> 
>         return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
> 

Looking at it from scratch, that does look much cleaner way to handle 
it. Will do in next revision.

Thanks for the review.

> 
> You could probably get rid of the enum in this way.
> 
> Just a small suggestion
> 
> 
> > +}
> > +
> > +static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
> > +{
> > +	u8 bin_h, bin_v;
> > +	enum binning_mode binning = imx219_get_binning(imx219, &bin_h, &bin_v);
> > +
> > +	if (binning == BINNING_ANALOG_X2)
> > +		return 2;
> > +
> > +	return 1;
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Controls
> >   */
> > @@ -367,10 +426,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
> > @@ -399,7 +460,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_EXPOSURE:
> >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -			  ctrl->val, &ret);
> > +			  ctrl->val / rate_factor, &ret);
> >  		break;
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -416,7 +477,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_VBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > -			  format->height + ctrl->val, &ret);
> > +			  (format->height + ctrl->val) / rate_factor, &ret);
> 
> 
> Isn't this (and exposure) compensatd by the doubled pixel rate ?
> 
> Applications use the pixel rate to compute the line duration and from
> there transform the frame duration and the exposure in lines, don't
> they ?
> 
> Overall, very nice to be able to double the achievable frame rate
> without any artifacts! Good job!
> 
> Thanks
>   j
> 
> >  		break;
> >  	case V4L2_CID_HBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > @@ -587,29 +648,14 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  {
> >  	const struct v4l2_mbus_framefmt *format;
> >  	const struct v4l2_rect *crop;
> > -	unsigned int bpp;
> > -	u64 bin_h, bin_v;
> > +	enum binning_mode binning;
> > +	u8 bin_h, bin_v;
> > +	u32 bpp;
> >  	int ret = 0;
> >
> >  	format = v4l2_subdev_state_get_format(state, 0);
> >  	crop = v4l2_subdev_state_get_crop(state, 0);
> > -
> > -	switch (format->code) {
> > -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > -		bpp = 8;
> > -		break;
> > -
> > -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > -	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > -	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > -	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > -	default:
> > -		bpp = 10;
> > -		break;
> > -	}
> > +	bpp = imx219_get_format_bpp(format);
> >
> >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> >  		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > @@ -620,28 +666,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
> > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> > +	binning = imx219_get_binning(imx219, &bin_h, &bin_v);
> > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
> > +		  (bin_h == 2) ? binning : BINNING_NONE, &ret);
> > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
> > +		  (bin_v == 2) ? binning : BINNING_NONE, &ret);
> >
> >  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> >  		  format->width, &ret);
> > @@ -846,6 +875,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  		int exposure_max;
> >  		int exposure_def;
> >  		int hblank;
> > +		int pixel_rate;
> >
> >  		/* Update limits and set FPS to default */
> >  		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > @@ -874,6 +904,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  					 IMX219_LLP_MAX - mode->width, 1,
> >  					 IMX219_LLP_MIN - mode->width);
> >  		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > +
> > +		/* Scale the pixel rate based on the mode specific factor */
> > +		pixel_rate = imx219_get_pixel_rate(imx219) *
> > +			     imx219_get_rate_factor(imx219);
> > +		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > +					 pixel_rate, 1, pixel_rate);
> >  	}
> >
> >  	return 0;
> >
> > --
> > 2.48.1
> >

--
Jai

