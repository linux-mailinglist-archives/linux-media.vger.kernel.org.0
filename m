Return-Path: <linux-media+bounces-10400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990BA8B6AFC
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA6081C21D26
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2304E1C291;
	Tue, 30 Apr 2024 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vgi8Hr1x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2818EB8
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714460483; cv=none; b=bsEcTtjSXWKgr8/yxoai8V9pH8fTV0b2BCeXwljRB6wlFSr2C/VtWohehyBnn+waKtt7MJS4JziUt71m/4t9uvHVTdic6LIMnTsq9coU900vAqjTg8OWaVsseR3WJSnljvapFHJPzJ46zKlE7nm6N+nDD2kRJjp42XFbOxB/Uok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714460483; c=relaxed/simple;
	bh=o5ve2abGLYfFjEoLBt+weOEdnPFMDf0Y/6yLGV7H4lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZkhPjNpm0pnlVLR055sJjl9XPl8/Q7ELvGMX+tH3iekGOlNIsBuE7vv6dgTvHYXm865JjLd1Cociu3V1e2kdPpiMhBDh/J/A7GKaEZNFUpnipOqcKL6CRfW2DtfMODI2qNVLu2oLCOBD/rUBozhPDuhy+4tdBCiN1W4eqE/i2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vgi8Hr1x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BBAE4D4;
	Tue, 30 Apr 2024 09:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714460417;
	bh=o5ve2abGLYfFjEoLBt+weOEdnPFMDf0Y/6yLGV7H4lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vgi8Hr1xI/49l13Eew7VZPskNxSbc/2XMLI91fTxIHT0GbFqbB2vE8CEIm6qK9Toj
	 EO3ln3sdoBvWndSkACWXGyZKtz5c2xALeL8xpxYnyX+UBvdrIvq3H5478TBaQIzXEk
	 Wn2a4jp7LQgMhBYBawpz1Wy/ByxDdSFp4cXGhjNM=
Date: Tue, 30 Apr 2024 09:01:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v4 1/4] media: v4l: Support passing sub-device argument
 to v4l2_get_link_freq()
Message-ID: <n5gr2rsxbnot7vittbs4mbhsuzmtwqgwlrbzk4ug6yklqyfit5@ts5oyzcc5qpc>
References: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
 <20240429190852.1008003-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240429190852.1008003-2-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Apr 29, 2024 at 10:08:49PM +0300, Sakari Ailus wrote:
> v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
> to take struct v4l2_subdev argument in order to obtain the link frequency
> using get_mbus_config() pad op. Prepare for this by allowing struct
> v4l2_subdev as well.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Nice! I need exactly something like this to avoid pre-computing a lot
a frequencies in a driver I'm working on.

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 19 ++++++++++++++++---
>  include/media/v4l2-common.h           | 14 +++++++++++---
>  2 files changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 4165c815faef..7f69b5a025fa 100644
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
> @@ -500,7 +500,20 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
>
>  	return freq > 0 ? freq : -EINVAL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
> +EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> +
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
>
>  /*
>   * Simplify a fraction using a simple continued fraction decomposition. The
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 63ad36f04f72..d7115cd61a38 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter
>   *
> - * @handler: The transmitter's control handler
> + * @pad: The transmitter's media pad (or control handler for compatibility
> + *	 reasons, don't use in new code)
>   * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
>   *	 D-PHY, samples per clock on parallel. 0 otherwise.
>   * @div: The divisor between pixel rate and link frequency. Number of data lanes
> @@ -541,8 +542,15 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>   * * %-ENOENT: Link frequency or pixel rate control not found
>   * * %-EINVAL: Invalid link frequency value
>   */
> -s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
> -		       unsigned int div);
> +#define v4l2_get_link_freq(pad, mul, div)				\
> +	_Generic(pad,							\
> +		 struct media_pad *: __v4l2_get_link_freq_pad,		\
> +		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
> +	(pad, mul, div)

That's nice and elegant, but given that I count 10 drivers in mainline
using this function, wouldn't it be better to make them use a pad and
remove the ctrl_handler version completely to avoid it being used in
future ?

> +s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> +			     unsigned int div);
> +s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> +			      unsigned int mul, unsigned int div);
>
>  void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
>  		unsigned int n_terms, unsigned int threshold);
> --
> 2.39.2
>
>

