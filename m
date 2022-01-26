Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099F849CF31
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 17:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbiAZQHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 11:07:14 -0500
Received: from mga09.intel.com ([134.134.136.24]:58123 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236333AbiAZQHN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 11:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643213233; x=1674749233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j/16QzoSfLPJOKBRLnhpNcSSA3m/BtG6mHlRtW3opZM=;
  b=ZSbKKCp/z6yaNczAFLs9lDEZyob7+eSpxsqxKC4LuFRkwF0gPde+ovUV
   3tNejSxLPx37zQCzYg8VruI2jItmUL+2GltBYkZ22fDcnYol3uAk4MTxK
   DuQaDVoeChgVyF2q/09iWazEvNkm39IjsDwh8/FxcMf3itbgxYBfUu05y
   gePY/oKb12ylrBIfP/JzzuE2vaqhRxl5zHqvSoi+Q8qi5EF/Cbo1C7dIS
   R5XNxMZ7xfvXzeePot1/UKodtQnWC2h5Wv7ImL6SBBDbLkqdxhURlyZxh
   HjSIbwl7jswGxELGg4U3lVVJFYDuBG09UKxcv10Gzh3nqmHTFHJCYaB5l
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246359609"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="246359609"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 08:07:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="674398113"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 08:07:12 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D5A102012F;
        Wed, 26 Jan 2022 18:07:09 +0200 (EET)
Date:   Wed, 26 Jan 2022 18:07:09 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/3] media: Provide a helper for setting bus_info field
Message-ID: <YfFxrdCCR4UOkBiT@paasikivi.fi.intel.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-2-sakari.ailus@linux.intel.com>
 <1266d262-526e-1244-d49b-c5778d2d7729@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1266d262-526e-1244-d49b-c5778d2d7729@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jan 25, 2022 at 01:54:45PM +0100, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 22/01/2022 17:36, Sakari Ailus wrote:
> > The bus_info or a similar field exists in a lot of structs, yet drivers
> > tend to set the value of that field by themselves in a determinable way.
> > Thus provide a helper for doing this. To be used in subsequent patches.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/media-device.h | 30 +++++++++++++++++++++++++++---
> >  1 file changed, 27 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/media/media-device.h b/include/media/media-device.h
> > index 1345e6da688a..9f0458068196 100644
> > --- a/include/media/media-device.h
> > +++ b/include/media/media-device.h
> > @@ -13,12 +13,13 @@
> >  
> >  #include <linux/list.h>
> >  #include <linux/mutex.h>
> > +#include <linux/pci.h>
> > +#include <linux/platform_device.h>
> >  
> >  #include <media/media-devnode.h>
> >  #include <media/media-entity.h>
> >  
> >  struct ida;
> > -struct device;
> >  struct media_device;
> >  
> >  /**
> > @@ -181,8 +182,7 @@ struct media_device {
> >  	atomic_t request_id;
> >  };
> >  
> > -/* We don't need to include pci.h or usb.h here */
> > -struct pci_dev;
> > +/* We don't need to include usb.h here */
> >  struct usb_device;
> >  
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> > @@ -496,4 +496,28 @@ static inline void __media_device_usb_init(struct media_device *mdev,
> >  #define media_device_usb_init(mdev, udev, name) \
> >  	__media_device_usb_init(mdev, udev, name, KBUILD_MODNAME)
> >  
> > +static inline void
> > +__media_set_bus_info(char *bus_info, size_t bus_info_size, struct device *dev)
> > +{
> > +	if (!dev || *bus_info)
> > +		return;
> > +
> > +	if (dev_is_platform(dev))
> > +		snprintf(bus_info, bus_info_size, "platform:%s", dev_name(dev));
> > +	else if (dev_is_pci(dev))
> > +		snprintf(bus_info, bus_info_size, "PCI:%s", dev_name(dev));
> > +}
> > +
> > +/**
> > + * media_set_bus_info() - Conditionally set bus_info
> > + *
> > + * @bus_info:	Variable where to write the bus info (char array)
> > + * @dev:	Related struct device
> > + *
> > + * Sets bus information based on device conditionally, if the first character of
> > + * &bus_info is not '\0' and dev is non-NULL.
> > + */
> > +#define media_set_bus_info(bus_info, dev) \
> > +	__media_set_bus_info(bus_info, sizeof(bus_info), dev)
> 
> Wouldn't it be simpler to make two #defines:
> 
> #define media_set_bus_info(mdev, dev) \
> 	__media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info), dev)
> 
> and:
> 
> #define v4l2_cap_set_bus_info(cap, dev) \
> 	__media_set_bus_info(cap->bus_info, sizeof(cap->bus_info), dev)
> 
> That way the sizeof() always works correctly.
> 
> This could also be static inlines to have better type checking, of course.
> 
> Another option is:
> 
> #define media_set_bus_info(s, dev) \
> 	__media_set_bus_info((s)->bus_info, sizeof((s)->bus_info), dev)
> 
> That's more generic, but it does make the assumption that the struct s
> has a field bus_info. Which is a reasonable assumption IMHO.
> 
> I do like the idea of this series.

Thanks for the comments.

I prefer Laurent's suggestion of removing the macro and simply using
sizeof() in the caller. Note that there will be a very small number of
these calls and so far none in the drivers (nor there should be any).

-- 
Kind regards,

Sakari Ailus
