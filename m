Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7266E669325
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241183AbjAMJnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232777AbjAMJm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 04:42:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C8857924
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 01:31:56 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pGGPi-0000zD-HZ; Fri, 13 Jan 2023 10:31:54 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pGGPi-00033s-8Y; Fri, 13 Jan 2023 10:31:54 +0100
Date:   Fri, 13 Jan 2023 10:31:54 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v2 3/7] media: imx-pxp: Add media controller support
Message-ID: <20230113093154.GB9298@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        kernel@pengutronix.de, linux-imx@nxp.com
References: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
 <20230112172507.30579-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230112172507.30579-4-laurent.pinchart@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 12 Jan 2023 19:25:03 +0200, Laurent Pinchart wrote:
> Register a media device for the PXP, using the v4l2-mem2mem MC
> infrastructure to populate the media graph. No media device operation is
> implemented, the main use of the MC API is to allow consistent discovery
> of media devices for userspace.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
> Changes since v1:
> 
> - Drop manual setting of bus_info
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 35 ++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 945316edd580..c3d2df5d725d 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -24,6 +24,7 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  
> +#include <media/media-device.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -200,6 +201,9 @@ struct pxp_pdata {
>  struct pxp_dev {
>  	struct v4l2_device	v4l2_dev;
>  	struct video_device	vfd;
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	struct media_device	mdev;
> +#endif
>  
>  	struct clk		*clk;
>  	void __iomem		*mmio;
> @@ -1830,8 +1834,34 @@ static int pxp_probe(struct platform_device *pdev)
>  		goto err_m2m;
>  	}
>  
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	dev->mdev.dev = &pdev->dev;
> +	strscpy(dev->mdev.model, MEM2MEM_NAME, sizeof(dev->mdev.model));
> +	media_device_init(&dev->mdev);
> +	dev->v4l2_dev.mdev = &dev->mdev;
> +
> +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
> +						 MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to initialize media device\n");
> +		goto err_vfd;
> +	}
> +
> +	ret = media_device_register(&dev->mdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register media device\n");
> +		goto err_m2m_mc;
> +	}
> +#endif
> +
>  	return 0;
>  
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +err_m2m_mc:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> +err_vfd:
> +	video_unregister_device(vfd);
> +#endif
>  err_m2m:
>  	v4l2_m2m_release(dev->m2m_dev);
>  err_v4l2:
> @@ -1852,6 +1882,11 @@ static int pxp_remove(struct platform_device *pdev)
>  	clk_disable_unprepare(dev->clk);
>  
>  	v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME);
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	media_device_unregister(&dev->mdev);
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> +#endif
>  	video_unregister_device(&dev->vfd);
>  	v4l2_m2m_release(dev->m2m_dev);
>  	v4l2_device_unregister(&dev->v4l2_dev);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Pengutronix e.K.                           | Michael Tretter             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
