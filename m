Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18AE21FCB21
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 12:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgFQKni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 06:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgFQKna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 06:43:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1496AC061573
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 03:43:28 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33579F9;
        Wed, 17 Jun 2020 12:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592390607;
        bh=7335oV9I8bcfEZOrt727Nv4IcFUofpYpmOJbJXXXMWc=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MYBcseH6JAzLRQeFmeyT24f0GS0gz97cWgNSFLhwkCqvaIoadU5uGcDbKteCeQ2Cq
         b2mGLr0UwFto/EODz0o5D5EtFw6OfZtgNGCuAD4RgHjFCPYaro4mLEnvJmAYOLTc/L
         yeAc30KpgjePeWq6MmjrTAtwh8HMxCvcgQtREI3I=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v1 056/107] media: ti-vpe: cal: Add cal_camerarx_destroy()
 to cleanup CAMERARX
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-57-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <7b83dfbe-529f-7dce-5ca0-882d6000e7da@ideasonboard.com>
Date:   Wed, 17 Jun 2020 11:43:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614235944.17716-57-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 15/06/2020 00:58, Laurent Pinchart wrote:
> The cal_camerarx_create() function allocates resources with devm_*, and
> thus doesn't need any manual cleanup. Those won't hold true for long, as
> we will need to store resources that have no devm_* allocation variant
> in cal_camerarx. Furthermore, devm_kzalloc() is the wrong memory
> allocation API for structures that can be accessed from userspace, as
> device nodes can be kept open across device removal.

I still think that should be fixed by making devm_ allocations able to
be reference counted so that it doesn't remove until until references
(from open file handles) are released ;-) but that's completely out of
scope here...


> 
> Add a cal_camerarx_destroy() function to destroy a CAMERARX instance
> explicitly, and switch to kzalloc() for memory allocation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 35 ++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index b8c7ad8e39cd..c9fef333c532 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -931,7 +931,7 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	struct cal_camerarx *phy;
>  	int ret;
>  
> -	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
> +	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -946,7 +946,8 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
>  	if (IS_ERR(phy->base)) {
>  		cal_err(cal, "failed to ioremap\n");
> -		return ERR_CAST(phy->base);
> +		ret = PTR_ERR(phy->base);
> +		goto error;
>  	}
>  
>  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
> @@ -954,9 +955,21 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
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
> +
> +	kfree(phy);
>  }
>  
>  static int cal_camerarx_init_regmap(struct cal_dev *cal)
> @@ -2252,15 +2265,17 @@ static int cal_probe(struct platform_device *pdev)
>  	/* Create CAMERARX PHYs. */
>  	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
>  		cal->phy[i] = cal_camerarx_create(cal, i);
> -		if (IS_ERR(cal->phy[i]))
> -			return PTR_ERR(cal->phy[i]);
> +		if (IS_ERR(cal->phy[i])) {
> +			ret = PTR_ERR(cal->phy[i]);

here, cal->phy[i] is an error value, but you then iterate them and call
cal_camerarx_destroy() on this value.

Perhaps you should set the following here, before jumping:

			cal->phy[i] = NULL;


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
> @@ -2301,6 +2316,11 @@ static int cal_probe(struct platform_device *pdev)
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
> @@ -2329,6 +2349,9 @@ static int cal_remove(struct platform_device *pdev)
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

-- 
Regards
--
Kieran
