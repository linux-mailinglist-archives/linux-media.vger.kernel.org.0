Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287491FFBA5
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 21:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgFRTRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 15:17:30 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36342 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgFRTR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 15:17:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05IJHPT3062166;
        Thu, 18 Jun 2020 14:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592507845;
        bh=Aw4zL81l8sAtkAHd/3rzc843UUfr7TBZ9IwksVvqXFs=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=oG5m99tVpjieuLWRdW0tJpamwlAw5RXpyiWpZp4uu2KxACA8w2wv4NPDoPPL2jzsU
         +cyxaUqKsi59xWMSnLG0c7EngXI3wA8O2x5LcAgZEQj9znNi7A6xsI0rBtK93HxC9r
         R/FZ3B34fUXhJ1Pgz2fQ7O5Baia7yXW8hgH2BoqQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05IJHP2G107752
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Jun 2020 14:17:25 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 18
 Jun 2020 14:17:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 18 Jun 2020 14:17:25 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id 05IJHO0Z073277;
        Thu, 18 Jun 2020 14:17:25 -0500
Date:   Thu, 18 Jun 2020 14:17:24 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 068/107] media: ti-vpe: cal: Split media
 initialization and cleanup to functions
Message-ID: <20200618191724.w5wljkc2ylky5rsb@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-69-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200614235944.17716-69-laurent.pinchart@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the patch.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote on Mon [2020-Jun-15 02:59:05 +0300]:
> Create four functions to handle initialization, cleanup, registration
> and unregistration of the V4L2 (and sonn media controller) objects:

s/sonn/soon/

Benoit
> 
> - init() is meant to be called early at probe time to initialize the
>   objects, before they get used from within the kernel
> 
> - cleanup() is the counterpart of init, and is meant to be called at the
>   end of the remove sequence to free all objects
> 
> - register() is meant to be called at the end of the probe sequence, to
>   register the userspace-facing devices
> 
> - unregister() is the counterpart of register, and is meant to be called
>   at the beginning for the remove sequence, to disallow access from
>   userspace
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 120 +++++++++++++++++++++-------
>  1 file changed, 92 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 9fe8abfa1df9..6655c0051ccc 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -2202,6 +2202,88 @@ static void cal_async_notifier_unregister(struct cal_dev *cal)
>  	v4l2_async_notifier_cleanup(&cal->notifier);
>  }
>  
> +/* ------------------------------------------------------------------
> + *	Media and V4L2 device handling
> + * ------------------------------------------------------------------
> + */
> +
> +/*
> + * Register user-facing devices. To be called at the end of the probe function
> + * when all resources are initialized and ready.
> + */
> +static int cal_media_register(struct cal_dev *cal)
> +{
> +	int ret;
> +
> +	/*
> +	 * Register the async notifier. This may trigger registration of the
> +	 * V4L2 video devices if all subdevs are ready.
> +	 */
> +	ret = cal_async_notifier_register(cal);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/*
> + * Unregister the user-facing devices, but don't free memory yet. To be called
> + * at the beginning of the remove function, to disallow access from userspace.
> + */
> +static void cal_media_unregister(struct cal_dev *cal)
> +{
> +	unsigned int i;
> +
> +	/* Unregister all the V4L2 video devices. */
> +	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
> +		if (cal->ctx[i])
> +			cal_ctx_v4l2_unregister(cal->ctx[i]);
> +	}
> +
> +	cal_async_notifier_unregister(cal);
> +}
> +
> +/*
> + * Initialize the in-kernel objects. To be called at the beginning of the probe
> + * function, before the V4L2 device is used by the driver.
> + */
> +static int cal_media_init(struct cal_dev *cal)
> +{
> +	int ret;
> +
> +	/*
> +	 * Initialize the V4L2 device (despite the function name, this performs
> +	 * initialization, not registration).
> +	 */
> +	ret = v4l2_device_register(&cal->pdev->dev, &cal->v4l2_dev);
> +	if (ret) {
> +		cal_err(cal, "Failed to register V4L2 device\n");
> +		return ret;
> +	}
> +
> +	vb2_dma_contig_set_max_seg_size(&cal->pdev->dev, DMA_BIT_MASK(32));
> +
> +	return 0;
> +}
> +
> +/*
> + * Cleanup the in-kernel objects, freeing memory. To be called at the very end
> + * of the remove sequence, when nothing (including userspace) can access the
> + * objects anymore.
> + */
> +static void cal_media_cleanup(struct cal_dev *cal)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
> +		if (cal->ctx[i])
> +			cal_ctx_v4l2_cleanup(cal->ctx[i]);
> +	}
> +
> +	v4l2_device_unregister(&cal->v4l2_dev);
> +	vb2_dma_contig_clear_max_seg_size(&cal->pdev->dev);
> +}
> +
>  /* ------------------------------------------------------------------
>   *	Initialization and module stuff
>   * ------------------------------------------------------------------
> @@ -2328,12 +2410,10 @@ static int cal_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/* Register the V4L2 device. */
> -	ret = v4l2_device_register(&pdev->dev, &cal->v4l2_dev);
> -	if (ret) {
> -		cal_err(cal, "Failed to register V4L2 device\n");
> +	/* Initialize the media device. */
> +	ret = cal_media_init(cal);
> +	if (ret < 0)
>  		goto error_camerarx;
> -	}
>  
>  	/* Create contexts. */
>  	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
> @@ -2342,11 +2422,9 @@ static int cal_probe(struct platform_device *pdev)
>  	if (!cal->ctx[0] && !cal->ctx[1]) {
>  		cal_err(cal, "Neither port is configured, no point in staying up\n");
>  		ret = -ENODEV;
> -		goto error_v4l2;
> +		goto error_media;
>  	}
>  
> -	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> -
>  	/* Read the revision and hardware info to verify hardware access. */
>  	pm_runtime_enable(&pdev->dev);
>  	ret = pm_runtime_get_sync(&pdev->dev);
> @@ -2356,16 +2434,14 @@ static int cal_probe(struct platform_device *pdev)
>  	cal_get_hwinfo(cal);
>  	pm_runtime_put_sync(&pdev->dev);
>  
> -	/* Register the async notifier. */
> -	ret = cal_async_notifier_register(cal);
> +	/* Register the media device. */
> +	ret = cal_media_register(cal);
>  	if (ret)
>  		goto error_pm_runtime;
>  
>  	return 0;
>  
>  error_pm_runtime:
> -	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> -
>  	pm_runtime_disable(&pdev->dev);
>  	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
>  		ctx = cal->ctx[i];
> @@ -2373,8 +2449,8 @@ static int cal_probe(struct platform_device *pdev)
>  			cal_ctx_v4l2_cleanup(ctx);
>  	}
>  
> -error_v4l2:
> -	v4l2_device_unregister(&cal->v4l2_dev);
> +error_media:
> +	cal_media_cleanup(cal);
>  
>  error_camerarx:
>  	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
> @@ -2392,24 +2468,14 @@ static int cal_remove(struct platform_device *pdev)
>  
>  	pm_runtime_get_sync(&pdev->dev);
>  
> -	cal_async_notifier_unregister(cal);
> -
> -	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
> -		if (cal->ctx[i])
> -			cal_ctx_v4l2_unregister(cal->ctx[i]);
> -	}
> +	cal_media_unregister(cal);
>  
>  	for (i = 0; i < ARRAY_SIZE(cal->phy); i++) {
>  		if (cal->phy[i])
>  			cal_camerarx_disable(cal->phy[i]);
>  	}
>  
> -	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
> -		if (cal->ctx[i])
> -			cal_ctx_v4l2_cleanup(cal->ctx[i]);
> -	}
> -
> -	v4l2_device_unregister(&cal->v4l2_dev);
> +	cal_media_cleanup(cal);
>  
>  	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
>  		cal_camerarx_destroy(cal->phy[i]);
> @@ -2417,8 +2483,6 @@ static int cal_remove(struct platform_device *pdev)
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
> -	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> -
>  	return 0;
>  }
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
