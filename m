Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2380649FC2A
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 15:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349512AbiA1OwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 09:52:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40766 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343783AbiA1Ov4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 09:51:56 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D51CA471;
        Fri, 28 Jan 2022 15:51:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643381514;
        bh=2TEyz7o11dq2nWiM/ghG9i9NYMBwhpkAhck4CNVRuCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uvh2G/zFRzPlRMdH9zoy3Y42+a1Q7wRlCZo5zwWzHc3IcRYQFuCe7lpNT3yAMedJ6
         gqbVfhg1v5cqxiu2nqKxsOtK7M9PvUhv+XS5jQk2/fbRSRErUyZljM4vCGVWpQ2ok6
         4XiqsfbniponHnz1u/Awd2DWWz4eolM26nXlN744=
Date:   Fri, 28 Jan 2022 16:51:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 2/4] mc: Provide a helper for setting bus_info field
Message-ID: <YfQC9JfuhBxR3cXr@pendragon.ideasonboard.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220128083309.213122-3-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Jan 28, 2022 at 10:33:07AM +0200, Sakari Ailus wrote:
> The bus_info or a similar field exists in a lot of structs, yet drivers
> tend to set the value of that field by themselves in a determinable way.
> Thus provide a helper for doing this. To be used in subsequent patches.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/media-device.h | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index 1345e6da688a..54f0c12bc682 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -13,12 +13,13 @@
>  
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
>  
>  #include <media/media-devnode.h>
>  #include <media/media-entity.h>
>  
>  struct ida;
> -struct device;
>  struct media_device;
>  
>  /**
> @@ -181,8 +182,7 @@ struct media_device {
>  	atomic_t request_id;
>  };
>  
> -/* We don't need to include pci.h or usb.h here */
> -struct pci_dev;
> +/* We don't need to include usb.h here */
>  struct usb_device;
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
> @@ -496,4 +496,26 @@ static inline void __media_device_usb_init(struct media_device *mdev,
>  #define media_device_usb_init(mdev, udev, name) \
>  	__media_device_usb_init(mdev, udev, name, KBUILD_MODNAME)
>  
> +
> +/**
> + * media_set_bus_info() - Conditionally set bus_info

It's not conditional anymore.

> + *
> + * @bus_info:		Variable where to write the bus info (char array)
> + * @bus_info_size:	Length of the bus_info
> + * @dev:		Related struct device
> + *
> + * Sets bus information based on &dev. This is currently done for PCI and
> + * platform devices. dev is required to be non-NULL for this to happen.

Are there drivers that set a NULL dev ?

I'd also mention that this function is not meant to be called by
drivers.

> + */
> +static inline void
> +media_set_bus_info(char *bus_info, size_t bus_info_size, struct device *dev)
> +{
> +	if (!dev)
> +		strscpy(bus_info, "no bus info", bus_info_size);
> +	else if (dev_is_platform(dev))
> +		snprintf(bus_info, bus_info_size, "platform:%s", dev_name(dev));
> +	else if (dev_is_pci(dev))
> +		snprintf(bus_info, bus_info_size, "PCI:%s", dev_name(dev));
> +}
> +
>  #endif

-- 
Regards,

Laurent Pinchart
