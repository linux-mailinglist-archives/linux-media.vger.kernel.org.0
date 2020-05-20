Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8781DA638
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 02:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgETALW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 20:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgETALW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 20:11:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F412FC061A0E
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 17:11:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6420A30C;
        Wed, 20 May 2020 02:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589933480;
        bh=PISQbl/pnuiIppEeRdvN3MEQ0rLy6hwY9qNp8h4R7tY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qFBvNJC9HNVfplcrKTjPQdMBmDd4TclivEENa/Bk6rCUDUag7j+gxC/uYCeWfcdv7
         csmgISAxHZkFeKkqDZA0IsSuS7it/hxucuzDbWgrepROL/mDkqbIkAO+sjk8Co4z6/
         sfiDuJjJgbVkDj2/Qksjz8bWVbJmzNvlpEgbJLPA=
Date:   Wed, 20 May 2020 03:11:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/1] Documentation: media: Document how to write
 camera sensor drivers
Message-ID: <20200520001108.GK3820@pendragon.ideasonboard.com>
References: <20200519085250.32318-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200519085250.32318-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, May 19, 2020 at 11:52:50AM +0300, Sakari Ailus wrote:
> While we have had some example drivers, there has been up to date no
> formal documentation on how camera sensor drivers should be written; what
> are the practices, why, and where they apply.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Added power management documentation.

I've reviewed v1, and most of the comments still apply. I'll comment on
the new section below.

> 
> The HTML docs are here:
> 
> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/doc2/output/>
> 
>  .../driver-api/media/camera-sensor.rst        | 129 ++++++++++++++++++
>  Documentation/driver-api/media/csi2.rst       |   2 +
>  Documentation/driver-api/media/index.rst      |   1 +
>  3 files changed, 132 insertions(+)
>  create mode 100644 Documentation/driver-api/media/camera-sensor.rst
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> new file mode 100644
> index 000000000000..fa71f07731a0
> --- /dev/null
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -0,0 +1,129 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Writing camera sensor drivers
> +=============================
> +
> +CSI-2
> +-----
> +
> +Please see what is written on :ref:`MIPI_CSI_2`.
> +
> +Handling clocks
> +---------------
> +
> +Camera sensors have an internal clock tree including a PLL and a number of
> +divisors. The clock tree is generally configured by the driver based on a few
> +input parameters that are specific to the hardware:: the external clock frequency
> +and the link frequency. The two parameters generally are obtained from system
> +firmware. No other frequencies should be used in any circumstances.
> +
> +The reason why the clock frequencies are so important is that the clock signals
> +come out of the SoC, and in many cases a specific frequency is designed to be
> +used in the system. Using another frequency may cause harmful effects
> +elsewhere. Therefore only the pre-determined frequencies are configurable by the
> +user.
> +
> +Frame size
> +----------
> +
> +There are two distinct ways to configure the frame size produced by camera
> +sensors.
> +
> +Freely configurable camera sensor drivers
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Freely configurable camera sensor drivers expose the device's internal
> +processing pipeline as one or more sub-devices with different cropping and
> +scaling configurations. The output size of the device is the result of a series
> +of cropping and scaling operations from the device's pixel array's size.
> +
> +An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
> +
> +Register list based drivers
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Register list based drivers generally, instead of able to configure the device
> +they control based on user requests, are limited to a number of preset
> +configurations that combine a number of different parameters that on hardware
> +level are independent. How a driver picks such configuration is based on the
> +format set on a source pad at the end of the device's internal pipeline.
> +
> +Most sensor drivers are implemented this way, see e.g.
> +drivers/media/i2c/imx319.c for an example.
> +
> +Frame interval configuration
> +----------------------------
> +
> +There are two different methods for obtaining possibilities for different frame
> +intervals as well as configuring the frame interval. Which one to implement
> +depends on the type of the device.
> +
> +Raw camera sensors
> +~~~~~~~~~~~~~~~~~~
> +
> +Instead of a high level parameter such as frame interval, the frame interval is
> +a result of the configuration of a number of camera sensor implementation
> +specific parameters. Luckily, these parameters tend to be the same for more or
> +less all modern raw camera sensors.
> +
> +The frame interval is calculated using the following equation::
> +
> +	frame interval = (analogue crop width + horizontal blanking) *
> +			 (analogue crop height + vertical blanking) / pixel rate
> +
> +The formula is bus independent and is applicable for raw timing parameters on
> +large variety of devices beyond camera sensors. Devices that have no analogue
> +crop, use the full source image size, i.e. pixel array size.
> +
> +Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> +``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
> +pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
> +unit of that control is Hz.
> +
> +Register list based drivers need to implement read-only sub-device nodes for the
> +purpose. Devices that are not register list based need these to configure the
> +device's internal processing pipeline.
> +
> +The first entity in the linear pipeline is the pixel array. The pixel array may
> +be followed by other entities that are there to allow configuring binning,
> +skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
> +
> +USB cameras etc. devices
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +USB video class hardware, as well as many cameras offering a higher level
> +control interface, generally use the concept of frame interval (or frame rate)
> +on the level of device hardware interface. This means lower level controls
> +exposed by raw cameras may not be used as an interface to control the frame
> +interval on these devices.
> +
> +Power management
> +----------------
> +
> +Always use runtime PM to manage the power states of your device.
> +
> +Existing camera sensor drivers may rely on the old
> +:c:type:`v4l2_subdev_core_ops`->s_power() callback for bridge or ISP drivers to
> +manage their power state. This is however **deprecated**. If you feel you need
> +to begin calling an s_power from an ISP or a bridge driver, instead please add
> +runtime PM support to the sensor driver you are using. Likewise, new drivers
> +should not use s_power.

This should explain how runtime PM should be used. .s_power() provides
an explicit API to control power of the sensor. From a sensor driver
point of view, one may wonder when to call pm_runtime_get(_sync)() and
pm_runtime_put(_sync)() if there's no explicit operation. From a
receiver point of view, one may wonder how to control the sensor power
state. I'm pretty sure someone could try to call the runtime PM get/put
functions on the struct device corresponding to the sensor from an ISP
driver. To avoid that, this section needs to explain why explicit power
management from the ISP side is not needed.

> +
> +Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
> +``drivers/media/i2c/smiapp/smiapp-core.c``. The two drivers work in both ACPI
> +and DT based systems.
> +
> +Control framework
> +~~~~~~~~~~~~~~~~~
> +
> +``v4l2_ctrl_handler_setup()`` function may not be used in the device's runtime PM
> +``resume`` callback currently, as it has no way to figure out the power state of
> +the device. As callback is required to figure out the device's power state, it
> +can only know when the device is fully powered. This can be done using

I don't understand the previous sentence.

> +
> +.. c:function::
> +	int pm_runtime_get_if_in_use(struct device *dev);
> +
> +The function returns a non-zero value if it succeeded getting the power count or
> +runtime PM was disabled, in either of which cases the driver may proceed to
> +access the device.

This requires more explanation too, it's not clear to me.

> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> index e111ff7bfd3d..da8b356389f0 100644
> --- a/Documentation/driver-api/media/csi2.rst
> +++ b/Documentation/driver-api/media/csi2.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> +.. _MIPI_CSI_2:
> +
>  MIPI CSI-2
>  ==========
>  
> diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
> index 328350924853..c140692454b1 100644
> --- a/Documentation/driver-api/media/index.rst
> +++ b/Documentation/driver-api/media/index.rst
> @@ -34,6 +34,7 @@ Please see:
>      mc-core
>      cec-core
>      csi2
> +    camera-sensor
>  
>      drivers/index
>  

-- 
Regards,

Laurent Pinchart
