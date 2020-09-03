Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5E725CCDA
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 23:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgICVyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 17:54:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgICVyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 17:54:01 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CBEE56E;
        Thu,  3 Sep 2020 23:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599170039;
        bh=wxgcEJq64ndET3rkAHyd4k6piPSr10OZBG5En/4DvwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tERTeQlmNpPg6kIMg9XO/inetCQs4ROT+hoj5518Ij3GLBzTVbaXMBSrGa8oNmYrI
         czinNUbw+0ce5DA6ZdasavjW3ciM09bQMKjNsMAqTdd4stLDfPQIq6PVk0USgH6COf
         aLI15otN8KjmVwz4Yeap4+ymaKgOH8mA55nN+JiA=
Date:   Fri, 4 Sep 2020 00:53:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-fcp: Drop local dma_parms
Message-ID: <20200903215335.GH6492@pendragon.ideasonboard.com>
References: <20426a75cba769372c2f3f12f44a477e6fc8e979.1599167414.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20426a75cba769372c2f3f12f44a477e6fc8e979.1599167414.git.robin.murphy@arm.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robin,

Thank you for the patch.

On Thu, Sep 03, 2020 at 10:12:27PM +0100, Robin Murphy wrote:
> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> for platform devices"), struct platform_device already provides a
> dma_parms structure, so we can save allocating another one.
> 
> Also the DMA segment size is simply a size, not a bitmask.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Looks good to me, I like the simplification.

Should I get this upstream, or do you have other similar patches
tree-wide that you plan to get merged in one go ?

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

-- 
Regards,

Laurent Pinchart
