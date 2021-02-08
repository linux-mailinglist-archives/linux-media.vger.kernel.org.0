Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15ED0312EA6
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 11:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhBHKOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 05:14:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:33188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232355AbhBHKIM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 05:08:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D37FA601FB;
        Mon,  8 Feb 2021 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612778849;
        bh=gdHdGxSWxUqD1mP5CuSSmNhSTLa95bu1XHK1XXgsSzo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p5b9bdRwb7RVTFzxKvI3tU/kyCYfO4I5O8txacBWdj3LW9TuRnDdx0LqAtW4wg8Oj
         tHFGgwevsJ+G/2pVQf5nInIMxJeHUxhVVTKB+MYgxKshfs06P9JcpLCNhiSAEjzn4C
         XwmrBr1VYebbSAFo5h6z5HhubfIQDLd6xYTvrOVsd6rrNa/Y9aFv4jm+0Ahcmlh5pc
         ow4GISiz5M71jnTz3xJB2QsumAFr+F2E54CXWx3dfcdKLSmQq7CGkCC1+xdnak9dqE
         PLHkJoICyheIUUSILWN2E1MBVwcgIuCCOZcc5jkwnhhYFmi8WolVlAysmZtffZLUtQ
         /LHWHoQXgb3EQ==
Date:   Mon, 8 Feb 2021 11:07:23 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] media: i2c: fix max9271 build dependencies
Message-ID: <20210208110723.4859ddda@coco.lan>
In-Reply-To: <20210208092424.GP32460@paasikivi.fi.intel.com>
References: <20210208113208.35449879@canb.auug.org.au>
        <20210208065315.1914616-1-mchehab+huawei@kernel.org>
        <20210208072701.GI32460@paasikivi.fi.intel.com>
        <20210208083616.3iulzo56mhn4ymmq@uno.localdomain>
        <20210208084147.GN32460@paasikivi.fi.intel.com>
        <20210208100822.76ca0c2e@coco.lan>
        <20210208092424.GP32460@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 8 Feb 2021 11:24:25 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> On Mon, Feb 08, 2021 at 10:08:22AM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 8 Feb 2021 10:41:47 +0200
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> >   
> > > Hi Jacopo,
> > > 
> > > On Mon, Feb 08, 2021 at 09:36:16AM +0100, Jacopo Mondi wrote:  
> > > > Hello everyone,
> > > > 
> > > > On Mon, Feb 08, 2021 at 09:27:01AM +0200, Sakari Ailus wrote:    
> > > > > Hi Mauro,
> > > > >
> > > > > Thanks for the patch.    
> > > > 
> > > > Sorry, that's cleary an oversight from my side.
> > > > Thanks for tackling it.
> > > >     
> > > > >
> > > > > On Mon, Feb 08, 2021 at 07:53:15AM +0100, Mauro Carvalho Chehab wrote:    
> > > > > > As described on its c file, the Maxim MAX9271 GMSL serializer isn't a
> > > > > > self-contained driver, as MAX9271 is usually embedded in camera modules
> > > > > > with at least one image sensor and optional additional components,
> > > > > > such as uController units or ISPs/DSPs.
> > > > > >
> > > > > > After chanseset a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module"),
> > > > > > there are now two drivers currently needing it: rdacm20 and rdacm21.
> > > > > >
> > > > > > Building with allmodconfig is now causing those warnings:
> > > > > >
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_serial_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_high_threshold' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_enable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_disable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_verify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_deserializer_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > > 	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_translation' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > > >
> > > > > > Address the issue by adding a Kconfig item for it, that it is
> > > > > > seleced if either one of the modules that need max9271 is used.
> > > > > >
> > > > > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > > Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > > > ---
> > > > > >  drivers/media/i2c/Kconfig  | 10 ++++++++++
> > > > > >  drivers/media/i2c/Makefile |  8 ++++----
> > > > > >  2 files changed, 14 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > index 2d3dc0d82f9e..a6802195d583 100644
> > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > @@ -712,6 +712,16 @@ config VIDEO_ST_MIPID02
> > > > > >  	  module will be called st-mipid02.
> > > > > >  endmenu
> > > > > >
> > > > > > +#
> > > > > > +# Camera ancillary chips
> > > > > > +#
> > > > > > +
> > > > > > +# MAX9271 is usually embedded in camera modules
> > > > > > +config VIDEO_MAX9271_SERIALIZER
> > > > > > +	tristate
> > > > > > +	default y
> > > > > > +	depends on VIDEO_RDACM20 || VIDEO_RDACM21
> > > > > > +    
> > > > >
> > > > > I'd instead make the RDACM drivers depend on this one instead. The RDACM20
> > > > > driver directly depends on the symbols in the MAX9271 driver.  
> > 
> > While such solution is technically OK, it will make harder for the ones
> > wanting to use the RDACM drivers, because those two drivers will be
> > ridden at the config menu, until MAX9271 got selected.
> > 
> > With the above solution, this driver will be auto-selected if either
> > RDACM20 or RDACM21 is needed.
> > 
> > Btw, this is exactly the same strategy we use for tuner I2C modules:
> > the user doesn't need to know that his board uses tuner "foo" or "bar".
> > All it needs is to know that it will require, for instance, the em28xx
> > driver.
> >   
> > > > >    
> > > > 
> > > > OTOH I it makes sense to have MAX9271 depend on the camera modules, as
> > > > selecting the serializer alone is not that useful.
> > > > 
> > > > Could the two camera modules symbols instead select the MAX9271 one ?    
> > > 
> > > MAX9271 could be used elsewhere than in RDACM* devices.  
> > 
> > Sure, but then it is just a matter of adding the other driver there:
> > 
> > 	depends on VIDEO_RDACM20 || VIDEO_RDACM21 || VIDEO_FOO
> > 
> > To be frank, I doubt that we'll end having dozens of boards with this.
> > If we end having lots of drivers, we can work on a different
> > solution.  
> 
> Also note that there will be combinations of something compiled as a module
> and another driver linked directly to the kernel.
> 
> So each of the RDACM drivers would likely also need:
> 
> 	depends on VIDEO_MAX9271_SERIALIZER || !VIDEO_MAX9271_SERIALIZER

No. I fail to see where this would work, as MAX9271 is a mandatory
dependency of those drivers. See:

	static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
	{
	        struct rdacm20_device *dev = sd_to_rdacm20(sd);
	
	        return max9271_set_serial_link(dev->serializer, enable);
	}


Without compiling max9271, the device won't stream ;-)

-

Yet, assuming that this could be an optional feature, if you use this:

	config VIDEO_MAX9271_SERIALIZER
		tristate
		default y
		depends on VIDEO_RDACM20 || VIDEO_RDACM21 

You should *not* never do:

 	depends on VIDEO_MAX9271_SERIALIZER || !VIDEO_MAX9271_SERIALIZER
	
for VIDEO_RDACM20 or VIDEO_RDACM21, as it would cause a dependency
loop.

-

If you do, instead:

    if VIDEO_V4L2 && I2C
	config VIDEO_MAX9271_SERIALIZER
		tristate

	config VIDEO_RDACM20
		select VIDEO_MAX9271_SERIALIZER
		...

	config VIDEO_RDACM21
		select VIDEO_MAX9271_SERIALIZER
		...
    endif

Then you also won't need:
	depends on VIDEO_MAX9271_SERIALIZER || !VIDEO_MAX9271_SERIALIZER

As select should do the right thing in this case, ensuring that MAX9271
will be builtin either if RDACM20 or RDACM21 is builtin.

-

This should also work:

	config VIDEO_MAX9271_SERIALIZER
		tristate
		...

	if VIDEO_MAX9271_SERIALIZER

	config VIDEO_RDACM20
		tristate
		...

	config VIDEO_RDACM21
		tristate
		...

	endif

without needing a "depend on FOO || !FOO" logic, but, as I said before, this 
case will force the user that want to build the RDACM20/RDACM21 drivers to 
be aware that a MAX9271 driver is required.

-

You would only need a "depend on FOO || !FOO" if the driver FOO is
optional and if you try do something like:

	config FOO
		tristate
		...

	config VIDEO_RDACM20
		tristate
		depends on FOO
		...

	config VIDEO_RDACM21
		tristate
		depends on FOO
		...
	
as, on such case, it would allow the vars to be:
	
	FOO="m"
	VIDEO_RDACM20="y"
	VIDEO_RDACM21="m"

which would cause build errors.

Thanks,
Mauro
