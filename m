Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42D7496E4D
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 00:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbiAVXsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 18:48:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbiAVXsg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 18:48:36 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FB79556;
        Sun, 23 Jan 2022 00:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642895313;
        bh=utnzPnD1759I/zG93Z9RU2VrbhjIFmxXjOpSXwLC6kQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qe/zPJqHfvEvJXAOD5aDgdZvjvU68RFNdLG6UNnKWkWaLK26RImmnJjWZvdivcDRh
         LnaEZTU3Nwu2rt2eSGVZ6gyVCj2ihssFBHRgQf55LAi9Mch0INfxOwK+BY2tFK0u0I
         QIFDBaV66VGsSYFKrBMtssv+MSDnvulVEgjvoGeU=
Date:   Sun, 23 Jan 2022 01:48:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/3] media: Set bus_info in media_device_init()
Message-ID: <YeyXwO1AwD5IhaUz@pendragon.ideasonboard.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220122163656.168440-3-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Sat, Jan 22, 2022 at 06:36:55PM +0200, Sakari Ailus wrote:
> Set bus_info field based on struct device in media_device_init(). Also
> remove corresponding code from drivers.

This looks fine to me, but the documentation should be updated to
explain that bus_info will be set by media_device_init(), and that
driver may then override the value if desired (and probably also list
the rules under which such an override is allowed).

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-device.c                       | 2 ++
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      | 2 --
>  drivers/media/platform/rcar-vin/rcar-core.c        | 2 --
>  drivers/media/platform/stm32/stm32-dcmi.c          | 2 --
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 2 --
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 2 --
>  drivers/media/platform/ti-vpe/cal.c                | 2 --
>  drivers/media/platform/vsp1/vsp1_drv.c             | 2 --
>  8 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index cf5e459b1d96..f7e1d63cec14 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -715,6 +715,8 @@ void media_device_init(struct media_device *mdev)
>  
>  	atomic_set(&mdev->request_id, 0);
>  
> +	media_set_bus_info(mdev->bus_info, mdev->dev);
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
> index 7694ffef5c00..90c69113ce60 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1970,8 +1970,6 @@ static int dcmi_probe(struct platform_device *pdev)
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
> index c9044785b903..d27594dbf0e1 100644
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

-- 
Regards,

Laurent Pinchart
