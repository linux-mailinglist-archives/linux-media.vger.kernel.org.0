Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4AE3393BC
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 17:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbhCLQlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 11:41:01 -0500
Received: from mga01.intel.com ([192.55.52.88]:27349 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232647AbhCLQkn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 11:40:43 -0500
IronPort-SDR: mMLpVxiNnI9nY7V3qUAj36SGnTMdP6KPIshW8Aog+4VjjX1OoJY8oZXTzCGkQ8tD3wF/nN2ZOc
 943y48lRGP/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="208698792"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="208698792"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 08:40:43 -0800
IronPort-SDR: J8rjlsu0j6aYhKrTYB1GVpdTJwvmEvWUEnkRo2x05p1gCL0gkub7sN/HgNqdZkVDSBYd7KuuFk
 BJHnYrA+4Z4g==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="377753800"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 08:40:42 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 6E1C5203A9;
        Fri, 12 Mar 2021 18:40:40 +0200 (EET)
Date:   Fri, 12 Mar 2021 18:40:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: async, fwnode: Improve module organisation
Message-ID: <20210312164040.GI3@paasikivi.fi.intel.com>
References: <20210308100256.26270-1-sakari.ailus@linux.intel.com>
 <51c824c3115fc678c91660b9a12332242c1b1384.camel@collabora.com>
 <20210309100314.GI3@paasikivi.fi.intel.com>
 <4e5a01739867c7b6ab15fe506d4ef2160a851293.camel@collabora.com>
 <20210309222137.GQ3@paasikivi.fi.intel.com>
 <f41e7ecc2af70e77ba05cc27f90fc9344b8b52f7.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f41e7ecc2af70e77ba05cc27f90fc9344b8b52f7.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, Mar 12, 2021 at 11:50:35AM -0300, Ezequiel Garcia wrote:
> Hi Sakari,
> 
> Just saw the v2 and remembered I didn't follow-up
> on your questions here. Sorry about that.
> 
> On Wed, 2021-03-10 at 00:21 +0200, Sakari Ailus wrote:
> > Hi Ezequiel,
> > 
> > On Tue, Mar 09, 2021 at 09:22:16AM -0300, Ezequiel Garcia wrote:
> > > On Tue, 2021-03-09 at 12:03 +0200, Sakari Ailus wrote:
> > > > Hi Ezequiel,
> > > > 
> > > > On Mon, Mar 08, 2021 at 04:01:58PM -0300, Ezequiel Garcia wrote:
> > > > > Hi Sakari,
> > > > > 
> > > > > Thanks a lot for the patch. I like where this is going.
> > > > 
> > > > Thanks for the review, too!
> > > > 
> > > > > 
> > > > > On Mon, 2021-03-08 at 12:02 +0200, Sakari Ailus wrote:
> > > > > > The V4L2 async framework is generally used with the V4L2 fwnode, which
> > > > > > also depends on the former. There is only one exception, the CAFE_CCIC
> > > > > > driver, which uses V4L2 async but does not need V4L2 fwnode.
> > > > > > 
> > > > > > At the same time there is a vast number of systems that need videodev
> > > > > > module, but have no use for v4l2-async that's now part of videodev.
> > > > > > 
> > > > > > In order to improve, build v4l2-async and v4l2-fwnode as a single module
> > > > > > called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
> > > > > > Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.
> > > > > > 
> > > > > > This also moves the initialisation of the debufs entries for async subdevs
> > > > > > to loading of the v4l2-async module. The directory is named as
> > > > > > "v4l2-async".
> > > > > > 
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > ---
> > > > > > This goes on top of my recent async patches.
> > > > > > 
> > > > > >  drivers/media/i2c/Kconfig                     | 80 +++++++++----------
> > > > > >  drivers/media/i2c/ccs/Kconfig                 |  2 +-
> > > > > >  drivers/media/i2c/et8ek8/Kconfig              |  2 +-
> > > > > >  drivers/media/pci/intel/ipu3/Kconfig          |  2 +-
> > > > > >  drivers/media/platform/Kconfig                | 16 ++--
> > > > > >  drivers/media/platform/am437x/Kconfig         |  2 +-
> > > > > >  drivers/media/platform/atmel/Kconfig          |  4 +-
> > > > > >  drivers/media/platform/cadence/Kconfig        |  4 +-
> > > > > >  drivers/media/platform/davinci/Kconfig        |  2 +-
> > > > > >  drivers/media/platform/exynos4-is/Kconfig     |  4 +-
> > > > > >  drivers/media/platform/marvell-ccic/Kconfig   |  1 +
> > > > > >  drivers/media/platform/rcar-vin/Kconfig       |  4 +-
> > > > > >  .../media/platform/sunxi/sun4i-csi/Kconfig    |  2 +-
> > > > > >  .../media/platform/sunxi/sun6i-csi/Kconfig    |  2 +-
> > > > > >  drivers/media/platform/xilinx/Kconfig         |  2 +-
> > > > > >  drivers/media/v4l2-core/Kconfig               |  3 +-
> > > > > >  drivers/media/v4l2-core/Makefile              |  6 +-
> > > > > >  .../{v4l2-async.c => v4l2-async-core.c}       | 23 +++++-
> > > > > >  drivers/media/v4l2-core/v4l2-dev.c            |  5 --
> > > > > >  drivers/staging/media/imx/Kconfig             |  2 +-
> > > > > >  drivers/staging/media/tegra-video/Kconfig     |  2 +-
> > > > > >  21 files changed, 94 insertions(+), 76 deletions(-)
> > > > > >  rename drivers/media/v4l2-core/{v4l2-async.c => v4l2-async-core.c} (96%)
> > > > > > 
> > > > > [..]
> > > > > > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > > > > > index bf49f83cb86f..26e12db0a4e8 100644
> > > > > > --- a/drivers/media/v4l2-core/Kconfig
> > > > > > +++ b/drivers/media/v4l2-core/Kconfig
> > > > > > @@ -62,13 +62,14 @@ config V4L2_FLASH_LED_CLASS
> > > > > >         tristate "V4L2 flash API for LED flash class devices"
> > > > > >         depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > > > >         depends on LEDS_CLASS_FLASH
> > > > > > +       select V4L2_ASYNC
> > > > > >         help
> > > > > >           Say Y here to enable V4L2 flash API support for LED flash
> > > > > >           class drivers.
> > > > > >  
> > > > > >           When in doubt, say N.
> > > > > >  
> > > > > > -config V4L2_FWNODE
> > > > > > +config V4L2_ASYNC
> > > > > >         tristate
> > > > > >  
> > > > > 
> > > > > So we don't expect (or want) out-of-tree drivers to be able to use this.
> > > > > Is that correct?
> > > > 
> > > > Hmm. I somehow manage to miss how this is related to out-of-tree drivers.
> > > > 
> > > 
> > > As it is, the v4l2-async module is not user-selectable, because
> > > V4L2_ASYNC has no prompt (the symbol is non-visible).
> > > 
> > > For the user to be able to select the v4l2-async module,
> > > even if no driver is selecting it, it needs a prompt: 
> > > 
> > > config V4L2_ASYNC
> > >         tristate "V4L2 asynchronous subdevice support"
> > 
> > Well, yes, you could do this in principle.
> > 
> > But this patch does not change this in any way, does it?
> > 
> 
> I can be wrong, but it does change it. Before the patch,
> v4l2-async kernel API is in the videodev module, which
> is built with CONFIG_VIDEO_V4L2, which is enabled
> when the user selects CONFIG_MEDIA_SUPPORT.
> 
> If the kernel was built with CONFIG_VIDEO_V4L2,
> out-of-tree drivers gets support for v4l2-async.
> 
> After this patch, the v4l2-async kernel API is now selected
> by drivers that need it, and can't be enabled. If there are
> no such drivers, out-of-tree drivers won't get it.

Yes, this is true with V4L2_ASYNC but it was true for V4L2_FWNODE
previously, too. 

> I guess this is a bit subtle, and perhaps not worth
> considering.

I'm not sure how common proper out-of-tree drivers are anyway, most live in
some random kernel tree that contains a bunch of non-upstreamed stuff.

> > If someone needs this out-of-tree, they could also enable one of the
> > drivers that need v4l2-async in the kernel.
> > 
> 
> True :)

\o/

-- 
Regards,

Sakari Ailus
