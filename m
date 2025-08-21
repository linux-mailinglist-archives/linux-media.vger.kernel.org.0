Return-Path: <linux-media+bounces-40570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C39B2F831
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 493E11CC6553
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BDF30BF65;
	Thu, 21 Aug 2025 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CiH0KIx4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA93D2E2823
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779756; cv=none; b=TZ9x9Ck8pbIdeFPqwwaQGMHLxf9pKnY36m8XIsYiE17ijicneURQOvwUNEWUfzHgfu0FhNTL4RCnq/YnxdqDMnYCxOO7PDewC8fqRs1g6Mal8ESIi+r80F2A63sVsrjvM4b2nsvFtyVNhPOvNhjzntaY+cpCguDd9oWpk8dne+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779756; c=relaxed/simple;
	bh=45rh0VmqCcpn5LJYbMGIhMZyoRKdKKoe/82viQliRhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0MuAuchBSL/2yobSOySGCave41OqHL6iJtzHdtvq3iOp5IfkN/p0dypilKrfwhPK1XiqyFShfbIAp9/cUK+pfSYv50+uKjgtHtRqMtJdwhQs2PpOhXiZRpvXyUDlkNQMDz8PLTccJG7vvgiZgGKx2YqdIk5+Pi0tYUeuIow1lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CiH0KIx4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 175AFFDB;
	Thu, 21 Aug 2025 14:34:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755779693;
	bh=45rh0VmqCcpn5LJYbMGIhMZyoRKdKKoe/82viQliRhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiH0KIx4q/wT2BFiWtmxe4kCiVgjvtcAX972lRVWQdjvsHCQ/4nFoyrnw3NGX+Vda
	 ON89J5Yk5hH/wTMTqHThXGlLEUEG6XVwlhveWK0B5zLi2HCiSe8xeGUFePEu2hs03O
	 ncKhig+4zW6qHKvADKzQs8eJBRyJElvsRoArJwX4=
Date: Thu, 21 Aug 2025 15:35:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 2/3] media: v4l2-common: Drop the workaround from
 v4l2_get_link_freq()
Message-ID: <20250821123528.GC8865@pendragon.ideasonboard.com>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821121207.552993-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821121207.552993-3-sakari.ailus@linux.intel.com>

On Thu, Aug 21, 2025 at 03:12:06PM +0300, Sakari Ailus wrote:
> Remove the workaround that allowed calling v4l2_get_link_freq() on the
> control handler.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 17 ++++++++---------
>  include/media/v4l2-common.h           | 19 ++++---------------
>  2 files changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index a5334aa35992..0574f5d685f8 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -512,8 +512,9 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
>  
> -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> -			      unsigned int mul, unsigned int div)
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> +				   unsigned int mul, unsigned int div)
>  {
>  	struct v4l2_ctrl *ctrl;
>  	s64 freq;
> @@ -548,11 +549,9 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
>  
>  	return freq > 0 ? freq : -EINVAL;
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
>  
> -#ifdef CONFIG_MEDIA_CONTROLLER
> -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> -			     unsigned int div)
> +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> +		       unsigned int div)
>  {
>  	struct v4l2_mbus_config mbus_config = {};
>  	struct v4l2_subdev *sd;
> @@ -571,10 +570,10 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  	 * Fall back to using the link frequency control if the media bus config
>  	 * doesn't provide a link frequency.
>  	 */
> -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> +	return v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> -#endif /* CONFIG_MEDIA_CONTROLLER */
> +EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> +#endif
>  
>  /*
>   * Simplify a fraction using a simple continued fraction decomposition. The
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 39dd0c78d70f..ab0ce8e605c3 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -560,15 +560,14 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter
>   *
> - * @pad: The transmitter's media pad (or control handler for non-MC users or
> - *	 compatibility reasons, don't use in new code)
> + * @pad: The transmitter's media pad
>   * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
>   *	 D-PHY, samples per clock on parallel. 0 otherwise.
>   * @div: The divisor between pixel rate and link frequency. Number of data lanes
>   *	 times two on D-PHY, 1 on parallel. 0 otherwise.
>   *
>   * This function is intended for obtaining the link frequency from the
> - * transmitter sub-devices. It returns the link rate, either from the
> + * transmitter sub-device's pad. It returns the link rate, either from the
>   * V4L2_CID_LINK_FREQ control implemented by the transmitter, or value
>   * calculated based on the V4L2_CID_PIXEL_RATE implemented by the transmitter.
>   *
> @@ -578,19 +577,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>   * * %-EINVAL: Invalid link frequency value
>   */
>  #ifdef CONFIG_MEDIA_CONTROLLER
> -#define v4l2_get_link_freq(pad, mul, div)				\
> -	_Generic(pad,							\
> -		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> -		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> -	(pad, mul, div)
> -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> -			     unsigned int div);
> -#else
> -#define v4l2_get_link_freq(handler, mul, div)		\
> -	__v4l2_get_link_freq_ctrl(handler, mul, div)
> +s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
> +		       unsigned int div);
>  #endif
> -s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> -			      unsigned int mul, unsigned int div);
>  
>  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
>  		unsigned int n_terms, unsigned int threshold);

-- 
Regards,

Laurent Pinchart

