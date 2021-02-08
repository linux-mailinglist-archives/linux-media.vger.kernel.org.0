Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1073134E3
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 15:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbhBHOSk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 09:18:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:41634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232557AbhBHOPf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 09:15:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD42764E30;
        Mon,  8 Feb 2021 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612793694;
        bh=N+Sovy/qiwgm1oeL1BF7krizboBucDhUd24hty1zw9U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DnL53LEHBJHER5L+uZ0Mm6kIhOSvLXb9ohZmBH+2a4KIHQEeRjX9g/V6r73p5EbpZ
         JUhBnvillcSYLbgXfZx/pC0bmsIKT5Nk9Cy+Z+2QVTT7mvwq4vkJdiCn51qmbHygn5
         qxDeH4cIcqExFZgG83T5tnRTAMHwPuAN6paVUK+X5t+ML7V2yyYSVfcyWNH+YnUpyd
         w90XdM6qUMUEg/g1L1JiabL4x+dVIt1Z74ZRGRJ+QUZEXnL/QafZfTE1Eh0Aa06zNz
         Ay0izs+C0cufWLcKjFyqc+taw0U5eMQUMv7+HkGVEG+5tbCfH+4/+XQWMrrzbQmU3c
         jAvC9jPDzam9w==
Date:   Mon, 8 Feb 2021 15:14:46 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] media: i2c: fix max9271 build dependencies
Message-ID: <20210208151446.27862d71@coco.lan>
In-Reply-To: <20210208135514.t2wymwvsehdl657m@uno.localdomain>
References: <20210208072701.GI32460@paasikivi.fi.intel.com>
        <20210208083616.3iulzo56mhn4ymmq@uno.localdomain>
        <20210208084147.GN32460@paasikivi.fi.intel.com>
        <20210208100822.76ca0c2e@coco.lan>
        <20210208092424.GP32460@paasikivi.fi.intel.com>
        <20210208110723.4859ddda@coco.lan>
        <YCEhVrSFpqX1Th4x@pendragon.ideasonboard.com>
        <20210208114142.skwc22xps5xiqdyo@uno.localdomain>
        <20210208141102.3d5999dd@coco.lan>
        <20210208143150.03974bca@coco.lan>
        <20210208135514.t2wymwvsehdl657m@uno.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 8 Feb 2021 14:55:14 +0100
Jacopo Mondi <jacopo@jmondi.org> escreveu:

> Hi Mauro,
> 
> On Mon, Feb 08, 2021 at 02:31:50PM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 8 Feb 2021 14:11:02 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> >  
> > > Em Mon, 8 Feb 2021 12:41:42 +0100
> > > Jacopo Mondi <jacopo@jmondi.org> escreveu:
> > >  
> > > > > > If you do, instead:
> > > > > >
> > > > > >     if VIDEO_V4L2 && I2C
> > > > > > 	config VIDEO_MAX9271_SERIALIZER
> > > > > > 		tristate
> > > > > >
> > > > > > 	config VIDEO_RDACM20
> > > > > > 		select VIDEO_MAX9271_SERIALIZER
> > > > > > 		...
> > > > > >
> > > > > > 	config VIDEO_RDACM21
> > > > > > 		select VIDEO_MAX9271_SERIALIZER
> > > > > > 		...
> > > > > >     endif
> > > > > >
> > > > > > Then you also won't need:
> > > > > > 	depends on VIDEO_MAX9271_SERIALIZER || !VIDEO_MAX9271_SERIALIZER
> > > > > >
> > > > > > As select should do the right thing in this case, ensuring that MAX9271
> > > > > > will be builtin either if RDACM20 or RDACM21 is builtin.  
> > > > >
> > > > > I also vote for usage of "select".
> > > > >  
> > > >
> > > > I would prefer that too, I was concerned about possible un-met
> > > > dependencies, as Sakari pointed out, but the current situation is no
> > > > better, as the only Kconfig symbols where those can be listed are the
> > > > camera modules one.  
> > >
> > > Works for me. I'll make a patch for it.  
> >
> > Hmm... after taking a deeper look at the rcma20 drivers, and on its
> > Kconfig help text:
> >
> > 	config VIDEO_RDACM20
> > 		tristate "IMI RDACM20 camera support"
> > 		select V4L2_FWNODE
> > 		select VIDEO_V4L2_SUBDEV_API
> > 		select MEDIA_CONTROLLER
> > 		help
> > 		  This driver supports the IMI RDACM20 GMSL camera, used in
> > 		  ADAS systems.
> >
> > 		  This camera should be used in conjunction with a GMSL
> > 		  deserialiser such as the MAX9286.
> >
> > I'm starting to suspect that there's something very wrong here...
> >
> > The help text mentions the MAX9286 driver, which is a complete
> > driver, and not MAX9271, which seems to implement a set of PHY functions
> > needed by those drivers, and which lacks a proper I2C binding code on it.  
> 
> What is it puzzling you here ? The fact max9286 is mentioned ?
> Maybe it is not clear but the max9286 and max9271 are, respectively,
> the deserializer and serializers chips that form a GMSL link.
> 
> Camera modules usually embed an image sensor (plus a variety of
> ISP/uControllers for internal image processing) whose output is
> directed to an embedded GMSL serializer (the max9271), which captures
> the image output and serializes it on the GMSL link.
> 
> On the other side of the link a GMSLa deserializer (the max9286) is
> required, to receive and interpret the GMSL signal and convert it back
> to an image stream then transmitted though a MIPI CSI-2 interface to
> the SoC.
> 
> Maybe the last statement is redundant and should not be placed in the
> camera module Kconfig description, as system integrators are of course
> aware that a deserializer is required on the other side of the link ?
> 
> >
> > The I2C binding code is, instead, inside RDACM20 and RDACM21:
> >
> > 	static int rdacm21_initialize(struct rdacm21_device *dev)
> > 	{
> > 		int ret;
> >
> > 		/* Verify communication with the MAX9271: ping to wakeup. */
> > 		dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > 		i2c_smbus_read_byte(dev->serializer.client);
> > 		usleep_range(3000, 5000);
> >
> > 		/* Enable reverse channel and disable the serial link. */
> > 		ret = max9271_set_serial_link(&dev->serializer, false);
> > 		if (ret)
> > 			return ret;
> >
> > 		/* Configure I2C bus at 105Kbps speed and configure GMSL. */
> > 		ret = max9271_configure_i2c(&dev->serializer,
> > 					    MAX9271_I2CSLVSH_469NS_234NS |
> > 					    MAX9271_I2CSLVTO_1024US |
> > 					    MAX9271_I2CMSTBT_105KBPS);
> >
> > 		/* Several other max9271-specific init code */
> >
> > 		ret = ov490_initialize(dev);
> > 		if (ret)
> > 			return ret;
> >
> > And, at max9271 "driver", there's just a bunch of exported functions.
> >  
> 
> max9271 is a library module that provides functions for other drivers to use.
> The MAX9271 chip alone has no actual use, as it is usually embedded in
> a camera module with an image sensor (and other chips).

I'm not discussing what the driver does. The point the max9271
should be turned into a real driver. I fail to see any reason why
it is code is currently turned into a bad hack, where all max9271
specific initialization is outside its driver (and duplicated on
two separate drivers).

Btw the max9286 driver does that:

	static struct i2c_driver max9286_i2c_driver = {
		.driver	= {
			.name		= "max9286",
			.of_match_table	= of_match_ptr(max9286_dt_ids),
		},
		.probe_new	= max9286_probe,
		.remove		= max9286_remove,
	};

	module_i2c_driver(max9286_i2c_driver);

In other words, it has its own .probe_new/.remove methods.

The max9271 has its probing method inside rdacm21_initialize()
and rdacm20_initialize().

You should, instead, move the max9271 probe/init code into
a max9271_probe function, and use module_i2c_driver().

Then, use i2c_new_client_device[1] at the camera drivers, checking if
the driver was properly loaded, returning an error if not.

[1] or one of the other alternative ways to probe/bind an i2c device,
    like using the v4l2 helper function v4l2_i2c_new_subdev().

Thanks,
Mauro
