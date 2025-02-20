Return-Path: <linux-media+bounces-26462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B39FA3DB2F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AE2319C0723
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4751F940A;
	Thu, 20 Feb 2025 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQmY8fqA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB51E766E;
	Thu, 20 Feb 2025 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057595; cv=none; b=WctJ7yYZSspv2UBgalvlb0ZRmqzljvswwzt25dPBO57o1UvBtr2cpD0T/OCUOlivid6tfkIM4IEabWd/yOqpWwqprTss8EmUwqdwEPXaftJRfG/YpxomUuzOdN5tsQdv9C4OPDAOJt/qiA+OWB1UINbWkG4ykvQLDlDtcxRmzcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057595; c=relaxed/simple;
	bh=APbqXh88xg3nJ04q86baKMgK+Abnc2gYjbREC8lsUVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ap1O7Vn+2QO0kXS9hSgzxJLQq49KLZ0gw5H1dSbbB0fuqSGTGJYtKe9S3D5K3+UEZU4ImVGDgdVHG6iahhg2bq6ZRFEoIwgKO6qZOXVqGuBAgh1WmO2OwtGPRwCQdxAOzeRNDCZUkihqieZnA3vkl0Z8DEHOgAxhFgWuCVKxSVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQmY8fqA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740057593; x=1771593593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=APbqXh88xg3nJ04q86baKMgK+Abnc2gYjbREC8lsUVg=;
  b=UQmY8fqAzQaqGCbvcnO2xTXt5J7fjMm3vlzf3+Wrqk9tSWBJ3jGMDCIg
   74GAEpn7zp+OlVCmj1H+S0spAEUgG8Sgzl/BZ1dss9650rwnIgA+kzwt4
   4lsRHB7YtdDL8L4zeCPf+ZjhsQ/yLmjXQUkzMwyjfQBumDbMiaLlOIaWt
   jyyPscMsFoaZqB/87ACDopmsXXS63NqemWPH0eS+HGzGK1MX0BiSA11B2
   RL/wxeSNlB64U3Ov5l627vVxV8HAnupeUAVPsyQVj4bMKU/A4JWTQK7A3
   mqz9m607wUp8GnDg/05jJmNcoZaOXLTIQKDN9vjVMGcqaMxR47B/jnZAH
   Q==;
X-CSE-ConnectionGUID: 5NDcW4O8RBqrS+66E8XSWg==
X-CSE-MsgGUID: QubNOprOTNylDos94auaDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40756665"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="40756665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:19:53 -0800
X-CSE-ConnectionGUID: bfgHlItuQcabMG+IUuOhZQ==
X-CSE-MsgGUID: PnXraADXQ4quK8KNT4xacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="145892227"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:19:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E89A911F7F2;
	Thu, 20 Feb 2025 15:19:47 +0200 (EET)
Date: Thu, 20 Feb 2025 13:19:47 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: shravan kumar <shravan.chippa@microchip.com>
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com,
	praveen.kumar@microchip.com
Subject: Re: [PATCH V4] media: i2c: imx334: Add support for 1280x720 &
 640x480 resolutions
Message-ID: <Z7cr8x6i8NZbdjIQ@kekkonen.localdomain>
References: <20250218093356.3608409-1-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218093356.3608409-1-shravan.chippa@microchip.com>

Hi Shravan,

On Tue, Feb 18, 2025 at 03:03:56PM +0530, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Added support for 1280x720@30 and 640x480@30 resolutions and
> optimized the resolution arrays by incorporating a common
> register array.
> 
> Updated the register array values for 1920x1080@30 and 3840x2160@30
> resolutions in accordance with the common register array values.
> 
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> 
> ---
> changelog:
> v3 -> v4
> In response to the review request, the dependency of the common register value
> array on the 445M link frequency has been eliminated.
> 
> Although I do not have a test setup for 4k resolution at an 819M link frequency, 
> I have made adjustments based on the IMX334 data sheet, the latest 4k resolution,
> and the common register value array. 
> 
> Additionally, the 4k resolution has been switched to master mode to ensure
> consistency with other resolutions that also use master mode.
> 
> changelog:
> v2 -> v3
> removied blank lines reported by media CI robot 
> 
> v1 -> v2
> Optimized the resolution arrays by added common register
> array
> ---
> 
>  drivers/media/i2c/imx334.c | 214 +++++++++++++++++++------------------
>  1 file changed, 109 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index a544fc3df39c..0172406780df 100644
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

What's the effect of this change and why is it done?

>  	{0x3168, 0xa0},
>  	{0x316a, 0x7e},
>  	{0x319e, 0x02},
> @@ -330,116 +314,103 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
>  	{0x3002, 0x00},
>  };
>  
> +/* Sensor mode registers for 640x480@30fps */
> +static const struct imx334_reg mode_640x480_regs[] = {
> +	{0x302c, 0x70},
> +	{0x302d, 0x06},
> +	{0x302e, 0x80},
> +	{0x302f, 0x02},
> +	{0x3074, 0x48},
> +	{0x3075, 0x07},
> +	{0x308e, 0x49},
> +	{0x308f, 0x07},
> +	{0x3076, 0xe0},
> +	{0x3077, 0x01},
> +	{0x3090, 0xe0},
> +	{0x3091, 0x01},
> +	{0x3308, 0xe0},
> +	{0x3309, 0x01},
> +	{0x30d8, 0x30},
> +	{0x30d9, 0x0b},
> +};
> +
> +/* Sensor mode registers for 1280x720@30fps */
> +static const struct imx334_reg mode_1280x720_regs[] = {
> +	{0x302c, 0x30},
> +	{0x302d, 0x05},
> +	{0x302e, 0x00},
> +	{0x302f, 0x05},
> +	{0x3074, 0x84},
> +	{0x3075, 0x03},
> +	{0x308e, 0x85},
> +	{0x308f, 0x03},
> +	{0x3076, 0xd0},
> +	{0x3077, 0x02},
> +	{0x3090, 0xd0},
> +	{0x3091, 0x02},
> +	{0x3308, 0xd0},
> +	{0x3309, 0x02},
> +	{0x30d8, 0x30},
> +	{0x30d9, 0x0b},
> +};
> +
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

This was the only location this register was written to.

Please split this into two to make it more reviewable: splitting register
lists into two and then to adding new modes.

> -	{0x300d, 0x2a},
> -	{0x3034, 0x26},
> -	{0x3035, 0x02},
> -	{0x314c, 0x29},
> -	{0x314d, 0x01},
> -	{0x315a, 0x02},
> -	{0x3168, 0xa0},
> -	{0x316a, 0x7e},
> -	{0x3288, 0x21},
> -	{0x328a, 0x02},
>  	{0x302c, 0x3c},
>  	{0x302d, 0x00},
>  	{0x302e, 0x00},
>  	{0x302f, 0x0f},
> +	{0x3074, 0xb0},
> +	{0x3075, 0x00},
> +	{0x308e, 0xb1},
> +	{0x308f, 0x00},
>  	{0x3076, 0x70},
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
> +	{0x30d8, 0x20},
> +	{0x30d9, 0x12},
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
> +	{0x300d, 0x2a},
> +	{0x3034, 0x26},
> +	{0x3035, 0x02},
> +	{0x315a, 0x02},
>  	{0x3a20, 0x6f},
>  	{0x3a21, 0x00},
>  	{0x3a22, 0xcf},
>  	{0x3a23, 0x00},
>  	{0x3a24, 0x6f},
>  	{0x3a25, 0x00},
> +	{0x3a24, 0x6f},
> +	{0x3a25, 0x00},
>  	{0x3a26, 0xb7},
>  	{0x3a27, 0x00},
>  	{0x3a28, 0x5f},
> @@ -505,6 +476,32 @@ static const struct imx334_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
>  			.regs = mode_1920x1080_regs,
>  		},
> +	}, {
> +		.width = 1280,
> +		.height = 720,
> +		.hblank = 2480,
> +		.vblank = 1170,
> +		.vblank_min = 45,
> +		.vblank_max = 132840,
> +		.pclk = 297000000,
> +		.link_freq_idx = 1,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> +			.regs = mode_1280x720_regs,
> +		},
> +	}, {
> +		.width = 640,
> +		.height = 480,
> +		.hblank = 2480,
> +		.vblank = 1170,
> +		.vblank_min = 45,
> +		.vblank_max = 132840,
> +		.pclk = 297000000,
> +		.link_freq_idx = 1,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_640x480_regs),
> +			.regs = mode_640x480_regs,
> +		},
>  	},
>  };
>  
> @@ -989,6 +986,13 @@ static int imx334_start_streaming(struct imx334 *imx334)
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
Kind regards,

Sakari Ailus

