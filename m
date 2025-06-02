Return-Path: <linux-media+bounces-33933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB68ACB2AF
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 514731946172
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 14:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8AA23026C;
	Mon,  2 Jun 2025 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q0efLb9c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301622FE19;
	Mon,  2 Jun 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873872; cv=none; b=sQSG17aAWwYBvuYoL5UlPNtr2iEZ/v6MR5Mw6SsUudH9RV3n6EjiK95F0Kr2WO9iIiOThpnjl/Y7kimhgq1jmETIsB4epJK0MYdxLVcq5JrzpZRfz+5wYEsl3NZXv+9Ehy9PTxihIdMjSQt3zPQM3UpAF9zgw2t5MjgjemXxmcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873872; c=relaxed/simple;
	bh=sxfJ7yRL05XnzpkXaeOvWrTMK/PR8lRTFDF1Q8C5rzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noiNKCBjuKb4AYn1kWGYenBC6jbnC3fH7P4efIb5WrEkIRYWEYePAb04nu1Th5fCxHwcujrVzzS7I81X2e2153Wq5E9035oYiUbXtyf9Vm53zsLQdZuc5n50TNi6itHX7mAzrTIi3DLJki0YhpUALVfKkm+07E3q1OrMYREKYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q0efLb9c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E171379;
	Mon,  2 Jun 2025 16:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748873867;
	bh=sxfJ7yRL05XnzpkXaeOvWrTMK/PR8lRTFDF1Q8C5rzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0efLb9ctHtZEy4B5IVcHytKG3GcrK5Nd6B3Oz1xQYtAdTGTM7E1rYj7qJuRItNEL
	 6fiUOPJt+U7NHQXLmVKOSCjnni3wmH+EtsKMab0+Gl/TqeJ3Zm28N2gX7FLlRxjePx
	 Dc+2AzqHZtkclDjHQwcncNP7bvzpubILnTk9ex/g=
Date: Mon, 2 Jun 2025 17:17:40 +0300
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
Subject: Re: [PATCH v3 09/15] media: rcar-isp: Switch to Streams API
Message-ID: <20250602141740.GG23515@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-9-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-9-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:38PM +0300, Tomi Valkeinen wrote:
> Switch to Streams API with a single hardcoded route. This breaks any
> existing userspace which depended on the custom rcar streams
> implementation, but a single camera use case should continue to work.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 62 ++++++++++++++++++++++---
>  1 file changed, 55 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 2337c5d44c40..a04cbf96b809 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -124,6 +124,17 @@ static const struct rcar_isp_format rcar_isp_formats[] = {
>  	},
>  };
>  
> +static const struct v4l2_mbus_framefmt risp_default_fmt = {
> +	.width = 1920,
> +	.height = 1080,
> +	.code = MEDIA_BUS_FMT_RGB888_1X24,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.field = V4L2_FIELD_NONE,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization = V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
> +};
> +
>  static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
>  {
>  	unsigned int i;
> @@ -222,7 +233,7 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  	u32 sel_csi = 0;
>  	int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK, 0);
>  	if (!fmt)
>  		return -EINVAL;
>  
> @@ -336,7 +347,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_format *format)
>  {
> -	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (format->pad > RCAR_ISP_SINK)
>  		return v4l2_subdev_get_fmt(sd, state, format);
> @@ -344,10 +355,20 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  	if (!risp_code_to_fmt(format->format.code))
>  		format->format.code = rcar_isp_formats[0].code;
>  
> -	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
> -		framefmt = v4l2_subdev_state_get_format(state, i);
> -		*framefmt = format->format;
> -	}
> +	/* Set sink format */

s/format/format./

> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = format->format;
> +
> +	/* Propagate to source format */

	/* Propagate the format to the source pad. */

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -364,6 +385,32 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
>  	.pad	= &risp_pad_ops,
>  };
>  
> +static int risp_init_state(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	static struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_ISP_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_ISP_PORT0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	static const struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&risp_default_fmt);
> +}
> +
> +static const struct v4l2_subdev_internal_ops risp_internal_ops = {
> +	.init_state = risp_init_state,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Async handling and registration of subdevices and links
>   */
> @@ -521,11 +568,12 @@ static int risp_probe(struct platform_device *pdev)
>  
>  	isp->subdev.owner = THIS_MODULE;
>  	isp->subdev.dev = &pdev->dev;
> +	isp->subdev.internal_ops = &risp_internal_ops;
>  	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
>  	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
>  	snprintf(isp->subdev.name, sizeof(isp->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  
>  	isp->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
>  	isp->subdev.entity.ops = &risp_entity_ops;

-- 
Regards,

Laurent Pinchart

