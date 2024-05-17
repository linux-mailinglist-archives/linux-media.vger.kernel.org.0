Return-Path: <linux-media+bounces-11592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2EE8C84A5
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 12:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D401F242B5
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 10:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362A233062;
	Fri, 17 May 2024 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jfcxdkr7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774A23772
	for <linux-media@vger.kernel.org>; Fri, 17 May 2024 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715941068; cv=none; b=K6qEnLNtkGQEfFmQx2T3kv2HU1DBUUASN3zVYV6wFVJgxVgFsOoVtPbqWsHx/Kz+ARbUsial/yjyuICdfHYXx3TjcoltSznm0Z/VfvnYuVLnADB9TBId9DGxhNRXmweBtgXQt8MsHlQolQ2Ep8EHUzRedTGuLWVoWrChYAauAOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715941068; c=relaxed/simple;
	bh=I/G+nTqIShfpa8RI3qdzFr8vdMvRCDMxH7P2r1jZeWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KB5WWeaIx6yE37Ft7g0qDDSudYnuxtaYkD0y/DB9+X1h99llldtQI4FFx+QQ9rVTSTQvDmwxRLXakNnZmzuN5mnSzWPDxHLG3I+O2ho+RSxwfwiyvdgrWo1FjLKkbE2Ph2MV6Qmpf11R9yFdTYf3jUzrs/1RHLB4LgDwWkyY6pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jfcxdkr7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [149.14.240.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5033682E;
	Fri, 17 May 2024 12:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715941050;
	bh=I/G+nTqIShfpa8RI3qdzFr8vdMvRCDMxH7P2r1jZeWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfcxdkr7RjG/YdjymLEdwvffg8agJ+YZLJFD4RhwYuDzc/yU6sO2rH6ZIgMJTaNr7
	 kjfA8/hHqP/wwlPuclpbGQboQViGITgjnqRPkItTI/Ux7rrX0+EpQPtluq8E5X+fT6
	 h226mHBfAudgYu6mkVZjLICBWcyqn3NpwrJ3KUKA=
Date: Fri, 17 May 2024 12:17:35 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v6 1/4] media: v4l: Support passing media pad argument to
 v4l2_get_link_freq()
Message-ID: <mmejy32ddl37q2f7z26qwehi5hwzftfa2vmlxnkfrjbsie7ree@6y427suyixdo>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
 <20240516122539.30787-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516122539.30787-2-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, May 16, 2024 at 03:25:36PM GMT, Sakari Ailus wrote:
> v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
> to take struct media_pad argument in order to obtain the link frequency
> using get_mbus_config() pad op. Prepare for this by allowing struct
> media_pad as well.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 21 ++++++++++++++++++---
>  include/media/v4l2-common.h           | 19 ++++++++++++++++---
>  2 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 4165c815faef..01650aed7c30 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -464,8 +464,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
>
> -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> -		       unsigned int div)
> +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> +			      unsigned int mul, unsigned int div)
>  {
>  	struct v4l2_ctrl *ctrl;
>  	s64 freq;
> @@ -500,7 +500,22 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
>
>  	return freq > 0 ? freq : -EINVAL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> +EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> +			     unsigned int div)
> +{
> +	struct v4l2_subdev *sd;
> +
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	if (!sd)
> +		return -ENODEV;
> +
> +	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> +}
> +EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> +#endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /*
>   * Simplify a fraction using a simple continued fraction decomposition. The
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 63ad36f04f72..f29dc8bb8f09 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter
>   *
> - * @handler: The transmitter's control handler
> + * @pad: The transmitter's media pad (or control handler for non-MC users or

The users of get_link_freq we have in mainline all select
MEDIA_CONTROLLER if I checked correctly
v4l2_get_link_freq

drivers/media/i2c/st-mipid02.c
drivers/media/i2c/tc358746.c
drivers/media/pci/intel/ipu3/ipu3-cio2.c
drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
drivers/media/pci/intel/ivsc/mei_csi.c
drivers/media/platform/cadence/cdns-csi2rx.c
drivers/media/platform/nxp/imx-mipi-csis.c
drivers/media/platform/nxp/imx8mq-mipi-csi2.c
drivers/media/platform/qcom/camss/camss.c
drivers/media/platform/ti/cal/cal-camerarx.c

is it even worth having a compatibility fallback or can they be
switched to use the remote's pad ?


> + *	 compatibility reasons, don't use in new code)
>   * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
>   *	 D-PHY, samples per clock on parallel. 0 otherwise.
>   * @div: The divisor between pixel rate and link frequency. Number of data lanes
> @@ -541,8 +542,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>   * * %-ENOENT: Link frequency or pixel rate control not found
>   * * %-EINVAL: Invalid link frequency value
>   */
> -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> -		       unsigned int div);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +#define v4l2_get_link_freq(pad, mul, div)				\
> +	_Generic(pad,							\
> +		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> +		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> +	(pad, mul, div)
> +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> +			     unsigned int div);
> +#else /* !CONFIG_MEDIA_CONTROLLER */
> +#define v4l2_get_link_freq(handler, mul, div)		\
> +	__v4l2_get_link_freq_ctrl(handler, mul, div)
> +#endif /* !CONFIG_MEDIA_CONTROLLER */

nit: no ! in !CONFIG_MEDIA_CONTROLLER
nit: maybe an empty line here ?

> +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> +			      unsigned int mul, unsigned int div);
>
>  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
>  		unsigned int n_terms, unsigned int threshold);
> --
> 2.39.2
>

