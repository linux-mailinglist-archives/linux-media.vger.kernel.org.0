Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E434F49B467
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 13:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384496AbiAYM5X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 07:57:23 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54898 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457649AbiAYMys (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 07:54:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD64C61353
        for <linux-media@vger.kernel.org>; Tue, 25 Jan 2022 12:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5926C340E0;
        Tue, 25 Jan 2022 12:54:46 +0000 (UTC)
Message-ID: <1266d262-526e-1244-d49b-c5778d2d7729@xs4all.nl>
Date:   Tue, 25 Jan 2022 13:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] media: Provide a helper for setting bus_info field
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-2-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220122163656.168440-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 22/01/2022 17:36, Sakari Ailus wrote:
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

Wouldn't it be simpler to make two #defines:

#define media_set_bus_info(mdev, dev) \
	__media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info), dev)

and:

#define v4l2_cap_set_bus_info(cap, dev) \
	__media_set_bus_info(cap->bus_info, sizeof(cap->bus_info), dev)

That way the sizeof() always works correctly.

This could also be static inlines to have better type checking, of course.

Another option is:

#define media_set_bus_info(s, dev) \
	__media_set_bus_info((s)->bus_info, sizeof((s)->bus_info), dev)

That's more generic, but it does make the assumption that the struct s
has a field bus_info. Which is a reasonable assumption IMHO.

I do like the idea of this series.

Regards,

	Hans

> +
>  #endif

