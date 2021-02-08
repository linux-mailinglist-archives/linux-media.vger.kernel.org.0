Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173F8312CDE
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 10:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbhBHJLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 04:11:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:46402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231281AbhBHJJZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 04:09:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 473C664E5A;
        Mon,  8 Feb 2021 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612775307;
        bh=tQSOKSuUKy0z9iWHGjlMuG6HuDujV8ShI8+HV1Qgb7w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CbFQv8K7kbDtKUTabFC44AfFprjbiARtgfycTv/IktTNcgKiqgz8R0QCsZZ7yvB1P
         2/unU8OHGHB8fk3/twOW7AvZ2ZRgIghy48C/Kb8z8qXCbAOHhliDc/InR85MiTTWLI
         ZsSO3UaOj4nxOuPTZyV7qpXrFvacR0+sKwl2CicVNzL3vK01olmXzRNbiRlypPH7Kj
         wO/gFMT1pZVh7EVi19wTnwn7DQZZCd8L73hVFu4Ph2mgZaUHg0B5w9sUuUdbXHVfkg
         mvyfBelh0IVi7pf8lA5kbk/Ys2wMS1zYLrcS3px8tiOYWMTq1brPvl2WSH7cT6c+BB
         g+svRniFpYkuA==
Date:   Mon, 8 Feb 2021 10:08:22 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] media: i2c: fix max9271 build dependencies
Message-ID: <20210208100822.76ca0c2e@coco.lan>
In-Reply-To: <20210208084147.GN32460@paasikivi.fi.intel.com>
References: <20210208113208.35449879@canb.auug.org.au>
        <20210208065315.1914616-1-mchehab+huawei@kernel.org>
        <20210208072701.GI32460@paasikivi.fi.intel.com>
        <20210208083616.3iulzo56mhn4ymmq@uno.localdomain>
        <20210208084147.GN32460@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 8 Feb 2021 10:41:47 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

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

While such solution is technically OK, it will make harder for the ones
wanting to use the RDACM drivers, because those two drivers will be
ridden at the config menu, until MAX9271 got selected.

With the above solution, this driver will be auto-selected if either
RDACM20 or RDACM21 is needed.

Btw, this is exactly the same strategy we use for tuner I2C modules:
the user doesn't need to know that his board uses tuner "foo" or "bar".
All it needs is to know that it will require, for instance, the em28xx
driver.

> > >  
> > 
> > OTOH I it makes sense to have MAX9271 depend on the camera modules, as
> > selecting the serializer alone is not that useful.
> > 
> > Could the two camera modules symbols instead select the MAX9271 one ?  
> 
> MAX9271 could be used elsewhere than in RDACM* devices.

Sure, but then it is just a matter of adding the other driver there:

	depends on VIDEO_RDACM20 || VIDEO_RDACM21 || VIDEO_FOO

To be frank, I doubt that we'll end having dozens of boards with this.
If we end having lots of drivers, we can work on a different
solution.

> 
> Also, as select does not handle dependencies, all drivers that need MAX9271
> would have to include the dependencies of MAX9271.

Yes. "Depends on" handles any dependencies that are required for building
MAX9271. In this specific case, the dependencies are the same, so select
could equally work.

Thanks,
Mauro
