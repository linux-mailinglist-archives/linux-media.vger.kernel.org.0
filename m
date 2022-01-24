Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDAC4983E3
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 16:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240862AbiAXPzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 10:55:37 -0500
Received: from mga12.intel.com ([192.55.52.136]:11356 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240865AbiAXPzg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 10:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643039736; x=1674575736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDy3AVbxNVr/JSzauME9AvSD0cvkPq0Xv8PDw6peN9s=;
  b=QfUZmYvaIrRu/S1FR2rO5coQ/YyD22nxWGPwP+PhKlujNc2+KkvjTd9U
   alhEJxih96eGIkuobQ/GvOBUgSwKVXneOFUZqtY0EJKdjMienoQw+XQRh
   v2N5WygYanrrIk49caq31ryc0XLioEkd8KnIAfnG3ny5eARrxyurtuK4U
   PDiPULWNFJe16R+JMBBgRqP75L9V8G+ZGpg4/xh1jCNZWHKaUiICRh1Ok
   rzbFxEDZ95QqCunCagnMr9v8kYz6BruH50z47c7inJtkQsRYHQQGkIc60
   Z7sySeY/TGttMwx7B5cIBa4+t03PatTagNI21pLXhPFqYJn5HLV8EGu+R
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226055374"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="226055374"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:55:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="627538598"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:55:34 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E44CB20287;
        Mon, 24 Jan 2022 17:55:32 +0200 (EET)
Date:   Mon, 24 Jan 2022 17:55:32 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/3] media: Provide a helper for setting bus_info field
Message-ID: <Ye7L9My5CmarNMLB@paasikivi.fi.intel.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-2-sakari.ailus@linux.intel.com>
 <YeyWwp/0lmfImJ7t@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeyWwp/0lmfImJ7t@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Sun, Jan 23, 2022 at 01:44:02AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Sat, Jan 22, 2022 at 06:36:54PM +0200, Sakari Ailus wrote:
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
> 
> Does this have to be inline ?

Not necessarily. But we'll need a new module if it isn't --- this code will
be needed in both MC and V4L2 separately.

> 
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
> I like the idea, but if the bus_info passed to the macro is a char *
> instead of a char[], I think this will still compile, with
> sizeof(bus_info) not giving the expected value. Could we either get a
> compilation failure in that case, of maybe turn this into two inline
> functions, one for media_device and the other one for v4l2_capability,
> that would both call __media_set_bus_info() ? The latter may be better.

The latter, yes. There will be so few users that's entirely fine.

-- 
Kind regards,

Sakari Ailus
