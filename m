Return-Path: <linux-media+bounces-22086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0679D99B4
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 15:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CB3A28310B
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 14:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CE81D5CD7;
	Tue, 26 Nov 2024 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4PxRDSx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49578BE46;
	Tue, 26 Nov 2024 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732631792; cv=none; b=ajQ2IrUaoHtKG4WPRwGlLXxJnpnozBxuYVguzdRTa4wCDcATf51upkBXY6jgtiQWw6NT/LDdOI6y8FsYo8TATpqtMeabyD3sToxmATgFAui7XIj1GXQ8CFxP2glGP/NiDaH1KwlYzlf3D0Q4FoEfHM3cOCKLt6xbJ0fRDayMKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732631792; c=relaxed/simple;
	bh=JzXU9P99AoLbjBAGR3owoxTTsTfX3Nf4vjrC0RWhLP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hl6yW9Q8/ULseSpfpfyfAk0M6aCFZAZUtKfKunqqYRpMd+3idXNW0Ge/LAICjIl8V7sRC4RNfya2ZZzKrs6NAua1RyvvxpS7zqJ7IULyG1cyl4sZsH23WYoccTT+HSRNcsGNtkbKyQxsuCmKBrbFSy+p0xzHd9dGZvGGoxITBrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4PxRDSx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732631790; x=1764167790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JzXU9P99AoLbjBAGR3owoxTTsTfX3Nf4vjrC0RWhLP8=;
  b=F4PxRDSx81A22eIT4mydQPZczfsjBlA9xdCaUJf1NTgD4mqnsJHr0p12
   GkSEatmLMOHgRx5s2GWtqBOAQ3eQgYmw3Zh+4ZjjzWuWKnMmv7XHCfzFN
   B9mXHP2qo9J7/rbh6GBFpBqZRVDjkfK0B3HQVnMOKzgTaTwFk96EpIRKP
   PxGM9HuXH2npDWgWfT7SX+S8+j2YBZhi+AIGsTaeAZEqeeyEpEpr1SmZ5
   06UB8MTrOdfXhqI12yqHvpxT5veiGJlW8F1DwSs+UUC8NQmGNKjYEMY0X
   TwIrSukFGUMqIL3VzivhQHmx7dqlMRVQNxJM8FEVDY5L+8n1RUv18ftcd
   Q==;
X-CSE-ConnectionGUID: Yog4g+YHR3OaOnvjPbBkcg==
X-CSE-MsgGUID: W90zYwE1RvCYImoaH/mkEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36721744"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="36721744"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 06:36:29 -0800
X-CSE-ConnectionGUID: TysiTX2+TTOav5xFiJH8Vg==
X-CSE-MsgGUID: q5eQ2L3yTROPnkk4j9RfSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="91249597"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 06:36:27 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DC4C011F89A;
	Tue, 26 Nov 2024 16:36:24 +0200 (EET)
Date: Tue, 26 Nov 2024 14:36:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v3 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <Z0Xc6FYyYdLTUfll@kekkonen.localdomain>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
 <20241125-imx219_fixes-v3-3-434fc0b541c8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125-imx219_fixes-v3-3-434fc0b541c8@ideasonboard.com>

Hi Jai,

On Mon, Nov 25, 2024 at 08:36:27PM +0530, Jai Luthra wrote:
> When the analog binning mode is used for high framerate operation,
> the pixel rate is effectively doubled. Account for this when setting up
> the pixel clock rate, and applying the vblank and exposure controls.
> 
> The previous logic only used analog binning for 8-bit modes, but normal
> binning limits the framerate on 10-bit 480p [1]. So with this patch we
> switch to using special binning (with 2x pixel rate) for all formats of
> 480p mode and 8-bit 1232p.
> 
> [1]: https://github.com/raspberrypi/linux/issues/5493
> 
> Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 120 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 970e6362d0ae3a9078daf337155e83d637bc1ca1..39b85cdee58318b080c867afd68ca33d14d3eda7 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -149,6 +149,12 @@
>  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
>  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
>  
> +enum binning_mode {
> +	BINNING_NONE = IMX219_BINNING_NONE,
> +	BINNING_X2 = IMX219_BINNING_X2,
> +	BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
> +};
> +
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
>  	/* Frame width */
> @@ -337,6 +343,10 @@ struct imx219 {
>  
>  	/* Two or Four lanes */
>  	u8 lanes;
> +
> +	/* Binning mode */
> +	enum binning_mode bin_h;
> +	enum binning_mode bin_v;
>  };
>  
>  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> @@ -362,6 +372,36 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
>  	return imx219_mbus_formats[i];
>  }
>  
> +static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
> +{
> +	switch (format->code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		return 8;
> +
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	default:
> +		return 10;
> +	}
> +}
> +
> +static int imx219_get_rate_factor(struct imx219 *imx219)
> +{
> +	switch (imx219->bin_v) {
> +	case BINNING_NONE:
> +	case BINNING_X2:
> +		return 1;
> +	case BINNING_ANALOG_X2:
> +		return 2;

FWIW, what the CCS driver does is that it exposes different horizontal
blanking ranges for devices that use analogue binning. The rate is really
about reading pixels and with analogue binning the rate is the same, it's
just that fewer pixels are being (digitally) read (as they are binned). I
wonder if this would be a workable approach for this sensor, too. Of course
if the LLP behaves differently for this sensor, then we should probably
just accept that.

> +	}
> +	return -EINVAL;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Controls
>   */
> @@ -373,10 +413,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>  	const struct v4l2_mbus_framefmt *format;
>  	struct v4l2_subdev_state *state;
> +	int rate_factor;

u32?

>  	int ret = 0;
>  
>  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
>  	format = v4l2_subdev_state_get_format(state, 0);
> +	rate_factor = imx219_get_rate_factor(imx219);
>  
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		int exposure_max, exposure_def;
> @@ -405,7 +447,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_EXPOSURE:
>  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> -			  ctrl->val, &ret);
> +			  ctrl->val / rate_factor, &ret);

Isn't the exposure in lines? It shouldn't be affected by the rate change,
shouldn't it?

>  		break;
>  	case V4L2_CID_DIGITAL_GAIN:
>  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> @@ -422,7 +464,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_VBLANK:
>  		cci_write(imx219->regmap, IMX219_REG_VTS,
> -			  format->height + ctrl->val, &ret);
> +			  (format->height + ctrl->val) / rate_factor, &ret);

The same for vertical blanking.

>  		break;
>  	case V4L2_CID_HBLANK:
>  		cci_write(imx219->regmap, IMX219_REG_HTS,
> @@ -463,7 +505,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
>  
>  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
>  {
> -	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
> +	return ((imx219->lanes == 2) ? IMX219_PIXEL_RATE :
> +		IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
>  }
>  
>  /* Initialize control handlers */
> @@ -592,29 +635,12 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  {
>  	const struct v4l2_mbus_framefmt *format;
>  	const struct v4l2_rect *crop;
> -	unsigned int bpp;
> -	u64 bin_h, bin_v;
> +	u32 bpp;
>  	int ret = 0;
>  
>  	format = v4l2_subdev_state_get_format(state, 0);
>  	crop = v4l2_subdev_state_get_crop(state, 0);
> -
> -	switch (format->code) {
> -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> -		bpp = 8;
> -		break;
> -
> -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> -	case MEDIA_BUS_FMT_SGRBG10_1X10:
> -	case MEDIA_BUS_FMT_SGBRG10_1X10:
> -	case MEDIA_BUS_FMT_SBGGR10_1X10:
> -	default:
> -		bpp = 10;
> -		break;
> -	}
> +	bpp = imx219_get_format_bpp(format);
>  
>  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
>  		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> @@ -625,28 +651,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
>  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
>  
> -	switch (crop->width / format->width) {
> -	case 1:
> -	default:
> -		bin_h = IMX219_BINNING_NONE;
> -		break;
> -	case 2:
> -		bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> -		break;
> -	}
> -
> -	switch (crop->height / format->height) {
> -	case 1:
> -	default:
> -		bin_v = IMX219_BINNING_NONE;
> -		break;
> -	case 2:
> -		bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> -		break;
> -	}
> -
> -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->bin_h, &ret);
> +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->bin_v, &ret);

Please run:

$ ./scripts/checkpatch.pl --strict --max-line-length=80

>  
>  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
>  		  format->width, &ret);
> @@ -851,6 +857,27 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  		int exposure_max;
>  		int exposure_def;
>  		int hblank;
> +		int pixel_rate;
> +		u32 bpp = imx219_get_format_bpp(format);
> +		enum binning_mode binning = BINNING_NONE;
> +
> +		/*
> +		 * For 8-bit formats, analog horizontal binning is required,
> +		 * else the output image is garbage.
> +		 * For 10-bit formats, analog horizontal binning is optional,
> +		 * but still useful as it doubles the effective framerate.
> +		 * We can only use it with width <= 1624, as for higher values
> +		 * there are blocky artefacts.

This comment would benefit from rewrapping.

> +		 *
> +		 * Vertical binning should match the horizontal binning mode.
> +		 */
> +		if (bin_h == 2 && (format->width <= 1624 || bpp == 8))
> +			binning = BINNING_ANALOG_X2;
> +		else
> +			binning = BINNING_X2;
> +
> +		imx219->bin_h = (bin_h == 2) ? binning : BINNING_NONE;
> +		imx219->bin_v = (bin_v == 2) ? binning : BINNING_NONE;

It'd be also nice to move the state information to sub-device state.

>  
>  		/* Update limits and set FPS to default */
>  		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> @@ -879,6 +906,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  					 IMX219_PPL_MAX - mode->width,
>  					 1, IMX219_PPL_MIN - mode->width);
>  		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> +
> +		/* Scale the pixel rate based on the mode specific factor */
> +		pixel_rate = imx219_get_pixel_rate(imx219);
> +		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> +					 pixel_rate, 1, pixel_rate);
>  	}
>  
>  	return 0;
> 

-- 
Kind regards,

Sakari Ailus

