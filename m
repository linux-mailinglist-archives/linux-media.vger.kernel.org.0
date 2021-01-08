Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22BA92EF2AD
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 13:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbhAHMwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 07:52:35 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51248 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAHMwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 07:52:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9981B1F46715
Message-ID: <4bec214a8e749c640998fa74a7ebc703d4c40c7a.camel@collabora.com>
Subject: Re: [PATCH 1/6] media: mach-pxa: Register the camera sensor
 fixed-rate clock
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Petr Cvek <petrcvekcz@gmail.com>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Fri, 08 Jan 2021 09:51:43 -0300
In-Reply-To: <c8b39f6c-7a21-b597-c633-b053d701fe67@gmail.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
         <20210104165739.116404-2-ezequiel@collabora.com>
         <d07ac542-8b1c-779f-0b69-683c0d0ae2d1@gmail.com>
         <3950cb4b337e6373b066034c32e51a1e9e88a50f.camel@collabora.com>
         <c8b39f6c-7a21-b597-c633-b053d701fe67@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-01-08 at 12:02 +0100, Petr Cvek wrote:
> Dne 06. 01. 21 v 16:53 Ezequiel Garcia napsal(a):
> > Hi Petr,
> > 
> > Thanks a lot for reviewing and testing the series.
> > 
> > On Tue, 2021-01-05 at 17:41 +0100, Petr Cvek wrote:
> > > 
> > > Dne 04. 01. 21 v 17:57 Ezequiel Garcia napsal(a):
> > > > The pxa-camera capture driver currently registers a v4l2-clk
> > > > clock, named "mclk", to represent the mt9m111 sensor clock.
> > > > 
> > > > Register a proper fixed-rate clock using the generic clock framework,
> > > > which will allow to remove the v4l2-clk clock in the pxa-camera
> > > > driver in a follow-up commit.
> > > > 
> > > 
> > > BTW the mclk output to a sensor is actually a variable rate, divided from lcdclk (which can be changed too). PXA camera driver  is using
> > > variable
> > > pcdev->mclk_divisor to generate the mclk from lcdclk. 
> > > 
> > 
> > Hm, now that I look at this, I see the pxa-camera driver
> > is requiring a clock:
> > 
> >         pcdev->clk = devm_clk_get(&pdev->dev, NULL);                             
> >         if (IS_ERR(pcdev->clk))                                                  
> >                 return PTR_ERR(pcdev->clk);   
> > 
> > Where is this clock registered in the non-devicetree case?
> > 
> 
> I think this is where the clock is defined 
> 
>         PXA27X_CKEN_1RATE("pxa27x-camera.0", NULL, CAMERA, pxa27x_lcd_bus_parents, 0),
> 
> https://elixir.bootlin.com/linux/v5.10.2/source/drivers/clk/pxa/clk-pxa27x.c#L180
> 

Ah, nice. That's the part I was missing.
> 
> > > The rate change is done in pxa_camera_activate():
> > > 
> > > https://elixir.bootlin.com/linux/v5.11-rc2/source/drivers/media/platform/pxa_camera.c#L1136
> > > 
> > >         __raw_writel(pcdev->mclk_divisor | cicr4, pcdev->base + CICR4);
> > > 
> > > Would it be possible to register a correct clock type with possibility to change the divisor by the standard way?
> > > 
> > 
> > Right, so you mean the pxa-camera driver is the one providing the clock for the sensors?
> > 
> > In that case, I guess the pxa-camera driver should be the one registering
> > a CCF clock. Other drivers are doing this, through clk_register for instance.
> > 
> 
> Yeah that would make the sense, because the camera controller controls the divider and enable signals.
> 
> > However, for the sake of this series, which is meant to get rid
> > of the v4l2-clk API, I would say it's fine to just register a fixed-rate.
> > 
> > This is similar to what v4l2_clk_register was doing, which was registering
> > a dummy clock.
> > 
> 
> I guess. Just the 1:1 replacement. 
> 

Exactly.

> > Having said that, as I mentioned above, I'm wondering if the mach-pxa
> > boards are really working, given I'm not seeing the clock for pxa-camera.
> > 
> > Maybe the best way forward is to just accept that pxa-camera
> > is only supported for the device tree platforms, and therefore drop the
> > support from mach-pxa/ boards.
> > 
> 
> PXA camera worked without devicetree without problems (I'm not sure if I ever used devicetree). The definition should be in that file above (but I'm
> not that familiar with the clock framework).
> 

That's fine.

I'm quite sure this series should be fine,
since we are just replacing the dummy v4l2-clk with
dummy proper CCF clock.

Thanks!
Ezequiel

