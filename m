Return-Path: <linux-media+bounces-30651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E81A95746
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56A90165C29
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ADB1F03C0;
	Mon, 21 Apr 2025 20:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X/0mgQwc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865B1E9B37
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745266770; cv=none; b=oBwgvCpNCL56ZuUfz2gag4UdNBVCc+ML02VFw6n1PILcwPIBH5+8fTczCEp6A8mODCXvgImqMz9eFmuLNOgyGV19OGJCMKtRUioh9A4ZbmrwXZJDIRjxI2ugKy7tC/MTpNzWdW3gKy9fD+hkGkoypHVcn2y3CYMy0Bs0PLIgKF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745266770; c=relaxed/simple;
	bh=qo4hdwGMSMtpuatnJvqfnDOmUroZXzf3XIE3AecJsIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6CkSNc/kBAvj7GxBPWqelRoIPqL/bEGhlWPgu/kPxYxyGtEMXcpDrhJ5dM7UYo69Ok46HuGPDl1uFBUP9zOSWpNmsMjdVAdBvE6AT0Jto9bcd0CkwYn0lHiZI1T/anEE0M9pjB5H8d06SjXN/rNoiZ7SjtegsyoP2kJ9TfhgSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X/0mgQwc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A9236D6;
	Mon, 21 Apr 2025 22:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745266640;
	bh=qo4hdwGMSMtpuatnJvqfnDOmUroZXzf3XIE3AecJsIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/0mgQwcj61BsrdBtVhSPYmJx7UGKdaYzS4RNynWgj9mTPnOkQZnRmr0nHVrkMegi
	 JI2RJ9KuEuOo7HtyHHJDiStRkdynaxrCwrDcfkZmkBIlLqbbG/VXEfAOlVSfATBYo0
	 d6BpnXvGfEzlX3lg/eqktLgURcjInJasixHoTKNA=
Date: Mon, 21 Apr 2025 23:19:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 08/11] media: ccs-pll: Add a flag for even PLL
 multipliers
Message-ID: <20250421201924.GI17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-9-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Apr 17, 2025 at 09:53:51AM +0300, Sakari Ailus wrote:
> Some devices (not entirely CCS compliant) only support even PLL
> multipliers. Add support for this through a PLL flag.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs-pll.c | 11 ++++++++++-
>  drivers/media/i2c/ccs-pll.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index ebbc5e323244..3f8153fb4af0 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -124,9 +124,10 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
>  	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
>  		pll->pixel_rate_csi);
>  
> -	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s\n",
> +	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s%s\n",
>  		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
>  		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
> +		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
>  		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
>  		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
>  		" ext-ip-pll-divider" : "",
> @@ -312,6 +313,10 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
>  	more_mul *= DIV_ROUND_UP(lim_fr->min_pll_multiplier, mul * more_mul);
>  	dev_dbg(dev, "more_mul2: %u\n", more_mul);
>  
> +	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
> +	    mul & 1 && more_mul & 1)

Even if not mandated by the C standard, I'd write

	    (mul & 1) && (more_mul & 1))

to make the code easier to read.

> +		more_mul <<= 1;

I'm not sure to get the logic behind this :-/

> +
>  	pll_fr->pll_multiplier = mul * more_mul;
>  	if (pll_fr->pll_multiplier > lim_fr->max_pll_multiplier) {
>  		dev_dbg(dev, "pll multiplier %u too high\n",
> @@ -668,6 +673,10 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
>  	if (!is_one_or_even(i))
>  		i <<= 1;
>  
> +	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
> +	    mul & 1 && i & 1)

Same here.

> +		i <<= 1;
> +
>  	dev_dbg(dev, "final more_mul: %u\n", i);
>  	if (i > more_mul_max) {
>  		dev_dbg(dev, "final more_mul is bad, max %u\n", more_mul_max);
> diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
> index ee206e5b287b..e8297db45460 100644
> --- a/drivers/media/i2c/ccs-pll.h
> +++ b/drivers/media/i2c/ccs-pll.h
> @@ -31,6 +31,7 @@
>  #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
>  #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
>  #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
> +#define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(11)

You could reuse bit 3, as it got dropped in patch 06/11.

>  
>  /**
>   * struct ccs_pll_branch_fr - CCS PLL configuration (front)

-- 
Regards,

Laurent Pinchart

