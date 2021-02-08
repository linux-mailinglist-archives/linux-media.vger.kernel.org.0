Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97142312CC2
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 10:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhBHJIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 04:08:02 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37563 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbhBHJAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 04:00:04 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DF08A40002;
        Mon,  8 Feb 2021 08:58:43 +0000 (UTC)
Date:   Mon, 8 Feb 2021 09:59:07 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] media: i2c: fix max9271 build dependencies
Message-ID: <20210208085907.rmwjtcpcnfkcpisj@uno.localdomain>
References: <20210208113208.35449879@canb.auug.org.au>
 <20210208065315.1914616-1-mchehab+huawei@kernel.org>
 <20210208072701.GI32460@paasikivi.fi.intel.com>
 <20210208083616.3iulzo56mhn4ymmq@uno.localdomain>
 <20210208084147.GN32460@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210208084147.GN32460@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Feb 08, 2021 at 10:41:47AM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Feb 08, 2021 at 09:36:16AM +0100, Jacopo Mondi wrote:
> > Hello everyone,
> >
> > On Mon, Feb 08, 2021 at 09:27:01AM +0200, Sakari Ailus wrote:
> > > Hi Mauro,
> > >
> > > Thanks for the patch.
> >
> > Sorry, that's cleary an oversight from my side.
> > Thanks for tackling it.
> >
> > >
> > > On Mon, Feb 08, 2021 at 07:53:15AM +0100, Mauro Carvalho Chehab wrote:
> > > > As described on its c file, the Maxim MAX9271 GMSL serializer isn't a
> > > > self-contained driver, as MAX9271 is usually embedded in camera modules
> > > > with at least one image sensor and optional additional components,
> > > > such as uController units or ISPs/DSPs.
> > > >
> > > > After chanseset a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module"),
> > > > there are now two drivers currently needing it: rdacm20 and rdacm21.
> > > >
> > > > Building with allmodconfig is now causing those warnings:
> > > >
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_serial_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_high_threshold' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_enable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_disable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_verify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_deserializer_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_translation' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > >
> > > > Address the issue by adding a Kconfig item for it, that it is
> > > > seleced if either one of the modules that need max9271 is used.
> > > >
> > > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > ---
> > > >  drivers/media/i2c/Kconfig  | 10 ++++++++++
> > > >  drivers/media/i2c/Makefile |  8 ++++----
> > > >  2 files changed, 14 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > index 2d3dc0d82f9e..a6802195d583 100644
> > > > --- a/drivers/media/i2c/Kconfig
> > > > +++ b/drivers/media/i2c/Kconfig
> > > > @@ -712,6 +712,16 @@ config VIDEO_ST_MIPID02
> > > >  	  module will be called st-mipid02.
> > > >  endmenu
> > > >
> > > > +#
> > > > +# Camera ancillary chips
> > > > +#
> > > > +
> > > > +# MAX9271 is usually embedded in camera modules
> > > > +config VIDEO_MAX9271_SERIALIZER
> > > > +	tristate
> > > > +	default y
> > > > +	depends on VIDEO_RDACM20 || VIDEO_RDACM21
> > > > +
> > >
> > > I'd instead make the RDACM drivers depend on this one instead. The RDACM20
> > > driver directly depends on the symbols in the MAX9271 driver.
> > >
> >
> > OTOH I it makes sense to have MAX9271 depend on the camera modules, as
> > selecting the serializer alone is not that useful.
> >
> > Could the two camera modules symbols instead select the MAX9271 one ?
>
> MAX9271 could be used elsewhere than in RDACM* devices.

Shouldn't other camera modules that include such serializer select its
symbol then ?

>
> Also, as select does not handle dependencies, all drivers that need MAX9271
> would have to include the dependencies of MAX9271.
>

Wouldn't select just select the MAX9271 symbol, which will list its own
dependencies ?


> >
> > > >  #
> > > >  # V4L2 I2C drivers that are related with Camera support
> > > >  #
> > > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > > index 6bd22d63e1a7..63bb16e51876 100644
> > > > --- a/drivers/media/i2c/Makefile
> > > > +++ b/drivers/media/i2c/Makefile
> > > > @@ -125,10 +125,10 @@ obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
> > > >  obj-$(CONFIG_VIDEO_IMX334)	+= imx334.o
> > > >  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> > > >  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> > > > -rdacm20-camera_module-objs	:= rdacm20.o max9271.o
> > > > -obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
> > > > -rdacm21-camera_module-objs	:= rdacm21.o max9271.o
> > > > -obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
> > > > +obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20.o
> > > > +obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21.o
> > > >  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> > > >
> > > > +obj-$(CONFIG_VIDEO_MAX9271_SERIALIZER) += max9271.o
> > > > +
> > > >  obj-$(CONFIG_SDR_MAX2175) += max2175.o
> > >
> > > --
> > > Kind regards,
> > >
> > > Sakari Ailus
>
> --
> Sakari Ailus
