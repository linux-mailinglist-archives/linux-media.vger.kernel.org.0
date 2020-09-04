Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD3125D76A
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 13:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbgIDLdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 07:33:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48022 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730160AbgIDLdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 07:33:10 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62B95540;
        Fri,  4 Sep 2020 13:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599219180;
        bh=1mVUmbo+wMVfQsDGKrk1mCuoDvfwVvSVa+ozt6d+TbI=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=HPecYUKxFzKE4rdvc7JI/aqc5j67h8+J1PfLJqlyQHxF+dyuBHtXjImpSyhIMxRMb
         jpZdB7L6LZCWM60BYR9gbHQaX21D7fR5+Hu9EL7BLIDNjhxQb22moz8THDpcIbvF73
         CJ3o54io0M3ct6Srxp0YmUQ4zF7LQkAf6q8yHVkU=
Subject: Re: [PATCH] media: rcar-fcp: Drop local dma_parms
To:     Robin Murphy <robin.murphy@arm.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20426a75cba769372c2f3f12f44a477e6fc8e979.1599167414.git.robin.murphy@arm.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <067714d0-0463-7e92-d53e-2e3ea8939b13@ideasonboard.com>
Date:   Fri, 4 Sep 2020 12:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20426a75cba769372c2f3f12f44a477e6fc8e979.1599167414.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robin,

On 03/09/2020 22:12, Robin Murphy wrote:
> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> for platform devices"), struct platform_device already provides a
> dma_parms structure, so we can save allocating another one.
> 
> Also the DMA segment size is simply a size, not a bitmask.

I recall following some precedence here.

But I'm happy with this update, I assume you'll update the other usages
of this?

git grep dma_set_max_seg_size | grep DMA_BIT_MASK
shows:

> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> drivers/gpu/drm/exynos/exynos_drm_dma.c:	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> drivers/gpu/drm/mediatek/mtk_drm_drv.c:	ret = dma_set_max_seg_size(dma_dev, (unsigned int)DMA_BIT_MASK(32));
> drivers/gpu/drm/msm/msm_drv.c:	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> drivers/media/platform/qcom/venus/core.c:	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> drivers/media/platform/rcar-fcp.c:	dma_set_max_seg_size(fcp->dev, DMA_BIT_MASK(32));


> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-fcp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
> index 5c6b00737fe7..13a84c7e3586 100644
> --- a/drivers/media/platform/rcar-fcp.c
> +++ b/drivers/media/platform/rcar-fcp.c
> @@ -22,7 +22,6 @@
>  struct rcar_fcp_device {
>  	struct list_head list;
>  	struct device *dev;
> -	struct device_dma_parameters dma_parms;
>  };
>  
>  static LIST_HEAD(fcp_devices);
> @@ -138,8 +137,7 @@ static int rcar_fcp_probe(struct platform_device *pdev)
>  
>  	fcp->dev = &pdev->dev;
>  
> -	fcp->dev->dma_parms = &fcp->dma_parms;
> -	dma_set_max_seg_size(fcp->dev, DMA_BIT_MASK(32));
> +	dma_set_max_seg_size(fcp->dev, UINT_MAX);
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> 

