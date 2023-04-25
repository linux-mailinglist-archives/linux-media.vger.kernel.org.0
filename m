Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEA66ED950
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjDYAY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjDYAY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:24:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98D15585
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:24:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 105F84FE;
        Tue, 25 Apr 2023 02:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682382284;
        bh=gJww8UmPUtdVRCFCcCDvyH7yKZd+L3BYbHmF4h4yP9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bhXC6AboivVaZyIriNPnzggYF+6ZgmmMUIaKyunFUdgJcQ7rtnRXM78KHfy5wd6Gq
         +jP1Xp6xu1SfvCMEzGpxuK5SdDu1SjsohYllJtoTAPGBqxWZ4ODxYWuONahI10iuJQ
         kedXLzOoVrpDQDIqMIZSoDCvtlcS09MjsYcMmRz4=
Date:   Tue, 25 Apr 2023 03:25:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 10/18] media: pxa_camera: Register V4L2 device early, fix
 probe error handling
Message-ID: <20230425002506.GA4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-11-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-11-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Mar 30, 2023 at 02:58:45PM +0300, Sakari Ailus wrote:
> Register V4L2 device before initialising the notifier. This way the device
> is available to the notifier from the beginning.

Could you please explain in the commit message why this is needed ? Same
comment for subsequent patches in this series.

> Also fix error handling in probe.

Splitting this in two patches, with the fix first, would make it easier
to review.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/intel/pxa_camera.c | 30 +++++++++++++----------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> index b848a2a9032f..31ae220ee4f3 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -2289,6 +2289,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	if (IS_ERR(pcdev->clk))
>  		return PTR_ERR(pcdev->clk);
>  
> +	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
> +	if (err)
> +		return err;
> +
>  	v4l2_async_nf_init(&pcdev->notifier);
>  	pcdev->res = res;
>  	pcdev->pdata = pdev->dev.platform_data;
> @@ -2306,10 +2310,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	} else if (pdev->dev.of_node) {
>  		err = pxa_camera_pdata_from_dt(&pdev->dev, pcdev);
>  	} else {
> -		return -ENODEV;
> +		err = -ENODEV;
>  	}
>  	if (err < 0)
> -		return err;
> +		goto exit_notifier_cleanup;
>  
>  	if (!(pcdev->platform_flags & (PXA_CAMERA_DATAWIDTH_8 |
>  			PXA_CAMERA_DATAWIDTH_9 | PXA_CAMERA_DATAWIDTH_10))) {
> @@ -2342,8 +2346,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	 * Request the regions.
>  	 */
>  	base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	if (IS_ERR(base)) {
> +		err = PTR_ERR(base);
> +		goto exit_notifier_cleanup;
> +	}
>  
>  	pcdev->irq = irq;
>  	pcdev->base = base;
> @@ -2352,7 +2358,8 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	pcdev->dma_chans[0] = dma_request_chan(&pdev->dev, "CI_Y");
>  	if (IS_ERR(pcdev->dma_chans[0])) {
>  		dev_err(&pdev->dev, "Can't request DMA for Y\n");
> -		return PTR_ERR(pcdev->dma_chans[0]);
> +		err = PTR_ERR(pcdev->dma_chans[0]);
> +		goto exit_notifier_cleanup;
>  	}
>  
>  	pcdev->dma_chans[1] = dma_request_chan(&pdev->dev, "CI_U");
> @@ -2392,23 +2399,17 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	pxa_camera_activate(pcdev);
>  
>  	platform_set_drvdata(pdev, pcdev);
> -	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
> -	if (err)
> -		goto exit_deactivate;
>  
>  	err = pxa_camera_init_videobuf2(pcdev);
>  	if (err)
> -		goto exit_notifier_cleanup;
> +		goto exit_deactivate;
>  
>  	pcdev->notifier.ops = &pxa_camera_sensor_ops;
>  	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);
>  	if (err)
> -		goto exit_notifier_cleanup;
> +		goto exit_deactivate;
>  
>  	return 0;
> -exit_notifier_cleanup:
> -	v4l2_async_nf_cleanup(&pcdev->notifier);
> -	v4l2_device_unregister(&pcdev->v4l2_dev);
>  exit_deactivate:
>  	pxa_camera_deactivate(pcdev);
>  	tasklet_kill(&pcdev->task_eof);
> @@ -2418,6 +2419,9 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	dma_release_channel(pcdev->dma_chans[1]);
>  exit_free_dma_y:
>  	dma_release_channel(pcdev->dma_chans[0]);
> +exit_notifier_cleanup:
> +	v4l2_async_nf_cleanup(&pcdev->notifier);
> +	v4l2_device_unregister(&pcdev->v4l2_dev);
>  	return err;
>  }
>  

-- 
Regards,

Laurent Pinchart
