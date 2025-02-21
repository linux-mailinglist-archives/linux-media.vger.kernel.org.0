Return-Path: <linux-media+bounces-26554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23482A3F05A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3AE13AFBB8
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 09:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1388E1D5ABA;
	Fri, 21 Feb 2025 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SBUvjzX7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E353FD4;
	Fri, 21 Feb 2025 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130288; cv=none; b=ZyzgWClBSGHquYF0j5smxeadHv2YjfLPUBL7OjpiUEcinN2jYuSfltzR1oMd0G3ol6YYJs84snJzlE2G4LJCaUDhBIde7MbLhXAda+muL9+P8jURx237nY2wPDXrKJE4/Z7ZUR8RnbPpLF18xQbESiwSeS6yp4g+FVQIcB4FRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130288; c=relaxed/simple;
	bh=ARTrsQ2nzk8syRF6hxGk2vNoNCrNelj+E7QXtFIvbDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hz3kNtSxS8tbyXkGbXEjiFeMEZeqHOSKsmEmmNm2exNPt0r80Od6b1MVoMRICOeEB/nqsCM4S3/5Y+NL8yhBs+P6/Nrd2xiYdDj5WcbHAPd//5aduzH5EBCtykMeqk7/GW12DOrjI5IkBhW5dlYzI0nVgfm2Kq446fdIFgW1IAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SBUvjzX7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A93E189A;
	Fri, 21 Feb 2025 10:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740130200;
	bh=ARTrsQ2nzk8syRF6hxGk2vNoNCrNelj+E7QXtFIvbDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBUvjzX73O2WnT3fkTTbV4PE9ApZqpWCha49V+nqyNwwmsN/KS76Rwcu3zoLkxXeZ
	 AydjBRi4g9c53HkZSjrRE7nAEJl2qoesHeVBjxmrnAuIqDHMc8S6cYhCQfN07IatcJ
	 RhMot9rZJrS0RBJAXpEn3jSZhWXrAVUdeef2owSg=
Date: Fri, 21 Feb 2025 10:31:21 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 2/3] media: i2c: imx219: Simplify binning mode
Message-ID: <hoh2rwql6qrzpdtuvof62jzipmba77xqottwdxqd2vqitgke5a@es6m3ghbp26d>
References: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
 <20250219-imx219_fixes_v2-v1-2-0e3f5dd9b024@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-imx219_fixes_v2-v1-2-0e3f5dd9b024@ideasonboard.com>

Hi Jai

On Wed, Feb 19, 2025 at 05:16:44PM +0530, Jai Luthra wrote:
> The imx219_get_binning() function currently returns two separate pieces
> of information, the return value is the binning mode enum, and the bin_h
> and bin_v references are updated with whether to perform binning in
> horizontal and vertical dimensions.
>
> It is simpler to combine both of these pieces of information, and
> directly update the bin_h and bin_v references with the register value
> that we will write to the sensor, which includes if the binning is
> digital or analog mode, thus allowing us to remove the superfluous
> binning mode enum.
>
> This is only a style change for the driver, with no functionality
> updated.
>
> Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Link: https://lore.kernel.org/linux-media/ubuuob7mb3o5bxoumrxv4rufutgk3lvdmdery6d3bfc6rytfti@tcchhlechzzp/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/imx219.c | 55 +++++++++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6e51a7af5e2a05cacefb201d96a9fbdc349f17d8..f02732d8fa95de0a295f247d4f0b60017dbb2ed2 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -146,12 +146,6 @@
>  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
>  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
>
> -enum binning_mode {
> -	BINNING_NONE = IMX219_BINNING_NONE,
> -	BINNING_X2 = IMX219_BINNING_X2,
> -	BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
> -};
> -
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
>  	/* Frame width */
> @@ -406,39 +400,43 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
>  	}
>  }
>
> -static enum binning_mode imx219_get_binning(struct imx219 *imx219, u8 *bin_h,
> -					    u8 *bin_v)
> +static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
>  {
>  	struct v4l2_subdev_state *state =
>  		v4l2_subdev_get_locked_active_state(&imx219->sd);
>  	const struct v4l2_mbus_framefmt *format =
>  		v4l2_subdev_state_get_format(state, 0);
>  	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
> +	u32 hbin = crop->width / format->width;
> +	u32 vbin = crop->height / format->height;
>
> -	*bin_h = crop->width / format->width;
> -	*bin_v = crop->height / format->height;
> +	*bin_h = IMX219_BINNING_NONE;
> +	*bin_v = IMX219_BINNING_NONE;
>
> -	if (*bin_h == 2 && *bin_v == 2)
> -		return BINNING_ANALOG_X2;
> -	else if (*bin_h == 2 || *bin_v == 2)
> -		/*
> -		 * Don't use analog binning if only one dimension
> -		 * is binned, as it crops the other dimension
> -		 */
> -		return BINNING_X2;
> -	else
> -		return BINNING_NONE;
> +	/*
> +	 * Use analog binning only if both dimensions are binned, as it crops
> +	 * the other dimension.
> +	 */
> +	if (hbin == 2 && vbin == 2) {
> +		*bin_h = IMX219_BINNING_X2_ANALOG;
> +		*bin_v = IMX219_BINNING_X2_ANALOG;
> +
> +		return;
> +	}
> +
> +	if (hbin == 2)
> +		*bin_h = IMX219_BINNING_X2;
> +	if (vbin == 2)
> +		*bin_v = IMX219_BINNING_X2;
>  }
>
>  static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
>  {
>  	u8 bin_h, bin_v;
> -	enum binning_mode binning = imx219_get_binning(imx219, &bin_h, &bin_v);
>
> -	if (binning == BINNING_ANALOG_X2)
> -		return 2;
> +	imx219_get_binning(imx219, &bin_h, &bin_v);
>
> -	return 1;
> +	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
>  }
>
>  /* -----------------------------------------------------------------------------
> @@ -674,7 +672,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  {
>  	const struct v4l2_mbus_framefmt *format;
>  	const struct v4l2_rect *crop;
> -	enum binning_mode binning;
>  	u8 bin_h, bin_v;
>  	u32 bpp;
>  	int ret = 0;
> @@ -692,11 +689,9 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
>  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
>
> -	binning = imx219_get_binning(imx219, &bin_h, &bin_v);
> -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
> -		  (bin_h == 2) ? binning : BINNING_NONE, &ret);
> -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
> -		  (bin_v == 2) ? binning : BINNING_NONE, &ret);
> +	imx219_get_binning(imx219, &bin_h, &bin_v);
> +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
>
>  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
>  		  format->width, &ret);
>
> --
> 2.48.1
>

