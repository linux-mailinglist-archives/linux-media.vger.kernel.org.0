Return-Path: <linux-media+bounces-34829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF59ADA2C9
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 19:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA577188EDA4
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2DF1C9DC6;
	Sun, 15 Jun 2025 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ujJDRUjm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E61DA21;
	Sun, 15 Jun 2025 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750007970; cv=none; b=oxb94Amhptj87MG38gkYpBKpzl0HWegHIaUv7XLWs/mE+XZRxfIzVMadWIAo0sbZM1e8gJganvMVZGkxvg0v2r6e92Ki68Eh/WHXV59QFb1MieBq299RTkkYNBF5gwdwps7CvHgZ/inYRbYYckKYykorseb6d5r3DffYXOSW7wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750007970; c=relaxed/simple;
	bh=OvBQK1v0fcWMCsu+jC3X3w8kD5Nu8oJEKeruk/03LRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsbVLRHoU16EyvFkljJEFrpYnIaTpSIV+fNmC+zZ8idb8/cB47henKvi01ztjagUpJHeLR1/yRE51klwJTryps7NCIgyMU00bhuvn4ine9td3lAP3SxfdPcoXxN2N1uQCk06sEvSWIlitYp88h8BmJXIy8bHGeXunXxFU0P0tn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ujJDRUjm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56D9789A;
	Sun, 15 Jun 2025 19:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750007954;
	bh=OvBQK1v0fcWMCsu+jC3X3w8kD5Nu8oJEKeruk/03LRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujJDRUjmlzKWOfkSqnSRinhqKLFlhuTZvlItTNN3Gc02/8WXcG0sfvh9yyML8jOfK
	 al3SdZZSUGpCcEixt2FKCy7EZJkZ5I1NaoV4LsqOXaEUBrLCC+OX1rQ8Hmu8fzK5yA
	 +kb3vrbuXmp2n+pukxY+/G5yfTsnjh2Q/iXsXDAA=
Date: Sun, 15 Jun 2025 20:19:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 12/13] media: rcar-vin: Enable media-graph on Gen2
Message-ID: <20250615171910.GA29950@pendragon.ideasonboard.com>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
 <20250613153434.2001800-13-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613153434.2001800-13-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 13, 2025 at 05:34:33PM +0200, Niklas Söderlund wrote:
> Complete the conversion from soc_camera to a full fledge media
> controller enabled devices for all supported generations of the device.
> All work is already done as this is already supported on Gen3, and
> later.
> 
> All that is missing is removing all special cases for the non
> media-graph call paths and use the common ones in their place.
> 
> The one change that stands out is dropping the doubling of the height in
> the Gen2 scaler setup, rvin_scaler_gen2(). In the Gen2 non-MC world the
> VIN size was set to match the video source subdevices, and if that was a
> TOP/BOTTOM video source it needed to be doubled for the scaler to
> function properly. In the MC world this is now handled by user-space
> configuration of the pipeline and the adjustment is not needed.
> 
> Mark the completion of converting from soc_camera by injecting an
> attribution of myself in the header.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v5
> - Use loop variable in rvin_group_notify_bound() to simplify usgae in
>   loop.
> - Move a few lines around in rvin_v4l2_register() to group similar
>   things together better made possible by removing the use_mc flag.
> 
> * Changes since v4
> - Break out small things to ease review.
> - Add rationale of odd looking change in rvin_scaler_gen2().
> 
> * Changes since v3
> - Resolve conflicts with other VIN work merged a head of this series.
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 162 ++----
>  .../platform/renesas/rcar-vin/rcar-dma.c      |  20 +-
>  .../platform/renesas/rcar-vin/rcar-v4l2.c     | 470 +-----------------
>  .../platform/renesas/rcar-vin/rcar-vin.h      |  10 +-
>  4 files changed, 44 insertions(+), 618 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 74fc90cf5800..f73729f59671 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -2,12 +2,11 @@
>  /*
>   * Driver for Renesas R-Car VIN
>   *
> + * Copyright (C) 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2011-2013 Renesas Solutions Corp.
>   * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
>   * Copyright (C) 2008 Magnus Damm
> - *
> - * Based on the soc-camera rcar_vin driver
>   */
>  
>  #include <linux/idr.h>
> @@ -43,9 +42,6 @@
>  
>  #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
>  
> -static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> -					  struct v4l2_subdev *subdev);
> -
>  /* -----------------------------------------------------------------------------
>   * Gen3 Group Allocator
>   */
> @@ -236,10 +232,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  		}
>  	}
>  
> -	if (vin->group->link_setup)
> -		return vin->group->link_setup(vin->group);
> -
> -	return  0;
> +	return vin->group->link_setup(vin->group);
>  }
>  
>  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
> @@ -290,18 +283,18 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
>  	guard(mutex)(&group->lock);
>  
>  	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> -		int ret;
> +		struct rvin_dev *pvin = group->vin[i];
>  
> -		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
> +		if (!pvin || pvin->parallel.asc != asc)
>  			continue;
>  
> -		ret = rvin_parallel_subdevice_attach(group->vin[i], subdev);
> -		if (ret)
> -			return ret;
> +		pvin->parallel.source_pad = 0;
> +		for (unsigned int pad = 0; pad < subdev->entity.num_pads; pad++)
> +			if (subdev->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)
> +				pvin->parallel.source_pad = pad;
>  
> -		v4l2_set_subdev_hostdata(subdev, group->vin[i]);
> -
> -		vin_dbg(group->vin[i], "Bound subdev %s\n", subdev->name);
> +		pvin->parallel.subdev = subdev;
> +		vin_dbg(pvin, "Bound subdev %s\n", subdev->name);
>  
>  		return 0;
>  	}
> @@ -525,95 +518,6 @@ static int rvin_create_controls(struct rvin_dev *vin)
>  	return 0;
>  }
>  
> -/* -----------------------------------------------------------------------------
> - * Async notifier
> - */
> -
> -static int rvin_find_pad(struct v4l2_subdev *sd, int direction)
> -{
> -	unsigned int pad;
> -
> -	if (sd->entity.num_pads <= 1)
> -		return 0;
> -
> -	for (pad = 0; pad < sd->entity.num_pads; pad++)
> -		if (sd->entity.pads[pad].flags & direction)
> -			return pad;
> -
> -	return -EINVAL;
> -}
> -
> -/* -----------------------------------------------------------------------------
> - * Parallel async notifier
> - */
> -
> -/* The vin lock should be held when calling the subdevice attach and detach */
> -static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> -					  struct v4l2_subdev *subdev)
> -{
> -	struct v4l2_subdev_mbus_code_enum code = {
> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> -	};
> -	int ret;
> -
> -	/* Find source and sink pad of remote subdevice */
> -	ret = rvin_find_pad(subdev, MEDIA_PAD_FL_SOURCE);
> -	if (ret < 0)
> -		return ret;
> -	vin->parallel.source_pad = ret;
> -
> -	ret = rvin_find_pad(subdev, MEDIA_PAD_FL_SINK);
> -	vin->parallel.sink_pad = ret < 0 ? 0 : ret;
> -
> -	if (vin->info->use_mc) {
> -		vin->parallel.subdev = subdev;
> -		return 0;
> -	}
> -
> -	/* Find compatible subdevices mbus format */
> -	vin->mbus_code = 0;
> -	code.index = 0;
> -	code.pad = vin->parallel.source_pad;
> -	while (!vin->mbus_code &&
> -	       !v4l2_subdev_call(subdev, pad, enum_mbus_code, NULL, &code)) {
> -		code.index++;
> -		switch (code.code) {
> -		case MEDIA_BUS_FMT_YUYV8_1X16:
> -		case MEDIA_BUS_FMT_UYVY8_1X16:
> -		case MEDIA_BUS_FMT_UYVY8_2X8:
> -		case MEDIA_BUS_FMT_UYVY10_2X10:
> -		case MEDIA_BUS_FMT_RGB888_1X24:
> -			vin->mbus_code = code.code;
> -			vin_dbg(vin, "Found media bus format for %s: %d\n",
> -				subdev->name, vin->mbus_code);
> -			break;
> -		default:
> -			break;
> -		}
> -	}
> -
> -	if (!vin->mbus_code) {
> -		vin_err(vin, "Unsupported media bus format for %s\n",
> -			subdev->name);
> -		return -EINVAL;
> -	}
> -
> -	/* Read tvnorms */
> -	ret = v4l2_subdev_call(subdev, video, g_tvnorms, &vin->vdev.tvnorms);
> -	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
> -		return ret;
> -
> -	/* Read standard */
> -	vin->std = V4L2_STD_UNKNOWN;
> -	ret = v4l2_subdev_call(subdev, video, g_std, &vin->std);
> -	if (ret < 0 && ret != -ENOIOCTLCMD)
> -		return ret;
> -
> -	vin->parallel.subdev = subdev;
> -
> -	return 0;
> -}
> -
>  /* -----------------------------------------------------------------------------
>   * CSI-2
>   */
> @@ -971,7 +875,7 @@ static int __maybe_unused rvin_resume(struct device *dev)
>  	 * as we don't know if and in which order the master VINs will
>  	 * be resumed.
>  	 */
> -	if (vin->info->use_mc) {
> +	if (vin->info->model == RCAR_GEN3) {
>  		unsigned int master_id = rvin_group_id_to_master(vin->id);
>  		struct rvin_dev *master = vin->group->vin[master_id];
>  		int ret;
> @@ -993,7 +897,6 @@ static int __maybe_unused rvin_resume(struct device *dev)
>  
>  static const struct rvin_info rcar_info_h1 = {
>  	.model = RCAR_H1,
> -	.use_mc = false,
>  	.max_width = 2048,
>  	.max_height = 2048,
>  	.scaler = rvin_scaler_gen2,
> @@ -1001,7 +904,6 @@ static const struct rvin_info rcar_info_h1 = {
>  
>  static const struct rvin_info rcar_info_m1 = {
>  	.model = RCAR_M1,
> -	.use_mc = false,
>  	.max_width = 2048,
>  	.max_height = 2048,
>  	.scaler = rvin_scaler_gen2,
> @@ -1009,7 +911,6 @@ static const struct rvin_info rcar_info_m1 = {
>  
>  static const struct rvin_info rcar_info_gen2 = {
>  	.model = RCAR_GEN2,
> -	.use_mc = false,
>  	.max_width = 2048,
>  	.max_height = 2048,
>  	.scaler = rvin_scaler_gen2,
> @@ -1024,7 +925,6 @@ static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a774e1 = {
>  	.model = RCAR_GEN3,
> -	.use_mc = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a774e1_routes,
> @@ -1040,7 +940,6 @@ static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a7795 = {
>  	.model = RCAR_GEN3,
> -	.use_mc = true,
>  	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
> @@ -1058,7 +957,6 @@ static const struct rvin_group_route rcar_info_r8a7796_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a7796 = {
>  	.model = RCAR_GEN3,
> -	.use_mc = true,
>  	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
> @@ -1076,7 +974,6 @@ static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a77965 = {
>  	.model = RCAR_GEN3,
> -	.use_mc = true,
>  	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
> @@ -1091,7 +988,6 @@ static const struct rvin_group_route rcar_info_r8a77970_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a77970 = {
>  	.model = RCAR_GEN3,
> -	.use_mc = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77970_routes,
> @@ -1105,7 +1001,6 @@ static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a77980 = {
>  	.model = RCAR_GEN3,
> -	.use_mc = true,
>  	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
> @@ -1119,7 +1014,6 @@ static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a77990 = {
>  	.model = RCAR_GEN3,
> -	.use_mc = true,
>  	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
> @@ -1133,7 +1027,6 @@ static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a77995 = {
>  	.model = RCAR_GEN3,
> -	.use_mc = true,
>  	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
> @@ -1143,7 +1036,6 @@ static const struct rvin_info rcar_info_r8a77995 = {
>  
>  static const struct rvin_info rcar_info_gen4 = {
>  	.model = RCAR_GEN4,
> -	.use_mc = true,
>  	.use_isp = true,
>  	.nv12 = true,
>  	.raw10 = true,
> @@ -1321,21 +1213,27 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_id;
>  
> -	if (vin->info->use_isp) {
> -		ret = rvin_isp_init(vin);
> -	} else if (vin->info->use_mc) {
> -		ret = rvin_csi2_init(vin);
> +	switch (vin->info->model) {
> +	case RCAR_GEN3:
> +	case RCAR_GEN4:
> +		if (vin->info->use_isp) {
> +			ret = rvin_isp_init(vin);
> +		} else {
> +			ret = rvin_csi2_init(vin);
>  
> -		if (vin->info->scaler &&
> -		    rvin_group_id_to_master(vin->id) == vin->id)
> -			vin->scaler = vin->info->scaler;
> -	} else {
> -		ret = rvin_group_get(vin, NULL, NULL);
> +			if (vin->info->scaler &&
> +			    rvin_group_id_to_master(vin->id) == vin->id)
> +				vin->scaler = vin->info->scaler;
> +		}
> +		break;
> +	default:
> +		ret = rvin_group_get(vin, rvin_parallel_setup_links, NULL);
>  		if (!ret)
>  			ret = rvin_group_notifier_init(vin, 0, 0);
>  
>  		if (vin->info->scaler)
>  			vin->scaler = vin->info->scaler;
> +		break;
>  	}
>  
>  	if (ret)
> @@ -1364,11 +1262,9 @@ static void rcar_vin_remove(struct platform_device *pdev)
>  
>  	rvin_v4l2_unregister(vin);
>  
> -	if (vin->info->use_isp || vin->info->use_mc) {
> -		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
> -			v4l2_async_nf_unregister(&vin->group->notifier);
> -			v4l2_async_nf_cleanup(&vin->group->notifier);
> -		}
> +	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
> +		v4l2_async_nf_unregister(&vin->group->notifier);
> +		v4l2_async_nf_cleanup(&vin->group->notifier);
>  	}
>  
>  	rvin_group_put(vin);
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 4fb33359bb0f..d4faa5a4e757 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -2,12 +2,11 @@
>  /*
>   * Driver for Renesas R-Car VIN
>   *
> + * Copyright (C) 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2011-2013 Renesas Solutions Corp.
>   * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
>   * Copyright (C) 2008 Magnus Damm
> - *
> - * Based on the soc-camera rcar_vin driver
>   */
>  
>  #include <linux/delay.h>
> @@ -555,17 +554,12 @@ static void rvin_set_coeff(struct rvin_dev *vin, unsigned short xs)
>  
>  void rvin_scaler_gen2(struct rvin_dev *vin)
>  {
> -	unsigned int crop_height;
>  	u32 xs, ys;
>  
>  	/* Set scaling coefficient */
> -	crop_height = vin->crop.height;
> -	if (V4L2_FIELD_HAS_BOTH(vin->format.field))
> -		crop_height *= 2;
> -
>  	ys = 0;
> -	if (crop_height != vin->compose.height)
> -		ys = (4096 * crop_height) / vin->compose.height;
> +	if (vin->crop.height != vin->compose.height)
> +		ys = (4096 * vin->crop.height) / vin->compose.height;
>  	rvin_write(vin, ys, VNYS_REG);
>  
>  	xs = 0;
> @@ -1294,14 +1288,6 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
>  	struct media_pad *pad;
>  	int ret;
>  
> -	/* No media controller used, simply pass operation to subdevice. */
> -	if (!vin->info->use_mc) {
> -		ret = v4l2_subdev_call(vin->parallel.subdev, video, s_stream,
> -				       on);
> -
> -		return ret == -ENOIOCTLCMD ? 0 : ret;
> -	}
> -
>  	pad = media_pad_remote_pad_first(&vin->pad);
>  	if (!pad)
>  		return -EPIPE;
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index db091af57c19..3a4c7433f061 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -2,12 +2,11 @@
>  /*
>   * Driver for Renesas R-Car VIN
>   *
> + * Copyright (C) 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2011-2013 Renesas Solutions Corp.
>   * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
>   * Copyright (C) 2008 Magnus Damm
> - *
> - * Based on the soc-camera rcar_vin driver
>   */
>  
>  #include <linux/pm_runtime.h>
> @@ -230,101 +229,6 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>   * V4L2
>   */
>  
> -static int rvin_reset_format(struct rvin_dev *vin)
> -{
> -	struct v4l2_subdev_format fmt = {
> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> -		.pad = vin->parallel.source_pad,
> -	};
> -	int ret;
> -
> -	ret = v4l2_subdev_call(vin_to_source(vin), pad, get_fmt, NULL, &fmt);
> -	if (ret)
> -		return ret;
> -
> -	v4l2_fill_pix_format(&vin->format, &fmt.format);
> -
> -	vin->crop.top = 0;
> -	vin->crop.left = 0;
> -	vin->crop.width = vin->format.width;
> -	vin->crop.height = vin->format.height;
> -
> -	/*  Make use of the hardware interlacer by default. */
> -	if (vin->format.field == V4L2_FIELD_ALTERNATE) {
> -		vin->format.field = V4L2_FIELD_INTERLACED;
> -		vin->format.height *= 2;
> -	}
> -
> -	rvin_format_align(vin, &vin->format);
> -
> -	vin->compose.top = 0;
> -	vin->compose.left = 0;
> -	vin->compose.width = vin->format.width;
> -	vin->compose.height = vin->format.height;
> -
> -	return 0;
> -}
> -
> -static int rvin_try_format(struct rvin_dev *vin, u32 which,
> -			   struct v4l2_pix_format *pix,
> -			   struct v4l2_rect *src_rect)
> -{
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -	struct v4l2_subdev_state *sd_state;
> -	static struct lock_class_key key;
> -	struct v4l2_subdev_format format = {
> -		.which = which,
> -		.pad = vin->parallel.source_pad,
> -	};
> -	enum v4l2_field field;
> -	u32 width, height;
> -	int ret;
> -
> -	/*
> -	 * FIXME: Drop this call, drivers are not supposed to use
> -	 * __v4l2_subdev_state_alloc().
> -	 */
> -	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
> -	if (IS_ERR(sd_state))
> -		return PTR_ERR(sd_state);
> -
> -	if (!rvin_format_from_pixel(vin, pix->pixelformat))
> -		pix->pixelformat = RVIN_DEFAULT_FORMAT;
> -
> -	v4l2_fill_mbus_format(&format.format, pix, vin->mbus_code);
> -
> -	/* Allow the video device to override field and to scale */
> -	field = pix->field;
> -	width = pix->width;
> -	height = pix->height;
> -
> -	ret = v4l2_subdev_call(sd, pad, set_fmt, sd_state, &format);
> -	if (ret < 0 && ret != -ENOIOCTLCMD)
> -		goto done;
> -	ret = 0;
> -
> -	v4l2_fill_pix_format(pix, &format.format);
> -
> -	if (src_rect) {
> -		src_rect->top = 0;
> -		src_rect->left = 0;
> -		src_rect->width = pix->width;
> -		src_rect->height = pix->height;
> -	}
> -
> -	if (field != V4L2_FIELD_ANY)
> -		pix->field = field;
> -
> -	pix->width = width;
> -	pix->height = height;
> -
> -	rvin_format_align(vin, pix);
> -done:
> -	__v4l2_subdev_state_free(sd_state);
> -
> -	return ret;
> -}
> -
>  static int rvin_querycap(struct file *file, void *priv,
>  			 struct v4l2_capability *cap)
>  {
> @@ -333,42 +237,6 @@ static int rvin_querycap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int rvin_try_fmt_vid_cap(struct file *file, void *priv,
> -				struct v4l2_format *f)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -
> -	return rvin_try_format(vin, V4L2_SUBDEV_FORMAT_TRY, &f->fmt.pix, NULL);
> -}
> -
> -static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
> -			      struct v4l2_format *f)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_rect fmt_rect, src_rect;
> -	int ret;
> -
> -	if (vb2_is_busy(&vin->queue))
> -		return -EBUSY;
> -
> -	ret = rvin_try_format(vin, V4L2_SUBDEV_FORMAT_ACTIVE, &f->fmt.pix,
> -			      &src_rect);
> -	if (ret)
> -		return ret;
> -
> -	vin->format = f->fmt.pix;
> -
> -	fmt_rect.top = 0;
> -	fmt_rect.left = 0;
> -	fmt_rect.width = vin->format.width;
> -	fmt_rect.height = vin->format.height;
> -
> -	v4l2_rect_map_inside(&vin->crop, &src_rect);
> -	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
> -
> -	return 0;
> -}
> -
>  static int rvin_g_fmt_vid_cap(struct file *file, void *priv,
>  			      struct v4l2_format *f)
>  {
> @@ -465,6 +333,7 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
>  
>  static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
>  {
> +	struct media_pad *pad = media_pad_remote_pad_first(&vin->pad);
>  	struct v4l2_subdev_format fmt = {
>  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>  	};
> @@ -472,18 +341,11 @@ static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
>  	unsigned int index;
>  	int ret;
>  
> -	if (vin->info->use_mc) {
> -		struct media_pad *pad = media_pad_remote_pad_first(&vin->pad);
> +	if (!pad)
> +		return -EINVAL;
>  
> -		if (!pad)
> -			return -EINVAL;
> -
> -		sd = media_entity_to_v4l2_subdev(pad->entity);
> -		index = pad->index;
> -	} else {
> -		sd = vin_to_source(vin);
> -		index = vin->parallel.source_pad;
> -	}
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	index = pad->index;
>  
>  	fmt.pad = index;
>  	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
> @@ -623,113 +485,6 @@ static int rvin_s_selection(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int rvin_g_parm(struct file *file, void *priv,
> -		       struct v4l2_streamparm *parm)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -
> -	return v4l2_g_parm_cap(&vin->vdev, sd, parm);
> -}
> -
> -static int rvin_s_parm(struct file *file, void *priv,
> -		       struct v4l2_streamparm *parm)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -
> -	return v4l2_s_parm_cap(&vin->vdev, sd, parm);
> -}
> -
> -static int rvin_g_pixelaspect(struct file *file, void *priv,
> -			      int type, struct v4l2_fract *f)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -
> -	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -		return -EINVAL;
> -
> -	return v4l2_subdev_call(sd, video, g_pixelaspect, f);
> -}
> -
> -static int rvin_enum_input(struct file *file, void *priv,
> -			   struct v4l2_input *i)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -	int ret;
> -
> -	if (i->index != 0)
> -		return -EINVAL;
> -
> -	ret = v4l2_subdev_call(sd, video, g_input_status, &i->status);
> -	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
> -		return ret;
> -
> -	i->type = V4L2_INPUT_TYPE_CAMERA;
> -
> -	if (v4l2_subdev_has_op(sd, pad, dv_timings_cap)) {
> -		i->capabilities = V4L2_IN_CAP_DV_TIMINGS;
> -		i->std = 0;
> -	} else {
> -		i->capabilities = V4L2_IN_CAP_STD;
> -		i->std = vin->vdev.tvnorms;
> -	}
> -
> -	strscpy(i->name, "Camera", sizeof(i->name));
> -
> -	return 0;
> -}
> -
> -static int rvin_g_input(struct file *file, void *priv, unsigned int *i)
> -{
> -	*i = 0;
> -	return 0;
> -}
> -
> -static int rvin_s_input(struct file *file, void *priv, unsigned int i)
> -{
> -	if (i > 0)
> -		return -EINVAL;
> -	return 0;
> -}
> -
> -static int rvin_querystd(struct file *file, void *priv, v4l2_std_id *a)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -
> -	return v4l2_subdev_call(sd, video, querystd, a);
> -}
> -
> -static int rvin_s_std(struct file *file, void *priv, v4l2_std_id a)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	int ret;
> -
> -	ret = v4l2_subdev_call(vin_to_source(vin), video, s_std, a);
> -	if (ret < 0)
> -		return ret;
> -
> -	vin->std = a;
> -
> -	/* Changing the standard will change the width/height */
> -	return rvin_reset_format(vin);
> -}
> -
> -static int rvin_g_std(struct file *file, void *priv, v4l2_std_id *a)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -
> -	if (v4l2_subdev_has_op(vin_to_source(vin), pad, dv_timings_cap))
> -		return -ENOIOCTLCMD;
> -
> -	*a = vin->std;
> -
> -	return 0;
> -}
> -
>  static int rvin_subscribe_event(struct v4l2_fh *fh,
>  				const struct v4l2_event_subscription *sub)
>  {
> @@ -740,167 +495,6 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
>  	return v4l2_ctrl_subscribe_event(fh, sub);
>  }
>  
> -static int rvin_enum_dv_timings(struct file *file, void *priv_fh,
> -				struct v4l2_enum_dv_timings *timings)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -	int ret;
> -
> -	if (timings->pad)
> -		return -EINVAL;
> -
> -	timings->pad = vin->parallel.sink_pad;
> -
> -	ret = v4l2_subdev_call(sd, pad, enum_dv_timings, timings);
> -
> -	timings->pad = 0;
> -
> -	return ret;
> -}
> -
> -static int rvin_s_dv_timings(struct file *file, void *priv_fh,
> -			     struct v4l2_dv_timings *timings)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -	int ret;
> -
> -	ret = v4l2_subdev_call(sd, pad, s_dv_timings,
> -			       vin->parallel.sink_pad, timings);
> -	if (ret)
> -		return ret;
> -
> -	/* Changing the timings will change the width/height */
> -	return rvin_reset_format(vin);
> -}
> -
> -static int rvin_g_dv_timings(struct file *file, void *priv_fh,
> -			     struct v4l2_dv_timings *timings)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -
> -	return v4l2_subdev_call(sd, pad, g_dv_timings,
> -				vin->parallel.sink_pad, timings);
> -}
> -
> -static int rvin_query_dv_timings(struct file *file, void *priv_fh,
> -				 struct v4l2_dv_timings *timings)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -
> -	return v4l2_subdev_call(sd, pad, query_dv_timings,
> -				vin->parallel.sink_pad, timings);
> -}
> -
> -static int rvin_dv_timings_cap(struct file *file, void *priv_fh,
> -			       struct v4l2_dv_timings_cap *cap)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -	int ret;
> -
> -	if (cap->pad)
> -		return -EINVAL;
> -
> -	cap->pad = vin->parallel.sink_pad;
> -
> -	ret = v4l2_subdev_call(sd, pad, dv_timings_cap, cap);
> -
> -	cap->pad = 0;
> -
> -	return ret;
> -}
> -
> -static int rvin_g_edid(struct file *file, void *fh, struct v4l2_edid *edid)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -	int ret;
> -
> -	if (edid->pad)
> -		return -EINVAL;
> -
> -	edid->pad = vin->parallel.sink_pad;
> -
> -	ret = v4l2_subdev_call(sd, pad, get_edid, edid);
> -
> -	edid->pad = 0;
> -
> -	return ret;
> -}
> -
> -static int rvin_s_edid(struct file *file, void *fh, struct v4l2_edid *edid)
> -{
> -	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -	int ret;
> -
> -	if (edid->pad)
> -		return -EINVAL;
> -
> -	edid->pad = vin->parallel.sink_pad;
> -
> -	ret = v4l2_subdev_call(sd, pad, set_edid, edid);
> -
> -	edid->pad = 0;
> -
> -	return ret;
> -}
> -
> -static const struct v4l2_ioctl_ops rvin_ioctl_ops = {
> -	.vidioc_querycap		= rvin_querycap,
> -	.vidioc_try_fmt_vid_cap		= rvin_try_fmt_vid_cap,
> -	.vidioc_g_fmt_vid_cap		= rvin_g_fmt_vid_cap,
> -	.vidioc_s_fmt_vid_cap		= rvin_s_fmt_vid_cap,
> -	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
> -
> -	.vidioc_g_selection		= rvin_g_selection,
> -	.vidioc_s_selection		= rvin_s_selection,
> -
> -	.vidioc_g_parm			= rvin_g_parm,
> -	.vidioc_s_parm			= rvin_s_parm,
> -
> -	.vidioc_g_pixelaspect		= rvin_g_pixelaspect,
> -
> -	.vidioc_enum_input		= rvin_enum_input,
> -	.vidioc_g_input			= rvin_g_input,
> -	.vidioc_s_input			= rvin_s_input,
> -
> -	.vidioc_dv_timings_cap		= rvin_dv_timings_cap,
> -	.vidioc_enum_dv_timings		= rvin_enum_dv_timings,
> -	.vidioc_g_dv_timings		= rvin_g_dv_timings,
> -	.vidioc_s_dv_timings		= rvin_s_dv_timings,
> -	.vidioc_query_dv_timings	= rvin_query_dv_timings,
> -
> -	.vidioc_g_edid			= rvin_g_edid,
> -	.vidioc_s_edid			= rvin_s_edid,
> -
> -	.vidioc_querystd		= rvin_querystd,
> -	.vidioc_g_std			= rvin_g_std,
> -	.vidioc_s_std			= rvin_s_std,
> -
> -	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
> -	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
> -	.vidioc_querybuf		= vb2_ioctl_querybuf,
> -	.vidioc_qbuf			= vb2_ioctl_qbuf,
> -	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
> -	.vidioc_expbuf			= vb2_ioctl_expbuf,
> -	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
> -	.vidioc_streamon		= vb2_ioctl_streamon,
> -	.vidioc_streamoff		= vb2_ioctl_streamoff,
> -
> -	.vidioc_log_status		= v4l2_ctrl_log_status,
> -	.vidioc_subscribe_event		= rvin_subscribe_event,
> -	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> -};
> -
> -/* -----------------------------------------------------------------------------
> - * V4L2 Media Controller
> - */
> -
>  static void rvin_mc_try_format(struct rvin_dev *vin,
>  			       struct v4l2_pix_format *pix)
>  {
> @@ -979,19 +573,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
>   * File Operations
>   */
>  
> -static int rvin_power_parallel(struct rvin_dev *vin, bool on)
> -{
> -	struct v4l2_subdev *sd = vin_to_source(vin);
> -	int power = on ? 1 : 0;
> -	int ret;
> -
> -	ret = v4l2_subdev_call(sd, core, s_power, power);
> -	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
> -		return ret;
> -
> -	return 0;
> -}
> -
>  static int rvin_open(struct file *file)
>  {
>  	struct rvin_dev *vin = video_drvdata(file);
> @@ -1011,11 +592,7 @@ static int rvin_open(struct file *file)
>  	if (ret)
>  		goto err_unlock;
>  
> -	if (vin->info->use_mc)
> -		ret = v4l2_pipeline_pm_get(&vin->vdev.entity);
> -	else if (v4l2_fh_is_singular_file(file))
> -		ret = rvin_power_parallel(vin, true);
> -
> +	ret = v4l2_pipeline_pm_get(&vin->vdev.entity);
>  	if (ret < 0)
>  		goto err_open;
>  
> @@ -1027,10 +604,7 @@ static int rvin_open(struct file *file)
>  
>  	return 0;
>  err_power:
> -	if (vin->info->use_mc)
> -		v4l2_pipeline_pm_put(&vin->vdev.entity);
> -	else if (v4l2_fh_is_singular_file(file))
> -		rvin_power_parallel(vin, false);
> +	v4l2_pipeline_pm_put(&vin->vdev.entity);
>  err_open:
>  	v4l2_fh_release(file);
>  err_unlock:
> @@ -1044,23 +618,14 @@ static int rvin_open(struct file *file)
>  static int rvin_release(struct file *file)
>  {
>  	struct rvin_dev *vin = video_drvdata(file);
> -	bool fh_singular;
>  	int ret;
>  
>  	mutex_lock(&vin->lock);
>  
> -	/* Save the singular status before we call the clean-up helper */
> -	fh_singular = v4l2_fh_is_singular_file(file);
> -
>  	/* the release helper will cleanup any on-going streaming */
>  	ret = _vb2_fop_release(file, NULL);
>  
> -	if (vin->info->use_mc) {
> -		v4l2_pipeline_pm_put(&vin->vdev.entity);
> -	} else {
> -		if (fh_singular)
> -			rvin_power_parallel(vin, false);
> -	}
> +	v4l2_pipeline_pm_put(&vin->vdev.entity);
>  
>  	mutex_unlock(&vin->lock);
>  
> @@ -1113,12 +678,6 @@ static void rvin_notify(struct v4l2_subdev *sd,
>  		container_of(sd->v4l2_dev, struct rvin_dev, v4l2_dev);
>  	unsigned int i;
>  
> -	/* If no media controller, no need to route the event. */
> -	if (!vin->info->use_mc) {
> -		rvin_notify_video_device(vin, notification, arg);
> -		return;
> -	}
> -
>  	group = vin->group;
>  
>  	for (i = 0; i < RCAR_VIN_NUM; i++) {
> @@ -1153,7 +712,8 @@ int rvin_v4l2_register(struct rvin_dev *vin)
>  	vdev->lock = &vin->lock;
>  	vdev->fops = &rvin_fops;
>  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> -		V4L2_CAP_READWRITE;
> +		V4L2_CAP_READWRITE | V4L2_CAP_IO_MC;
> +	vdev->ioctl_ops = &rvin_mc_ioctl_ops;
>  
>  	/* Set a default format */
>  	vin->format.pixelformat	= RVIN_DEFAULT_FORMAT;
> @@ -1162,14 +722,6 @@ int rvin_v4l2_register(struct rvin_dev *vin)
>  	vin->format.field = RVIN_DEFAULT_FIELD;
>  	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
>  
> -	if (vin->info->use_mc) {
> -		vdev->device_caps |= V4L2_CAP_IO_MC;
> -		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
> -	} else {
> -		vdev->ioctl_ops = &rvin_ioctl_ops;
> -		rvin_reset_format(vin);
> -	}
> -
>  	rvin_format_align(vin, &vin->format);
>  
>  	ret = video_register_device(&vin->vdev, VFL_TYPE_VIDEO, -1);
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index 38ae2bd20b72..74bef5b8adad 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -2,12 +2,11 @@
>  /*
>   * Driver for Renesas R-Car VIN
>   *
> + * Copyright (C) 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2011-2013 Renesas Solutions Corp.
>   * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
>   * Copyright (C) 2008 Magnus Damm
> - *
> - * Based on the soc-camera rcar_vin driver
>   */
>  
>  #ifndef __RCAR_VIN__
> @@ -79,8 +78,6 @@ struct rvin_video_format {
>   * @mbus_type:	media bus type
>   * @bus:	media bus parallel configuration
>   * @source_pad:	source pad of remote subdevice
> - * @sink_pad:	sink pad of remote subdevice
> - *
>   */
>  struct rvin_parallel_entity {
>  	struct v4l2_async_connection *asc;
> @@ -90,7 +87,6 @@ struct rvin_parallel_entity {
>  	struct v4l2_mbus_config_parallel bus;
>  
>  	unsigned int source_pad;
> -	unsigned int sink_pad;
>  };
>  
>  /**
> @@ -117,7 +113,6 @@ struct rvin_group_route {
>  /**
>   * struct rvin_info - Information about the particular VIN implementation
>   * @model:		VIN model
> - * @use_mc:		use media controller instead of controlling subdevice
>   * @use_isp:		the VIN is connected to the ISP and not to the CSI-2
>   * @nv12:		support outputting NV12 pixel format
>   * @raw10:		support outputting RAW10 pixel format
> @@ -129,7 +124,6 @@ struct rvin_group_route {
>   */
>  struct rvin_info {
>  	enum model_id model;
> -	bool use_mc;
>  	bool use_isp;
>  	bool nv12;
>  	bool raw10;
> @@ -176,7 +170,6 @@ struct rvin_info {
>   * @crop:		active cropping
>   * @compose:		active composing
>   * @scaler:		Optional scaler
> - * @std:		active video standard of the video source
>   *
>   * @alpha:		Alpha component to fill in for supported pixel formats
>   */
> @@ -218,7 +211,6 @@ struct rvin_dev {
>  	struct v4l2_rect crop;
>  	struct v4l2_rect compose;
>  	void (*scaler)(struct rvin_dev *vin);
> -	v4l2_std_id std;
>  
>  	unsigned int alpha;
>  };

-- 
Regards,

Laurent Pinchart

