Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922EF21B3E9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 13:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgGJL0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 07:26:42 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:55409 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726820AbgGJL0m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 07:26:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id trAqjmvNxJcNHtrAtjrqvW; Fri, 10 Jul 2020 13:26:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594380399; bh=JUVoijL8135/dk+prCllQkdejKz4/5BKHrKiDIxFlko=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uN8lYw/y3+B0IbQ0o6cGOLp3cyIkrp3A4PCrduWkZ7h1+aOAovboEAKchZ6PxUlZm
         cV5EDMcq+x/Ju6jXdbSo/djyJ/Mc1Ogmp1jux651gphCAyuZtmA5dLr3WYoTC0mmBb
         d86IW637q3MMMbO1Jco//6WKS47FeWCwKV9yYQpJ0gnXB0JePG6k8wus/2v5IXmPw+
         IQKmbmU7/x6hca3LBq7p+LKTwlkM7pW8OyHDQJvqlPhxRyQGZN6+yYcrMOyPwX7Jd6
         uxmxMo2sQBvzFqzCaDZZj4F5PZLnQDcuFpqsuptQKEyJqL/jblyXjABcxRfSvWoyiM
         PkoPKczbG1F+Q==
Subject: Re: [PATCH v2 069/108] media: ti-vpe: cal: Split media initialization
 and cleanup to functions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
 <20200706183709.12238-70-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <26317f49-d060-c4e2-d40c-90fd5eccdfb3@xs4all.nl>
Date:   Fri, 10 Jul 2020 13:26:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706183709.12238-70-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOS5Hvhl+dbRYrr6jcRGU1aVoz1daAJ4DvPtm7OTsmAmvgp44F6Wa8+0b+nOCOy6YX73BxUkqtpUQGpwLBmXaJAn828L4A4KuM6Z+w69YDJt9J4qcAjN
 bNLH4i0Bn6GIJtDcpo+kIPRcAZPXqZzmz2K6XFqKt+0BkibLZycOmn4poRME2yHMXDvNuAfUOSZonC7ViQdVZXaCzR9BDy8hkIS98XGcQ6M3zUYgMgAqqSaZ
 u+Zk25TTYOXv5N53tsGiUCj+Wg5Y/SMpcyIa8DLJL298Q64yH3VSxxY6YqhA98m0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/07/2020 20:36, Laurent Pinchart wrote:
> Create four functions to handle initialization, cleanup, registration
> and unregistration of the V4L2 (and soon media controller) objects:
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
> Changes since v1:
> 
> - Typo fix in commit message
> ---
>  drivers/media/platform/ti-vpe/cal.c | 116 +++++++++++++++++++++-------
>  1 file changed, 90 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 617b17133071..340cbf385d42 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -2213,6 +2213,88 @@ static void cal_async_notifier_unregister(struct cal_dev *cal)
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

You can just for 'return cal_async_notifier_register(cal);' here.

Regards,

	Hans

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
> @@ -2345,12 +2427,10 @@ static int cal_probe(struct platform_device *pdev)
>  		goto error_camerarx;
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
>  	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
> @@ -2365,8 +2445,6 @@ static int cal_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> -
>  	/* Read the revision and hardware info to verify hardware access. */
>  	pm_runtime_enable(&pdev->dev);
>  	ret = pm_runtime_get_sync(&pdev->dev);
> @@ -2376,16 +2454,14 @@ static int cal_probe(struct platform_device *pdev)
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
>  
>  error_context:
> @@ -2395,7 +2471,7 @@ static int cal_probe(struct platform_device *pdev)
>  			cal_ctx_v4l2_cleanup(ctx);
>  	}
>  
> -	v4l2_device_unregister(&cal->v4l2_dev);
> +	cal_media_cleanup(cal);
>  
>  error_camerarx:
>  	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
> @@ -2413,24 +2489,14 @@ static int cal_remove(struct platform_device *pdev)
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
> @@ -2438,8 +2504,6 @@ static int cal_remove(struct platform_device *pdev)
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
> -	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> -
>  	return 0;
>  }
>  
> 

