Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055FB1E1D80
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 10:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731549AbgEZIkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 04:40:16 -0400
Received: from mga07.intel.com ([134.134.136.100]:28530 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbgEZIkQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 04:40:16 -0400
IronPort-SDR: y50WTqnnu3I39cCP2P8psKq4eyytQGNh3T8vIpqGUGUvqS032fNEvh4P1AatMbUJH4YCVkhmxC
 ZqjTsxt7HCCQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 01:40:13 -0700
IronPort-SDR: l2w/Hxm7VIWYWLjsENTS3NLn1pGJmwauzNAKxlAgdFxmT8EAXBWQqB3EZWZAKe5rJBWeDIH/hL
 R5nxwBEYvTHw==
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; 
   d="scan'208";a="284359365"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 01:40:12 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6BA16208B5; Tue, 26 May 2020 11:40:10 +0300 (EEST)
Date:   Tue, 26 May 2020 11:40:10 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/1] Documentation: media: Document how to write
 camera sensor drivers
Message-ID: <20200526084010.GM7618@paasikivi.fi.intel.com>
References: <20200519085250.32318-1-sakari.ailus@linux.intel.com>
 <20200520001108.GK3820@pendragon.ideasonboard.com>
 <20200520091437.GW20066@paasikivi.fi.intel.com>
 <20200520105355.GC5852@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520105355.GC5852@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, May 20, 2020 at 01:53:55PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, May 20, 2020 at 12:14:37PM +0300, Sakari Ailus wrote:
> > On Wed, May 20, 2020 at 03:11:08AM +0300, Laurent Pinchart wrote:
> > > On Tue, May 19, 2020 at 11:52:50AM +0300, Sakari Ailus wrote:
> > > > While we have had some example drivers, there has been up to date no
> > > > formal documentation on how camera sensor drivers should be written; what
> > > > are the practices, why, and where they apply.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > since v1:
> > > > 
> > > > - Added power management documentation.
> > > 
> > > I've reviewed v1, and most of the comments still apply. I'll comment on
> > > the new section below.
> > > 
> > > > 
> > > > The HTML docs are here:
> > > > 
> > > > <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/doc2/output/>
> > > > 
> > > >  .../driver-api/media/camera-sensor.rst        | 129 ++++++++++++++++++
> > > >  Documentation/driver-api/media/csi2.rst       |   2 +
> > > >  Documentation/driver-api/media/index.rst      |   1 +
> > > >  3 files changed, 132 insertions(+)
> > > >  create mode 100644 Documentation/driver-api/media/camera-sensor.rst
> > > > 
> > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > new file mode 100644
> > > > index 000000000000..fa71f07731a0
> > > > --- /dev/null
> > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > @@ -0,0 +1,129 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +Writing camera sensor drivers
> > > > +=============================
> > > > +
> > > > +CSI-2
> > > > +-----
> > > > +
> > > > +Please see what is written on :ref:`MIPI_CSI_2`.
> > > > +
> > > > +Handling clocks
> > > > +---------------
> > > > +
> > > > +Camera sensors have an internal clock tree including a PLL and a number of
> > > > +divisors. The clock tree is generally configured by the driver based on a few
> > > > +input parameters that are specific to the hardware:: the external clock frequency
> > > > +and the link frequency. The two parameters generally are obtained from system
> > > > +firmware. No other frequencies should be used in any circumstances.
> > > > +
> > > > +The reason why the clock frequencies are so important is that the clock signals
> > > > +come out of the SoC, and in many cases a specific frequency is designed to be
> > > > +used in the system. Using another frequency may cause harmful effects
> > > > +elsewhere. Therefore only the pre-determined frequencies are configurable by the
> > > > +user.
> > > > +
> > > > +Frame size
> > > > +----------
> > > > +
> > > > +There are two distinct ways to configure the frame size produced by camera
> > > > +sensors.
> > > > +
> > > > +Freely configurable camera sensor drivers
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +Freely configurable camera sensor drivers expose the device's internal
> > > > +processing pipeline as one or more sub-devices with different cropping and
> > > > +scaling configurations. The output size of the device is the result of a series
> > > > +of cropping and scaling operations from the device's pixel array's size.
> > > > +
> > > > +An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
> > > > +
> > > > +Register list based drivers
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +Register list based drivers generally, instead of able to configure the device
> > > > +they control based on user requests, are limited to a number of preset
> > > > +configurations that combine a number of different parameters that on hardware
> > > > +level are independent. How a driver picks such configuration is based on the
> > > > +format set on a source pad at the end of the device's internal pipeline.
> > > > +
> > > > +Most sensor drivers are implemented this way, see e.g.
> > > > +drivers/media/i2c/imx319.c for an example.
> > > > +
> > > > +Frame interval configuration
> > > > +----------------------------
> > > > +
> > > > +There are two different methods for obtaining possibilities for different frame
> > > > +intervals as well as configuring the frame interval. Which one to implement
> > > > +depends on the type of the device.
> > > > +
> > > > +Raw camera sensors
> > > > +~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +Instead of a high level parameter such as frame interval, the frame interval is
> > > > +a result of the configuration of a number of camera sensor implementation
> > > > +specific parameters. Luckily, these parameters tend to be the same for more or
> > > > +less all modern raw camera sensors.
> > > > +
> > > > +The frame interval is calculated using the following equation::
> > > > +
> > > > +	frame interval = (analogue crop width + horizontal blanking) *
> > > > +			 (analogue crop height + vertical blanking) / pixel rate
> > > > +
> > > > +The formula is bus independent and is applicable for raw timing parameters on
> > > > +large variety of devices beyond camera sensors. Devices that have no analogue
> > > > +crop, use the full source image size, i.e. pixel array size.
> > > > +
> > > > +Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > > > +``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
> > > > +pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
> > > > +unit of that control is Hz.
> > > > +
> > > > +Register list based drivers need to implement read-only sub-device nodes for the
> > > > +purpose. Devices that are not register list based need these to configure the
> > > > +device's internal processing pipeline.
> > > > +
> > > > +The first entity in the linear pipeline is the pixel array. The pixel array may
> > > > +be followed by other entities that are there to allow configuring binning,
> > > > +skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
> > > > +
> > > > +USB cameras etc. devices
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +USB video class hardware, as well as many cameras offering a higher level
> > > > +control interface, generally use the concept of frame interval (or frame rate)
> > > > +on the level of device hardware interface. This means lower level controls
> > > > +exposed by raw cameras may not be used as an interface to control the frame
> > > > +interval on these devices.
> > > > +
> > > > +Power management
> > > > +----------------
> > > > +
> > > > +Always use runtime PM to manage the power states of your device.
> > > > +
> > > > +Existing camera sensor drivers may rely on the old
> > > > +:c:type:`v4l2_subdev_core_ops`->s_power() callback for bridge or ISP drivers to
> > > > +manage their power state. This is however **deprecated**. If you feel you need
> > > > +to begin calling an s_power from an ISP or a bridge driver, instead please add
> > > > +runtime PM support to the sensor driver you are using. Likewise, new drivers
> > > > +should not use s_power.
> > > 
> > > This should explain how runtime PM should be used. .s_power() provides
> > > an explicit API to control power of the sensor. From a sensor driver
> > 
> > In general, how to exactly implement power management is specific to the
> > driver, and a responsibility of the driver. The sensor drivers are not
> > special in this respect.
> 
> Sure, but we're moving away from a model that is well known
> (.s_power()), how to do so needs to be explained.

I'd say runtime PM is at least as well known, also among those not familiar
with historical V4L2 subdev ops. This is also why we point to examples,
something we haven't done before, leading people pick drivers that aren't
in any great shape.

I could add where a typical camera sensor driver might use runtime PM API,
but this would be probably no better than providing an example. The most
difficult part to get right is described below in any case.

> 
> > > point of view, one may wonder when to call pm_runtime_get(_sync)() and
> > > pm_runtime_put(_sync)() if there's no explicit operation. From a
> > > receiver point of view, one may wonder how to control the sensor power
> > > state. I'm pretty sure someone could try to call the runtime PM get/put
> > > functions on the struct device corresponding to the sensor from an ISP
> > > driver. To avoid that, this section needs to explain why explicit power
> > > management from the ISP side is not needed.
> > 
> > I can add explicit note on calling runtime PM functions on other devices is
> > not allowed for this is what the s_power callback did, but this not where
> > runtime PM should be documented.
> > 
> > Runtime PM documentation could perhaps be improved but that does not belong
> > here.
> 
> Sure, but if you want to deprecate .s_power(), you need to provide
> precise guidelines on what to do instead. Just saying "use runtime PM"
> isn't enough, even I wasn't sure how to handle that.
> 
> > The examples should be helpful for driver writers.
> > 
> > > > +
> > > > +Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
> > > > +``drivers/media/i2c/smiapp/smiapp-core.c``. The two drivers work in both ACPI
> > > > +and DT based systems.
> > > > +
> > > > +Control framework
> > > > +~~~~~~~~~~~~~~~~~
> > > > +
> > > > +``v4l2_ctrl_handler_setup()`` function may not be used in the device's runtime PM
> > > > +``resume`` callback currently, as it has no way to figure out the power state of
> 
> resume or runtime_resume ?

runtime_resume, yes.

> 
> > > > +the device. As callback is required to figure out the device's power state, it
> > > > +can only know when the device is fully powered. This can be done using
> > > 
> > > I don't understand the previous sentence.
> > 
> > How about rephrasing it as:
> > 
> > 	The callback need to know the device is in ``RPM_ACTIVE`` state,
> 
> s/need/needs/

Yes.

> 
> s/the device is/if the device is/ ?

How about "whether"?

> 
> > 	and that information is only available after the resume callback
> > 	has finished.
> >
> > > > +
> > > > +.. c:function::
> > > > +	int pm_runtime_get_if_in_use(struct device *dev);
> > > > +
> > > > +The function returns a non-zero value if it succeeded getting the power count or
> > > > +runtime PM was disabled, in either of which cases the driver may proceed to
> > > > +access the device.
> > > 
> > > This requires more explanation too, it's not clear to me.
> > 
> > How about:
> > 
> > 	The function returns a non-zero value if the device is in
> > 	RPM_ACTIVE state or runtime PM is disabled. The caller is required
> > 	to put the usage_count using ``pm_runtime_put()`` or one of its
> > 	variants.
> 
> What is not clear is where to use pm_runtime_get_if_in_use(). You
> started by saying v4l2_ctrl_handler_setup() can't be used in
> .runtime_resume(), but where should it be used instead, and how does it
> relate to pm_runtime_get_if_in_use() ?

pm_runtime_get_if_in_use() returns non-zero if it acquires device's power
count. As explained above, this can only happen when the device is in
RPM_ACTIVE state, i.e. not during the runtime_resume callback.

Have you read Documentation/power/runtime_pm.rst ? It perhaps doesn't
explain a driver's role in the whole picture very clearly, but documenting
that does not belong to V4L2 documentation either.

-- 
Regards,

Sakari Ailus
