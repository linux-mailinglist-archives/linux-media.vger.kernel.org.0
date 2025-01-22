Return-Path: <linux-media+bounces-25124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D2BA19112
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CCF11639B3
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 12:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B66E212B10;
	Wed, 22 Jan 2025 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndK0x5wd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E3B1F5611;
	Wed, 22 Jan 2025 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737547309; cv=none; b=MjwCIZRyOYh5iODwWQMwjd1Ynn/c6sc75XoUc0Ggue/q7+3YE8pxN7Wsg0hCQiiG0in+ZFj1VcP4Xb3pjl/+sUFrlgTq6Ufq6eHddSsKn4Hv4eOSW1D0niqgeuUvjGoans2A8q8uvSauipJWbWLs9P2wJruQgO1z1hKBguaktBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737547309; c=relaxed/simple;
	bh=ZvKdt2/FSV26lhfwnPGoQ5k/ggSlXTE1r3FigQ9wX9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/l98k41V7UVi7laUHYxA1f2OKgp6L5nB4LyH9q2NeyktLcpm+SIyOoT5GAh/i4XeJp+vt0cNoTsPUY8eUiO+QUacZw+04xX0H7W6VLgDlVm+sBTTrf377iCaoKaEAIsa+WnBbvfQO4JAfnyPE+CZFKNI84f6LTUiSx3+Z6O4D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndK0x5wd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737547308; x=1769083308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZvKdt2/FSV26lhfwnPGoQ5k/ggSlXTE1r3FigQ9wX9k=;
  b=ndK0x5wdD06mEJGslPSTquAe30bCNXIYQsaf449aBllauEHz5sfgm/9w
   1C4y5i0L6Vy0XQItT/utUY6ZpqX4dfozAvHYFABcrRI5UQqlQDiF1zn06
   Ts2ycn2ZfZaLF2uIQNoxcK4ZLbG4N4Kfd58Id6fqgEMYFevsxSrekQn/m
   yrRZTEJP7ZDY2Et7FhdtHAmpY3mCtdNKHga6pRgXoKwspdajgGkbWNiGF
   SfTr6+mOFACM9gyJYDPC1km/GzU/gE7IN4EgK6tyu1jiLs75lSboOkdb8
   c+vPR7Q4tP6J0txsJDpLOLFDoJGMOblmRAzhsfThDzbwNWnzYQSQ7m126
   g==;
X-CSE-ConnectionGUID: T435Ymu5TlKjfJQ4ojfIlw==
X-CSE-MsgGUID: ZR/F6XSTQwavm/fePUkxIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38169118"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="38169118"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 04:01:47 -0800
X-CSE-ConnectionGUID: eNqUDXSCT4+gXyIlWyFZMw==
X-CSE-MsgGUID: 1dGQ5kikR7SjUgZIZUGUOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="106957131"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 04:01:45 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4E41A11F944;
	Wed, 22 Jan 2025 14:01:43 +0200 (EET)
Date: Wed, 22 Jan 2025 12:01:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peyton Howe <peyton.howe@bellsouth.net>
Subject: Re: [PATCH] media: imx219: Adjust PLL settings based on the number
 of MIPI lanes
Message-ID: <Z5DeJ_-VWnE7vO8m@kekkonen.localdomain>
References: <20250120-media-imx219-4lane-v1-1-c7aa1a413ddc@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-media-imx219-4lane-v1-1-c7aa1a413ddc@raspberrypi.com>

Hi Dave,

On Mon, Jan 20, 2025 at 11:35:40AM +0000, Dave Stevenson wrote:
> Commit ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> added support for device tree to allow configuration of the sensor to
> use 4 lanes with a link frequency of 363MHz, and amended the advertised
> pixel rate to 280.8MPix/s.
> 
> However it didn't change any of the PLL settings, so actually it would
> have been running overclocked in the MIPI block, and with the frame
> rate and exposure calculations being wrong as the pixel rate was
> unchanged.
> 
> The pixel rate and link frequency advertised were taken from the "Clock
> Setting Example" section of the datasheet. However those are based on an
> external clock of 12MHz, and are unachievable with a clock of 24MHz - it
> seems PREPLLCLK_VT_DIV and PREPLLCK_OP_DIV can ONLY be set via the
> automatic configuration documented in "9-1-2 EXCK_FREQ setting depend on
> INCK frequency", not by writing the registers.
> The closest we can get with a 24MHz clock is 281.6MPix/s and 364MHz.
> 
> Dropping all support for the 363MHz link frequency would cause problems
> for existing users, so allow it, but log a warning that the requested
> value is being changed to the supported one.
> 
> Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> Co-developed-by: Peyton Howe <peyton.howe@bellsouth.net>
> Signed-off-by: Peyton Howe <peyton.howe@bellsouth.net>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> This was fed back to us by Peyton Howe as giving image corruption
> on a Raspberry Pi with DF Robot imx219 module, and confirmed with
> a Soho Enterprises module.
> Effectively the module was being overclocked and misbehaving.
> 
> With this patch and the Soho Enterprises module no image corruption
> is observed, and the frame rates are spot on. I haven't checked
> exposure times, but those should follow frame rate as they are
> based on the same clock.
> ---
>  drivers/media/i2c/imx219.c | 78 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 61 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 2d54cea113e1..562b3eb0cb1e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -133,10 +133,11 @@
>  
>  /* Pixel rate is fixed for all the modes */
>  #define IMX219_PIXEL_RATE		182400000
> -#define IMX219_PIXEL_RATE_4LANE		280800000
> +#define IMX219_PIXEL_RATE_4LANE		281600000
>  
>  #define IMX219_DEFAULT_LINK_FREQ	456000000
> -#define IMX219_DEFAULT_LINK_FREQ_4LANE	363000000
> +#define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED	363000000
> +#define IMX219_DEFAULT_LINK_FREQ_4LANE	364000000

This shows again the ill effects of register list based drivers. :-(

>  
>  /* IMX219 native and active pixel array size. */
>  #define IMX219_NATIVE_WIDTH		3296U
> @@ -168,15 +169,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>  	{ CCI_REG8(0x30eb), 0x05 },
>  	{ CCI_REG8(0x30eb), 0x09 },
>  
> -	/* PLL Clock Table */
> -	{ IMX219_REG_VTPXCK_DIV, 5 },
> -	{ IMX219_REG_VTSYCK_DIV, 1 },
> -	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 = AUTO set */
> -	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 = AUTO set */
> -	{ IMX219_REG_PLL_VT_MPY, 57 },
> -	{ IMX219_REG_OPSYCK_DIV, 1 },
> -	{ IMX219_REG_PLL_OP_MPY, 114 },
> -
>  	/* Undocumented registers */
>  	{ CCI_REG8(0x455e), 0x00 },
>  	{ CCI_REG8(0x471e), 0x4b },
> @@ -201,6 +193,34 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>  	{ IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1000000) },
>  };
>  
> +static const struct cci_reg_sequence imx219_2lane_regs[] = {
> +	/* PLL Clock Table */
> +	{ IMX219_REG_VTPXCK_DIV, 5 },
> +	{ IMX219_REG_VTSYCK_DIV, 1 },
> +	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 = AUTO set */
> +	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 = AUTO set */
> +	{ IMX219_REG_PLL_VT_MPY, 57 },
> +	{ IMX219_REG_OPSYCK_DIV, 1 },
> +	{ IMX219_REG_PLL_OP_MPY, 114 },
> +
> +	/* 2-Lane CSI Mode */
> +	{ IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
> +};
> +
> +static const struct cci_reg_sequence imx219_4lane_regs[] = {
> +	/* PLL Clock Table */
> +	{ IMX219_REG_VTPXCK_DIV, 5 },
> +	{ IMX219_REG_VTSYCK_DIV, 1 },
> +	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 = AUTO set */
> +	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 = AUTO set */
> +	{ IMX219_REG_PLL_VT_MPY, 88 },
> +	{ IMX219_REG_OPSYCK_DIV, 1 },
> +	{ IMX219_REG_PLL_OP_MPY, 91 },
> +
> +	/* 4-Lane CSI Mode */
> +	{ IMX219_REG_CSI_LANE_MODE, IMX219_CSI_4_LANE_MODE },
> +};
> +
>  static const s64 imx219_link_freq_menu[] = {
>  	IMX219_DEFAULT_LINK_FREQ,
>  };
> @@ -662,9 +682,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  
>  static int imx219_configure_lanes(struct imx219 *imx219)
>  {
> -	return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
> -			 imx219->lanes == 2 ? IMX219_CSI_2_LANE_MODE :
> -			 IMX219_CSI_4_LANE_MODE, NULL);
> +	/* Write the appropriate PLL settings for the number of MIPI lanes */
> +	return cci_multi_reg_write(imx219->regmap,
> +				  imx219->lanes == 2 ? imx219_2lane_regs : imx219_4lane_regs,
> +				  imx219->lanes == 2 ? ARRAY_SIZE(imx219_2lane_regs) :
> +				  ARRAY_SIZE(imx219_4lane_regs), NULL);
>  };
>  
>  static int imx219_start_streaming(struct imx219 *imx219,
> @@ -1036,6 +1058,7 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>  		.bus_type = V4L2_MBUS_CSI2_DPHY
>  	};
>  	int ret = -EINVAL;
> +	bool link_frequency_valid = false;
>  
>  	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>  	if (!endpoint)
> @@ -1062,9 +1085,30 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>  		goto error_out;
>  	}
>  
> -	if (ep_cfg.nr_of_link_frequencies != 1 ||
> -	   (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
> -	    IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
> +	if (ep_cfg.nr_of_link_frequencies == 1) {
> +		switch (imx219->lanes) {
> +		case 2:
> +			if (ep_cfg.link_frequencies[0] ==
> +						IMX219_DEFAULT_LINK_FREQ)
> +				link_frequency_valid = true;
> +			break;
> +		case 4:
> +			if (ep_cfg.link_frequencies[0] ==
> +						IMX219_DEFAULT_LINK_FREQ_4LANE)
> +				link_frequency_valid = true;
> +			else if (ep_cfg.link_frequencies[0] ==
> +				   IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED) {
> +				dev_warn(dev, "Link frequency of %d not supported, but has been incorrectly advertised previously\n",
> +					 IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED);
> +				dev_warn(dev, "Using link frequency of %d\n",
> +					 IMX219_DEFAULT_LINK_FREQ_4LANE);

Would it be helpful to use v4l2_link_freq_to_bitmap() here? The old
frequency requires separate handling but I guess you'll still want to
expose the correct frequency to the user space so it should be just one
condition.

> +				link_frequency_valid = true;
> +			}
> +			break;
> +		}
> +	}
> +
> +	if (!link_frequency_valid) {
>  		dev_err_probe(dev, -EINVAL,
>  			      "Link frequency not supported: %lld\n",
>  			      ep_cfg.link_frequencies[0]);
> 

-- 
Lomd regards,

Sakari Ailus

