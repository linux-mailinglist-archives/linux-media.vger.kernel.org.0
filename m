Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75F967154AD
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 07:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjE3FAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 01:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjE3FAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 01:00:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E3CC9
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 22:00:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 173F8E4;
        Tue, 30 May 2023 07:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685422812;
        bh=pEw6hWZoEoBtutTzqtO89COW4MSf2eCZJ5L0gUHIXg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PlSdfmM4JRVVHwt83is6etce48PERLdDgsBGeMbL7H12upvr7nohjduTTF14QN5/3
         N7K8TglxoS6ew66c2+3+ONwd//L30hCualZ23RvZ4U555ju2nxdYzyzM07N0zkOIeJ
         98cK8WMxJPVPiS3p5Tj6727y7BMOXryo+XdBQv7Q=
Date:   Tue, 30 May 2023 08:00:33 +0300
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
Subject: Re: [RESEND PATCH v3 25/32] media: marvell: cafe: Register V4L2
 device earlier
Message-ID: <20230530050033.GQ21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-26-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-26-sakari.ailus@linux.intel.com>
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

On Thu, May 25, 2023 at 12:16:08PM +0300, Sakari Ailus wrote:
> Register V4L2 device before the async notifier so the struct device will
> be available for the notifier which makes it possible to use it for debug
> prints.

Please record in the commit message that this is to prepare for patch
31/32. Same comment for other patches in this series.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/marvell/cafe-driver.c | 11 +++++++++--
>  drivers/media/platform/marvell/mcam-core.c   |  6 ------
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
> index dd1bba70bd791..fbfbb9f67ddfc 100644
> --- a/drivers/media/platform/marvell/cafe-driver.c
> +++ b/drivers/media/platform/marvell/cafe-driver.c
> @@ -536,6 +536,10 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto out_pdown;
>  
> +	ret = v4l2_device_register(mcam->dev, &mcam->v4l2_dev);
> +	if (ret)
> +		goto out_smbus_shutdown;
> +
>  	v4l2_async_nf_init(&mcam->notifier);
>  
>  	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
> @@ -544,12 +548,12 @@ static int cafe_pci_probe(struct pci_dev *pdev,
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
> @@ -565,6 +569,8 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  
>  out_mccic_shutdown:
>  	mccic_shutdown(mcam);
> +out_v4l2_device_unregister:
> +	v4l2_device_unregister(&mcam->v4l2_dev);
>  out_smbus_shutdown:
>  	cafe_smbus_shutdown(cam);
>  out_pdown:
> @@ -587,6 +593,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  static void cafe_shutdown(struct cafe_camera *cam)
>  {
>  	mccic_shutdown(&cam->mcam);
> +	v4l2_device_unregister(&cam->mcam.v4l2_dev);
>  	cafe_smbus_shutdown(cam);
>  	free_irq(cam->pdev->irq, cam);
>  	pci_iounmap(cam->pdev, cam->mcam.regs);
> diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
> index 3cee6d6b83fa9..bcfcecdb03ea2 100644
> --- a/drivers/media/platform/marvell/mcam-core.c
> +++ b/drivers/media/platform/marvell/mcam-core.c
> @@ -1866,10 +1866,6 @@ int mccic_register(struct mcam_camera *cam)
>  	/*
>  	 * Register with V4L
>  	 */

The comment doesn't seem valid anymore.

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
