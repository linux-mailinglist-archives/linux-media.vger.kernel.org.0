Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F49314ADD
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 09:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhBIIw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 03:52:29 -0500
Received: from mga09.intel.com ([134.134.136.24]:28279 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhBIIuB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 03:50:01 -0500
IronPort-SDR: CDHLnO0bOVrm7JGJpS2F/Ox7gTxjg5EPfG+CHvf/9FEnDgbMYokVxKFpLtiUL8u0HdfUR7kfhQ
 GM9R3y2PJCTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="181993764"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="181993764"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 00:48:11 -0800
IronPort-SDR: qBsvc/XA4yLsyr+Vdzc1wwSuT5sOxC7ubpfvD3hivgS3vif8ljX7K9bQ8dhLq0AlBWv4y9sQd9
 +rulLZqr11Ug==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="398715389"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 00:48:09 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 38B6E206D0; Tue,  9 Feb 2021 10:48:07 +0200 (EET)
Date:   Tue, 9 Feb 2021 10:48:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] media: i2c: Kconfig: Make MAX9271 a module
Message-ID: <20210209084807.GA32460@paasikivi.fi.intel.com>
References: <20210208182006.178740-1-jacopo+renesas@jmondi.org>
 <20210208202147.GZ32460@paasikivi.fi.intel.com>
 <YCG6mV9v+KXT7K+W@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCG6mV9v+KXT7K+W@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 09, 2021 at 12:26:33AM +0200, Laurent Pinchart wrote:
> Hi Sakari and Jacopo,
> 
> On Mon, Feb 08, 2021 at 10:21:47PM +0200, Sakari Ailus wrote:
> > On Mon, Feb 08, 2021 at 07:20:06PM +0100, Jacopo Mondi wrote:
> > > With the introduction of the RDACM21 camera module support in
> > > commit a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > > the symbols defined by the max9271 library were exported twice
> > > if multiple users of the library were compiled in at the same time.
> > > 
> > > In example:
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module:
> > > 'max9271_set_serial_link' exported twice. Previous export was in
> > > drivers/media/i2c/rdacm20-camera_module.ko
> > > 
> > > Fix this by making the rdacm21 file a module and have the driver
> > > using its functions select it.
> > > 
> > > Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/Kconfig  | 5 +++++
> > >  drivers/media/i2c/Makefile | 7 +++----
> > >  2 files changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 2d3dc0d82f9e..84645f751da3 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -1240,12 +1240,16 @@ config VIDEO_NOON010PC30
> > > 
> > >  source "drivers/media/i2c/m5mols/Kconfig"
> > > 
> > > +config VIDEO_MAX9271
> > 
> > How about calling this VIDEO_MAX9271_HELPER instead? It's not a driver in
> > the proper sense of the word.
> 
> Not all Kconfig symbols refer to drivers. Should we rename V4L2_FWNODE
> to V4L2_FWNODE_HELPER ? :-)
> 
> Of course the MAX9271 name may lead someone to believe that the symbol
> refers to a driver. If you think we should really make this explicit,
> I'd have a preference for LIB instead of HELPER.

LIB sounds good to me, too.

> 
> Either way,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > > +	tristate
> > > +
> > >  config VIDEO_RDACM20
> > >  	tristate "IMI RDACM20 camera support"
> > >  	depends on I2C
> > >  	select V4L2_FWNODE
> > >  	select VIDEO_V4L2_SUBDEV_API
> > >  	select MEDIA_CONTROLLER
> > > +	select VIDEO_MAX9271
> > >  	help
> > >  	  This driver supports the IMI RDACM20 GMSL camera, used in
> > >  	  ADAS systems.
> > > @@ -1259,6 +1263,7 @@ config VIDEO_RDACM21
> > >  	select V4L2_FWNODE
> > >  	select VIDEO_V4L2_SUBDEV_API
> > >  	select MEDIA_CONTROLLER
> > > +	select VIDEO_MAX9271
> > >  	help
> > >  	  This driver supports the IMI RDACM21 GMSL camera, used in
> > >  	  ADAS systems.
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index 6bd22d63e1a7..c34a7de3158b 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -125,10 +125,9 @@ obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
> > >  obj-$(CONFIG_VIDEO_IMX334)	+= imx334.o
> > >  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> > >  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> > > -rdacm20-camera_module-objs	:= rdacm20.o max9271.o
> > > -obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
> > > -rdacm21-camera_module-objs	:= rdacm21.o max9271.o
> > > -obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
> > > +obj-$(CONFIG_VIDEO_MAX9271)	+= max9271.o
> > > +obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20.o
> > > +obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21.o
> > >  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> > > 
> > >  obj-$(CONFIG_SDR_MAX2175) += max2175.o
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
