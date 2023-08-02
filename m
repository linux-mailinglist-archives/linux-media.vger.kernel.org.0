Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7856F76D925
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 23:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjHBVEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 17:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbjHBVEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 17:04:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BC726B0
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 14:04:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B77F829A;
        Wed,  2 Aug 2023 23:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691010216;
        bh=3re0y8JZDhLfaPizte+XU4IuMS0Put9waJxWZd8qXxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kZfUwOisG6cDktB+DZBqojMg9Qojnjj3F4+MMcjk11OE2jcSsDuzE+m/AK8Vu2+H0
         UKV8q8yQL59ulTHIWOEoAMYnKKNscsVwA+o8TC/jNczXFmgNtMUeNJODCu/NV3/YQ7
         TxX19Co0WsW61M2U/94rDKVP3twGvOu0EN50Drzk=
Date:   Thu, 3 Aug 2023 00:04:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     prabhakar.csengg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH -next] media: platform: ti: fix the return value handle
 for platform_get_irq()
Message-ID: <20230802210444.GF29718@pendragon.ideasonboard.com>
References: <20230731120212.2017996-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230731120212.2017996-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ruan,

Thank you for the patch.

On Mon, Jul 31, 2023 at 08:02:12PM +0800, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c | 4 +---
>  drivers/media/platform/ti/omap3isp/isp.c       | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 81a63a3865cf..a85b97107de7 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2420,10 +2420,8 @@ static int vpfe_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = platform_get_irq(pdev, 0);
> -	if (ret <= 0) {
> -		ret = -ENODEV;
> +	if (ret < 0)
>  		goto probe_out_cleanup;
> -	}
>  	vpfe->irq = ret;
>  
>  	ret = devm_request_irq(vpfe->pdev, vpfe->irq, vpfe_isr, 0,
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> index f3aaa9e76492..226db75221cd 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -2398,10 +2398,8 @@ static int isp_probe(struct platform_device *pdev)
>  
>  	/* Interrupt */
>  	ret = platform_get_irq(pdev, 0);
> -	if (ret <= 0) {
> -		ret = -ENODEV;
> +	if (ret < 0)
>  		goto error_iommu;
> -	}
>  	isp->irq_num = ret;
>  
>  	if (devm_request_irq(isp->dev, isp->irq_num, isp_isr, IRQF_SHARED,

The changes look fine to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Sakari, would you like to merge this through your tree ?

-- 
Regards,

Laurent Pinchart
