Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6CF56ED954
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbjDYA1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjDYA1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:27:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEF259D8
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:27:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 059CA4FE;
        Tue, 25 Apr 2023 02:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682382411;
        bh=ywoWHwlpczrX/69pkcM7RzmYKZp8eA11K/vdzb8W1Ls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RttzD8hwd3ae21aK7dHPbBYf4k7beLrd0oZZea6bA6gVKjb3LOlf/QM4Ief+thfce
         lPJjVua88MNylZcjdiwOC1sXLVv2ChsavR8JBFH3AUEXGOzOWX08UlmeZqXQtV7vlh
         Ave79KJVD1i2Xp7qlHKa8e1NBmNUfKdSbB3WrVRQ=
Date:   Tue, 25 Apr 2023 03:27:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 11/18] media: marvell: cafe: Register V4L2 device earlier
Message-ID: <20230425002711.GB4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-12-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-12-sakari.ailus@linux.intel.com>
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

On Thu, Mar 30, 2023 at 02:58:46PM +0300, Sakari Ailus wrote:
> Register V4L2 device before the async notifier so the struct device will
> be available for the notifier.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/marvell/cafe-driver.c | 12 ++++++++++--
>  drivers/media/platform/marvell/mcam-core.c   |  6 ------
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
> index dd1bba70bd79..4d8843623255 100644
> --- a/drivers/media/platform/marvell/cafe-driver.c
> +++ b/drivers/media/platform/marvell/cafe-driver.c
> @@ -536,6 +536,11 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto out_pdown;
>  
> +	ret = v4l2_device_register(mcam->dev, &mcam->v4l2_dev);
> +	if (ret)
> +		goto out_smbus_shutdown;
> +
> +
>  	v4l2_async_nf_init(&mcam->notifier);
>  
>  	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
> @@ -544,12 +549,12 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  				    struct v4l2_async_connection);
>  	if (IS_ERR(asd)) {
>  		ret = PTR_ERR(asd);
> -		goto out_smbus_shutdown;
> +		goto out_v4l2_device_unregister;
>  	}
>  
>  	ret = mccic_register(mcam);
>  	if (ret)
> -		goto out_smbus_shutdown;
> +		goto out_v4l2_device_unregister;
>  
>  	clkdev_create(mcam->mclk, "xclk", "%d-%04x",
>  		i2c_adapter_id(cam->i2c_adapter), ov7670_info.addr);
> @@ -565,6 +570,8 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  
>  out_mccic_shutdown:
>  	mccic_shutdown(mcam);
> +out_v4l2_device_unregister:
> +	v4l2_device_unregister(&mcam->v4l2_dev);
>  out_smbus_shutdown:
>  	cafe_smbus_shutdown(cam);
>  out_pdown:
> @@ -587,6 +594,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  static void cafe_shutdown(struct cafe_camera *cam)
>  {
>  	mccic_shutdown(&cam->mcam);
> +	v4l2_device_unregister(&cam->mcam.v4l2_dev);
>  	cafe_smbus_shutdown(cam);
>  	free_irq(cam->pdev->irq, cam);
>  	pci_iounmap(cam->pdev, cam->mcam.regs);
> diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
> index b74a362ec075..2ecdcbcb37fd 100644
> --- a/drivers/media/platform/marvell/mcam-core.c
> +++ b/drivers/media/platform/marvell/mcam-core.c
> @@ -1866,10 +1866,6 @@ int mccic_register(struct mcam_camera *cam)
>  	/*
>  	 * Register with V4L
>  	 */
> -	ret = v4l2_device_register(cam->dev, &cam->v4l2_dev);
> -	if (ret)
> -		goto out;
> -
>  	mutex_init(&cam->s_mutex);
>  	cam->state = S_NOTREADY;
>  	mcam_set_config_needed(cam, 1);
> @@ -1915,7 +1911,6 @@ int mccic_register(struct mcam_camera *cam)
>  
>  out:
>  	v4l2_async_nf_unregister(&cam->notifier);
> -	v4l2_device_unregister(&cam->v4l2_dev);
>  	v4l2_async_nf_cleanup(&cam->notifier);

Wouldn't the v4l2_async_nf_* calls be better placed in cafe-driver.c,
given that v4l2_async_nf_init() is called there too ? Same below.

>  	return ret;
>  }
> @@ -1937,7 +1932,6 @@ void mccic_shutdown(struct mcam_camera *cam)
>  		mcam_free_dma_bufs(cam);
>  	v4l2_ctrl_handler_free(&cam->ctrl_handler);
>  	v4l2_async_nf_unregister(&cam->notifier);
> -	v4l2_device_unregister(&cam->v4l2_dev);
>  	v4l2_async_nf_cleanup(&cam->notifier);
>  }
>  EXPORT_SYMBOL_GPL(mccic_shutdown);

-- 
Regards,

Laurent Pinchart
