Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40CC2EC0B2
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 16:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbhAFPyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 10:54:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57826 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbhAFPyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 10:54:40 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 130E61F4604B
Message-ID: <3950cb4b337e6373b066034c32e51a1e9e88a50f.camel@collabora.com>
Subject: Re: [PATCH 1/6] media: mach-pxa: Register the camera sensor
 fixed-rate clock
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Petr Cvek <petrcvekcz@gmail.com>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Wed, 06 Jan 2021 12:53:50 -0300
In-Reply-To: <d07ac542-8b1c-779f-0b69-683c0d0ae2d1@gmail.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
         <20210104165739.116404-2-ezequiel@collabora.com>
         <d07ac542-8b1c-779f-0b69-683c0d0ae2d1@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petr,

Thanks a lot for reviewing and testing the series.

On Tue, 2021-01-05 at 17:41 +0100, Petr Cvek wrote:
> 
> Dne 04. 01. 21 v 17:57 Ezequiel Garcia napsal(a):
> > The pxa-camera capture driver currently registers a v4l2-clk
> > clock, named "mclk", to represent the mt9m111 sensor clock.
> > 
> > Register a proper fixed-rate clock using the generic clock framework,
> > which will allow to remove the v4l2-clk clock in the pxa-camera
> > driver in a follow-up commit.
> > 
> 
> BTW the mclk output to a sensor is actually a variable rate, divided from lcdclk (which can be changed too). PXA camera driver  is using variable
> pcdev->mclk_divisor to generate the mclk from lcdclk. 
> 

Hm, now that I look at this, I see the pxa-camera driver
is requiring a clock:

        pcdev->clk = devm_clk_get(&pdev->dev, NULL);                             
        if (IS_ERR(pcdev->clk))                                                  
                return PTR_ERR(pcdev->clk);   

Where is this clock registered in the non-devicetree case?

> The rate change is done in pxa_camera_activate():
> 
> https://elixir.bootlin.com/linux/v5.11-rc2/source/drivers/media/platform/pxa_camera.c#L1136
> 
>         __raw_writel(pcdev->mclk_divisor | cicr4, pcdev->base + CICR4);
> 
> Would it be possible to register a correct clock type with possibility to change the divisor by the standard way?
> 

Right, so you mean the pxa-camera driver is the one providing the clock for the sensors?

In that case, I guess the pxa-camera driver should be the one registering
a CCF clock. Other drivers are doing this, through clk_register for instance.

However, for the sake of this series, which is meant to get rid
of the v4l2-clk API, I would say it's fine to just register a fixed-rate.

This is similar to what v4l2_clk_register was doing, which was registering
a dummy clock.

Having said that, as I mentioned above, I'm wondering if the mach-pxa
boards are really working, given I'm not seeing the clock for pxa-camera.

Maybe the best way forward is to just accept that pxa-camera
is only supported for the device tree platforms, and therefore drop the
support from mach-pxa/ boards.

Thanks,
Ezequiel
 

> Petr
> 
> 
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
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
> > 


