Return-Path: <linux-media+bounces-26062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D59A3261D
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 13:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C0113A5BA0
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 12:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6BC20C487;
	Wed, 12 Feb 2025 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djKvlezk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB8620A5CB;
	Wed, 12 Feb 2025 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364329; cv=none; b=pQm4Aq6aHlM2sIGmNlPYnYJ/wxKe3iH1H+d5PAsNGS6/lWrzph0EatgWj9aenCzw9L42buom6VonFeTWXBCichZM1lUdknqxh61uzGUJfYzgmCbMIgF0SOYRwr9EofSaDdJiz0kThhgOjPRlbBJ1tKF8t53NgaonF5py5EwtF6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364329; c=relaxed/simple;
	bh=MDIGdUpcHxh2Tq0tkaXQrIbTYWLchEjnXq4ARo0biNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG0nEXuXE0TihJXH2uY2cTnFN0Lbos/+z+ag/vwcDyXeGIErf1+a8WW9+yu6OHRg9uj659JNKYat0HKX1sXw0l31GjP80Er+qcNK0KpuU15TAUiSurx+F8XWNqVtFUM3Y0P6M9Qsak9JGNdKPay1v4ZGjhkvhaZRhNbAwhz2Sk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djKvlezk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739364327; x=1770900327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDIGdUpcHxh2Tq0tkaXQrIbTYWLchEjnXq4ARo0biNs=;
  b=djKvlezkkEacmQ7wZECmRo+7siZzLEyak3tNt/KGUkCJ0DbAVMC4jwVy
   XLl+F90uO3c8gv+LOylS8jenX/eEWVN0JhqqJ/lN/p8lVkbF87yhGFvf0
   3B75BquuB1ZY9UIu40n5zYOKHEw7eONZmp/p58tsiKzWcCfSXne4FRLeL
   cgzssCLNhnSuRrR0yGsUcfnsclgvj1E0ArBtHgEWgMXXpBBTSVfPcw+UT
   Cm3eqSNyvah/gC+78VsteG5RbiqcMcPYZlqOTK8l3we8YGreg5BN6Sb4o
   KSpE94LDs8OBuaVdmIX8RteiWpEDRRDKQVZtjYsfySNFin8D5hoWrE0Fl
   g==;
X-CSE-ConnectionGUID: egmROMrCSHq/p/MXulYM1A==
X-CSE-MsgGUID: M+wMf4FjTPy2Wp9LohS1NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43946245"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="43946245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 04:45:26 -0800
X-CSE-ConnectionGUID: TIQOYmLrRKalp6XvLfvCpA==
X-CSE-MsgGUID: u892swVGRtaUF0rE0/uq8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112666661"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 04:45:24 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C39EA11F99E;
	Wed, 12 Feb 2025 14:45:21 +0200 (EET)
Date: Wed, 12 Feb 2025 12:45:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: shravan kumar <shravan.chippa@microchip.com>
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com,
	praveen.kumar@microchip.com
Subject: Re: [PATCH V3] media: i2c: imx334: Add support for 1280x720 &
 640x480 resolutions
Message-ID: <Z6yX4QQRLBZeEqlp@kekkonen.localdomain>
References: <20241216043926.445001-1-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216043926.445001-1-shravan.chippa@microchip.com>

Hi Shravan,

Apologies for the late review.

On Mon, Dec 16, 2024 at 10:09:26AM +0530, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Add support for 1280x720@30 and 640x480@30 resolutions
> optimized the resolution arrays by added common register
> array
> 
> Updated 1920x1080@30 resolution register array with
> common register array
> 
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
> 
> changelog:
> 
> v2 -> v3
> Removied blank lines reported by media CI robot 
> 
> v1 -> v2
> Optimized the resolution arrays by added common register array
> 
> ---
>  drivers/media/i2c/imx334.c | 119 ++++++++++++++++++++++++++++++-------
>  1 file changed, 99 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index a544fc3df39c..58ad67dbb331 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -167,8 +167,8 @@ static const s64 link_freq[] = {
>  	IMX334_LINK_FREQ_445M,
>  };
>  
> -/* Sensor mode registers for 1920x1080@30fps */
> -static const struct imx334_reg mode_1920x1080_regs[] = {
> +/* Sensor common mode registers for 445M link frequency */
> +static const struct imx334_reg common_mode_regs_445m[] = {
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
>  	{0x3168, 0xa0},
>  	{0x316a, 0x7e},
>  	{0x319e, 0x02},
> @@ -330,6 +314,66 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
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
>  	{0x3000, 0x01},
> @@ -505,6 +549,32 @@ static const struct imx334_mode supported_modes[] = {
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
> @@ -989,6 +1059,15 @@ static int imx334_start_streaming(struct imx334 *imx334)
>  	const struct imx334_reg_list *reg_list;
>  	int ret;
>  
> +	if (link_freq[imx334->cur_mode->link_freq_idx] == IMX334_LINK_FREQ_445M) {

Could you add a struct field for the common registers and the length of the
list, instead of referring to the link frequency index?

It'd be nice to have the same split done to the other frequency as well.

> +		ret = imx334_write_regs(imx334, common_mode_regs_445m,
> +					ARRAY_SIZE(common_mode_regs_445m));
> +		if (ret) {
> +			dev_err(imx334->dev, "fail to write common registers");
> +			return ret;
> +		}
> +	}
> +
>  	/* Write sensor mode registers */
>  	reg_list = &imx334->cur_mode->reg_list;
>  	ret = imx334_write_regs(imx334, reg_list->regs,

-- 
Kind regards,

Sakari Ailus

