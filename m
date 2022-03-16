Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3A64DAD5D
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 10:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353461AbiCPJXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 05:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237322AbiCPJXj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 05:23:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1ABB473B1
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 02:22:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F446A67;
        Wed, 16 Mar 2022 10:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647422544;
        bh=AsCQBiUTF1N/BjUyTMGu7/rLH7dc5FdaDQ5mENs9d4Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mN4K97g26wJtdqxVVLRTmIGNWQ8VPn4m/yAMCLe2ALbXjXAHfR+kc+bHrM/he+3/f
         6iKpkkTO3Hv9nPNg2yhtECv1zav5Eh/u76TeFsKqWbSqxqZtt2ORGNXoM+NVxp1HVI
         mftYoAI/vKTt70kyBa3gqBFMAEpxPS8l6H+CjJjc=
Date:   Wed, 16 Mar 2022 11:22:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v3 4/5] mc: Set bus_info in media_device_init()
Message-ID: <YjGsPu0Z/AY48lul@pendragon.ideasonboard.com>
References: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
 <20220309163112.11708-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220309163112.11708-5-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Mar 09, 2022 at 06:31:11PM +0200, Sakari Ailus wrote:
> Set bus_info field based on struct device in media_device_init() and
> remove corresponding code from drivers.
> 
> Also update media_device_init() documentation: the dev field must be now
> initialised before calling it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-device.c                       | 4 ++++
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      | 2 --
>  drivers/media/platform/rcar-vin/rcar-core.c        | 2 --
>  drivers/media/platform/stm32/stm32-dcmi.c          | 2 --
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 2 --
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 2 --
>  drivers/media/platform/ti-vpe/cal.c                | 2 --
>  drivers/media/platform/vsp1/vsp1_drv.c             | 2 --
>  include/media/media-device.h                       | 6 +++---
>  9 files changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 094647fdb866..824d89b325a6 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -700,6 +700,10 @@ void media_device_init(struct media_device *mdev)
>  
>  	atomic_set(&mdev->request_id, 0);
>  
> +	if (!*mdev->bus_info)

	if (!mdev->bus_info[0])

could be a bit more readable, up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
> +				   mdev->dev);
> +
>  	dev_dbg(mdev->dev, "Media device initialized\n");
>  }
>  EXPORT_SYMBOL_GPL(media_device_init);
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 0e9b0503b62a..b15fac775e14 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1777,8 +1777,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	cio2->media_dev.dev = dev;
>  	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
>  		sizeof(cio2->media_dev.model));
> -	snprintf(cio2->media_dev.bus_info, sizeof(cio2->media_dev.bus_info),
> -		 "PCI:%s", pci_name(cio2->pci_dev));
>  	cio2->media_dev.hw_revision = 0;
>  
>  	media_device_init(&cio2->media_dev);
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 0186ae235113..1099cab7d95d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -94,8 +94,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
>  
>  	strscpy(mdev->driver_name, KBUILD_MODNAME, sizeof(mdev->driver_name));
>  	strscpy(mdev->model, match->compatible, sizeof(mdev->model));
> -	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
> -		 dev_name(mdev->dev));
>  
>  	media_device_init(mdev);
>  
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index c4c65d852525..09a743cd7004 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1997,8 +1997,6 @@ static int dcmi_probe(struct platform_device *pdev)
>  
>  	/* Initialize media device */
>  	strscpy(dcmi->mdev.model, DRV_NAME, sizeof(dcmi->mdev.model));
> -	snprintf(dcmi->mdev.bus_info, sizeof(dcmi->mdev.bus_info),
> -		 "platform:%s", DRV_NAME);
>  	dcmi->mdev.dev = &pdev->dev;
>  	media_device_init(&dcmi->mdev);
>  
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index 80a10f238bbe..18e6c65f4737 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -173,8 +173,6 @@ static int sun4i_csi_probe(struct platform_device *pdev)
>  	strscpy(csi->mdev.model, "Allwinner Video Capture Device",
>  		sizeof(csi->mdev.model));
>  	csi->mdev.hw_revision = 0;
> -	snprintf(csi->mdev.bus_info, sizeof(csi->mdev.bus_info), "platform:%s",
> -		 dev_name(csi->dev));
>  	media_device_init(&csi->mdev);
>  	csi->v4l.mdev = &csi->mdev;
>  
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index fc96921b0583..a971587dbbd1 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -733,8 +733,6 @@ static int sun6i_csi_v4l2_init(struct sun6i_csi *csi)
>  	strscpy(csi->media_dev.model, "Allwinner Video Capture Device",
>  		sizeof(csi->media_dev.model));
>  	csi->media_dev.hw_revision = 0;
> -	snprintf(csi->media_dev.bus_info, sizeof(csi->media_dev.bus_info),
> -		 "platform:%s", dev_name(csi->dev));
>  
>  	media_device_init(&csi->media_dev);
>  	v4l2_async_nf_init(&csi->notifier);
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 4a4a6c5983f7..11f67abc2f38 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -884,8 +884,6 @@ static int cal_media_init(struct cal_dev *cal)
>  	mdev->dev = cal->dev;
>  	mdev->hw_revision = cal->revision;
>  	strscpy(mdev->model, "CAL", sizeof(mdev->model));
> -	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
> -		 dev_name(mdev->dev));
>  	media_device_init(mdev);
>  
>  	/*
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index 502c7d9d6890..1f73c48eb738 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -243,8 +243,6 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
>  	mdev->dev = vsp1->dev;
>  	mdev->hw_revision = vsp1->version;
>  	strscpy(mdev->model, vsp1->info->model, sizeof(mdev->model));
> -	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
> -		 dev_name(mdev->dev));
>  	media_device_init(mdev);
>  
>  	vsp1->media_ops.link_setup = vsp1_entity_link_setup;
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index 2122d15bde4e..9e71a951f412 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -225,6 +225,9 @@ static inline __must_check int media_entity_enum_init(
>   *
>   * - dev must point to the parent device
>   * - model must be filled with the device model name
> + *
> + * The bus_info field is set by media_device_init() for PCI and platform devices
> + * if the field begins with '\0'.
>   */
>  void media_device_init(struct media_device *mdev);
>  
> @@ -249,9 +252,6 @@ void media_device_cleanup(struct media_device *mdev);
>   * The caller is responsible for initializing the &media_device structure
>   * before registration. The following fields of &media_device must be set:
>   *
> - *  - &media_device.dev must point to the parent device (usually a &pci_dev,
> - *    &usb_interface or &platform_device instance).
> - *
>   *  - &media_device.model must be filled with the device model name as a
>   *    NUL-terminated UTF-8 string. The device/model revision must not be
>   *    stored in this field.

-- 
Regards,

Laurent Pinchart
