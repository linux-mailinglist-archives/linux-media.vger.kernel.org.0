Return-Path: <linux-media+bounces-10811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3240D8BC3E3
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 23:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62F231C21116
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 21:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1513762D2;
	Sun,  5 May 2024 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pSBFznoc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C272555B;
	Sun,  5 May 2024 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714943401; cv=none; b=dAZJTZSWHZsdwHN3aHcGRR16C1SEBmnKONaMNm1QDYCri0i1t658SdEVB56i52vo6oZj8DXnsL2J0w/D2dShe8kwniDSuo6rk5KDKU/LTQsBvtkbtm0pU1zSsf6vc4SNsD7oWDxmn6cE9nYgLBVDhbMW2u3UUXWi+qzIPmJkufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714943401; c=relaxed/simple;
	bh=GgNNdNgApi6a46hv7HMxnVhx0bawXaOS9evjH+rBOz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uo7IaTpNGFQDMZ6ZOxBJ/LiPo87PdTJdaAWSGlOm9HxUBcPHqpJuVHABT5J1SpwwOxTinSgIsN9KQpdQIWe/u1hhtMrl2aoOVGPzF3pKUz2IjwA2i8Hdv2BHnhhBqR7rvXkRVT32Hqe9nD4LrQMlO52OkjZvb8tb6jJA+PhFk94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pSBFznoc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC08263B;
	Sun,  5 May 2024 23:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714943397;
	bh=GgNNdNgApi6a46hv7HMxnVhx0bawXaOS9evjH+rBOz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSBFznocLwmBjxjjfIYf3oCW4WuC5sUofwChmnAsCwVPPfAA3rMA1KqwGs6QuUy92
	 wQ9XpRmlmlppABGT1LBYq1pSH0glwcHgIMKUHF5p6B+WLQTsPzd4w+AcHmoiHiNeNl
	 ERd81uHDUbPrxF+scXl6GLqXO7dz6gT5b4pDT5Es=
Date: Mon, 6 May 2024 00:09:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/11] media: adv748x-csi2: Validate the image format
Message-ID: <20240505210950.GE23227@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:22PM +0200, Jacopo Mondi wrote:
> The adv748x-csi2 driver configures the CSI-2 transmitter to
> automatically infer the image stream format from the connected
> frontend (HDMI or AFE).
> 
> Setting a new format on the subdevice hence does not actually control
> the CSI-2 output format, but it's only there for the purpose of
> pipeline validation.
> 
> However, there is currently no validation that the supplied media bus
> code is valid and supported by the device.
> 
> With the introduction of enum_mbus_codes a list of supported format is
> now available, use it to validate that the supplied format is correct
> and use the default YUYV8 one if that's not the case.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 27 +++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 219417b319a6..1aae6467ca62 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -215,6 +215,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
> +					 unsigned int code)
> +{
> +	const unsigned int *codes = is_txa(tx) ?
> +				    adv748x_csi2_txa_fmts :
> +				    adv748x_csi2_txb_fmts;
> +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> +
> +	for (unsigned int i = 0; i < num_fmts; i++) {
> +		if (codes[i] == code)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_format *sdformat)
> @@ -222,7 +239,15 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
>  	struct adv748x_state *state = tx->state;
>  	struct v4l2_mbus_framefmt *mbusformat;
> -	int ret = 0;
> +	int ret;
> +
> +	/*
> +	 * Make sure the format is supported, if not default it to
> +	 * YUYV8 as it's supported by both TXes.

As indicated in the review if 06/11, I think this should be UYVY8

> +	 */
> +	ret = adv748x_csi2_is_fmt_supported(tx, sdformat->format.code);
> +	if (ret)
> +		sdformat->format.code = MEDIA_BUS_FMT_YUYV8_1X16;
>  
>  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
>  						 sdformat->which);

-- 
Regards,

Laurent Pinchart

