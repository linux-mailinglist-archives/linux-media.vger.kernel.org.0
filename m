Return-Path: <linux-media+bounces-32004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2206AAEA57
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 20:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFAB41BC412F
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 18:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C37224E4CE;
	Wed,  7 May 2025 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a5YfppQs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169F28B4F0;
	Wed,  7 May 2025 18:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644050; cv=none; b=HF1lY0Ttm8b5yGWCvY3jaquA9S7H+f+xtGdIIYexhIYHhME4liA3tS0fUqGYfQxAWSGwtircrI+if39NU9f6fivJdZ86BisDoTMXNTqAyn4wgnrn3HoOY9kPJk7WqW5YzNpQk4YpQlQgNuFhX8CSrnfxdzuk7LfrNoLZTAQRIzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644050; c=relaxed/simple;
	bh=4HKpOBJtT9Knd8yHFCVLaU8ixVr4lTJ1SeumRrcVqw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTQQOzKShfGYUN417ukBmraWkOWaHNYkKMiSVC0mvAOE2jxHCJ4dHMTVFr7EtDzcbmNopiSSb5dgyX+QSbZK0gqX5Dj6MgH+ZT/hTF7au5g1jbWhvNDahnwM6ev8uLaDJjlc74QD9ZQhbludFHmzU/WHbcNg5E9TWpM1DilViJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a5YfppQs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDACE6D5;
	Wed,  7 May 2025 20:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746644035;
	bh=4HKpOBJtT9Knd8yHFCVLaU8ixVr4lTJ1SeumRrcVqw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5YfppQsqevzz/DMRtGjjdbEW9ziRNKHDPWqIm3PIuPGPyf+Pd0EukV43zV25uwpE
	 FvxM4Ef0dESs1lmsMsGGjU/f4IPbYwTk2C/wvi62o6wzPKBh+JzzmxnRsBLJzQsOnD
	 gg5DkNh7IEPpZ/QZ9m9LaudG6hj0z8rmgmJhbWtc=
Date: Wed, 7 May 2025 20:53:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: omap3isp: use sgtable-based scatterlist
 wrappers
Message-ID: <20250507185358.GB28125@pendragon.ideasonboard.com>
References: <20250507160913.2084079-1-m.szyprowski@samsung.com>
 <CGME20250507160923eucas1p1a344e74759410b49143e2be42ef43ded@eucas1p1.samsung.com>
 <20250507160913.2084079-4-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507160913.2084079-4-m.szyprowski@samsung.com>

Hi Marek,

Thank you for the patch.

On Wed, May 07, 2025 at 06:09:13PM +0200, Marek Szyprowski wrote:
> Use common wrappers operating directly on the struct sg_table objects to
> fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
> functions have to be called with the number of elements originally passed
> to dma_map_sg_*() function, not the one returned in sgtable's nents.
> 
> Fixes: d33186d0be18 ("[media] omap3isp: ccdc: Use the DMA API for LSC")
> Fixes: 0e24e90f2ca7 ("[media] omap3isp: stat: Use the DMA API")
> CC: stable@vger.kernel.org
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti/omap3isp/ispccdc.c | 8 ++++----
>  drivers/media/platform/ti/omap3isp/ispstat.c | 6 ++----
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
> index dd375c4e180d..7d0c723dcd11 100644
> --- a/drivers/media/platform/ti/omap3isp/ispccdc.c
> +++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
> @@ -446,8 +446,8 @@ static int ccdc_lsc_config(struct isp_ccdc_device *ccdc,
>  		if (ret < 0)
>  			goto done;
>  
> -		dma_sync_sg_for_cpu(isp->dev, req->table.sgt.sgl,
> -				    req->table.sgt.nents, DMA_TO_DEVICE);
> +		dma_sync_sgtable_for_cpu(isp->dev, &req->table.sgt,
> +					 DMA_TO_DEVICE);
>  
>  		if (copy_from_user(req->table.addr, config->lsc,
>  				   req->config.size)) {
> @@ -455,8 +455,8 @@ static int ccdc_lsc_config(struct isp_ccdc_device *ccdc,
>  			goto done;
>  		}
>  
> -		dma_sync_sg_for_device(isp->dev, req->table.sgt.sgl,
> -				       req->table.sgt.nents, DMA_TO_DEVICE);
> +		dma_sync_sgtable_for_device(isp->dev, &req->table.sgt,
> +					    DMA_TO_DEVICE);
>  	}
>  
>  	spin_lock_irqsave(&ccdc->lsc.req_lock, flags);
> diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
> index 359a846205b0..d3da68408ecb 100644
> --- a/drivers/media/platform/ti/omap3isp/ispstat.c
> +++ b/drivers/media/platform/ti/omap3isp/ispstat.c
> @@ -161,8 +161,7 @@ static void isp_stat_buf_sync_for_device(struct ispstat *stat,
>  	if (ISP_STAT_USES_DMAENGINE(stat))
>  		return;
>  
> -	dma_sync_sg_for_device(stat->isp->dev, buf->sgt.sgl,
> -			       buf->sgt.nents, DMA_FROM_DEVICE);
> +	dma_sync_sgtable_for_device(stat->isp->dev, &buf->sgt, DMA_FROM_DEVICE);
>  }
>  
>  static void isp_stat_buf_sync_for_cpu(struct ispstat *stat,
> @@ -171,8 +170,7 @@ static void isp_stat_buf_sync_for_cpu(struct ispstat *stat,
>  	if (ISP_STAT_USES_DMAENGINE(stat))
>  		return;
>  
> -	dma_sync_sg_for_cpu(stat->isp->dev, buf->sgt.sgl,
> -			    buf->sgt.nents, DMA_FROM_DEVICE);
> +	dma_sync_sgtable_for_cpu(stat->isp->dev, &buf->sgt, DMA_FROM_DEVICE);
>  }
>  
>  static void isp_stat_buf_clear(struct ispstat *stat)

-- 
Regards,

Laurent Pinchart

