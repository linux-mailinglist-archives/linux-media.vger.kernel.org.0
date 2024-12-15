Return-Path: <linux-media+bounces-23440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919D9F24D3
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 17:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2CB51885D43
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 16:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF0618FDA3;
	Sun, 15 Dec 2024 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hYoGb/Dd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E39BE46
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734281144; cv=none; b=aP2zUrOQ9PlQHk+RIanqD7zfdt+L6gX+/Yq7UkD5KcfOYpLvjSXwip2ThkJTkgHwetovE52QHS+CIi0JlWmRPwhyxu4EFxVxOgo6ezONKPOWU3Z8hXU2OxJYeJOFJd5J6zIv+29wbFxTZTnC0ot2m1e4UOKBi5XrTEq2wK/5lDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734281144; c=relaxed/simple;
	bh=CaYWgo1wVy/F7RdRnu9LoMqSpSP/eMJjAFM3gtHJMuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKxNopnLM+da5SNIFm2Prhym1BAp9hNYMlNI0L9NH5SjxlV5XGPm1d3Pyf2y7mAX9csCcQAxHBNSNUs2uDd7hIyn7TbW4ZhBBRfl/t140NUaIfw1D+wTP6hP6IDb6YxhxvKYRK9eV7CJ0UhI8ONSPMh0UszeeYZPnFHbqTu8QFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hYoGb/Dd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AD34BDB;
	Sun, 15 Dec 2024 17:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734281104;
	bh=CaYWgo1wVy/F7RdRnu9LoMqSpSP/eMJjAFM3gtHJMuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYoGb/Dd57yAJ9bBWk3n+kHbpww5KOIQIeuUcq53oFSF4QRE12gSvhoExr+P8qxJ4
	 F0ViG+8WpP86Q5gn03VKmQ3siSCtzeqzEkoPrxFKVv7oD/qnmhHcdv6g5Va/EqdDD0
	 MpF36SczkFFdb+9t9r3nM8mUOy2T/MvRB1tXfIHY=
Date: Sun, 15 Dec 2024 18:45:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 1/5] media: v4l: Support passing media pad argument to
 v4l2_get_link_freq()
Message-ID: <20241215164523.GF9975@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210075906.609490-2-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Dec 10, 2024 at 09:59:02AM +0200, Sakari Ailus wrote:
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
> index 0a2f4f0d0a07..9fe74c7e064f 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -466,8 +466,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
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
> @@ -502,7 +502,22 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
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
> index 63ad36f04f72..fda903bb3674 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter
>   *
> - * @handler: The transmitter's control handler
> + * @pad: The transmitter's media pad (or control handler for non-MC users or
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
> +#else
> +#define v4l2_get_link_freq(handler, mul, div)		\
> +	__v4l2_get_link_freq_ctrl(handler, mul, div)
> +#endif
> +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> +			      unsigned int mul, unsigned int div);

Let's avoid this complexity by patching callers. I'm OK with this patch
as a temporary measure, but the series should end with a patch that
removes the ability to pass a control handler.

>  
>  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
>  		unsigned int n_terms, unsigned int threshold);

-- 
Regards,

Laurent Pinchart

