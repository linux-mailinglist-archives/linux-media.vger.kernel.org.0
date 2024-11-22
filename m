Return-Path: <linux-media+bounces-21823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C89EB9D5D52
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 896882835C9
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D691DDC32;
	Fri, 22 Nov 2024 10:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CRx7EbJz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D116EB5D;
	Fri, 22 Nov 2024 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732271526; cv=none; b=Pjnj/ck9wyymGCBCaVDCXFLdbMRMC1ZpvJN5LlTlvSV7/PwmZqLA9qN6w7nCNw9PWJaFe+FtmELMMwOVBsFk2bVOYB81jxm2Obly0UpT1TBvGNUkqmNYk2kMdcPDcnwEXvGE/lfNIi5jG3xkdtJVA8UH6DdQnqNqHVncBAO1Yv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732271526; c=relaxed/simple;
	bh=xkyfoDLOZRFP4y+VoeXwELn8PKJLa6+QhT/8HcZH7AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN7AZiirLk2Ie2RJDaDAhfhYKRN2mHYoHQbeeFMMC0lC1RsK5p+RtXPteehDRM8TLpFAq3Qw+O7sXoTtozp8XNof+PaoEOrrhXyta9lZ+P6B1Cl3YwV+XLqNJOI7BP8QSePxgzmJ2/kdfA9p770oi6xbmaDQDzxjtmr6Xpm4RkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CRx7EbJz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55B2C8BE;
	Fri, 22 Nov 2024 11:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732271502;
	bh=xkyfoDLOZRFP4y+VoeXwELn8PKJLa6+QhT/8HcZH7AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRx7EbJzyte/JU7Ipoix7oDvmQOAA+JIGsWFYnTtC/j3aB1f+mnF5uxeBSfox0hn3
	 5dzqWQGTR9K9cUbpFDcgqYBX3P74h/AxAzaF6lC9Fu3CC84Tqgoipb6gcnEDaUo+FU
	 6k0LVyAomYFN6EEVWJpU70UUm0n86jZMVeGrzfQE=
Date: Fri, 22 Nov 2024 11:31:58 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v2 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <npwwmrap6l3pfs6uuh5jxssrox5dp6h3bcvw4ihqqxrlhcmdks@vbyqxsakhlwg>
References: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
 <20241121-imx219_fixes-v2-3-7b068a60ea40@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121-imx219_fixes-v2-3-7b068a60ea40@ideasonboard.com>

Hi Jai

On Thu, Nov 21, 2024 at 05:38:04PM +0530, Jai Luthra wrote:
> When the analog binning mode is used for high framerate operation,
> the pixel rate is effectively doubled. Account for this when setting up
> the pixel clock rate, and applying the vblank and exposure controls.
>
> The previous logic only used analog binning for 8-bit modes, but normal
> binning limits the framerate on 10-bit 480p [1]. So with this patch we
> switch to using special binning (with 2x pixel rate) for all formats of
> 480p mode and 8-bit 1232p.
>
> To do this cleanly, re-introduce the book-keeping for which binning mode
> is used with which resolution/format.

I think the patch is correct, however this goes a bit in the opposite
direction of making the driver freely configurable. IOW the more we
store in modes, the harder it will become to freely configure the
sensor. I know there are different opinions on how much this is
actually an issue, with valid arguments on both sides, but as I recall
freely configurable was a goal of Laurent's series, let me cc him
explicitly.

>
> [1]: https://github.com/raspberrypi/linux/issues/5493
>
> Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 138 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 94 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 970e6362d0ae3a9078daf337155e83d637bc1ca1..ec795569361987ae30bff234e97fa34600bf5975 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -149,6 +149,18 @@
>  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
>  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
>
> +enum binning_mode {
> +	BINNING_NONE = IMX219_BINNING_NONE,
> +	BINNING_X2 = IMX219_BINNING_X2,
> +	BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
> +};
> +
> +enum binning_bit_depths {
> +	BINNING_IDX_8_BIT,
> +	BINNING_IDX_10_BIT,
> +	BINNING_IDX_MAX
> +};
> +
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
>  	/* Frame width */
> @@ -158,6 +170,9 @@ struct imx219_mode {
>
>  	/* V-timing */
>  	unsigned int vts_def;
> +
> +	/* binning mode based on format code */
> +	enum binning_mode binning[BINNING_IDX_MAX];
>  };
>
>  static const struct cci_reg_sequence imx219_common_regs[] = {
> @@ -293,24 +308,40 @@ static const struct imx219_mode supported_modes[] = {
>  		.width = 3280,
>  		.height = 2464,
>  		.vts_def = 3526,
> +		.binning = {
> +			[BINNING_IDX_8_BIT] = BINNING_NONE,
> +			[BINNING_IDX_10_BIT] = BINNING_NONE,
> +		},
>  	},
>  	{
>  		/* 1080P 30fps cropped */
>  		.width = 1920,
>  		.height = 1080,
>  		.vts_def = 1763,
> +		.binning = {
> +			[BINNING_IDX_8_BIT] = BINNING_NONE,
> +			[BINNING_IDX_10_BIT] = BINNING_NONE,
> +		},
>  	},
>  	{
>  		/* 2x2 binned 30fps mode */
>  		.width = 1640,
>  		.height = 1232,
>  		.vts_def = 1763,
> +		.binning = {
> +			[BINNING_IDX_8_BIT] = BINNING_ANALOG_X2,
> +			[BINNING_IDX_10_BIT] = BINNING_X2,
> +		},
>  	},
>  	{
>  		/* 640x480 30fps mode */
>  		.width = 640,
>  		.height = 480,
>  		.vts_def = 1763,
> +		.binning = {
> +			[BINNING_IDX_8_BIT] = BINNING_ANALOG_X2,
> +			[BINNING_IDX_10_BIT] = BINNING_ANALOG_X2,
> +		},
>  	},
>  };
>
> @@ -337,6 +368,9 @@ struct imx219 {
>
>  	/* Two or Four lanes */
>  	u8 lanes;
> +
> +	/* Binning mode */
> +	enum binning_mode binning;
>  };
>
>  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> @@ -362,6 +396,36 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
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
> +	switch (imx219->binning) {
> +	case BINNING_NONE:
> +	case BINNING_X2:
> +		return 1;
> +	case BINNING_ANALOG_X2:
> +		return 2;
> +	}
> +	return -EINVAL;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Controls
>   */
> @@ -373,10 +437,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>  	const struct v4l2_mbus_framefmt *format;
>  	struct v4l2_subdev_state *state;
> +	int rate_factor;
>  	int ret = 0;
>
>  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
>  	format = v4l2_subdev_state_get_format(state, 0);
> +	rate_factor = imx219_get_rate_factor(imx219);
>
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		int exposure_max, exposure_def;
> @@ -405,7 +471,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_EXPOSURE:
>  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> -			  ctrl->val, &ret);
> +			  ctrl->val / rate_factor, &ret);
>  		break;
>  	case V4L2_CID_DIGITAL_GAIN:
>  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> @@ -422,7 +488,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_VBLANK:
>  		cci_write(imx219->regmap, IMX219_REG_VTS,
> -			  format->height + ctrl->val, &ret);
> +			  (format->height + ctrl->val) / rate_factor, &ret);
>  		break;
>  	case V4L2_CID_HBLANK:
>  		cci_write(imx219->regmap, IMX219_REG_HTS,
> @@ -463,7 +529,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
>
>  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
>  {
> -	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
> +	return ((imx219->lanes == 2) ? IMX219_PIXEL_RATE :
> +		IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
>  }
>
>  /* Initialize control handlers */
> @@ -592,29 +659,12 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
> @@ -625,28 +675,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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

So if I got this right, another way of handling this would be to

		bin_v = (bpp == 8 || (format->width == 640 && format->height = 480)
                      ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;


I'm not sure how much better this is, as then freely configure the
sensor at (random numbers) 720x480@10bpp would not use analog binning
while it might be beneficial. Actually knowing what analog mode is how
it shuold be used would help, but if I recall correctly it wasn't
clear from documentation or not fully clarified by Sony ?

When it comes to scaling PIXEL_RATE, the above switch could be moved
to set_pad_format and store imx219->binning to be
1) used here
2) used in s_ctrl

like this patch does already.

Opinions ?

> -		break;
> -	}
> -
> -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->binning, &ret);
> +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->binning, &ret);
>
>  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
>  		  format->width, &ret);
> @@ -851,6 +881,21 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  		int exposure_max;
>  		int exposure_def;
>  		int hblank;
> +		int pixel_rate;
> +
> +		/* Update binning mode based on format */
> +		switch (imx219_get_format_bpp(format)) {
> +		case 8:
> +			imx219->binning = mode->binning[BINNING_IDX_8_BIT];
> +			break;
> +
> +		case 10:
> +			imx219->binning = mode->binning[BINNING_IDX_10_BIT];
> +			break;
> +
> +		default:
> +			imx219->binning = BINNING_NONE;
> +		}
>
>  		/* Update limits and set FPS to default */
>  		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> @@ -879,6 +924,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
> --
> 2.47.0
>
>

