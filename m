Return-Path: <linux-media+bounces-26555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88AA3F080
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96C064203B3
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 09:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F56C204691;
	Fri, 21 Feb 2025 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="av8yS7Af"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85149202C30;
	Fri, 21 Feb 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130599; cv=none; b=Lqe81y3zcBoU+eMlXAL/vNcmyyaHxBMhNAM6vR1nH1Q5RCQetuhtJHv6Gm8qqAC82271xILz5RNGvRrXpe7lW6ZKEQYAdHVpqa4ThhqKxYwIQejo1TefsJniGSXzTwhIVVWmQ+9qG2Fps72YGkZr6zRLfcz4v8qzDLkxBq+1t5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130599; c=relaxed/simple;
	bh=LcCshsTLz5TYNjtrU59EFDnTq5rwW6zHS0BJSQ45BL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPcP4578age+hceKWNgcD5qtISTbvOfQ7pLDSq4ARb5WDEYDchrF/InS+WPpBTFKJN+JlohZSplTHPtrYAT+TBF3fjlp3A2fqbOcxEQzY67dIdsGtz4XROV2w3MS+vuDSSjBhcQqhbJjrZYRcOeQfOFEySvB8prrlRuVFZfzc3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=av8yS7Af; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF03E89A;
	Fri, 21 Feb 2025 10:35:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740130511;
	bh=LcCshsTLz5TYNjtrU59EFDnTq5rwW6zHS0BJSQ45BL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=av8yS7AfwDcT0yDnyQPFUSLmz7TiJGA5aus/cQ6UCrmoCmclNHZF4UV4GtPu4SXUw
	 YtHl3WhDeT2V/buLOLunudzpysZmbcKpFjAgMx5vyBjQYChDo3ZW+VDcsMkj6eBglp
	 Vuztxo0iETOIo/GDCozZzl0pTVzMgL5qM32/Rgso=
Date: Fri, 21 Feb 2025 10:36:32 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 3/3] media: i2c: imx219: Use subdev state to calculate
 binning and pixelrate
Message-ID: <ikq3xkkto566jmxvmc352l4cnjy42bx47nwbihqu77hx76o7c5@jkn37hi4pfe2>
References: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
 <20250219-imx219_fixes_v2-v1-3-0e3f5dd9b024@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-imx219_fixes_v2-v1-3-0e3f5dd9b024@ideasonboard.com>

On Wed, Feb 19, 2025 at 05:16:45PM +0530, Jai Luthra wrote:
> The pixel rate and binning calculations need the format and resolution
> of the sensor, so pass the v4l2 subdev state directly instead of always
> operating on the active state.

Yeah I think it's saner, as even if v4l2 ctrl do not support TRY
state (and thus the pixel rate calculation can't be "tryed") we should
use the format information from the state at hand.

>
> Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Link: https://lore.kernel.org/linux-media/sejl7xskif6rlpdsg3jhczjwe5gi6rs53ehbyka6omv2zeg7qq@4iis7i2lla5p/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/imx219.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f02732d8fa95de0a295f247d4f0b60017dbb2ed2..0adfe8e5775ba6661f7d06fedfd920d91c24cba5 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -400,10 +400,9 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
>  	}
>  }
>
> -static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
> +static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
> +			       u8 *bin_v)
>  {
> -	struct v4l2_subdev_state *state =
> -		v4l2_subdev_get_locked_active_state(&imx219->sd);
>  	const struct v4l2_mbus_framefmt *format =
>  		v4l2_subdev_state_get_format(state, 0);
>  	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
> @@ -430,11 +429,11 @@ static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
>  		*bin_v = IMX219_BINNING_X2;
>  }
>
> -static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
> +static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
>  {
>  	u8 bin_h, bin_v;
>
> -	imx219_get_binning(imx219, &bin_h, &bin_v);
> +	imx219_get_binning(state, &bin_h, &bin_v);
>
>  	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
>  }
> @@ -455,7 +454,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>
>  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
>  	format = v4l2_subdev_state_get_format(state, 0);
> -	rate_factor = imx219_get_rate_factor(imx219);
> +	rate_factor = imx219_get_rate_factor(state);
>
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		int exposure_max, exposure_def;
> @@ -689,7 +688,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
>  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
>
> -	imx219_get_binning(imx219, &bin_h, &bin_v);
> +	imx219_get_binning(state, &bin_h, &bin_v);
>  	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
>  	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
>
> @@ -937,7 +936,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>
>  		/* Scale the pixel rate based on the mode specific factor */
>  		pixel_rate = imx219_get_pixel_rate(imx219) *
> -			     imx219_get_rate_factor(imx219);
> +			     imx219_get_rate_factor(state);
>  		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
>  					 pixel_rate, 1, pixel_rate);
>  	}
>
> --
> 2.48.1
>

