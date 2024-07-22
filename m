Return-Path: <linux-media+bounces-15254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6D69390FE
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 16:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 697241F21AC3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 14:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B5116DC33;
	Mon, 22 Jul 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Br6NEXRR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD711F954;
	Mon, 22 Jul 2024 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721659887; cv=none; b=u7A1MZePQlqwdQVflYgfduLgiNKuMznTqaHgzlmHq1PClO/r1PBee4hNN0khGivmsraNnWGxpTVik1/LHqCkr7GRy4Fj4XkROv61BlqcHJGrW8mE3jFkaxKp648UobpmhIw3ODVa5/yZ9WuKedGpEdPRuIDpFzpmJ/WjN2OnJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721659887; c=relaxed/simple;
	bh=/9u/Enuc4T5xnskpqw9mL/WB/R6cSYXOFLCDURWM8kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iyy1GtI1PoMFuQszKDN1sQBdFjZxgA9wIBhhtv0Cb2O8chhqlSpE2vYUhJ8hVLPn/tMBZdhgspQEl4B3v5xFN/q9U8+/J+5FNTNaEW7y1BplqKYssWoT0seohDDpdAN9xg5K5cncX4Uno2TDJd8aJAB+l7tLaUlWn6e6x49DSU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Br6NEXRR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22A76D1F;
	Mon, 22 Jul 2024 16:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721659843;
	bh=/9u/Enuc4T5xnskpqw9mL/WB/R6cSYXOFLCDURWM8kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Br6NEXRRN9YpT96gKD65Cm0L1J21FHroLIz5eZ1HGOy69c5bZ4AiLMUlhMzYblvxH
	 9sB1+w08KvkMgrDlYx5bFKCB/1Cq7dYjz9AfD8yFH75MqyAeGfb+zvadDZZ6fY0IXc
	 VHsCJkWpJDYO4FY+DpX6lEWpr2xfl2rI/K6g1WR8=
Date: Mon, 22 Jul 2024 17:51:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 04/14] staging: media: starfive: Add a params sink pad
 and a scd source pad for ISP
Message-ID: <20240722145106.GJ13497@pendragon.ideasonboard.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-5-changhuang.liang@starfivetech.com>

Hello Changhuang,

Thank you for the patch.

On Tue, Jul 09, 2024 at 01:38:14AM -0700, Changhuang Liang wrote:
> StarFive ISP can use params sink pad to transmit ISP parameters and use
> scd source pad to capture statistics collection data.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-isp.c    | 77 +++++++++++++++++--
>  .../staging/media/starfive/camss/stf-isp.h    |  2 +
>  2 files changed, 71 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
> index 4e6e26736852..0ebffd09842a 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp.c
> @@ -21,13 +21,23 @@ static const struct stf_isp_format isp_formats_sink[] = {
>  	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
>  };
>  
> +static const struct stf_isp_format isp_formats_sink_params[] = {
> +	{ MEDIA_BUS_FMT_METADATA_FIXED },
> +};
> +
>  static const struct stf_isp_format isp_formats_source[] = {
>  	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8 },
>  };
>  
> +static const struct stf_isp_format isp_formats_source_scd[] = {
> +	{ MEDIA_BUS_FMT_METADATA_FIXED },
> +};
> +
>  static const struct stf_isp_format_table isp_formats_st7110[] = {
>  	{ isp_formats_sink, ARRAY_SIZE(isp_formats_sink) },
> +	{ isp_formats_sink_params, ARRAY_SIZE(isp_formats_sink_params) },
>  	{ isp_formats_source, ARRAY_SIZE(isp_formats_source) },
> +	{ isp_formats_source_scd, ARRAY_SIZE(isp_formats_source_scd) },
>  };
>  
>  static const struct stf_isp_format *
> @@ -93,13 +103,19 @@ static void isp_try_format(struct stf_isp_dev *isp_dev,
>  
>  	formats = &isp_dev->formats[pad];
>  
> -	fmt->width = clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
> -			     STFCAMSS_FRAME_MAX_WIDTH);
> -	fmt->height = clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
> -			      STFCAMSS_FRAME_MAX_HEIGHT);
> -	fmt->height &= ~0x1;
> +	if (pad != STF_ISP_PAD_SRC_SCD && pad != STF_ISP_PAD_SINK_PARAMS) {
> +		fmt->width = clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
> +				     STFCAMSS_FRAME_MAX_WIDTH);
> +		fmt->height = clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
> +				      STFCAMSS_FRAME_MAX_HEIGHT);
> +		fmt->height &= ~0x1;
> +		fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	} else {
> +		fmt->width = 1;
> +		fmt->height = 1;

You should set fmt->colorspace here too. I think you can set it to 0.

> +	}
> +
>  	fmt->field = V4L2_FIELD_NONE;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
>  	fmt->flags = 0;
>  
>  	if (!stf_g_fmt_by_mcode(formats, fmt->code))
> @@ -119,7 +135,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
>  
>  		formats = &isp_dev->formats[code->pad];
>  		code->code = formats->fmts[code->index].code;
> -	} else {
> +	} else if (code->pad == STF_ISP_PAD_SRC) {
>  		struct v4l2_mbus_framefmt *sink_fmt;
>  
>  		if (code->index >= ARRAY_SIZE(isp_formats_source))
> @@ -131,6 +147,10 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
>  		code->code = sink_fmt->code;
>  		if (!code->code)
>  			return -EINVAL;
> +	} else {
> +		if (code->index > 0)
> +			return -EINVAL;
> +		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
>  	}
>  	code->flags = 0;
>  
> @@ -151,6 +171,9 @@ static int isp_set_format(struct v4l2_subdev *sd,
>  	isp_try_format(isp_dev, state, fmt->pad, &fmt->format);
>  	*format = fmt->format;
>  
> +	if (fmt->pad == STF_ISP_PAD_SRC_SCD || fmt->pad == STF_ISP_PAD_SINK_PARAMS)
> +		return 0;
> +
>  	isp_dev->current_fmt = stf_g_fmt_by_mcode(&isp_dev->formats[fmt->pad],
>  						  fmt->format.code);
>  
> @@ -202,6 +225,9 @@ static int isp_get_selection(struct v4l2_subdev *sd,
>  	struct v4l2_subdev_format fmt = { 0 };
>  	struct v4l2_rect *rect;
>  
> +	if (sel->pad == STF_ISP_PAD_SRC_SCD || sel->pad == STF_ISP_PAD_SINK_PARAMS)
> +		return -EINVAL;
> +
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
>  		if (sel->pad == STF_ISP_PAD_SINK) {
> @@ -239,6 +265,9 @@ static int isp_set_selection(struct v4l2_subdev *sd,
>  	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
>  	struct v4l2_rect *rect;
>  
> +	if (sel->pad == STF_ISP_PAD_SRC_SCD || sel->pad == STF_ISP_PAD_SINK_PARAMS)
> +		return -EINVAL;
> +
>  	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>  
> @@ -296,8 +325,38 @@ static int isp_init_formats(struct v4l2_subdev *sd,

While at it, you could rename the function to isp_init_state().

>  			.height = 1080
>  		}
>  	};
> +	struct v4l2_subdev_format format_params = {
> +		.pad = STF_ISP_PAD_SINK_PARAMS,
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,

That's not quite right, as the .init_state() handler is used to
initialized both the TRY and ACTIVE states. As the "which" field is
currently ignored through the driver the code should behave correctly
(as far as I can tell), but you may want at some point to initialize the
formats and selection rectangles directly in this function instead of
calling isp_set_format().

> +		.format = {
> +			.code = MEDIA_BUS_FMT_METADATA_FIXED,
> +			.width = 1,
> +			.height = 1

According to
https://docs.kernel.org/userspace-api/media/v4l/subdev-formats.html#metadata-formats,
width and height should be set to 0 for MEDIA_BUS_FMT_METADATA_FIXED.

> +		}
> +	};
> +	struct v4l2_subdev_format format_scd = {
> +		.pad = STF_ISP_PAD_SRC_SCD,
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.format = {
> +			.code = MEDIA_BUS_FMT_METADATA_FIXED,
> +			.width = 1,
> +			.height = 1
> +		}
> +	};
> +	int ret;
> +
> +	/* Init for STF_ISP_PAD_SINK and STF_ISP_PAD_SRC pad */
> +	ret = isp_set_format(sd, sd_state, &format);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Init for STF_ISP_PAD_SINK_PARAMS pad */
> +	ret = isp_set_format(sd, sd_state, &format_params);
> +	if (ret < 0)
> +		return ret;
>  
> -	return isp_set_format(sd, sd_state, &format);
> +	/* Init for STF_ISP_PAD_SRC_SCD pad */
> +	return isp_set_format(sd, sd_state, &format_scd);
>  }
>  
>  static const struct v4l2_subdev_video_ops isp_video_ops = {
> @@ -338,7 +397,9 @@ int stf_isp_register(struct stf_isp_dev *isp_dev, struct v4l2_device *v4l2_dev)
>  	v4l2_set_subdevdata(sd, isp_dev);
>  
>  	pads[STF_ISP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	pads[STF_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
>  	pads[STF_ISP_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +	pads[STF_ISP_PAD_SRC_SCD].flags = MEDIA_PAD_FL_SOURCE;
>  
>  	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
>  	sd->entity.ops = &isp_media_ops;
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
> index 955cbb048363..bc7e7b0736fa 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.h
> +++ b/drivers/staging/media/starfive/camss/stf-isp.h
> @@ -392,7 +392,9 @@
>  /* pad id for media framework */
>  enum stf_isp_pad_id {
>  	STF_ISP_PAD_SINK = 0,
> +	STF_ISP_PAD_SINK_PARAMS,
>  	STF_ISP_PAD_SRC,
> +	STF_ISP_PAD_SRC_SCD,
>  	STF_ISP_PAD_MAX
>  };
>  

-- 
Regards,

Laurent Pinchart

