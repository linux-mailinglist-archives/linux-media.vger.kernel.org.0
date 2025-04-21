Return-Path: <linux-media+bounces-30652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E759BA95750
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3C317A5DB5
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2B81F0995;
	Mon, 21 Apr 2025 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F1rIkrW+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD0B1F03D5
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 20:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745267075; cv=none; b=kLhGzuSVd4Kk5icsAJSgD9h+gkgGmOorBTX8tm++kwMT3+ifbcXO5s30/DG38BUJxeSDINvDbpLPWUvLoHfmmqF2volSUCUEo19WehsQX5mRA30I1qSR2vbhfGDwB05G3h67JwL75q1QWvlj5CjknSCoJ/HiB5ROODAV1OGgDIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745267075; c=relaxed/simple;
	bh=dfLQNeKBETGsWh/R40yOGwmE1YO15sJD5+g7BQLWNyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sf/ZTVdA3pWpSaagwl8B29XcIDwX6bMSbcFrQDf2CK/yI/O3cly9mtJm9hGIkenFn1pccMh1X4gG4gHoby6CC4Kws0pXml/oVOuGOlMNpGPDuh11rjtdO8M8OwnDDVv8bA6C+xrx8Ed4dSZ0KjalXUbRkD81u5Br/QCAxkqa0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F1rIkrW+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEB2B6D6;
	Mon, 21 Apr 2025 22:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745266945;
	bh=dfLQNeKBETGsWh/R40yOGwmE1YO15sJD5+g7BQLWNyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1rIkrW+Wk3x+2mTlBZkEMK/A3WEv17ZstrDE8F3bLvLypsy48zCbWnVJLuXWfsfO
	 3dbjtKK5+Qn4CJ+gr1CXkogpIXv6ebBJWrnIPEya7ZD1LRFvcoQacgJXRK2dUXYYid
	 YsNh9vD1OKLrXE4nElBK4GsC5k705UKtyFlt4cEo=
Date: Mon, 21 Apr 2025 23:24:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 09/11] media: ccs-pll: Better validate VT PLL branch
Message-ID: <20250421202429.GJ17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-10-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:52AM +0300, Sakari Ailus wrote:
> Check that the VT PLL dividers are actually found, don't trust they always
> are even though they should be.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs-pll.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index 3f8153fb4af0..fc6f8aff5fd8 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -449,7 +449,7 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
>  	return -EINVAL;
>  }
>  
> -static void
> +static int
>  ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
>  		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
>  		     struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
> @@ -572,6 +572,8 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
>  		if (best_pix_div < SHRT_MAX >> 1)
>  			break;
>  	}
> +	if (best_pix_div == SHRT_MAX >> 1)
> +		return -EINVAL;

I think I would have written

	if (vt_div > max_vt_div)
		return -EINVAL;

to match the for loop condition, this seems a bit more readable to me.
The result should be the same though, so either way,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	pll->vt_bk.sys_clk_div = DIV_ROUND_UP(vt_div, best_pix_div);
>  	pll->vt_bk.pix_clk_div = best_pix_div;
> @@ -584,6 +586,8 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
>  out_calc_pixel_rate:
>  	pll->pixel_rate_pixel_array =
>  		pll->vt_bk.pix_clk_freq_hz * pll->vt_lanes;
> +
> +	return 0;
>  }
>  
>  /*
> @@ -863,8 +867,10 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
>  		if (pll->flags & CCS_PLL_FLAG_DUAL_PLL)
>  			break;
>  
> -		ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
> -				     op_pll_bk, cphy, phy_const);
> +		rval = ccs_pll_calculate_vt(dev, lim, op_lim_bk, pll, op_pll_fr,
> +					    op_pll_bk, cphy, phy_const);
> +		if (rval)
> +			continue;
>  
>  		rval = check_bk_bounds(dev, lim, pll, PLL_VT);
>  		if (rval)

-- 
Regards,

Laurent Pinchart

