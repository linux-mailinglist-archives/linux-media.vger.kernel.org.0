Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C01332564
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 13:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhCIMWh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 07:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhCIMW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Mar 2021 07:22:26 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2217AC06174A
        for <linux-media@vger.kernel.org>; Tue,  9 Mar 2021 04:22:26 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 00BFE1F45512
Message-ID: <4e5a01739867c7b6ab15fe506d4ef2160a851293.camel@collabora.com>
Subject: Re: [PATCH 1/1] v4l: async, fwnode: Improve module organisation
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Date:   Tue, 09 Mar 2021 09:22:16 -0300
In-Reply-To: <20210309100314.GI3@paasikivi.fi.intel.com>
References: <20210308100256.26270-1-sakari.ailus@linux.intel.com>
         <51c824c3115fc678c91660b9a12332242c1b1384.camel@collabora.com>
         <20210309100314.GI3@paasikivi.fi.intel.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-03-09 at 12:03 +0200, Sakari Ailus wrote:
> Hi Ezequiel,
> 
> On Mon, Mar 08, 2021 at 04:01:58PM -0300, Ezequiel Garcia wrote:
> > Hi Sakari,
> > 
> > Thanks a lot for the patch. I like where this is going.
> 
> Thanks for the review, too!
> 
> > 
> > On Mon, 2021-03-08 at 12:02 +0200, Sakari Ailus wrote:
> > > The V4L2 async framework is generally used with the V4L2 fwnode, which
> > > also depends on the former. There is only one exception, the CAFE_CCIC
> > > driver, which uses V4L2 async but does not need V4L2 fwnode.
> > > 
> > > At the same time there is a vast number of systems that need videodev
> > > module, but have no use for v4l2-async that's now part of videodev.
> > > 
> > > In order to improve, build v4l2-async and v4l2-fwnode as a single module
> > > called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
> > > Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.
> > > 
> > > This also moves the initialisation of the debufs entries for async subdevs
> > > to loading of the v4l2-async module. The directory is named as
> > > "v4l2-async".
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > This goes on top of my recent async patches.
> > > 
> > >  drivers/media/i2c/Kconfig                     | 80 +++++++++----------
> > >  drivers/media/i2c/ccs/Kconfig                 |  2 +-
> > >  drivers/media/i2c/et8ek8/Kconfig              |  2 +-
> > >  drivers/media/pci/intel/ipu3/Kconfig          |  2 +-
> > >  drivers/media/platform/Kconfig                | 16 ++--
> > >  drivers/media/platform/am437x/Kconfig         |  2 +-
> > >  drivers/media/platform/atmel/Kconfig          |  4 +-
> > >  drivers/media/platform/cadence/Kconfig        |  4 +-
> > >  drivers/media/platform/davinci/Kconfig        |  2 +-
> > >  drivers/media/platform/exynos4-is/Kconfig     |  4 +-
> > >  drivers/media/platform/marvell-ccic/Kconfig   |  1 +
> > >  drivers/media/platform/rcar-vin/Kconfig       |  4 +-
> > >  .../media/platform/sunxi/sun4i-csi/Kconfig    |  2 +-
> > >  .../media/platform/sunxi/sun6i-csi/Kconfig    |  2 +-
> > >  drivers/media/platform/xilinx/Kconfig         |  2 +-
> > >  drivers/media/v4l2-core/Kconfig               |  3 +-
> > >  drivers/media/v4l2-core/Makefile              |  6 +-
> > >  .../{v4l2-async.c => v4l2-async-core.c}       | 23 +++++-
> > >  drivers/media/v4l2-core/v4l2-dev.c            |  5 --
> > >  drivers/staging/media/imx/Kconfig             |  2 +-
> > >  drivers/staging/media/tegra-video/Kconfig     |  2 +-
> > >  21 files changed, 94 insertions(+), 76 deletions(-)
> > >  rename drivers/media/v4l2-core/{v4l2-async.c => v4l2-async-core.c} (96%)
> > > 
> > [..]
> > > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > > index bf49f83cb86f..26e12db0a4e8 100644
> > > --- a/drivers/media/v4l2-core/Kconfig
> > > +++ b/drivers/media/v4l2-core/Kconfig
> > > @@ -62,13 +62,14 @@ config V4L2_FLASH_LED_CLASS
> > >         tristate "V4L2 flash API for LED flash class devices"
> > >         depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > >         depends on LEDS_CLASS_FLASH
> > > +       select V4L2_ASYNC
> > >         help
> > >           Say Y here to enable V4L2 flash API support for LED flash
> > >           class drivers.
> > >  
> > >           When in doubt, say N.
> > >  
> > > -config V4L2_FWNODE
> > > +config V4L2_ASYNC
> > >         tristate
> > >  
> > 
> > So we don't expect (or want) out-of-tree drivers to be able to use this.
> > Is that correct?
> 
> Hmm. I somehow manage to miss how this is related to out-of-tree drivers.
> 

As it is, the v4l2-async module is not user-selectable, because
V4L2_ASYNC has no prompt (the symbol is non-visible).

For the user to be able to select the v4l2-async module,
even if no driver is selecting it, it needs a prompt: 

config V4L2_ASYNC
	tristate "V4L2 asynchronous subdevice support"

This is usually useful for out-of-tree drivers, AFAIK.

Cheers,
Eze

