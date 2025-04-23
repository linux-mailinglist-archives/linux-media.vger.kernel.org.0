Return-Path: <linux-media+bounces-30881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47DA99AFD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 23:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D93965A3000
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB7F1F1508;
	Wed, 23 Apr 2025 21:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uRut7gw1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E82701D4
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 21:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444963; cv=none; b=VI8pMLOIXW5BPDl2jlIufImU7cWNsJPFEt4xZScDXUIY/obvBT4xJmC37eQe8PLs8khimmN4jagDokF+TKIp/mh0QEHmNGmanl+7VE1Yy74sGrce9VwLYhHp714KvHihq3pfyal4FeXRUDgjdBEisAY3KK9G701AiLFysOeK1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444963; c=relaxed/simple;
	bh=1pB58JJzD9Z6rTVFi9hXCNUBXvMo6xLfejo4bEqgwI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0pDYmCkPTvvcbXTbP5In0pYC16evo5S/kbJYBzMUSxjhWB2GKEEkSVtUMKgYwAjZmXC7FkH5aZDZzubbV1+o8M15T6JbUeR7b8sZ1e7giS56/ya8TmkgpT3FSMjGOCh26hc3g+5jFGTTgSJKMBaXO4OZAwgVHhYaNJVmSB96Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uRut7gw1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76075198D;
	Wed, 23 Apr 2025 23:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745444957;
	bh=1pB58JJzD9Z6rTVFi9hXCNUBXvMo6xLfejo4bEqgwI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRut7gw1XrPF1bxWE3MEGBZIWH/cbaXLFf2+gMiPUuCwlM2AQZoEMTCyxc9imO1Fa
	 nfWHnliNaHm0KVmTgrZNtP03GNaYMyd20zgn1Rxk4/6XM3gGrxzXqFRGHEQdzhlDOp
	 zusOOlxWd4q2bMadcWIE3NYPomwNa1Vxfy1pvG5Y=
Date: Thu, 24 Apr 2025 00:49:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v3 08/11] media: ccs-pll: Add a flag for even PLL
 multipliers
Message-ID: <20250423214916.GA31282@pendragon.ideasonboard.com>
References: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
 <20250423123359.1800904-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423123359.1800904-9-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Apr 23, 2025 at 03:33:56PM +0300, Sakari Ailus wrote:
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
> index ebbc5e323244..f4be4e9f6777 100644
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
> +	    (mul & 1) && (more_mul & 1))
> +		more_mul <<= 1;
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
> +		i <<= 1;
> +
>  	dev_dbg(dev, "final more_mul: %u\n", i);
>  	if (i > more_mul_max) {
>  		dev_dbg(dev, "final more_mul is bad, max %u\n", more_mul_max);
> diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
> index ee206e5b287b..754eb5f52cc4 100644
> --- a/drivers/media/i2c/ccs-pll.h
> +++ b/drivers/media/i2c/ccs-pll.h
> @@ -22,6 +22,7 @@
>  /* op pix clock is for all lanes in total normally */
>  #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
>  #define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> +#define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(3)
>  /* CCS PLL flags */
>  #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)

I would probably have reordered the bits, but I don't mind much.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)

-- 
Regards,

Laurent Pinchart

