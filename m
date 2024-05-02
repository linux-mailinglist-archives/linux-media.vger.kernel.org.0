Return-Path: <linux-media+bounces-10644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E908BA091
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 20:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5DC41F22599
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 18:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956F2174EC6;
	Thu,  2 May 2024 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fcbf/7FS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB717167B;
	Thu,  2 May 2024 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714674785; cv=none; b=nKCpyTRPecmeNasCMsvgmxmss/b0Si3OHr2zzaVkp9aSCuCyc+APmRBd+J+IMJYQtzglo+92AQba+3kEbAE6Z9p/9+H+AWpYvccrsCW3Mrr5DuZOGffmeVyg4gQ6AKW3JqufXPQ5XO6h+JZSdM65flnrWvyeXyKsCzX8KGoGHyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714674785; c=relaxed/simple;
	bh=8hUT5+G9fATSvqnzDPMlXPg00F04FiJqsXIP3tlQpAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsexEj9+qQ4u5IqGBIUHqMM0neOw2Vbp22KKU4lK0ffY9BDD+cdxq3TbOz1I33SGPk02XYsCqf8I+ck/9VWKqxEanTaXrHGBC4hQA97idEdQgenNO2m7TpsPBYasQyqqUaNgdTJZDyul+mNvM3SJF2ECg3LP+56kn77wvbDGrr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fcbf/7FS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B862EBC8;
	Thu,  2 May 2024 20:32:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714674723;
	bh=8hUT5+G9fATSvqnzDPMlXPg00F04FiJqsXIP3tlQpAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcbf/7FShJGdJJ5B6O8494vnXh23/SeVKOeehAmfUrZe0HdZmUAC31+IItr0DE0+H
	 AJBKfFNtRI7jzJiY9IPbNauEGGZKCKKVBvKgFYOLVQYEX8ehcZ+Jv8UG4YcfwsjXKD
	 VsjMiwrJF1BdwsgX7ykh88uPJdXv+Z/yLxHjl37I=
Date: Thu, 2 May 2024 21:32:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 12/19] media: max9286: Implement .get_frame_desc()
Message-ID: <20240502183254.GS15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-13-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-13-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:48PM +0200, Jacopo Mondi wrote:
> Implement the .get_frame_desc() pad operation to allow the receiver
> to retrieve information on the multiplexed source pad.
> 
> Record in the max9286_format_info structure the MIPI CSI-2
> data type and use it to populate the frame_desc_entry.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 120 ++++++++++++++++++++++++++++--------
>  1 file changed, 95 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index f203e4527257..4b4f4c03c10a 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -23,6 +23,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -145,7 +146,12 @@
>  
>  struct max9286_format_info {
>  	u32 code;
> -	u8 datatype;
> +	/* The gmsl data format configuration. */
> +	u8 gmsl_dt;
> +	/* The format bpp, used for stride calculation. */
> +	u8 bpp;
> +	/* The Data Type identifier as defined by the MIPI CSI-2 standard. */
> +	u8 mipi_dt;
>  };
>  
>  struct max9286_i2c_speed {
> @@ -235,28 +241,44 @@ static inline struct max9286_priv *sd_to_max9286(struct v4l2_subdev *sd)
>  static const struct max9286_format_info max9286_formats[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> -		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
> +		.gmsl_dt = MAX9286_DATATYPE_YUV422_8BIT,
> +		.bpp = 16,
> +		.mipi_dt = MIPI_CSI2_DT_YUV422_8B,
>  	}, {
>  		.code = MEDIA_BUS_FMT_VYUY8_1X16,
> -		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
> +		.gmsl_dt = MAX9286_DATATYPE_YUV422_8BIT,
> +		.bpp = 16,
> +		.mipi_dt = MIPI_CSI2_DT_YUV422_8B,
>  	}, {
>  		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> -		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
> +		.gmsl_dt = MAX9286_DATATYPE_YUV422_8BIT,
> +		.bpp = 16,
> +		.mipi_dt = MIPI_CSI2_DT_YUV422_8B,
>  	}, {
>  		.code = MEDIA_BUS_FMT_YVYU8_1X16,
> -		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
> +		.gmsl_dt = MAX9286_DATATYPE_YUV422_8BIT,
> +		.bpp = 16,
> +		.mipi_dt = MIPI_CSI2_DT_YUV422_8B,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> -		.datatype = MAX9286_DATATYPE_RAW12,
> +		.gmsl_dt = MAX9286_DATATYPE_RAW12,
> +		.bpp = 12,
> +		.mipi_dt = MIPI_CSI2_DT_RAW12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> -		.datatype = MAX9286_DATATYPE_RAW12,
> +		.gmsl_dt = MAX9286_DATATYPE_RAW12,
> +		.bpp = 12,
> +		.mipi_dt = MIPI_CSI2_DT_RAW12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> -		.datatype = MAX9286_DATATYPE_RAW12,
> +		.gmsl_dt = MAX9286_DATATYPE_RAW12,
> +		.bpp = 12,
> +		.mipi_dt = MIPI_CSI2_DT_RAW12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> -		.datatype = MAX9286_DATATYPE_RAW12,
> +		.gmsl_dt = MAX9286_DATATYPE_RAW12,
> +		.bpp = 12,
> +		.mipi_dt = MIPI_CSI2_DT_RAW12,
>  	},
>  };
>  
> @@ -532,19 +554,23 @@ static int max9286_check_config_link(struct max9286_priv *priv,
>  	return 0;
>  }
>  
> +static const struct max9286_format_info *
> +max9286_get_format_info(unsigned int code)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
> +		if (max9286_formats[i].code == code)
> +			return &max9286_formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
>  static void max9286_set_video_format(struct max9286_priv *priv,
>  				     const struct v4l2_mbus_framefmt *format)
>  {
>  	const struct max9286_format_info *info = NULL;
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
> -		if (max9286_formats[i].code == format->code) {
> -			info = &max9286_formats[i];
> -			break;
> -		}
> -	}
>  
> +	info = max9286_get_format_info(format->code);
>  	if (WARN_ON(!info))
>  		return;
>  
> @@ -559,7 +585,7 @@ static void max9286_set_video_format(struct max9286_priv *priv,
>  	/* Enable CSI-2 Lane D0-D3 only, DBL mode. */
>  	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
>  		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> -		      info->datatype);
> +		      info->gmsl_dt);
>  
>  	/*
>  	 * Enable HS/VS encoding, use HS as line valid source, use D14/15 for
> @@ -900,7 +926,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_state *state,
>  			   struct v4l2_subdev_format *format)
>  {
> -	unsigned int i;
> +	const struct max9286_format_info *info;
>  
>  	/*
>  	 * Disable setting format on the source pad: format is propagated
> @@ -910,12 +936,8 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  
>  	/* Validate the format. */
> -	for (i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
> -		if (max9286_formats[i].code == format->format.code)
> -			break;
> -	}
> -
> -	if (i == ARRAY_SIZE(max9286_formats))
> +	info = max9286_get_format_info(format->format.code);
> +	if (!info)
>  		format->format.code = max9286_formats[0].code;
>  
>  	*v4l2_subdev_state_get_format(state, format->pad, 0) = format->format;
> @@ -930,6 +952,53 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	unsigned int num_routes = 0;
> +	int ret = 0;
> +
> +	if (pad != MAX9286_SRC_PAD)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);

Add a blank line.

> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *entry;
> +		const struct max9286_format_info *info;
> +		struct v4l2_mbus_framefmt *fmt;

const

> +
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
> +		info = max9286_get_format_info(fmt->code);
> +		if (WARN_ON(!info)) {

I don't think this can happen. You can drop the check and the err_unlock
label.

> +			ret = -EINVAL;
> +			goto err_unlock;
> +		}
> +
> +		entry = &fd->entry[num_routes];
> +		entry->stream = num_routes;
> +		entry->flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
> +		entry->length = fmt->width * fmt->height * info->bpp / 8;

As explained in the review of 07/19, you can drop flags and length (and
thus the bpp field from max9286_format_info).

> +		entry->pixelcode = fmt->code;
> +
> +		/* VC is set according to link ordering, see register 0x15. */
> +		entry->bus.csi2.vc = route->sink_pad;
> +		entry->bus.csi2.dt = info->mipi_dt;
> +
> +		num_routes++;
> +	}
> +
> +	fd->num_entries = num_routes;
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +err_unlock:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
>  static const struct v4l2_subdev_video_ops max9286_video_ops = {
>  	.s_stream	= max9286_s_stream,
>  };
> @@ -940,6 +1009,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
>  	.set_fmt	= max9286_set_fmt,
>  	.get_frame_interval = v4l2_subdev_get_frame_interval,
>  	.set_frame_interval = max9286_set_frame_interval,
> +	.get_frame_desc	= max9286_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops max9286_subdev_ops = {

-- 
Regards,

Laurent Pinchart

