Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528EAC2093
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 14:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729738AbfI3M1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 08:27:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38352 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfI3M1i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 08:27:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UCRZBg124571;
        Mon, 30 Sep 2019 07:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569846455;
        bh=sgj1pzMIyV2+FIKw3eWzNBc0D+SmBaqYz7qeavCJJ5M=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=YUNA9sIpH0xVIvu0znUcctZXTAudCYm3rXpC4V59v2Cks0EIqPiwCSFNpAv+DEgqK
         k0oEujCiNbbYjQVZBsU9eKaqlR/NMPnO2ZJ7LZJpOxitg4uj1dlnKfnF89hMXx56El
         Ne1ls4sdz2HNGv3jW3/poyEDLdnAmwklCNGFNMOc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UCRZ6V068545
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 07:27:35 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 07:27:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 07:27:25 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x8UCRYw1055586;
        Mon, 30 Sep 2019 07:27:35 -0500
Date:   Mon, 30 Sep 2019 07:29:46 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v4 6/8] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Message-ID: <20190930122946.2io4pkri4gy3pnkr@ti.com>
References: <20190927184722.31989-1-bparrot@ti.com>
 <20190927184722.31989-7-bparrot@ti.com>
 <20190930072857.GA19037@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190930072857.GA19037@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Mon [2019-Sep-30 10:28:57 +0300]:
> Hi Benoit,
> 
> On Fri, Sep 27, 2019 at 01:47:20PM -0500, Benoit Parrot wrote:
> > On some board it is possible that the sensor 'powerdown' and or 'reset'
> > pin might be controlled by gpio instead of being tied.
> > 
> > To implement we add pm_runtime support which will handle the power
> > up/down sequence when it is available otherwise the sensor will be
> > powered on at module insertion/probe and powered off at module removal.
> > 
> > Now originally the driver assumed that the sensor would always stay
> > powered and keep its register setting. We cannot assume this anymore, so
> > every time we "power up" we need to re-program the initial registers
> > configuration first. This was previously done only at probe time.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/Kconfig  |  2 +-
> >  drivers/media/i2c/ov2659.c | 88 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 87 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 7eee1812bba3..315c1d8bdb7b 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -634,7 +634,7 @@ config VIDEO_OV2640
> >  config VIDEO_OV2659
> >  	tristate "OmniVision OV2659 sensor support"
> >  	depends on VIDEO_V4L2 && I2C
> > -	depends on MEDIA_CAMERA_SUPPORT
> > +	depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
> >  	select V4L2_FWNODE
> >  	help
> >  	  This is a Video4Linux2 sensor driver for the OmniVision
> > diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> > index cd4625432264..7d0baa386644 100644
> > --- a/drivers/media/i2c/ov2659.c
> > +++ b/drivers/media/i2c/ov2659.c
> > @@ -22,9 +22,11 @@
> >  
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/pm_runtime.h>
> >  
> >  #include <media/i2c/ov2659.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -218,6 +220,11 @@ struct ov2659 {
> >  	struct sensor_register *format_ctrl_regs;
> >  	struct ov2659_pll_ctrl pll;
> >  	int streaming;
> > +	/* used to control the sensor PWDN pin */
> > +	struct gpio_desc *pwdn_gpio;
> > +	/* used to control the sensor RESETB pin */
> > +	struct gpio_desc *resetb_gpio;
> > +	int on;
> 
> Please use runtime PM for this instead. It's hard to get this right
> otherwise.

So you mean, I should use the "if (!pm_runtime_get_if_in_use(dev))"
construct?

Ok I'll switch it to that, just using "on" was a little simple but I
already had it :).


> 
> Access to "on" is not serialised with the power state changes. In this case
> e.g. drivers/media/i2c/ov5670.c is a good example. I think I'll see how I
> could improve smiapp as well.

Ok so that driver uses this pm method but does not actually power up or
down the sensor. 

Benoit

> 
> -- 
> Sakari Ailus
> sakari.ailus@linux.intel.com
