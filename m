Return-Path: <linux-media+bounces-23881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 957739F92E3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42AB416FD51
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E02218AD9;
	Fri, 20 Dec 2024 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cox7DpjE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531D2185B0
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700153; cv=none; b=dMUTLpqvzyw7cFTech5iBShq5bFifdht10R7sT5+yhjEHK8JhGuPldqXeSaMX+1nrcJkO/WMx6vzSfmEYg46x1FE3E98Z7FKOVDv15kQsaju9nGf4ElbZRa7cZ8NlQGgQaVfR2LDe3E6JRKPuKDW7PmS0z9jqwjsHAhr0WpP/wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700153; c=relaxed/simple;
	bh=O4Agdgb6zWiWZAKPbDSC/ZE0hNJ5dhsTXAfohwjiV9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQZvcNTc8GvjvhE4cLB1dzsI3+gpIbvOMQSBEVzweuuEMLSqSL7juBJJLMU1h/COvSTzYCovvLSKNVNWUSqoqyQOIAfEDDKm3w+zUCPVKtI3hH2XnjNOD76w/is+BXnMk8IBIo3zr8q/0aa9e1LUdeyfV+axE10BX1fuiWa7ITs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cox7DpjE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1A0816A;
	Fri, 20 Dec 2024 14:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734700109;
	bh=O4Agdgb6zWiWZAKPbDSC/ZE0hNJ5dhsTXAfohwjiV9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cox7DpjEfSB0sN26dUt6Y3qOTfHaM8jE3wFscLTKKU7KTRjr/VTyGrboj0EEbMU7/
	 E5uDTelCMXy51rpF4tuD6Vx6S5R5a98Nmtduju/qIi3KEniHbR3LQ9O9nnd3/EzYwF
	 Rf3LSK+f4g1aTpT+gou/Zqych0BeWgESj/AfDE2w=
Message-ID: <17c10edf-40b2-491a-873d-65b285d92e09@ideasonboard.com>
Date: Fri, 20 Dec 2024 15:09:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] media: v4l: Support passing media pad argument to
 v4l2_get_link_freq()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
 <20241217215445.901459-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241217215445.901459-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/12/2024 23:54, Sakari Ailus wrote:
> v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
> to take struct media_pad argument in order to obtain the link frequency
> using get_mbus_config() pad op. Prepare for this by allowing struct
> media_pad as well.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/v4l2-core/v4l2-common.c | 21 ++++++++++++++++++---
>   include/media/v4l2-common.h           | 19 ++++++++++++++++---
>   2 files changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 0a2f4f0d0a07..9fe74c7e064f 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -466,8 +466,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>   }
>   EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
>   
> -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> -		       unsigned int div)
> +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> +			      unsigned int mul, unsigned int div)
>   {
>   	struct v4l2_ctrl *ctrl;
>   	s64 freq;
> @@ -502,7 +502,22 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
>   
>   	return freq > 0 ? freq : -EINVAL;
>   }
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
>   /*
>    * Simplify a fraction using a simple continued fraction decomposition. The
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 63ad36f04f72..fda903bb3674 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>   /**
>    * v4l2_get_link_freq - Get link rate from transmitter
>    *
> - * @handler: The transmitter's control handler
> + * @pad: The transmitter's media pad (or control handler for non-MC users or
> + *	 compatibility reasons, don't use in new code)
>    * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
>    *	 D-PHY, samples per clock on parallel. 0 otherwise.
>    * @div: The divisor between pixel rate and link frequency. Number of data lanes
> @@ -541,8 +542,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>    * * %-ENOENT: Link frequency or pixel rate control not found
>    * * %-EINVAL: Invalid link frequency value
>    */
> -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> -		       unsigned int div);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +#define v4l2_get_link_freq(pad, mul, div)				\
> +	_Generic(pad,							\
> +		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> +		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> +	(pad, mul, div)

I can't decide if I love or hate _Generic =).

> +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> +			     unsigned int div);
> +#else
> +#define v4l2_get_link_freq(handler, mul, div)		\
> +	__v4l2_get_link_freq_ctrl(handler, mul, div)
> +#endif
> +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> +			      unsigned int mul, unsigned int div);
>   
>   void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
>   		unsigned int n_terms, unsigned int threshold);

This makes sense in the transition period. But I wonder, should we later 
have:

v4l2_get_link_freq(struct v4l2_subdev *sd, unsigned int pad, ...) like 
all the subdev ops? Perhaps not... Subdev ops take subdev as the first 
argument as, well, they're subdev ops.

It did look to me that in many drivers we already have the source subdev 
and pad stored somewhere, and getting the media_pad to call 
v4l2_get_link_freq() is an extra step.

  Tomi


