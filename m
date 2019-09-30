Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCE6C20AF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 14:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbfI3Mib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 08:38:31 -0400
Received: from mga11.intel.com ([192.55.52.93]:6954 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729603AbfI3Mia (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 08:38:30 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 05:38:30 -0700
X-IronPort-AV: E=Sophos;i="5.64,567,1559545200"; 
   d="scan'208";a="197522724"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 05:38:28 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D531220473; Mon, 30 Sep 2019 15:38:26 +0300 (EEST)
Date:   Mon, 30 Sep 2019 15:38:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v4 6/8] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Message-ID: <20190930123826.GC19037@paasikivi.fi.intel.com>
References: <20190927184722.31989-1-bparrot@ti.com>
 <20190927184722.31989-7-bparrot@ti.com>
 <20190930072857.GA19037@paasikivi.fi.intel.com>
 <20190930122946.2io4pkri4gy3pnkr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930122946.2io4pkri4gy3pnkr@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 30, 2019 at 07:29:46AM -0500, Benoit Parrot wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Mon [2019-Sep-30 10:28:57 +0300]:
> > Hi Benoit,
> > 
> > On Fri, Sep 27, 2019 at 01:47:20PM -0500, Benoit Parrot wrote:
> > > On some board it is possible that the sensor 'powerdown' and or 'reset'
> > > pin might be controlled by gpio instead of being tied.
> > > 
> > > To implement we add pm_runtime support which will handle the power
> > > up/down sequence when it is available otherwise the sensor will be
> > > powered on at module insertion/probe and powered off at module removal.
> > > 
> > > Now originally the driver assumed that the sensor would always stay
> > > powered and keep its register setting. We cannot assume this anymore, so
> > > every time we "power up" we need to re-program the initial registers
> > > configuration first. This was previously done only at probe time.
> > > 
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  drivers/media/i2c/Kconfig  |  2 +-
> > >  drivers/media/i2c/ov2659.c | 88 +++++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 87 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 7eee1812bba3..315c1d8bdb7b 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -634,7 +634,7 @@ config VIDEO_OV2640
> > >  config VIDEO_OV2659
> > >  	tristate "OmniVision OV2659 sensor support"
> > >  	depends on VIDEO_V4L2 && I2C
> > > -	depends on MEDIA_CAMERA_SUPPORT
> > > +	depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
> > >  	select V4L2_FWNODE
> > >  	help
> > >  	  This is a Video4Linux2 sensor driver for the OmniVision
> > > diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> > > index cd4625432264..7d0baa386644 100644
> > > --- a/drivers/media/i2c/ov2659.c
> > > +++ b/drivers/media/i2c/ov2659.c
> > > @@ -22,9 +22,11 @@
> > >  
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_graph.h>
> > > +#include <linux/pm_runtime.h>
> > >  
> > >  #include <media/i2c/ov2659.h>
> > >  #include <media/v4l2-ctrls.h>
> > > @@ -218,6 +220,11 @@ struct ov2659 {
> > >  	struct sensor_register *format_ctrl_regs;
> > >  	struct ov2659_pll_ctrl pll;
> > >  	int streaming;
> > > +	/* used to control the sensor PWDN pin */
> > > +	struct gpio_desc *pwdn_gpio;
> > > +	/* used to control the sensor RESETB pin */
> > > +	struct gpio_desc *resetb_gpio;
> > > +	int on;
> > 
> > Please use runtime PM for this instead. It's hard to get this right
> > otherwise.
> 
> So you mean, I should use the "if (!pm_runtime_get_if_in_use(dev))"
> construct?

Yes, please.

> 
> Ok I'll switch it to that, just using "on" was a little simple but I
> already had it :).
> 
> 
> > 
> > Access to "on" is not serialised with the power state changes. In this case
> > e.g. drivers/media/i2c/ov5670.c is a good example. I think I'll see how I
> > could improve smiapp as well.
> 
> Ok so that driver uses this pm method but does not actually power up or
> down the sensor. 

Well, not explicitly. The driver supports ACPI based systems only right
now.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
