Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD7F2FAB57
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 21:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394264AbhARUXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 15:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394284AbhARUW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 15:22:27 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19610C061573
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 12:21:22 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CA1DF1F447E1
Message-ID: <8c71f7b3e19b9d66fc41d54c6e0d44cc03daa35b.camel@collabora.com>
Subject: Re: [PATCH v2 1/6] media: mach-pxa: Register the camera sensor
 fixed-rate clock
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Date:   Mon, 18 Jan 2021 17:21:12 -0300
In-Reply-To: <20210118163657.GZ11878@paasikivi.fi.intel.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
         <20210112194919.50176-2-ezequiel@collabora.com>
         <20210118163657.GZ11878@paasikivi.fi.intel.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-01-18 at 18:36 +0200, Sakari Ailus wrote:
> Hi Ezequiel,
> 
> Thanks for the patch.
> 
> On Tue, Jan 12, 2021 at 04:49:14PM -0300, Ezequiel Garcia wrote:
> > The pxa-camera capture driver currently registers a v4l2-clk
> > clock, named "mclk", to represent the mt9m111 sensor clock.
> > 
> > Register a proper fixed-rate clock using the generic clock framework,
> > which will allow to remove the v4l2-clk clock in the pxa-camera
> > driver in a follow-up commit.
> 
> Where is the clock generated?
> 
> If it's the same device, shouldn't it be registered in the pxa_camera
> driver?
> 

Apparently, as Petr explained, the PXA camera controller
can provide a clock.

However, it seems to me this is not necesarily the only
way to provide a clock to a sensor, is it?

Moreover, doing the proper clock conversion in the PXA driver
doesn't seem trivial and I don't have hardware to test it.

I'd rather keep things simple, and just register a fixed-rate
clock at mach-pxa level, which will be removed anyway
once these non-DT platforms are finally converted to DT
or dropped.

This way is at least a tiny bit less ugly than the current
dummy v4l2-clk.

Thanks,
Ezequiel

> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Acked-by: Arnd Bergmann <arnd@arndb.de> (for arch/arm/mach-*/)
> > ---
> > Quoting Arnd:
> > """
> > If there are no objections to the change itself, please take it through
> > the v4l2 git tree.
> > """
> > 
> >  arch/arm/mach-pxa/devices.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
> > index 524d6093e0c7..09b8495f3fd9 100644
> > --- a/arch/arm/mach-pxa/devices.c
> > +++ b/arch/arm/mach-pxa/devices.c
> > @@ -4,6 +4,7 @@
> >  #include <linux/init.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/clkdev.h>
> > +#include <linux/clk-provider.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/dmaengine.h>
> >  #include <linux/spi/pxa2xx_spi.h>
> > @@ -634,6 +635,13 @@ static struct platform_device pxa27x_device_camera = {
> >  
> >  void __init pxa_set_camera_info(struct pxacamera_platform_data *info)
> >  {
> > +       struct clk *mclk;
> > +
> > +       /* Register a fixed-rate clock for camera sensors. */
> > +       mclk = clk_register_fixed_rate(NULL, "pxa_camera_clk", NULL, 0,
> > +                                            info->mclk_10khz * 10000);
> > +       if (!IS_ERR(mclk))
> > +               clkdev_create(mclk, "mclk", NULL);
> >         pxa_register_device(&pxa27x_device_camera, info);
> >  }
> >  
> 


