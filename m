Return-Path: <linux-media+bounces-30644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E22A956EC
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 21:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C8E13A7B19
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 19:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2521EFF8E;
	Mon, 21 Apr 2025 19:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LTOvfX9q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AB12E401
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265186; cv=none; b=Sm5YcvbZuqIvtwIHkw4cIUHTmkeMYT9+RFoXMhNkqCu6EOWNKSfg10Pmv5VbSvuKKHK6lpBmH47pn+aHRdgmHEsXyhFUv3UxjO3ABd2Ccpf1OEGuQN2MKFU3QvgDZXxiSHbLqRpJgEa83YiWdpextDuG6j0469Pw2gRz4QQ2bQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265186; c=relaxed/simple;
	bh=K2Wpkwp0MlnMooHmy0BfUs/u4m2M+cLatjJ6VLiPHg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwyfWEaPK5/PefZLKsaGvjosjW4C7tDL/VrxifT4COXT6F5UvbtTheaJJ28N86pMhfD3K36J40fsEqKKhOFhzOJf6IzAdFGNOIHGC1zdZpFI1iTogqWQ9/9f2CbCki2XBfcPhnw2YS3VL6myZy7RY6owMqctc0AfqGbVUzj5mcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LTOvfX9q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5967E6D5;
	Mon, 21 Apr 2025 21:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745265056;
	bh=K2Wpkwp0MlnMooHmy0BfUs/u4m2M+cLatjJ6VLiPHg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTOvfX9qmXb5w9NLuiyGUEgir6UZHpVymqCplU9uQLHs5CacTboF94i29zsPXs33k
	 xNuxXYyQaAw9DEmmfVnI2qSE7/uP/2C5ZATRmUZNISaKQlRdf7K6a2kR+S/hgc0awc
	 zzkov6zLo2hOWaK0sz7uoyhasK1CqwrCapYlc5Dg=
Date: Mon, 21 Apr 2025 22:53:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 02/11] media: ccs-pll: Start VT pre-PLL multiplier
 search from correct value
Message-ID: <20250421195300.GB17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:45AM +0300, Sakari Ailus wrote:
> The ccs_pll_calculate_vt_tree() function does a search over possible VT
> PLL configurations to find the "best" one. If the sensor did not support
> odd pre-PLL divisors and the minimum value (with constraints) wasn't 1,
> other even values could have errorneously searched (and selected) for the
> pre-PLL divisor. Fix this.

Same comments as for 01/11. You can add my R-b tag if you address the
issues in the same way.

> Fixes: 415ddd993978 ("media: ccs-pll: Split limits and PLL configuration into front and back parts")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs-pll.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index e516ed23e899..2399cd6509b7 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -397,6 +397,8 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
>  	min_pre_pll_clk_div = max_t(u16, min_pre_pll_clk_div,
>  				    pll->ext_clk_freq_hz /
>  				    lim_fr->max_pll_ip_clk_freq_hz);
> +	if (!(pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER))
> +		min_pre_pll_clk_div = clk_div_even(min_pre_pll_clk_div);
>  
>  	dev_dbg(dev, "vt min/max_pre_pll_clk_div: %u,%u\n",
>  		min_pre_pll_clk_div, max_pre_pll_clk_div);

-- 
Regards,

Laurent Pinchart

