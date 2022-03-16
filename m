Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4ED4DADBC
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 10:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352592AbiCPJvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 05:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241720AbiCPJvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 05:51:21 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6677E606D5
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647424207; x=1678960207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9jjwchjOToZWdRv/W5kn1I0S5iahnaEQ38GqbZmto7Q=;
  b=JbwUXwZqzxs0++6QYE2md7aI+7TgZ148D3Y6mSqTS3LKtpQCIfNPGpym
   fjJTZpPFQAg1NgmKfhDzPfQWbFcXRc8+elbkZtsCTxQVmk3M0jLBsfV3F
   DO0HqgLERB5foFm7SOUe+PIq0XR6ufi3jL80X7qdIh95x2zT61oYFuO70
   YZPDOOwb17yaQHZs7PI2rg52yWeHCuvRV/T6Cw3DuEIXHhiiyZCM2eJkV
   xfths7dB8CzmjqyHxv/Jyo8j5MjwMPIm1+d7UE+NAtUIVvg/SI8i5g7yH
   nKXeQf4ehufEvB1CqNSn6ITGaFFhGJOg7vfmnvpampBrD6QBWRhEnJO+a
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238704259"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="238704259"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 02:50:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="783404174"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 02:50:05 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 031ED20090;
        Wed, 16 Mar 2022 11:50:03 +0200 (EET)
Date:   Wed, 16 Mar 2022 11:50:02 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v3 3/5] mc: Provide a helper for setting bus_info field
Message-ID: <YjGyyjpsi/vIKrwZ@paasikivi.fi.intel.com>
References: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
 <20220309163112.11708-4-sakari.ailus@linux.intel.com>
 <YjGrVH/OQKt6/JXQ@pendragon.ideasonboard.com>
 <YjGs0NTfWp9ELFky@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjGs0NTfWp9ELFky@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 16, 2022 at 11:24:32AM +0200, Laurent Pinchart wrote:
> On Wed, Mar 16, 2022 at 11:18:13AM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Mar 09, 2022 at 06:31:10PM +0200, Sakari Ailus wrote:
> > > The bus_info or a similar field exists in a lot of structs, yet drivers
> > > tend to set the value of that field by themselves in a determinable way.
> > > Thus provide a helper for doing this. To be used in subsequent patches.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  include/media/media-device.h | 30 +++++++++++++++++++++++++++---
> > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/include/media/media-device.h b/include/media/media-device.h
> > > index bc015d2cf541..2122d15bde4e 100644
> > > --- a/include/media/media-device.h
> > > +++ b/include/media/media-device.h
> > > @@ -13,12 +13,13 @@
> > >  
> > >  #include <linux/list.h>
> > >  #include <linux/mutex.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/platform_device.h>
> > >  
> > >  #include <media/media-devnode.h>
> > >  #include <media/media-entity.h>
> > >  
> > >  struct ida;
> > > -struct device;
> > >  struct media_device;
> > >  
> > >  /**
> > > @@ -181,8 +182,7 @@ struct media_device {
> > >  	atomic_t request_id;
> > >  };
> > >  
> > > -/* We don't need to include pci.h or usb.h here */
> > > -struct pci_dev;
> > > +/* We don't need to include usb.h here */
> > >  struct usb_device;
> > >  
> > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > > @@ -502,4 +502,28 @@ static inline void __media_device_usb_init(struct media_device *mdev,
> > >  #define media_device_usb_init(mdev, udev, name) \
> > >  	__media_device_usb_init(mdev, udev, name, KBUILD_MODNAME)
> > >  
> > > +
> > > +/**
> > > + * media_set_bus_info() - Set bus_info field
> > > + *
> > > + * @bus_info:		Variable where to write the bus info (char array)
> > > + * @bus_info_size:	Length of the bus_info
> > > + * @dev:		Related struct device
> > > + *
> > > + * Sets bus information based on &dev. This is currently done for PCI and
> > > + * platform devices. dev is required to be non-NULL for this to happen.
> > > + *
> > > + * This function is not meant to be called from drivers.
> > > + */
> > > +static inline void
> > > +media_set_bus_info(char *bus_info, size_t bus_info_size, struct device *dev)
> > > +{
> > > +	if (!dev)
> > > +		strscpy(bus_info, "no bus info", bus_info_size);
> > > +	else if (dev_is_platform(dev))
> > > +		snprintf(bus_info, bus_info_size, "platform:%s", dev_name(dev));
> > > +	else if (dev_is_pci(dev))
> > > +		snprintf(bus_info, bus_info_size, "PCI:%s", dev_name(dev));
> > > +}
> > 
> > I wouldn't inline this, as it's not used in any hot path, and will
> > generate quite a bit of code. Apart from that,
> 
> But the function is only called in two places, and we'd have to export
> it, and handle the case where MC is disabled. Possibly not worth it,
> although it would be nice to not inline it if possible. If there's a
> suitable location to make that easy let's do so, otherwise you can keep
> it inline.

There's no such location currently. If one will be added, this should be
moved there. But it's not really worth a new kernel module at the moment.

> 
> (By the way, at some point we may want to not make MC optional)

Yes.

> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
