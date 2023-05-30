Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA2A71549D
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 06:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjE3Eyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 00:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjE3Eyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 00:54:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76016C9
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 21:54:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F335E4;
        Tue, 30 May 2023 06:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685422460;
        bh=irTc6moHG8O+4NgKE5eMSDpFZFNxoPwOiM1WVsiI/Vc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=df9oVWwbjl4s5P2VKvQYG+NjreFvZiJf7eX+MgyKs3DcFkXxO/1EDoCl0UWF+F43M
         Z+sGA0cWoi9SlKzbq0sYIqislvT8cMuPAwEGwRJRnSA8+zYAgdKseQgj3Pt2t+YoCH
         9bF4u5Q2A4vlJpZHYn+4EVrNR8l5nMxQMtPOHnD4=
Date:   Tue, 30 May 2023 07:54:41 +0300
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
Subject: Re: [RESEND PATCH v3 24/32] media: pxa_camera: Register V4L2 device
 early
Message-ID: <20230530045441.GO21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-25-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-25-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:16:07PM +0300, Sakari Ailus wrote:
> Register V4L2 device before initialising the notifier. This way the device
> is available to the notifier from the beginning which makes it possible to
> use it for debug prints.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/intel/pxa_camera.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> index dad5e8d97683e..5df93fd4ff04b 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -2307,6 +2307,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
> +	if (err)
> +		return err;
> +
>  	v4l2_async_nf_init(&pcdev->notifier);
>  	pcdev->res = res;
>  	pcdev->pdata = pdev->dev.platform_data;
> @@ -2324,10 +2328,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	} else if (pdev->dev.of_node) {
>  		err = pxa_camera_pdata_from_dt(&pdev->dev, pcdev);
>  	} else {
> -		return -ENODEV;
> +		err = -ENODEV;
>  	}
>  	if (err < 0)
> -		return err;
> +		goto exit_v4l2_device_unregister;
>  
>  	if (!(pcdev->platform_flags & (PXA_CAMERA_DATAWIDTH_8 |
>  			PXA_CAMERA_DATAWIDTH_9 | PXA_CAMERA_DATAWIDTH_10))) {
> @@ -2393,22 +2397,17 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	pxa_camera_activate(pcdev);
>  
>  	platform_set_drvdata(pdev, pcdev);
> -	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
> -	if (err)
> -		goto exit_deactivate;
>  
>  	err = pxa_camera_init_videobuf2(pcdev);
>  	if (err)
> -		goto exit_v4l2_device_unregister;
> +		goto exit_deactivate;
>  
>  	pcdev->notifier.ops = &pxa_camera_sensor_ops;
>  	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);

The v4l2_device isn't made available to the notifier before this call,
so why is it necessary to register it earlier ?

>  	if (err)
> -		goto exit_v4l2_device_unregister;
> +		goto exit_deactivate;
>  
>  	return 0;
> -exit_v4l2_device_unregister:
> -	v4l2_device_unregister(&pcdev->v4l2_dev);
>  exit_deactivate:
>  	pxa_camera_deactivate(pcdev);
>  	tasklet_kill(&pcdev->task_eof);
> @@ -2420,6 +2419,8 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	dma_release_channel(pcdev->dma_chans[0]);
>  exit_notifier_cleanup:
>  	v4l2_async_nf_cleanup(&pcdev->notifier);
> +exit_v4l2_device_unregister:
> +	v4l2_device_unregister(&pcdev->v4l2_dev);
>  	return err;
>  }
>  

-- 
Regards,

Laurent Pinchart
