Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0D921B3E6
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 13:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgGJLYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 07:24:35 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:36261 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726820AbgGJLYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 07:24:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tr8mjmuzRJcNHtr8qjrqk6; Fri, 10 Jul 2020 13:24:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594380272; bh=HtnVOtzLa94hrtG4BbP13R4IShAG4gxuZQ7nvMJ0KAo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uXBnej7LSWIvGgatAUBoNzeTXbgid2SZGDd/EECPujyHKAvVvBkkaZ3VqsFlMGcZD
         Sy1aH5vlxnsHFm8WRz3TSMcESgm2LF2uP18A08uAMVaERJOEy0XYeqhs75tMLL8IZM
         tIDfe0flyI6VtoTsRTN3mie3x6MEc4TpsHvWGnbvgtDTw/ZfBP/VDLhO+FzjL2ckST
         Lu6UzPyHlCfmzv1y4T8RfgdysOFgSxfc20UHNP0qgegFNcBiFwPmdcgvx4La5HLSzc
         VwT8/raf3gv1vJaU/Ubp0XimRabhE+jUDsbSY++CPbZfY3uYNPl4RaWfccxuB8Fj7b
         tIKbudHTcmjHw==
Subject: Re: [PATCH v2 057/108] media: ti-vpe: cal: Add cal_camerarx_destroy()
 to cleanup CAMERARX
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
 <20200706183709.12238-58-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fe5265b8-2ad4-3017-d223-d8d55e3b7082@xs4all.nl>
Date:   Fri, 10 Jul 2020 13:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706183709.12238-58-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOnBpF1Mp5Hn7Vkbwf1l1kvXhec4BxhsUK9VOQ15TnyDRpav2WSsrbIonbTLL8rQQDKdyRiVTZZGj7r4YgIZ0fBWzmoqx3Cvqp1rGd/zXNpJGG9qrQUg
 mm66iU4OPvfj1KzVvUkbrURhgNztn0c/esPGPr33BGeEyvt0u16n12p8n5FboBuUkVUIn4KxUOWg5WHvLlDLAnIwgTP4PiLjDiVryku3rgIjSz/1rjIBYz6p
 jQvsLSccaGD0URBp6o2Z5+u7dcJS8+47MMB16o8f1ibiWA1LxHJv22yJ7b13G4FS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/07/2020 20:36, Laurent Pinchart wrote:
> The cal_camerarx_create() function allocates resources with devm_*, and
> thus doesn't need any manual cleanup. Those won't hold true for long, as
> we will need to store resources that have no devm_* allocation variant
> in cal_camerarx. Furthermore, devm_kzalloc() is the wrong memory
> allocation API for structures that can be accessed from userspace, as
> device nodes can be kept open across device removal.
> 
> Add a cal_camerarx_destroy() function to destroy a CAMERARX instance
> explicitly, and switch to kzalloc() for memory allocation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Set cal->phy[i] to NULL in error path
> ---
>  drivers/media/platform/ti-vpe/cal.c | 36 ++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 5580913a1356..492141f07d69 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -932,7 +932,7 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	struct cal_camerarx *phy;
>  	int ret;
>  
> -	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
> +	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -947,7 +947,8 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
>  	if (IS_ERR(phy->base)) {
>  		cal_err(cal, "failed to ioremap\n");
> -		return ERR_CAST(phy->base);
> +		ret = PTR_ERR(phy->base);
> +		goto error;
>  	}
>  
>  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
> @@ -955,9 +956,21 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  
>  	ret = cal_camerarx_regmap_init(cal, phy);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		goto error;
>  
>  	return phy;
> +
> +error:
> +	kfree(phy);
> +	return ERR_PTR(ret);
> +}
> +
> +static void cal_camerarx_destroy(struct cal_camerarx *phy)
> +{
> +	if (!phy)
> +		return;

This isn't necessary since kfree already tests for this.

Regards,

	Hans

> +
> +	kfree(phy);
>  }
>  
>  static int cal_camerarx_init_regmap(struct cal_dev *cal)
> @@ -2253,15 +2266,18 @@ static int cal_probe(struct platform_device *pdev)
>  	/* Create CAMERARX PHYs. */
>  	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
>  		cal->phy[i] = cal_camerarx_create(cal, i);
> -		if (IS_ERR(cal->phy[i]))
> -			return PTR_ERR(cal->phy[i]);
> +		if (IS_ERR(cal->phy[i])) {
> +			ret = PTR_ERR(cal->phy[i]);
> +			cal->phy[i] = NULL;
> +			goto error_camerarx;
> +		}
>  	}
>  
>  	/* Register the V4L2 device. */
>  	ret = v4l2_device_register(&pdev->dev, &cal->v4l2_dev);
>  	if (ret) {
>  		cal_err(cal, "Failed to register V4L2 device\n");
> -		return ret;
> +		goto error_camerarx;
>  	}
>  
>  	/* Create contexts. */
> @@ -2302,6 +2318,11 @@ static int cal_probe(struct platform_device *pdev)
>  
>  error_v4l2:
>  	v4l2_device_unregister(&cal->v4l2_dev);
> +
> +error_camerarx:
> +	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
> +		cal_camerarx_destroy(cal->phy[i]);
> +
>  	return ret;
>  }
>  
> @@ -2330,6 +2351,9 @@ static int cal_remove(struct platform_device *pdev)
>  
>  	v4l2_device_unregister(&cal->v4l2_dev);
>  
> +	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
> +		cal_camerarx_destroy(cal->phy[i]);
> +
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
> 

