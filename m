Return-Path: <linux-media+bounces-30647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2CA956F9
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EB2A7A7BD0
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FA51442E8;
	Mon, 21 Apr 2025 20:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k9GkBvJt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B9801
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265677; cv=none; b=FQVJIem0+NP9aPjCJLk/DYZnWgRkrnc1fbCUgYDJ7S48DW6qb4K3bb5H1veM1gZM6lA5Lc0BDQhoF+ZLXwSmUGImHFkVWKKptfesqhIUNqwPMMaDcNF6rOWI9BZZ5XT7qh2q+rj5GK8d+ZGXBlPcC0WurupLOQITD/bPf0dBvyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265677; c=relaxed/simple;
	bh=YrSKU58olz/JjWt3y9OmNEkel5lzH5uVtWHNFzphcZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNULYlmOU/S6V2542b/GB0iX7KGUsbq62A2u+PgUB7Gpe6p80/bwW21oWaiez+tf3ABt18ttBo+EzJWBlaaEPZKu6ZBezYJzA5my87Po2cbHSamFq8iLSuxV09hh/vsTPXqW51BZq1n4uCRS5wLsMHdyvdhTj3gdnxFbSEx7zIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k9GkBvJt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A62E46D5;
	Mon, 21 Apr 2025 21:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745265546;
	bh=YrSKU58olz/JjWt3y9OmNEkel5lzH5uVtWHNFzphcZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9GkBvJtsTXyMO0LNhVKjt0sYc8vLBi01OtfEfu0OWjTE0x5J9tyV4VVo2KFYcKaj
	 u+ro5Nqfsr41dCIX8ojo7TA7sHAZ5Ce0bRLzQRVDTpFUh8XZk/cjdI/zqWGszeqOs0
	 gMiSafTWL0uZnacm4U9XG6vRBzSWDQac6cz4yKgk=
Date: Mon, 21 Apr 2025 23:01:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 04/11] media: ccs-pll: Correctly the upper limit of
 maximum op_pre_pll_clk_div
Message-ID: <20250421200111.GE17813@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065354.311617-5-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

In the subject line, s/Correctly/Correct/ (or an equivalent change)

On Thu, Apr 17, 2025 at 09:53:47AM +0300, Sakari Ailus wrote:
> The PLL calculator does a search of the PLL configuration space for all
> valid OP pre-PLL clock dividers. The maximum did not take into account CCS

s/CCS/the CCS/

> PLL flag CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER in which case also odd PLL
> dividers (other than 1) are valid. Do that now.
> 
> Fixes: 4e1e8d240dff ("media: ccs-pll: Add support for extended input PLL clock divider")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index 266fcd160da6..d985686b0a36 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c
> @@ -799,7 +799,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
>  		op_lim_fr->min_pre_pll_clk_div, op_lim_fr->max_pre_pll_clk_div);
>  	max_op_pre_pll_clk_div =
>  		min_t(u16, op_lim_fr->max_pre_pll_clk_div,
> -		      clk_div_even(pll->ext_clk_freq_hz /
> +		      DIV_ROUND_UP(pll->ext_clk_freq_hz,
>  				   op_lim_fr->min_pll_ip_clk_freq_hz));

This doesn't take the CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER flag into account.
If I understand the code right, it's not an issue, as
max_op_pre_pll_clk_div is only used as an upper bound for the
pre_pll_clk_div loop, which increments by 2 when
CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER isn't set.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	min_op_pre_pll_clk_div =
>  		max_t(u16, op_lim_fr->min_pre_pll_clk_div,

pre_pll_clk_div-- 
Regards,

Laurent Pinchart

