Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDBE715497
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 06:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjE3Evf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 00:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjE3Evc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 00:51:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F44E107
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 21:51:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD1F27F3;
        Tue, 30 May 2023 06:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685422264;
        bh=rfbUXIf8asMqt3PaGV+QsCqOvSnUdITyB4IMjrSv7JU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CjbHuwT5q0o1Bnlqxhw/Udp768qqgndT7ZorIUbk+Veo7ed8hZtns+3vi0xqNKSgq
         ku53KjGXWpZO7Oo6P+iuW6JgXOufc3FbdEJmYCldQRPfyhYtEVM3Nx+YVV83wvVhwB
         Ek311YBwdlwOyWFg2ej/XKK34QJjFkvQ9QF0vR3A=
Date:   Tue, 30 May 2023 07:51:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 23/32] media: pxa_camera: Fix probe error
 handling
Message-ID: <20230530045125.GN21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-24-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-24-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:16:06PM +0300, Sakari Ailus wrote:
> Fix and simplify error handling in pxa_camera probe, by moving devm_*()
> functions early in the probe function and then tearing down what was set
> up on error patch.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/intel/pxa_camera.c | 48 ++++++++++++-----------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> index f0d316d5fe27c..dad5e8d97683e 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -2289,6 +2289,24 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	if (IS_ERR(pcdev->clk))
>  		return PTR_ERR(pcdev->clk);
>  
> +	/*
> +	 * Request the regions.
> +	 */
> +	base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	pcdev->irq = irq;
> +	pcdev->base = base;
> +
> +	/* request irq */
> +	err = devm_request_irq(&pdev->dev, pcdev->irq, pxa_camera_irq, 0,
> +			       PXA_CAM_DRV_NAME, pcdev);
> +	if (err) {
> +		dev_err(&pdev->dev, "Camera interrupt register failed\n");
> +		return err;
> +	}
> +

The IRQ should not be requested before the device is initialized, to
avoid spurious IRQs at probe time. I don't think the driver currently
handles this very well, but moving IRQ registration up is the wrong
direction. As this particular change isn't needed to clean up the
notifier, I would keep the devm_request_irq() call where it is.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	v4l2_async_nf_init(&pcdev->notifier);
>  	pcdev->res = res;
>  	pcdev->pdata = pdev->dev.platform_data;
> @@ -2338,21 +2356,12 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	spin_lock_init(&pcdev->lock);
>  	mutex_init(&pcdev->mlock);
>  
> -	/*
> -	 * Request the regions.
> -	 */
> -	base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> -
> -	pcdev->irq = irq;
> -	pcdev->base = base;
> -
>  	/* request dma */
>  	pcdev->dma_chans[0] = dma_request_chan(&pdev->dev, "CI_Y");
>  	if (IS_ERR(pcdev->dma_chans[0])) {
>  		dev_err(&pdev->dev, "Can't request DMA for Y\n");
> -		return PTR_ERR(pcdev->dma_chans[0]);
> +		err = PTR_ERR(pcdev->dma_chans[0]);
> +		goto exit_notifier_cleanup;
>  	}
>  
>  	pcdev->dma_chans[1] = dma_request_chan(&pdev->dev, "CI_U");
> @@ -2379,14 +2388,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/* request irq */
> -	err = devm_request_irq(&pdev->dev, pcdev->irq, pxa_camera_irq, 0,
> -			       PXA_CAM_DRV_NAME, pcdev);
> -	if (err) {
> -		dev_err(&pdev->dev, "Camera interrupt register failed\n");
> -		goto exit_free_dma;
> -	}
> -
>  	tasklet_setup(&pcdev->task_eof, pxa_camera_eof);
>  
>  	pxa_camera_activate(pcdev);
> @@ -2398,16 +2399,15 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  
>  	err = pxa_camera_init_videobuf2(pcdev);
>  	if (err)
> -		goto exit_notifier_cleanup;
> +		goto exit_v4l2_device_unregister;
>  
>  	pcdev->notifier.ops = &pxa_camera_sensor_ops;
>  	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);
>  	if (err)
> -		goto exit_notifier_cleanup;
> +		goto exit_v4l2_device_unregister;
>  
>  	return 0;
> -exit_notifier_cleanup:
> -	v4l2_async_nf_cleanup(&pcdev->notifier);
> +exit_v4l2_device_unregister:
>  	v4l2_device_unregister(&pcdev->v4l2_dev);
>  exit_deactivate:
>  	pxa_camera_deactivate(pcdev);
> @@ -2418,6 +2418,8 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	dma_release_channel(pcdev->dma_chans[1]);
>  exit_free_dma_y:
>  	dma_release_channel(pcdev->dma_chans[0]);
> +exit_notifier_cleanup:
> +	v4l2_async_nf_cleanup(&pcdev->notifier);
>  	return err;
>  }
>  

-- 
Regards,

Laurent Pinchart
