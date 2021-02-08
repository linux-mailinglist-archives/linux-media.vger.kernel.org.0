Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67DE031359E
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 15:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhBHOug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 09:50:36 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:41701 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhBHOuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 09:50:22 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2AB7F2000E;
        Mon,  8 Feb 2021 14:49:33 +0000 (UTC)
Date:   Mon, 8 Feb 2021 15:49:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] media: i2c: fix max9271 build dependencies
Message-ID: <20210208144957.ol73vkbhkna4f2nz@uno.localdomain>
References: <20210208084147.GN32460@paasikivi.fi.intel.com>
 <20210208100822.76ca0c2e@coco.lan>
 <20210208092424.GP32460@paasikivi.fi.intel.com>
 <20210208110723.4859ddda@coco.lan>
 <YCEhVrSFpqX1Th4x@pendragon.ideasonboard.com>
 <20210208114142.skwc22xps5xiqdyo@uno.localdomain>
 <20210208141102.3d5999dd@coco.lan>
 <20210208143150.03974bca@coco.lan>
 <20210208135514.t2wymwvsehdl657m@uno.localdomain>
 <20210208151446.27862d71@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210208151446.27862d71@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Feb 08, 2021 at 03:14:46PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 8 Feb 2021 14:55:14 +0100
> Jacopo Mondi <jacopo@jmondi.org> escreveu:
>
> > Hi Mauro,
> >
> > On Mon, Feb 08, 2021 at 02:31:50PM +0100, Mauro Carvalho Chehab wrote:
> > > Em Mon, 8 Feb 2021 14:11:02 +0100
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> > >
> > > > Em Mon, 8 Feb 2021 12:41:42 +0100
> > > > Jacopo Mondi <jacopo@jmondi.org> escreveu:
> > > >
> > > > > > > If you do, instead:
> > > > > > >
> > > > > > >     if VIDEO_V4L2 && I2C
> > > > > > > 	config VIDEO_MAX9271_SERIALIZER
> > > > > > > 		tristate
> > > > > > >
> > > > > > > 	config VIDEO_RDACM20
> > > > > > > 		select VIDEO_MAX9271_SERIALIZER
> > > > > > > 		...
> > > > > > >
> > > > > > > 	config VIDEO_RDACM21
> > > > > > > 		select VIDEO_MAX9271_SERIALIZER
> > > > > > > 		...
> > > > > > >     endif
> > > > > > >
> > > > > > > Then you also won't need:
> > > > > > > 	depends on VIDEO_MAX9271_SERIALIZER || !VIDEO_MAX9271_SERIALIZER
> > > > > > >
> > > > > > > As select should do the right thing in this case, ensuring that MAX9271
> > > > > > > will be builtin either if RDACM20 or RDACM21 is builtin.
> > > > > >
> > > > > > I also vote for usage of "select".
> > > > > >
> > > > >
> > > > > I would prefer that too, I was concerned about possible un-met
> > > > > dependencies, as Sakari pointed out, but the current situation is no
> > > > > better, as the only Kconfig symbols where those can be listed are the
> > > > > camera modules one.
> > > >
> > > > Works for me. I'll make a patch for it.
> > >
> > > Hmm... after taking a deeper look at the rcma20 drivers, and on its
> > > Kconfig help text:
> > >
> > > 	config VIDEO_RDACM20
> > > 		tristate "IMI RDACM20 camera support"
> > > 		select V4L2_FWNODE
> > > 		select VIDEO_V4L2_SUBDEV_API
> > > 		select MEDIA_CONTROLLER
> > > 		help
> > > 		  This driver supports the IMI RDACM20 GMSL camera, used in
> > > 		  ADAS systems.
> > >
> > > 		  This camera should be used in conjunction with a GMSL
> > > 		  deserialiser such as the MAX9286.
> > >
> > > I'm starting to suspect that there's something very wrong here...
> > >
> > > The help text mentions the MAX9286 driver, which is a complete
> > > driver, and not MAX9271, which seems to implement a set of PHY functions
> > > needed by those drivers, and which lacks a proper I2C binding code on it.
> >
> > What is it puzzling you here ? The fact max9286 is mentioned ?
> > Maybe it is not clear but the max9286 and max9271 are, respectively,
> > the deserializer and serializers chips that form a GMSL link.
> >
> > Camera modules usually embed an image sensor (plus a variety of
> > ISP/uControllers for internal image processing) whose output is
> > directed to an embedded GMSL serializer (the max9271), which captures
> > the image output and serializes it on the GMSL link.
> >
> > On the other side of the link a GMSLa deserializer (the max9286) is
> > required, to receive and interpret the GMSL signal and convert it back
> > to an image stream then transmitted though a MIPI CSI-2 interface to
> > the SoC.
> >
> > Maybe the last statement is redundant and should not be placed in the
> > camera module Kconfig description, as system integrators are of course
> > aware that a deserializer is required on the other side of the link ?
> >
> > >
> > > The I2C binding code is, instead, inside RDACM20 and RDACM21:
> > >
> > > 	static int rdacm21_initialize(struct rdacm21_device *dev)
> > > 	{
> > > 		int ret;
> > >
> > > 		/* Verify communication with the MAX9271: ping to wakeup. */
> > > 		dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > > 		i2c_smbus_read_byte(dev->serializer.client);
> > > 		usleep_range(3000, 5000);
> > >
> > > 		/* Enable reverse channel and disable the serial link. */
> > > 		ret = max9271_set_serial_link(&dev->serializer, false);
> > > 		if (ret)
> > > 			return ret;
> > >
> > > 		/* Configure I2C bus at 105Kbps speed and configure GMSL. */
> > > 		ret = max9271_configure_i2c(&dev->serializer,
> > > 					    MAX9271_I2CSLVSH_469NS_234NS |
> > > 					    MAX9271_I2CSLVTO_1024US |
> > > 					    MAX9271_I2CMSTBT_105KBPS);
> > >
> > > 		/* Several other max9271-specific init code */
> > >
> > > 		ret = ov490_initialize(dev);
> > > 		if (ret)
> > > 			return ret;
> > >
> > > And, at max9271 "driver", there's just a bunch of exported functions.
> > >
> >
> > max9271 is a library module that provides functions for other drivers to use.
> > The MAX9271 chip alone has no actual use, as it is usually embedded in
> > a camera module with an image sensor (and other chips).
>
> I'm not discussing what the driver does. The point the max9271
> should be turned into a real driver. I fail to see any reason why
> it is code is currently turned into a bad hack, where all max9271
> specific initialization is outside its driver (and duplicated on
> two separate drivers).

No, that's not true. The -camera module- initialization uses functions
exported by the max9271 module, to configure it depending on how the
camera module is assembled. iirc the GPIO handling for the 20 and the
21 are different in example. There might be modules that require a
different configuration of the serializer video input port and such
depending on how they're wired internally. We don't want to describe,
in example, the internal parallel video port between the serializer
and the ISP and the one between the ISP and the image sensor.

The camera module has a compatible string and that's what you want
specify in your DTS, and the camera module driver once probed
initializes the embedded serializer and the image sensor and the other
chips.

I understand the disconnection and the next question: what if we have
a standalone driver for the image sensor then ? Are you going to
duplicate the code inside the camera module driver ? The thing is that
these ADAS camera modules are designed to be more or less
plug-and-play objects, which are configured to stream images with a
fixed format and with internal circuitry that configures them at power
up. There's no need for a full sensor driver as well as the max9271
code alone serves no purposes.

>
> Btw the max9286 driver does that:
>
> 	static struct i2c_driver max9286_i2c_driver = {
> 		.driver	= {
> 			.name		= "max9286",
> 			.of_match_table	= of_match_ptr(max9286_dt_ids),
> 		},
> 		.probe_new	= max9286_probe,
> 		.remove		= max9286_remove,
> 	};
>
> 	module_i2c_driver(max9286_i2c_driver);
>
> In other words, it has its own .probe_new/.remove methods.

The max9286 is a self-contained module. It has a GMSL and a CSI-2
interface. It's a bridge that connects the SoC to a camera module that
embeds a compatible serializer. It's dual its a 'GMSL camera module'
not a 'GMSL serializer' alone.

>
> The max9271 has its probing method inside rdacm21_initialize()
> and rdacm20_initialize().
>
> You should, instead, move the max9271 probe/init code into
> a max9271_probe function, and use module_i2c_driver().

I don't get what we would gain.

Conceptually to me this is like asking to separate handling of the
CSI-2 TX configuration from the imager part configuration in a sensor
driver.

The objection might be "yes but the sensor has a single i2c address".

For GMSL that's not true as we have multiple addresses 'on the other
side' of the GMSL link, but they're handled by address translation by
the serializer itself, it is conceptually more similar to a device that
register a range of i2c addresses than at three different devices.

>
> Then, use i2c_new_client_device[1] at the camera drivers, checking if
> the driver was properly loaded, returning an error if not.
>

That's how, through the instantiation of an i2c-mux on the
deserializer side we instantiate the camera module devices.

Getting to the serializer, then instantiate yet another i2c client for
the embedded ISP and embedded image sensor doesn't bring any benefit
as their configuration and run-time handling would be limited to a few
operations, you can see how thin are the camera module drivers on that
part.

Thanks
  j

> [1] or one of the other alternative ways to probe/bind an i2c device,
>     like using the v4l2 helper function v4l2_i2c_new_subdev().
>
> Thanks,
> Mauro
