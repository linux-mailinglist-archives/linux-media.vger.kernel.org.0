Return-Path: <linux-media+bounces-33926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E525ACAFD4
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AD647AF64A
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBED0223301;
	Mon,  2 Jun 2025 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UFM0jlIm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC8222561;
	Mon,  2 Jun 2025 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872506; cv=none; b=t4N/3hJBK/xLGNypYQ9eipiltUqbsqouqpFmbz0ml1mw5PetrPXDSw1M972duNKvf+Lv97/J+0oXMDWcBb3UhXxWmwduzUPMJHLJZ097sMSznzBoNUCFoPh6DTDmP9bk37b+e3z3A3tmn6whhBG0fE+yNcsCDZnXNFj7KQVulZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872506; c=relaxed/simple;
	bh=mIUipTaRh6NCVM7jbqFGFymMTskoonxgS39J9efjgpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwUOjCjlLa3cQQC2zOCN3FbHKkfbZejmEqXdpKYnnvGB9+LQ0qSVljMEDOoGWJNIb5FaT64cfD6ABcIzPPx0oAx/UID6xjO2yhnMWMoWb6wlVAdyNm8ipt40OiqQ0MY7+dIBdgw+j9Tc3FCzYT9x4rRMpiLxWLeaKLG9hzWlaI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UFM0jlIm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A56EBC9;
	Mon,  2 Jun 2025 15:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748872500;
	bh=mIUipTaRh6NCVM7jbqFGFymMTskoonxgS39J9efjgpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFM0jlImjGSYOo657etBS6Zhecr4zoJyHsB1UF2ZwpHy7PfbpPwqeieTx1JP/1N95
	 Mcsials05bjNHB9Rl9CP8tlotTmkQ7dnRG7H/P+lNaZyVaukdEu2demSZ3iLlpswXi
	 je2rbcE1gQl7wA9VVY8w4Md1qw8eXFP7nNuOoKmk=
Date: Mon, 2 Jun 2025 16:54:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 14/15] media: rcar-csi2: Add full streams support
Message-ID: <20250602135453.GC23515@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-14-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-14-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:43PM +0300, Tomi Valkeinen wrote:
> Add the missing pieces to enable full streams support:
> 
> - Add set_routing
> - Drop the explicit uses of a single stream, and instead use the streams
>   mask.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 85 ++++++++++++++++++++++--------
>  1 file changed, 63 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 8f708196ef49..4a73d223229c 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -694,6 +694,17 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
>  	},
>  };
>  
> +static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> +	.width		= 1920,
> +	.height		= 1080,
> +	.code		= MEDIA_BUS_FMT_RGB888_1X24,
> +	.colorspace	= V4L2_COLORSPACE_SRGB,
> +	.field		= V4L2_FIELD_NONE,
> +	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization	= V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> +};
> +
>  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
>  {
>  	unsigned int i;
> @@ -1641,10 +1652,8 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>  				u64 source_streams_mask)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	int ret = 0;
> -
> -	if (source_streams_mask != 1)
> -		return -EINVAL;
> +	u64 sink_streams;
> +	int ret;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
> @@ -1655,8 +1664,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       RCAR_CSI2_SOURCE_VC0,
> +						       RCAR_CSI2_SINK,
> +						       &source_streams_mask);
> +
>  	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> -					 BIT_ULL(0));
> +					 sink_streams);
>  	if (ret) {
>  		rcsi2_stop(priv);
>  		return ret;
> @@ -1672,10 +1686,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>  				 u32 source_pad, u64 source_streams_mask)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	int ret = 0;
> -
> -	if (source_streams_mask != 1)
> -		return -EINVAL;
> +	u64 sink_streams;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
> @@ -1683,11 +1694,17 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>  	if (priv->stream_count == 1)
>  		rcsi2_stop(priv);
>  
> -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       RCAR_CSI2_SOURCE_VC0,
> +						       RCAR_CSI2_SINK,
> +						       &source_streams_mask);
> +
> +	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> +				    sink_streams);
>  
>  	priv->stream_count -= 1;
>  
> -	return ret;
> +	return 0;

This seems to belong to a previous patch.

>  }
>  
>  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> @@ -1720,6 +1737,40 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rcsi2_set_routing(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state,
> +			     enum v4l2_subdev_format_whence which,
> +			     struct v4l2_subdev_krouting *routing)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	int ret;
> +
> +	if (!priv->info->use_isp)
> +		return -ENOTTY;
> +
> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> +		return -EINVAL;

A comment to explain this check would be nice.

> +
> +	if (priv->info->use_isp) {

You return an error above when this condition is false.

> +		ret = v4l2_subdev_routing_validate(sd, routing,
> +						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	} else {
> +		ret = v4l2_subdev_routing_validate(sd, routing,
> +						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +						   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +					       &rcar_csi2_default_fmt);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
>  					 unsigned int pad,
>  					 struct v4l2_mbus_frame_desc *fd)
> @@ -1781,6 +1832,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  
> +	.set_routing = rcsi2_set_routing,
>  	.get_frame_desc = rcsi2_get_frame_desc,
>  };
>  
> @@ -1801,17 +1853,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>  		},
>  	};
>  
> -	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> -		.width		= 1920,
> -		.height		= 1080,
> -		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> -		.field		= V4L2_FIELD_NONE,
> -		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> -		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> -		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> -	};
> -
>  	static const struct v4l2_subdev_krouting routing = {
>  		.num_routes = ARRAY_SIZE(routes),
>  		.routes = routes,

-- 
Regards,

Laurent Pinchart

