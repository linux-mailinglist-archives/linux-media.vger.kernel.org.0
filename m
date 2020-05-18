Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2A71D754B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 12:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgERKfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 06:35:36 -0400
Received: from mga01.intel.com ([192.55.52.88]:49077 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726180AbgERKfg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 06:35:36 -0400
IronPort-SDR: 5/apjnpVWQ17mhsleyp2lOciqFIQLhmq3Gs3ojd68i6AM3rDRETgDuL6lvM5KwBZjham+4XPI9
 obfRsFVZAWwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 03:35:31 -0700
IronPort-SDR: OUWCbgipT/1/d7pXb1RM1/XiQxYEaunvRRCFfvBQYvf3hM+aYYiLRDJcfb+aQ4laZ+k7dBgNlV
 vs6AXreEbL4A==
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; 
   d="scan'208";a="373345144"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 03:35:27 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 024CD20D04; Mon, 18 May 2020 13:35:24 +0300 (EEST)
Date:   Mon, 18 May 2020 13:35:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        bingbu.cao@intel.com, Maxime Ripard <maxime@cerno.tech>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH 1/1] Documentation: media: Document how to write camera
 sensor drivers
Message-ID: <20200518103524.GB20066@paasikivi.fi.intel.com>
References: <20200512105914.9948-1-sakari.ailus@linux.intel.com>
 <ab436563-9b22-ee4d-5c96-84857720f2f7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab436563-9b22-ee4d-5c96-84857720f2f7@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the review.

On Mon, May 18, 2020 at 11:50:34AM +0200, Hans Verkuil wrote:
> On 12/05/2020 12:59, Sakari Ailus wrote:
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
> > +
> > +Handling clocks
> > +---------------
> > +
> > +Camera sensors have an internal clock tree including a PLL and a number of
> > +divisors. The clock tree is generally configured by the driver based on a few
> > +input parameters that are specific to the hardware:: the external clock frequency
> > +and the link frequency. The two parameters generally are obtained from system
> > +firmware. No other frequencies should be used in any circumstances.
> > +
> > +The reason why the clock frequencies are so important is that the clock signals
> > +come out of the SoC, and in many cases a specific frequency is designed to be
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
> > +they control based on user requests, are limited to a number of preset
> > +configurations that combine a number of different parameters that on hardware
> > +level are independent. How a driver picks such configuration is based on the
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
> > +
> > +Instead of a high level parameter such as frame interval, the frame interval is
> > +a result of the configuration of a number of camera sensor implementation
> > +specific parameters. Luckily, these parameters tend to be the same for more or
> > +less all modern raw camera sensors.
> > +
> > +The frame interval is calculated using the following equation::
> > +
> > +	frame interval = (analogue crop width + horizontal blanking) *
> > +			 (analogue crop height + vertical blanking) / pixel rate
> > +
> > +The formula is bus independent and is applicable for raw timing parameters on
> > +large variety of devices beyond camera sensors. Devices that have no analogue
> > +crop, use the full source image size, i.e. pixel array size.
> > +
> > +Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > +``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
> > +pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
> > +unit of that control is Hz.
> > +
> > +Register list based drivers need to implement read-only sub-device nodes for the
> > +purpose. Devices that are not register list based need these to configure the
> > +device's internal processing pipeline.
> > +
> > +The first entity in the linear pipeline is the pixel array. The pixel array may
> > +be followed by other entities that are there to allow configuring binning,
> > +skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
> > +
> > +USB cameras etc. devices
> > +~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +USB video class hardware, as well as many cameras offering a higher level
> > +control interface, generally use the concept of frame interval (or frame rate)
> > +on the level of device hardware interface. This means lower level controls
> > +exposed by raw cameras may not be used as an interface to control the frame
> > +interval on these devices.
> > diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> > index e111ff7bfd3d..da8b356389f0 100644
> > --- a/Documentation/driver-api/media/csi2.rst
> > +++ b/Documentation/driver-api/media/csi2.rst
> > @@ -1,5 +1,7 @@
> >  .. SPDX-License-Identifier: GPL-2.0
> >  
> > +.. _MIPI_CSI_2:
> > +
> >  MIPI CSI-2
> >  ==========
> >  
> > diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
> > index 328350924853..c140692454b1 100644
> > --- a/Documentation/driver-api/media/index.rst
> > +++ b/Documentation/driver-api/media/index.rst
> > @@ -34,6 +34,7 @@ Please see:
> >      mc-core
> >      cec-core
> >      csi2
> > +    camera-sensor
> >  
> >      drivers/index
> >  
> > 
> 
> Can you add a section on power management? I've CC-ed Sowjanya as well, since she
> had some questions about that (off-line), and I don't know the answer on the right
> way to handle power management for sensors.

Sure. There's nothing special in here per se, but given the history and
interaction with the control framework it's worth documenting that
separately. Many drivers are also being used on both ACPI and DT that makes
the drivers somewhat more convoluted.

-- 
Kind regards,

Sakari Ailus
