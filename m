Return-Path: <linux-media+bounces-34008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446BACC6FD
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 14:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78881188E820
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 12:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064EE231826;
	Tue,  3 Jun 2025 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O+ClEhH+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE9722F767
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748954907; cv=none; b=Q8UWp96C3ruHyBMKfdTsNUyWwjd9Ek9sP9n9xxVeIsnXL07VwSzxfEz99t7IMMAC/b6Je386HHKAlvDvpNAgLChBx9tkJXCmbKD/0GzyIXQttmvELfV8Q95IEj2KH+iodgY1xLbVKh9SoQxYIYGfHS9WFF2r6uWcvjoHuSXWoyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748954907; c=relaxed/simple;
	bh=i8MbJHvdnda/GDGCLP0CKmrQaSbQXmAFXUm3vqdaBHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nR5xHLS8krTt19PCPrzojQxtYgyzndOUoeOgdDXq5amTQ45xQg8IZ8I7cAa2QzzbMJypIbCWyleFxLPEwG3TL3Y9I4f8kMJqyeTs7laLKVrM6RbjtI2QyeE8JCoKhQY2Y+s+NmI3bo8+RiNF4YmrcU22b21HU1p+AnQvvHJwKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O+ClEhH+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86BB1D7;
	Tue,  3 Jun 2025 14:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748954901;
	bh=i8MbJHvdnda/GDGCLP0CKmrQaSbQXmAFXUm3vqdaBHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+ClEhH+SuxZ9Tub0LehShn+J+EGLwNblOmMOfup1UT4tTSmSNKo1hWXPda+PP+c4
	 k90nDmXNoSRCDNbkgTbxfDel+uRtsVVo2khpG7aSy4p6C2H7SxeuD8ZE2XnZ+wjLEI
	 vsDZDR5yWaI7J+nspS9SeFQF3QO16Oweir+Xyivg=
Date: Tue, 3 Jun 2025 15:48:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 09/12] media: mt9m114: Fix scaler bypass mode
Message-ID: <20250603124814.GF27361@pendragon.ideasonboard.com>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-10-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250531163148.83497-10-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Sat, May 31, 2025 at 06:31:44PM +0200, Hans de Goede wrote:
> As indicated by the comment in mt9m114_ifp_set_fmt():
> 
> 	/* If the output format is RAW10, bypass the scaler. */
> 	if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
> 		...
> 
> The intend of the driver is that the scalar is bypassed when the ISP
> source/output pad's pixel-format is set to MEDIA_BUS_FMT_SGRBG10_1X10.
> 
> This patch makes 2 changes which are required to get this to work properly:
> 
> 1. Set the MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE bit in
>    the MT9M114_CAM_OUTPUT_FORMAT register.

Does that bit actually make a difference ? It's documented as only being
effective when MT9M114_CAM_OUTPUT_FORMAT_BT656_ENABLE is also set, and
the driver never sets that.

> 
> 2. Disable cropping/composing by setting crop and compose selections on
>    the ISP sink/input format to the format widthxheight @ 0x0.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
> Changes in v2:
> - When bypassing the scalar make ifp_get_selection() / ifp_set_selection()
>   fill sel->r with a rectangle of (0,0)/wxh and return 0 instead of
>   returning -EINVAL
> ---
>  drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 7a1451006cfe..d954f2be8f0d 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -467,7 +467,8 @@ static const struct mt9m114_format_info mt9m114_format_infos[] = {
>  		/* Keep the format compatible with the IFP sink pad last. */
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.output_format = MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_RAWR10
> -			| MT9M114_CAM_OUTPUT_FORMAT_FORMAT_BAYER,
> +			| MT9M114_CAM_OUTPUT_FORMAT_FORMAT_BAYER
> +			| MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE,
>  		.flags = MT9M114_FMT_FLAG_PARALLEL | MT9M114_FMT_FLAG_CSI2,
>  	}
>  };
> @@ -850,6 +851,7 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>  	const struct v4l2_mbus_framefmt *format;
>  	const struct v4l2_rect *crop;
>  	const struct v4l2_rect *compose;
> +	unsigned int border;
>  	u64 output_format;
>  	int ret = 0;
>  
> @@ -869,10 +871,12 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>  	 * by demosaicing that are taken into account in the crop rectangle but
>  	 * not in the hardware.
>  	 */

The comment should be updated.

> +	border = (format->code == MEDIA_BUS_FMT_SGRBG10_1X10) ? 0 : 4;

No need for parentheses.

> +
>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
> -		  crop->left - 4, &ret);
> +		  crop->left - border, &ret);
>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
> -		  crop->top - 4, &ret);
> +		  crop->top - border, &ret);
>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
>  		  crop->width, &ret);
>  	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
> @@ -911,7 +915,8 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
>  			   MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_MASK |
>  			   MT9M114_CAM_OUTPUT_FORMAT_FORMAT_MASK |
>  			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_BYTES |
> -			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE);
> +			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE |
> +			   MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE);
>  	output_format |= info->output_format;
>  
>  	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
> @@ -1810,6 +1815,7 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>  {
>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
>  	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_rect *crop;
>  
>  	format = v4l2_subdev_state_get_format(state, fmt->pad);
>  
> @@ -1830,8 +1836,15 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>  		format->code = info->code;
>  
>  		/* If the output format is RAW10, bypass the scaler. */
> -		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
> +		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
>  			*format = *v4l2_subdev_state_get_format(state, 0);
> +			crop = v4l2_subdev_state_get_crop(state, 0);
> +			crop->left = 0;
> +			crop->top = 0;
> +			crop->width = format->width;
> +			crop->height = format->height;
> +			*v4l2_subdev_state_get_compose(state, 0) = *crop;
> +		}

This one is annoying. Normally changing a format or selection rectangle
in a subdev should only propagate the configuration downstream. Here
you're modiying selection rectangles upstream of the source pad. I think
we'll need to live with it, I don't really see a way around that. It's a
non-standard behaviour though, and would require sensor-specific
userspace to handle this right.

There's however one issue. When switching back from a raw output to a
processed output, the crop and compose rectangles will remain the same,
and will have values that are not valid for processed output as they
won't have the 4 pixels border subtracted. I think you'll need to update
them, but only when the source format actually changes. Setting the
source format without modifying the media bus code should not result in
the selection rectangles being reset.

All this needs to be explained in a comment in the code.

>  	}
>  
>  	fmt->format = *format;
> @@ -1851,6 +1864,12 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
>  	if (sel->pad != 0)
>  		return -EINVAL;
>  
> +	/* Crop and compose cannot be changed when bypassing the scaler */

s/scaler/scaler./

Same below.

> +	if (v4l2_subdev_state_get_format(state, 1)->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
> +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> +		return 0;
> +	}

Instead of special-casing this, can you use a similar approach as in
mt9m114_configure_ifp() and replace the 4 and 8 below with border and
boarder * 2 (with an update to the comment too) ?

> +
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP:
>  		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> @@ -1911,6 +1930,12 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
>  	if (sel->pad != 0)
>  		return -EINVAL;
>  
> +	/* Crop and compose cannot be changed when bypassing the scaler */
> +	if (v4l2_subdev_state_get_format(state, 1)->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
> +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> +		return 0;
> +	}

Let's add a source_format variable to avoid duplicating the
v4l2_subdev_state_get_format(), call, as we use the source format at the
end of the function.

> +
>  	format = v4l2_subdev_state_get_format(state, 0);
>  	crop = v4l2_subdev_state_get_crop(state, 0);
>  	compose = v4l2_subdev_state_get_compose(state, 0);

-- 
Regards,

Laurent Pinchart

