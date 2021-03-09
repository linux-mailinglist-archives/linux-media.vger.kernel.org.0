Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E424D332284
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 11:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhCIKDa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 05:03:30 -0500
Received: from mga18.intel.com ([134.134.136.126]:15020 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229950AbhCIKDS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 05:03:18 -0500
IronPort-SDR: lA8hEjlw/4vuS1aykZiAXx6KcjHP02Xws5UZ79am38szTi6RohkemcBhZfvkyDXSQK7Rkc/z53
 UAThqUgIG2WA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175806304"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="175806304"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 02:03:17 -0800
IronPort-SDR: O+Pdn0IS8bLLwMDCu/2Ur/BVFxoNJeEOA1TjMKAWT6xN5PQxY9m4RrkhfO8CZQVuXq9oXYjAG2
 25A9Ag6LJBAA==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="408587630"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 02:03:17 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 21EA020427;
        Tue,  9 Mar 2021 12:03:15 +0200 (EET)
Date:   Tue, 9 Mar 2021 12:03:15 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: async, fwnode: Improve module organisation
Message-ID: <20210309100314.GI3@paasikivi.fi.intel.com>
References: <20210308100256.26270-1-sakari.ailus@linux.intel.com>
 <51c824c3115fc678c91660b9a12332242c1b1384.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51c824c3115fc678c91660b9a12332242c1b1384.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Mon, Mar 08, 2021 at 04:01:58PM -0300, Ezequiel Garcia wrote:
> Hi Sakari,
> 
> Thanks a lot for the patch. I like where this is going.

Thanks for the review, too!

> 
> On Mon, 2021-03-08 at 12:02 +0200, Sakari Ailus wrote:
> > The V4L2 async framework is generally used with the V4L2 fwnode, which
> > also depends on the former. There is only one exception, the CAFE_CCIC
> > driver, which uses V4L2 async but does not need V4L2 fwnode.
> > 
> > At the same time there is a vast number of systems that need videodev
> > module, but have no use for v4l2-async that's now part of videodev.
> > 
> > In order to improve, build v4l2-async and v4l2-fwnode as a single module
> > called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
> > Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.
> > 
> > This also moves the initialisation of the debufs entries for async subdevs
> > to loading of the v4l2-async module. The directory is named as
> > "v4l2-async".
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > This goes on top of my recent async patches.
> > 
> >  drivers/media/i2c/Kconfig                     | 80 +++++++++----------
> >  drivers/media/i2c/ccs/Kconfig                 |  2 +-
> >  drivers/media/i2c/et8ek8/Kconfig              |  2 +-
> >  drivers/media/pci/intel/ipu3/Kconfig          |  2 +-
> >  drivers/media/platform/Kconfig                | 16 ++--
> >  drivers/media/platform/am437x/Kconfig         |  2 +-
> >  drivers/media/platform/atmel/Kconfig          |  4 +-
> >  drivers/media/platform/cadence/Kconfig        |  4 +-
> >  drivers/media/platform/davinci/Kconfig        |  2 +-
> >  drivers/media/platform/exynos4-is/Kconfig     |  4 +-
> >  drivers/media/platform/marvell-ccic/Kconfig   |  1 +
> >  drivers/media/platform/rcar-vin/Kconfig       |  4 +-
> >  .../media/platform/sunxi/sun4i-csi/Kconfig    |  2 +-
> >  .../media/platform/sunxi/sun6i-csi/Kconfig    |  2 +-
> >  drivers/media/platform/xilinx/Kconfig         |  2 +-
> >  drivers/media/v4l2-core/Kconfig               |  3 +-
> >  drivers/media/v4l2-core/Makefile              |  6 +-
> >  .../{v4l2-async.c => v4l2-async-core.c}       | 23 +++++-
> >  drivers/media/v4l2-core/v4l2-dev.c            |  5 --
> >  drivers/staging/media/imx/Kconfig             |  2 +-
> >  drivers/staging/media/tegra-video/Kconfig     |  2 +-
> >  21 files changed, 94 insertions(+), 76 deletions(-)
> >  rename drivers/media/v4l2-core/{v4l2-async.c => v4l2-async-core.c} (96%)
> > 
> [..]
> > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > index bf49f83cb86f..26e12db0a4e8 100644
> > --- a/drivers/media/v4l2-core/Kconfig
> > +++ b/drivers/media/v4l2-core/Kconfig
> > @@ -62,13 +62,14 @@ config V4L2_FLASH_LED_CLASS
> >         tristate "V4L2 flash API for LED flash class devices"
> >         depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> >         depends on LEDS_CLASS_FLASH
> > +       select V4L2_ASYNC
> >         help
> >           Say Y here to enable V4L2 flash API support for LED flash
> >           class drivers.
> >  
> >           When in doubt, say N.
> >  
> > -config V4L2_FWNODE
> > +config V4L2_ASYNC
> >         tristate
> >  
> 
> So we don't expect (or want) out-of-tree drivers to be able to use this.
> Is that correct?

Hmm. I somehow manage to miss how this is related to out-of-tree drivers.

They do need to be adapted to the change though.

> 
> >  # Used by drivers that need Videobuf modules
> > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > index e4cd589b99a5..298ca6ba4f32 100644
> > --- a/drivers/media/v4l2-core/Makefile
> > +++ b/drivers/media/v4l2-core/Makefile
> > @@ -7,14 +7,16 @@ tuner-objs    :=      tuner-core.o
> >  
> >  videodev-objs  :=      v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> >                         v4l2-event.o v4l2-ctrls.o v4l2-subdev.o \
> > -                       v4l2-async.o v4l2-common.o
> > +                       v4l2-common.o
> >  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
> >  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
> >  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
> >  videodev-$(CONFIG_SPI) += v4l2-spi.o
> >  videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
> >  
> > -obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> > +v4l2-async-objs :=     v4l2-async-core.o v4l2-fwnode.o
> > +
> 
> Looks good.
> 
> > +obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
> >  obj-$(CONFIG_VIDEO_V4L2) += videodev.o
> >  obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async-core.c
> > similarity index 96%
> > rename from drivers/media/v4l2-core/v4l2-async.c
> > rename to drivers/media/v4l2-core/v4l2-async-core.c
> > index 21b3890b96fc..6e49386f0284 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async-core.c
> > @@ -852,8 +852,27 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
> >  }
> >  DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
> >  
> > -void v4l2_async_debug_init(struct dentry *debugfs_dir)
> > +static struct dentry *v4l2_async_debugfs_dir;
> > +
> > +static int __init v4l2_async_init(void)
> >  {
> > -       debugfs_create_file("pending_async_subdevices", 0444, debugfs_dir, NULL,
> > +       v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
> > +       debugfs_create_file("pending_async_subdevices", 0444,
> > +                           v4l2_async_debugfs_dir, NULL,
> >                             &pending_subdevs_fops);
> 
> I guess we could have kept the previous path,
> but OTOH it's not really a big deal for debugfs.

If debugfs bits are added to V4L2 framework, it will be different from the
above debugfs path. Otherwise the two will in practice be part of the same
module. And if it's going to change, it's better to change it now than
later.

> 
> Once we figure out the above about exposing V4L2_ASYNC:
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks!

-- 
Kind regards,

Sakari Ailus
