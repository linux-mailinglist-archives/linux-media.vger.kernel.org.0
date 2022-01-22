Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A683F496E4C
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 00:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbiAVXoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 18:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbiAVXoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 18:44:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B7AC06173B
        for <linux-media@vger.kernel.org>; Sat, 22 Jan 2022 15:44:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F39D556;
        Sun, 23 Jan 2022 00:44:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642895059;
        bh=SNr9G0HvWGycYTPBap/nBtl1JrONVya6JMDpGdvieSY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iwQkKV0GAPqR3Kwdl39/vovZz4XQ9kjaBWqPpwV6EVTVqajvhStb1RH69p6XRumHO
         +iS4vXlvT2nxU2DawmPlRC/6hQekmMwX2SBlT70d6dQZrSDfel7wu/QmUxzfKxURlQ
         dijUbW2AUe2FALXZwz4iBJ/WZjLx3B6AGN+y+JiU=
Date:   Sun, 23 Jan 2022 01:44:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/3] media: Provide a helper for setting bus_info field
Message-ID: <YeyWwp/0lmfImJ7t@pendragon.ideasonboard.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220122163656.168440-2-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Sat, Jan 22, 2022 at 06:36:54PM +0200, Sakari Ailus wrote:
> The bus_info or a similar field exists in a lot of structs, yet drivers
> tend to set the value of that field by themselves in a determinable way.
> Thus provide a helper for doing this. To be used in subsequent patches.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/media-device.h | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index 1345e6da688a..9f0458068196 100644
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
> @@ -496,4 +496,28 @@ static inline void __media_device_usb_init(struct media_device *mdev,
>  #define media_device_usb_init(mdev, udev, name) \
>  	__media_device_usb_init(mdev, udev, name, KBUILD_MODNAME)
>  
> +static inline void
> +__media_set_bus_info(char *bus_info, size_t bus_info_size, struct device *dev)
> +{
> +	if (!dev || *bus_info)
> +		return;
> +
> +	if (dev_is_platform(dev))
> +		snprintf(bus_info, bus_info_size, "platform:%s", dev_name(dev));
> +	else if (dev_is_pci(dev))
> +		snprintf(bus_info, bus_info_size, "PCI:%s", dev_name(dev));
> +}

Does this have to be inline ?

> +
> +/**
> + * media_set_bus_info() - Conditionally set bus_info
> + *
> + * @bus_info:	Variable where to write the bus info (char array)
> + * @dev:	Related struct device
> + *
> + * Sets bus information based on device conditionally, if the first character of
> + * &bus_info is not '\0' and dev is non-NULL.
> + */
> +#define media_set_bus_info(bus_info, dev) \
> +	__media_set_bus_info(bus_info, sizeof(bus_info), dev)

I like the idea, but if the bus_info passed to the macro is a char *
instead of a char[], I think this will still compile, with
sizeof(bus_info) not giving the expected value. Could we either get a
compilation failure in that case, of maybe turn this into two inline
functions, one for media_device and the other one for v4l2_capability,
that would both call __media_set_bus_info() ? The latter may be better.

> +
>  #endif

-- 
Regards,

Laurent Pinchart
