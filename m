Return-Path: <linux-media+bounces-10639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B848B9FDF
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 19:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B021F2218D
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 17:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6D817107B;
	Thu,  2 May 2024 17:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UfEDyEHl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E216FF44;
	Thu,  2 May 2024 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714672648; cv=none; b=trBNLDCX2kemakblJPAP0SqrAs70OASC7h3ufxdWd7+3Z7pyeAj97OR8ivNfO93WBH6OklLc4wpbvtMwyRb4aT6iGVp3Y/y1PJ4t373i1YJarEM96mFRiML0QOqTW9j+5ba9jNpiw+JhbYc/8FqcgRoIkzVHVlCms8Jhvh5yKuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714672648; c=relaxed/simple;
	bh=emeteYJ2lPGIRo0wB2dKC+t1TfNv7uwH6zsKNxALwxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+wHiZM5F63sqqqcOd7Qb3gxhaDOBQH/R8YpwQyrk5IlcI30Rp1pGApMq9nnA+qHqRMS1ndpCJpmmxg3wi22oOOfGa3X0b+G1GjSh9dNKksh5sG7L+WwAvREx9EHH+ZGxrOObj/H7u8G5ibzaIQZh7TUp4+bd3QDCy6MCP6/f+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UfEDyEHl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FBB5552;
	Thu,  2 May 2024 19:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714672587;
	bh=emeteYJ2lPGIRo0wB2dKC+t1TfNv7uwH6zsKNxALwxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfEDyEHlf0fgipfgy1TCGbuk7sQoWe0WzzyPqdUG1um8amoz/iHxWNLQp6KmRjPb9
	 fpoJg99tOXas9fmLxdvDp09xR0M9C3W2rZxc7kRWIQAoJ18dT4arYpd5X6/lGCyOXH
	 PiLU/5mn063uwAFafE1IFrsCnBg3bDN9/83QuYJM=
Date: Thu, 2 May 2024 20:57:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/19] media: adv748x: Implement .get_frame_desc()
Message-ID: <20240502175717.GN15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-8-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-8-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:43PM +0200, Jacopo Mondi wrote:
> Implement the get_frame_desc subdev pad operation.
> 
> Implement the get_frame_desc pad operation to allow retrieving the
> stream configuration of the adv748x csi2 subdevice.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 86 ++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index a7bfed393ff0..497586aff6b2 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -8,12 +8,51 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  
>  #include "adv748x.h"
>  
> +struct adv748x_csi2_format_info {
> +	u8 dt;
> +	u8 bpp;
> +};
> +
> +static int adv748x_csi2_get_format_info(struct adv748x_csi2 *tx, u32 mbus_code,
> +					struct adv748x_csi2_format_info *fmt)
> +{
> +	switch (mbus_code) {
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +		fmt->dt = MIPI_CSI2_DT_YUV422_8B;
> +		fmt->bpp = 16;
> +		break;
> +	case MEDIA_BUS_FMT_YUYV10_1X20:
> +		fmt->dt = MIPI_CSI2_DT_YUV422_10B;
> +		fmt->bpp = 20;
> +		break;
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		fmt->dt = MIPI_CSI2_DT_RGB565;
> +		fmt->bpp = 16;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		fmt->dt = MIPI_CSI2_DT_RGB666;
> +		fmt->bpp = 18;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		fmt->dt = MIPI_CSI2_DT_RGB888;
> +		fmt->bpp = 24;
> +		break;
> +	default:
> +		dev_dbg(tx->state->dev,
> +			"Unsupported media bus code: %u\n", mbus_code);
> +		return -EINVAL;

That should never happen, right ?

> +	}
> +
> +	return 0;
> +}
> +
>  static int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx,
>  					    unsigned int vc)
>  {
> @@ -258,11 +297,58 @@ static int adv748x_csi2_set_routing(struct v4l2_subdev *sd,
>  	return adv748x_csi2_apply_routing(sd, state, routing);
>  }
>  
> +static int adv748x_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				       struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> +	struct adv748x_csi2_format_info info = {};

Why do you need to initialize the structure to 0 ?

> +	struct v4l2_mbus_frame_desc_entry *entry;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret = -EINVAL;
> +
> +	if (pad != ADV748X_CSI2_SOURCE)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	/* A single route is available. */
> +	route = &state->routing.routes[0];
> +	fmt = v4l2_subdev_state_get_format(state, pad, route->source_stream);
> +	if (!fmt)
> +		goto err_unlock;

Can this happen ?

> +
> +	ret = adv748x_csi2_get_format_info(tx, fmt->code, &info);
> +	if (ret)
> +		goto err_unlock;
> +
> +	memset(fd, 0, sizeof(*fd));

This is done by the caller.

> +
> +	/* A single stream is available. */
> +	fd->num_entries = 1;
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	entry = &fd->entry[0];
> +	entry->stream = 0;
> +	entry->flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;

This is meant for streams that carry variable-length data. You cand drop
and, and leave the .length field unset.

> +	entry->length = fmt->width * fmt->height * info.bpp / 8;
> +	entry->pixelcode = fmt->code;
> +	entry->bus.csi2.vc = route->source_stream;
> +	entry->bus.csi2.dt = info.dt;
> +
> +err_unlock:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = adv748x_csi2_set_format,
>  	.get_mbus_config = adv748x_csi2_get_mbus_config,
>  	.set_routing = adv748x_csi2_set_routing,
> +	.get_frame_desc = adv748x_csi2_get_frame_desc,
>  };
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

