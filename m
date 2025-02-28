Return-Path: <linux-media+bounces-27224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42694A4988B
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7D313B463F
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621D625F781;
	Fri, 28 Feb 2025 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djmOzvP6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A0276D1A;
	Fri, 28 Feb 2025 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743344; cv=none; b=C1KnK4RAXsNJqGWj1HLAJft/evEs3ptCxbotHT9itZ68lyJp/0U2gJnM51/OEVGvsoLlIdcH21wA3/kJ6qNOf3d1S8mX2/2FvzXK3U6+P3nEFlP7OTo2M3rv1ouM1KOTiDDgtHAat+NajJru0jd45rDyyYGDx1Ff6rPzo3qkpQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743344; c=relaxed/simple;
	bh=XwQxmlGPReV6UlaylrY2vwKm8Dmxn4Uv+zvw6veM7ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uk+XOhZvQ0URg+g3wF93HjJKQk9IgtY2HkadBePCYqxC4GJjTaR5+8N88ulJmuFNKhpMHYSkU+GdqWx8ffiemrgf13VVk3jwkPJLK5YZIYWDQylmw+h5Wcg18tRSXw3GN5bCnos05EVTKH9023+TQsesnJVWLi1xJ36aBbSSDio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djmOzvP6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740743343; x=1772279343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XwQxmlGPReV6UlaylrY2vwKm8Dmxn4Uv+zvw6veM7ec=;
  b=djmOzvP63bXelT2kgZohiFJP4OuDJiRYfrnsDZjDiSXMNgdlyEsse9Df
   cZMC08lUutbCAnb8Vrrx52ya8DiBeLvTdkSy+2XTXYTIZxeFhJNZHtc5Y
   H86lopdbVqWKRgv2Buffe+ZYBX+VmtLDauKAD/WgoABVyKweCFiireoo4
   GvKIShIIYE5VlWGWANZQIigoJTB3D0+lsSsSMQ8xyyeAUps3/5KAnbn7S
   xjrAAnsbJy/4dB0EkrbRq2kLXk4xZwUIbjT2p/PwsEyQ8+fcrBKVymGnI
   SFJFv02E9+F8tUWhId0b6T6P6d/t+LiCRt3sqle1gmvKzZ39XEUuqkIK4
   g==;
X-CSE-ConnectionGUID: +bT87kkRS2WQD7hxsLlLrA==
X-CSE-MsgGUID: oQn6UYhDT0y6AoQmTLWpsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41791148"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="41791148"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 03:49:02 -0800
X-CSE-ConnectionGUID: 53kRlNm9Tuq+WFIQ2DkStQ==
X-CSE-MsgGUID: b43Zr6imQu+4nrikgafnxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117500719"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 03:49:00 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B905711F944;
	Fri, 28 Feb 2025 13:48:57 +0200 (EET)
Date: Fri, 28 Feb 2025 11:48:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: shravan kumar <shravan.chippa@microchip.com>
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com,
	praveen.kumar@microchip.com
Subject: Re: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Message-ID: <Z8GiqSfuyQdUNylt@kekkonen.localdomain>
References: <20250228103332.3647098-1-shravan.chippa@microchip.com>
 <20250228103332.3647098-2-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228103332.3647098-2-shravan.chippa@microchip.com>

Hi Shravan,

On Fri, Feb 28, 2025 at 04:03:30PM +0530, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Optimized the resolution arrays by integrating a common register array.
> 
> Adjusted the register array values for 1920x1080@30 and 3840x2160@30
> resolutions to align with the common register array values.
> 
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  drivers/media/i2c/imx334.c | 132 +++++++++----------------------------
>  1 file changed, 31 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index a544fc3df39c..a800f2203592 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -167,8 +167,8 @@ static const s64 link_freq[] = {
>  	IMX334_LINK_FREQ_445M,
>  };
>  
> -/* Sensor mode registers for 1920x1080@30fps */
> -static const struct imx334_reg mode_1920x1080_regs[] = {
> +/* Sensor common mode registers values */
> +static const struct imx334_reg common_mode_regs[] = {
>  	{0x3000, 0x01},
>  	{0x3018, 0x04},
>  	{0x3030, 0xca},
> @@ -176,26 +176,10 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
>  	{0x3032, 0x00},
>  	{0x3034, 0x4c},
>  	{0x3035, 0x04},
> -	{0x302c, 0xf0},
> -	{0x302d, 0x03},
> -	{0x302e, 0x80},
> -	{0x302f, 0x07},
> -	{0x3074, 0xcc},
> -	{0x3075, 0x02},
> -	{0x308e, 0xcd},
> -	{0x308f, 0x02},
> -	{0x3076, 0x38},
> -	{0x3077, 0x04},
> -	{0x3090, 0x38},
> -	{0x3091, 0x04},
> -	{0x3308, 0x38},
> -	{0x3309, 0x04},
> -	{0x30C6, 0x00},
> +	{0x30c6, 0x00},
>  	{0x30c7, 0x00},
>  	{0x30ce, 0x00},
>  	{0x30cf, 0x00},
> -	{0x30d8, 0x18},
> -	{0x30d9, 0x0a},
>  	{0x304c, 0x00},
>  	{0x304e, 0x00},
>  	{0x304f, 0x00},
> @@ -210,7 +194,7 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
>  	{0x300d, 0x29},
>  	{0x314c, 0x29},
>  	{0x314d, 0x01},
> -	{0x315a, 0x06},
> +	{0x315a, 0x0a},

We still have this change in the patch that's just supposed to move
register address/value pairs around. :-( Please check the changes yourself
before posting v7.

>  	{0x3168, 0xa0},
>  	{0x316a, 0x7e},
>  	{0x319e, 0x02},
> @@ -330,24 +314,32 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
>  	{0x3002, 0x00},
>  };
>  
> +/* Sensor mode registers for 1920x1080@30fps */
> +static const struct imx334_reg mode_1920x1080_regs[] = {
> +	{0x302c, 0xf0},
> +	{0x302d, 0x03},
> +	{0x302e, 0x80},
> +	{0x302f, 0x07},
> +	{0x3074, 0xcc},
> +	{0x3075, 0x02},
> +	{0x308e, 0xcd},
> +	{0x308f, 0x02},
> +	{0x3076, 0x38},
> +	{0x3077, 0x04},
> +	{0x3090, 0x38},
> +	{0x3091, 0x04},
> +	{0x3308, 0x38},
> +	{0x3309, 0x04},
> +	{0x30d8, 0x18},
> +	{0x30d9, 0x0a},
> +};
> +
>  /* Sensor mode registers for 3840x2160@30fps */
>  static const struct imx334_reg mode_3840x2160_regs[] = {
> -	{0x3000, 0x01},
> -	{0x3002, 0x00},
> -	{0x3018, 0x04},
> -	{0x37b0, 0x36},
> -	{0x304c, 0x00},
> -	{0x300c, 0x3b},
>  	{0x300d, 0x2a},
>  	{0x3034, 0x26},
>  	{0x3035, 0x02},
> -	{0x314c, 0x29},
> -	{0x314d, 0x01},
>  	{0x315a, 0x02},
> -	{0x3168, 0xa0},
> -	{0x316a, 0x7e},
> -	{0x3288, 0x21},
> -	{0x328a, 0x02},
>  	{0x302c, 0x3c},
>  	{0x302d, 0x00},
>  	{0x302e, 0x00},
> @@ -356,82 +348,13 @@ static const struct imx334_reg mode_3840x2160_regs[] = {
>  	{0x3077, 0x08},
>  	{0x3090, 0x70},
>  	{0x3091, 0x08},
> -	{0x30d8, 0x20},
> -	{0x30d9, 0x12},
>  	{0x3308, 0x70},
>  	{0x3309, 0x08},
> -	{0x3414, 0x05},
> -	{0x3416, 0x18},
> -	{0x35ac, 0x0e},
> -	{0x3648, 0x01},
> -	{0x364a, 0x04},
> -	{0x364c, 0x04},
> -	{0x3678, 0x01},
> -	{0x367c, 0x31},
> -	{0x367e, 0x31},
> -	{0x3708, 0x02},
> -	{0x3714, 0x01},
> -	{0x3715, 0x02},
> -	{0x3716, 0x02},
> -	{0x3717, 0x02},
> -	{0x371c, 0x3d},
> -	{0x371d, 0x3f},
> -	{0x372c, 0x00},
> -	{0x372d, 0x00},
> -	{0x372e, 0x46},
> -	{0x372f, 0x00},
> -	{0x3730, 0x89},
> -	{0x3731, 0x00},
> -	{0x3732, 0x08},
> -	{0x3733, 0x01},
> -	{0x3734, 0xfe},
> -	{0x3735, 0x05},
> -	{0x375d, 0x00},
> -	{0x375e, 0x00},
> -	{0x375f, 0x61},
> -	{0x3760, 0x06},
> -	{0x3768, 0x1b},
> -	{0x3769, 0x1b},
> -	{0x376a, 0x1a},
> -	{0x376b, 0x19},
> -	{0x376c, 0x18},
> -	{0x376d, 0x14},
> -	{0x376e, 0x0f},
> -	{0x3776, 0x00},
> -	{0x3777, 0x00},
> -	{0x3778, 0x46},
> -	{0x3779, 0x00},
> -	{0x377a, 0x08},
> -	{0x377b, 0x01},
> -	{0x377c, 0x45},
> -	{0x377d, 0x01},
> -	{0x377e, 0x23},
> -	{0x377f, 0x02},
> -	{0x3780, 0xd9},
> -	{0x3781, 0x03},
> -	{0x3782, 0xf5},
> -	{0x3783, 0x06},
> -	{0x3784, 0xa5},
> -	{0x3788, 0x0f},
> -	{0x378a, 0xd9},
> -	{0x378b, 0x03},
> -	{0x378c, 0xeb},
> -	{0x378d, 0x05},
> -	{0x378e, 0x87},
> -	{0x378f, 0x06},
> -	{0x3790, 0xf5},
> -	{0x3792, 0x43},
> -	{0x3794, 0x7a},
> -	{0x3796, 0xa1},
> -	{0x3e04, 0x0e},
>  	{0x319e, 0x00},
>  	{0x3a00, 0x01},
>  	{0x3a18, 0xbf},
> -	{0x3a19, 0x00},
>  	{0x3a1a, 0x67},
> -	{0x3a1b, 0x00},
>  	{0x3a1c, 0x6f},
> -	{0x3a1d, 0x00},
>  	{0x3a1e, 0xd7},
>  	{0x3a1f, 0x01},
>  	{0x3a20, 0x6f},
> @@ -989,6 +912,13 @@ static int imx334_start_streaming(struct imx334 *imx334)
>  	const struct imx334_reg_list *reg_list;
>  	int ret;
>  
> +	ret = imx334_write_regs(imx334, common_mode_regs,
> +				ARRAY_SIZE(common_mode_regs));
> +	if (ret) {
> +		dev_err(imx334->dev, "fail to write common registers");
> +		return ret;
> +	}
> +
>  	/* Write sensor mode registers */
>  	reg_list = &imx334->cur_mode->reg_list;
>  	ret = imx334_write_regs(imx334, reg_list->regs,

-- 
Regards,

Sakari Ailus

