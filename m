Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC661E1D36
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 10:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgEZIYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 04:24:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:60986 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727879AbgEZIYX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 04:24:23 -0400
IronPort-SDR: JRnmDR+uMreddcjcxdIaWj6QYU6eh3gN0pZ3R/WvvSSu9cGRqQ8w2Q45xi1WZGIg7m60T1aZC3
 8fgMAY+GWn9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 01:23:52 -0700
IronPort-SDR: lii2J4O9tOMqeHsnipIK9Q486sYLkPdX8qWM7J1Mxst5MY166glqwt4ML928L/Mdlx++ONYbKp
 5l8/lEgkMuPQ==
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; 
   d="scan'208";a="255100958"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 01:23:51 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 78DEC208B5; Tue, 26 May 2020 11:23:48 +0300 (EEST)
Date:   Tue, 26 May 2020 11:23:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        bingbu.cao@intel.com, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/1] Documentation: media: Document how to write camera
 sensor drivers
Message-ID: <20200526082348.GL7618@paasikivi.fi.intel.com>
References: <20200512105914.9948-1-sakari.ailus@linux.intel.com>
 <20200520000130.GJ3820@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520000130.GJ3820@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the comments.

On Wed, May 20, 2020 at 03:01:30AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, May 12, 2020 at 01:59:14PM +0300, Sakari Ailus wrote:
> > While we have had some example drivers, there has been up to date no
> > formal documentation on how camera sensor drivers should be written; what
> > are the practices, why, and where they apply.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > The HTML documentation can be found here:
> > 
> > <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/doc/output/driver-api/media/camera-sensor.html>
> > 
> >  .../driver-api/media/camera-sensor.rst        | 98 +++++++++++++++++++
> >  Documentation/driver-api/media/csi2.rst       |  2 +
> >  Documentation/driver-api/media/index.rst      |  1 +
> >  3 files changed, 101 insertions(+)
> >  create mode 100644 Documentation/driver-api/media/camera-sensor.rst
> > 
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > new file mode 100644
> > index 000000000000..345e3ae30340
> > --- /dev/null
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -0,0 +1,98 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Writing camera sensor drivers
> > +=============================
> > +
> > +CSI-2
> > +-----
> > +
> > +Please see what is written on :ref:`MIPI_CSI_2`.
> 
> That document mentions:
> 
>   CSI-2 transmitter, such as a sensor or a TV tuner, drivers need to
>   provide the CSI-2 receiver with information on the CSI-2 bus
>   configuration. These include the V4L2_CID_LINK_FREQ and
>   V4L2_CID_PIXEL_RATE controls and
>   (:c:type:`v4l2_subdev_video_ops`->s_stream() callback). These
>   interface elements must be present on the sub-device represents the
>   CSI-2 transmitter.
>   
>   The V4L2_CID_LINK_FREQ control is used to tell the receiver driver the
>   frequency (and not the symbol rate) of the link. The
>   V4L2_CID_PIXEL_RATE is may be used by the receiver to obtain the pixel
>   rate the transmitter uses. The
>   :c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
>   ability to start and stop the stream.
> 
> Is that still up to date ? I thought V4L2_CID_LINK_FREQ was meant for
> userspace to pick a frequency, and CSI-2 receivers were expected to use
> the V4L2_CID_PIXEL_RATE control only to query the transmitter's rate.

Good question. I think it is up-to-date.

The ipu3-cio2 driver uses the LINK_FREQ control, that's what most CSI-2
receiver drivers are interested in. I guess it could use PIXEL_RATE, too.
Using either would probably make sense, and there seems to be a single
sensor driver using LINK_FREQ that does not implement PIXEL_RATE.

That's a separate issue though, I can send a patch soonish. Ping me if I
forget.

> 
> > +
> > +Handling clocks
> > +---------------
> > +
> > +Camera sensors have an internal clock tree including a PLL and a number of
> > +divisors. The clock tree is generally configured by the driver based on a few
> > +input parameters that are specific to the hardware:: the external clock frequency
> > +and the link frequency. The two parameters generally are obtained from system
> > +firmware. No other frequencies should be used in any circumstances.
> 
> Does the last sentence try to explain that drivers shall not pick values
> for the input clock frequency and the link frequency other than the ones
> obtained from the firmware ? I had initially interpreted it as meaning
> no other parameters than those two frequencies shall be used to
> configure the clock tree. It should be rephrased to make it clearer.
> 
> Another issue is that you mention the two frequencies are *generally*
> obtained from the firmware, and then state that no other values may be
> used, but you don't explain what should be done when the values are not
> provided by the firmware in the non-general case.

That is actually explained below. I'll see if some of the below text could
be used.

The problem is that the driver does not know in what kind of a system the
device may be used in, and whether random frequencies would be workable
there or not. Also some drivers in practice currently need a set of
frequencies to work with, rather than a range.

Using higher link frequencies than specified in firmware would also bring a
new problem: the sensor driver might configure the transmitter at a
frequency (or data rate) the receiver does not support. This would also
need to be solved for any frequency to work.

In principle we could also add a frequency range to firmware, using a
different property. I'm not sure what the gain from that would be though.

> 
> > +
> > +The reason why the clock frequencies are so important is that the clock signals
> > +come out of the SoC, and in many cases a specific frequency is designed to be
> 
> The clock input to the sensor doesn't always come out of the SoC. Do you
> really mean the sensor input clock here, or should the text talk about
> the sensor output clock instead ? The main source of electro-magnetic
> emissions will be the sensor output, not its input.

Probably so, but the former is affected by the latter. How about:

The reason why the clock frequencies are so important is that the clock
signals may travel long distances on the PCB, and in many cases only a
specific frequency is known not to cause interference.

> 
> > +used in the system. Using another frequency may cause harmful effects
> > +elsewhere. Therefore only the pre-determined frequencies are configurable by the
> > +user.
> > +
> > +Frame size
> > +----------
> > +
> > +There are two distinct ways to configure the frame size produced by camera
> > +sensors.
> > +
> > +Freely configurable camera sensor drivers
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Freely configurable camera sensor drivers expose the device's internal
> > +processing pipeline as one or more sub-devices with different cropping and
> > +scaling configurations. The output size of the device is the result of a series
> > +of cropping and scaling operations from the device's pixel array's size.
> > +
> > +An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
> > +
> > +Register list based drivers
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Register list based drivers generally, instead of able to configure the device
> 
> s/able/being able/

Yes.

> 
> What's the non-general case here ?

There could be (and are) drivers that are only partially based on register
lists.

> 
> > +they control based on user requests, are limited to a number of preset
> > +configurations that combine a number of different parameters that on hardware
> > +level are independent. How a driver picks such configuration is based on the
> 
> The parameters are usually not independent, as they are usually
> expressed in registers as sizes, and thus depend on the previous
> pipeline stages. This should be rephrased.

Their value range does depend on previous processing steps but the
configuration of the consecutive processing steps is still independent;
configuring one does not require a particular configuration on the other.
In that sense they are independent.

> 
> > +format set on a source pad at the end of the device's internal pipeline.
> > +
> > +Most sensor drivers are implemented this way, see e.g. 
> > +drivers/media/i2c/imx319.c for an example.
> > +
> > +Frame interval configuration
> > +----------------------------
> > +
> > +There are two different methods for obtaining possibilities for different frame
> > +intervals as well as configuring the frame interval. Which one to implement
> > +depends on the type of the device.
> > +
> > +Raw camera sensors
> > +~~~~~~~~~~~~~~~~~~
> 
> This isn't limited to raw sensors.

I guess there's a class of devices that contain an ISP but still expose the
raw timing values to the driver.

How about:

"Raw camera sensors and other devices with close to hardware control parameters"

> 
> > +
> > +Instead of a high level parameter such as frame interval, the frame interval is
> 
> Drop "Instead of a high level parameter such as frame interval, ".

Ack.

> 
> > +a result of the configuration of a number of camera sensor implementation
> > +specific parameters. Luckily, these parameters tend to be the same for more or
> > +less all modern raw camera sensors.
> 
> Drop "luckily".

Hmm. I think it probably should be there but I can remove it, too.

> 
> > +
> > +The frame interval is calculated using the following equation::
> > +
> > +	frame interval = (analogue crop width + horizontal blanking) *
> > +			 (analogue crop height + vertical blanking) / pixel rate
> > +
> > +The formula is bus independent and is applicable for raw timing parameters on
> > +large variety of devices beyond camera sensors. Devices that have no analogue
> > +crop, use the full source image size, i.e. pixel array size.
> 
> s/crop, /crop /

Yes.

> 
> > +
> > +Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > +``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
> > +pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
> > +unit of that control is Hz.
> 
> I think you should turn this text around, it's not very clear for
> someone who doesn't have lots of background in this field. It would be
> better to explain that
> 
> - sensors perform pixel sampling and scanning out with a fixed rate
> - each frame is scanned out line by line, with a line comprising active
>   image data and blanking
> - blanking lines also occur at the end of the frame
> - the frame rate is thus the result of the h/v total and pixel rate
> - the active period is the result of analog crop configuration, and the
>   h/v blanking are then added with fixed or variable values depending on
>   the sensor
> - the frame rate for a given analog crop can thus be influenced by the
>   amount of h/v blanking.
> 
> That's a more logical flow I believe, explaining how sensors work and
> then explaining how the frame rate derives from that.

I don't question the usefulness of such documentation, but note this is
driver API documentation. I think such description would be better placed
in uAPI documentation.

I actually wonder whether much of the above would be better placed there.
We have some bits of this in the control documentation but it assumes some
knowledge of the camera sensors.

> 
> > +
> > +Register list based drivers need to implement read-only sub-device nodes for the
> > +purpose. Devices that are not register list based need these to configure the
> 
> What is "the purpose" ?

How about adding: " of conveying this information to the user space".

> 
> > +device's internal processing pipeline.
> > +
> > +The first entity in the linear pipeline is the pixel array. The pixel array may
> > +be followed by other entities that are there to allow configuring binning,
> > +skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
> 
> I think this should be split to a different section about sensor
> pipelines.
> 
> > +
> > +USB cameras etc. devices
> > +~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +USB video class hardware, as well as many cameras offering a higher level
> > +control interface, generally use the concept of frame interval (or frame rate)
> > +on the level of device hardware interface. This means lower level controls
> > +exposed by raw cameras may not be used as an interface to control the frame
> > +interval on these devices.
> 
> It's not limited to these devices, it's also applicable to some camera
> sensors that include an ISP, they can expose a frame interval/rate
> control. As this file is named camera-sensor.rst, I think we should talk
> about those. It's then typical for the analog crop and blanking to be
> manually controllable when AEC is disabled, and for the AEC to take a
> frame interval/rate parameter (or min/max values thereof).

That's why the "etc." is there. :-) But perhaps it could be expressed
better. How about:

USB cameras and other devices using frame interval natively~

> 
> Should this also explain what APIs should be exposed by sensor drivers
> in that case ?

Probably yes.

-- 
Sakari Ailus
