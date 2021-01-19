Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895442FB3B6
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 09:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbhASIFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 03:05:24 -0500
Received: from mga18.intel.com ([134.134.136.126]:49212 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730640AbhASIDs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 03:03:48 -0500
IronPort-SDR: 77uYxBw11e15wipuz9OFl/GswL9ec8MOz/16GYt6eWX/R+s/p8bUWJrkQzmJ9ULEc7umapUWdt
 FK0bNUZ4/ZWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="166559347"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="166559347"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 00:01:54 -0800
IronPort-SDR: Hn35EKDSoj6JLtLqR4gZ3vMdjTpAswkKhI5c2L50KX8+V9PMb5XriAybtDmG4DUaFwGGFZEy0X
 EY5SWsLhoBRg==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="391018092"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 00:01:51 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 90579207BF; Tue, 19 Jan 2021 10:01:48 +0200 (EET)
Date:   Tue, 19 Jan 2021 10:01:48 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH v2 1/6] media: mach-pxa: Register the camera sensor
 fixed-rate clock
Message-ID: <20210119080148.GB11878@paasikivi.fi.intel.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
 <20210112194919.50176-2-ezequiel@collabora.com>
 <20210118163657.GZ11878@paasikivi.fi.intel.com>
 <8c71f7b3e19b9d66fc41d54c6e0d44cc03daa35b.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c71f7b3e19b9d66fc41d54c6e0d44cc03daa35b.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Mon, Jan 18, 2021 at 05:21:12PM -0300, Ezequiel Garcia wrote:
> On Mon, 2021-01-18 at 18:36 +0200, Sakari Ailus wrote:
> > Hi Ezequiel,
> > 
> > Thanks for the patch.
> > 
> > On Tue, Jan 12, 2021 at 04:49:14PM -0300, Ezequiel Garcia wrote:
> > > The pxa-camera capture driver currently registers a v4l2-clk
> > > clock, named "mclk", to represent the mt9m111 sensor clock.
> > > 
> > > Register a proper fixed-rate clock using the generic clock framework,
> > > which will allow to remove the v4l2-clk clock in the pxa-camera
> > > driver in a follow-up commit.
> > 
> > Where is the clock generated?
> > 
> > If it's the same device, shouldn't it be registered in the pxa_camera
> > driver?
> > 
> 
> Apparently, as Petr explained, the PXA camera controller
> can provide a clock.
> 
> However, it seems to me this is not necesarily the only
> way to provide a clock to a sensor, is it?

It isn't. But that's what the clock framework is for.

> 
> Moreover, doing the proper clock conversion in the PXA driver
> doesn't seem trivial and I don't have hardware to test it.

I guess it's possible to do that later, too. The platform appears to rely
still on platform data, too.

This set is still a major improvement, to get rid of v4l2-clk.

> 
> I'd rather keep things simple, and just register a fixed-rate
> clock at mach-pxa level, which will be removed anyway
> once these non-DT platforms are finally converted to DT
> or dropped.
> 
> This way is at least a tiny bit less ugly than the current
> dummy v4l2-clk.
> 
> Thanks,
> Ezequiel
> 
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de> (for arch/arm/mach-*/)
> > > ---
> > > Quoting Arnd:
> > > """
> > > If there are no objections to the change itself, please take it through
> > > the v4l2 git tree.
> > > """
> > > 
> > >  arch/arm/mach-pxa/devices.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
> > > index 524d6093e0c7..09b8495f3fd9 100644
> > > --- a/arch/arm/mach-pxa/devices.c
> > > +++ b/arch/arm/mach-pxa/devices.c
> > > @@ -4,6 +4,7 @@
> > >  #include <linux/init.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/clkdev.h>
> > > +#include <linux/clk-provider.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/dmaengine.h>
> > >  #include <linux/spi/pxa2xx_spi.h>
> > > @@ -634,6 +635,13 @@ static struct platform_device pxa27x_device_camera = {
> > >  
> > >  void __init pxa_set_camera_info(struct pxacamera_platform_data *info)
> > >  {
> > > +       struct clk *mclk;
> > > +
> > > +       /* Register a fixed-rate clock for camera sensors. */
> > > +       mclk = clk_register_fixed_rate(NULL, "pxa_camera_clk", NULL, 0,
> > > +                                            info->mclk_10khz * 10000);
> > > +       if (!IS_ERR(mclk))
> > > +               clkdev_create(mclk, "mclk", NULL);
> > >         pxa_register_device(&pxa27x_device_camera, info);
> > >  }
> > >  
> > 
> 
> 

-- 
Sakari Ailus
