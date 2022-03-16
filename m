Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7E34DAD5F
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 10:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346808AbiCPJ0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 05:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237322AbiCPJ0F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 05:26:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A777DE97
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 02:24:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3CF5A67;
        Wed, 16 Mar 2022 10:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647422689;
        bh=5s1YnwqWBSIe1udBqCPtz02yyXeJbi8fEZm6di5gsE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kcwtAHyleEYCp4OBjnV3eV3lw7bM8Kot3+Pl+AXKqZk+Mgoa7wGf5F4Nz0V0M9q2l
         xQh4Yn/ikdMYP9BKfgOxfcE1p4lhQX76uf0VttF5OjRvzXpt7zoTGp6V7DAUivqlvs
         y2eE9XZM3DE/SEAEW8YP1UOAHXK9Vz8E0mo4ZBT0=
Date:   Wed, 16 Mar 2022 11:24:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v3 3/5] mc: Provide a helper for setting bus_info field
Message-ID: <YjGs0NTfWp9ELFky@pendragon.ideasonboard.com>
References: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
 <20220309163112.11708-4-sakari.ailus@linux.intel.com>
 <YjGrVH/OQKt6/JXQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YjGrVH/OQKt6/JXQ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 16, 2022 at 11:18:13AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 09, 2022 at 06:31:10PM +0200, Sakari Ailus wrote:
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
> > index bc015d2cf541..2122d15bde4e 100644
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
> > @@ -502,4 +502,28 @@ static inline void __media_device_usb_init(struct media_device *mdev,
> >  #define media_device_usb_init(mdev, udev, name) \
> >  	__media_device_usb_init(mdev, udev, name, KBUILD_MODNAME)
> >  
> > +
> > +/**
> > + * media_set_bus_info() - Set bus_info field
> > + *
> > + * @bus_info:		Variable where to write the bus info (char array)
> > + * @bus_info_size:	Length of the bus_info
> > + * @dev:		Related struct device
> > + *
> > + * Sets bus information based on &dev. This is currently done for PCI and
> > + * platform devices. dev is required to be non-NULL for this to happen.
> > + *
> > + * This function is not meant to be called from drivers.
> > + */
> > +static inline void
> > +media_set_bus_info(char *bus_info, size_t bus_info_size, struct device *dev)
> > +{
> > +	if (!dev)
> > +		strscpy(bus_info, "no bus info", bus_info_size);
> > +	else if (dev_is_platform(dev))
> > +		snprintf(bus_info, bus_info_size, "platform:%s", dev_name(dev));
> > +	else if (dev_is_pci(dev))
> > +		snprintf(bus_info, bus_info_size, "PCI:%s", dev_name(dev));
> > +}
> 
> I wouldn't inline this, as it's not used in any hot path, and will
> generate quite a bit of code. Apart from that,

But the function is only called in two places, and we'd have to export
it, and handle the case where MC is disabled. Possibly not worth it,
although it would be nice to not inline it if possible. If there's a
suitable location to make that easy let's do so, otherwise you can keep
it inline.

(By the way, at some point we may want to not make MC optional)

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> >  #endif

-- 
Regards,

Laurent Pinchart
