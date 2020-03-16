Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33354186B37
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731216AbgCPMje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:39:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35846 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731050AbgCPMjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:39:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D7AAA3B;
        Mon, 16 Mar 2020 13:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584362372;
        bh=8MWreaBOOcT2ES4I84mlWsjXYrL44X8hB9WbBBHOfX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ufEpETLNkl5xRZrbJrPVtpVsEtupBC1E1XCMfjcPjw0OCT0EtkrkCSko3UrCCzAvY
         kHC6EOXpqZdhpkpj0dcSm5ZWHOl9cTPeDXsz0bb91Xov1+Pr+1dD3USmj2bsGUhzyE
         LsgmjsC8+M89VwkRyF9dKb5lbteSaI5D1cShkZ1E=
Date:   Mon, 16 Mar 2020 14:39:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 12/16] media: ti-vpe: cal: set DMA max seg size
Message-ID: <20200316123927.GE4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-12-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-12-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 13, 2020 at 01:41:17PM +0200, Tomi Valkeinen wrote:
> Set DMA max seg size correctly to get rid of warnings on 64 bit
> platforms:
> 
> DMA-API: cal 6f03000.cal: mapping sg segment longer than device claims to support [len=720896] [max=65536]
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 832f37ebad0d..64ea92dbfac5 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -2321,6 +2321,8 @@ static int cal_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = cal_runtime_get(dev);
> @@ -2335,6 +2337,8 @@ static int cal_probe(struct platform_device *pdev)
>  	return 0;
>  
>  runtime_disable:
> +	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +

It's probably time to fix this horrible DMA API that requires such
cleanups, but that's out of scope for this patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	pm_runtime_disable(&pdev->dev);
>  	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
>  		ctx = dev->ctx[i];
> @@ -2377,6 +2381,8 @@ static int cal_remove(struct platform_device *pdev)
>  	cal_runtime_put(dev);
>  	pm_runtime_disable(&pdev->dev);
>  
> +	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
