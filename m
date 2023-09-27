Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5537B0EDA
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 00:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjI0WXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 18:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjI0WXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 18:23:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35731AF
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 15:22:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (176-132-227-79.abo.bbox.fr [176.132.227.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9F05DFB;
        Thu, 28 Sep 2023 00:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695853273;
        bh=/wldjJzHYGc/TQv6UPQAFUTK7DO/r9zGMCYE6QWmTCU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m1jo0rXbAyhNgjANyg4eXvonr4UPwE1ycfnIP0rOePoItOFnDvBu0Esd/g/gIQGKR
         XLc+UFD5sOXtG8GEN77SdO4dHId1krjLH4j8TCKAbEIUpfT4+HhiMZC02S/QVDxWcm
         Cw4FeMmJxRcM4wyu62GXvFaFsgNEbhWONMTSV+GY=
Date:   Thu, 28 Sep 2023 01:23:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: Documentation: Split camera sensor
 documentation
Message-ID: <20230927222305.GW5854@pendragon.ideasonboard.com>
References: <20230927115816.392215-1-sakari.ailus@linux.intel.com>
 <20230927122620.GA21444@pendragon.ideasonboard.com>
 <ZRQnzNUsvKIUdIN1@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZRQnzNUsvKIUdIN1@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Sep 27, 2023 at 01:02:04PM +0000, Sakari Ailus wrote:
> On Wed, Sep 27, 2023 at 03:26:20PM +0300, Laurent Pinchart wrote:
> > On Wed, Sep 27, 2023 at 02:58:16PM +0300, Sakari Ailus wrote:
> > > Split camera sensor documentation into user and kernel portions. This
> > > should make it easier for the user space developers to find the relevant
> > > documentation.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../driver-api/media/camera-sensor.rst        | 129 +++++-------------
> > >  .../media/drivers/camera-sensor.rst           | 104 ++++++++++++++
> > >  .../userspace-api/media/drivers/index.rst     |   1 +
> > >  .../userspace-api/media/v4l/control.rst       |   4 +
> > >  4 files changed, 145 insertions(+), 93 deletions(-)
> > >  create mode 100644 Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > 
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > index 2acc08142a1a..6e5c3b16161e 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -1,8 +1,12 @@
> > >  .. SPDX-License-Identifier: GPL-2.0
> > >  
> > > +.. _media_writing_camera_sensor_drivers:
> > > +
> > >  Writing camera sensor drivers
> > >  =============================
> > >  
> > > +Please also see :ref:`media_using_camera_sensor_drivers`.
> > 
> > Let's mention why:
> > 
> > This document covers the in-kernel APIs only. For the best practices on
> > userspace API implementation in camera sensor drivers, please see
> > :ref:`media_using_camera_sensor_drivers`.
> 
> I'll add that.
> 
> > 
> > > +
> > >  CSI-2 and parallel (BT.601 and BT.656) busses
> > >  ---------------------------------------------
> > >  
> > > @@ -34,7 +38,8 @@ Devicetree
> > >  
> > >  The preferred way to achieve this is using ``assigned-clocks``,
> > >  ``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See the
> > > -`clock device tree bindings <https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml>`_
> > > +`clock device tree bindings
> > > +<https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml>`_
> > >  for more information. The driver then gets the frequency using
> > >  ``clk_get_rate()``.
> > >  
> > > @@ -85,9 +90,7 @@ PM instead. If you feel you need to begin calling ``.s_power()`` from an ISP or
> > >  a bridge driver, instead add runtime PM support to the sensor driver you are
> > >  using and drop its ``.s_power()`` handler.
> > >  
> > > -See examples of runtime PM handling in e.g. ``drivers/media/i2c/ov8856.c`` and
> > > -``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI and DT
> > > -based systems.
> > > +Please also see :ref:`examples <media-camera-sensor-examples>`.
> > >  
> > >  Control framework
> > >  ~~~~~~~~~~~~~~~~~
> > > @@ -104,99 +107,39 @@ The function returns a non-zero value if it succeeded getting the power count or
> > >  runtime PM was disabled, in either of which cases the driver may proceed to
> > >  access the device.
> > >  
> > > -Frame size
> > > -----------
> > > -
> > > -There are two distinct ways to configure the frame size produced by camera
> > > -sensors.
> > > -
> > > -Freely configurable camera sensor drivers
> > > -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > -
> > > -Freely configurable camera sensor drivers expose the device's internal
> > > -processing pipeline as one or more sub-devices with different cropping and
> > > -scaling configurations. The output size of the device is the result of a series
> > > -of cropping and scaling operations from the device's pixel array's size.
> > > -
> > > -An example of such a driver is the CCS driver (see ``drivers/media/i2c/ccs``).
> > > -
> > > -Register list based drivers
> > > -~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > -
> > > -Register list based drivers generally, instead of able to configure the device
> > > -they control based on user requests, are limited to a number of preset
> > > -configurations that combine a number of different parameters that on hardware
> > > -level are independent. How a driver picks such configuration is based on the
> > > -format set on a source pad at the end of the device's internal pipeline.
> > > -
> > > -Most sensor drivers are implemented this way, see e.g.
> > > -``drivers/media/i2c/imx319.c`` for an example.
> > > -
> > > -Frame interval configuration
> > > -----------------------------
> > > -
> > > -There are two different methods for obtaining possibilities for different frame
> > > -intervals as well as configuring the frame interval. Which one to implement
> > > -depends on the type of the device.
> > > -
> > > -Raw camera sensors
> > > -~~~~~~~~~~~~~~~~~~
> > > -
> > > -Instead of a high level parameter such as frame interval, the frame interval is
> > > -a result of the configuration of a number of camera sensor implementation
> > > -specific parameters. Luckily, these parameters tend to be the same for more or
> > > -less all modern raw camera sensors.
> > > -
> > > -The frame interval is calculated using the following equation::
> > > -
> > > -	frame interval = (analogue crop width + horizontal blanking) *
> > > -			 (analogue crop height + vertical blanking) / pixel rate
> > > -
> > > -The formula is bus independent and is applicable for raw timing parameters on
> > > -large variety of devices beyond camera sensors. Devices that have no analogue
> > > -crop, use the full source image size, i.e. pixel array size.
> > > -
> > > -Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > > -``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> > > -is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> > > -the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> > > -sub-device. The unit of that control is pixels per second.
> > > -
> > > -Register list based drivers need to implement read-only sub-device nodes for the
> > > -purpose. Devices that are not register list based need these to configure the
> > > -device's internal processing pipeline.
> > > -
> > > -The first entity in the linear pipeline is the pixel array. The pixel array may
> > > -be followed by other entities that are there to allow configuring binning,
> > > -skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
> > > -
> > > -USB cameras etc. devices
> > > -~~~~~~~~~~~~~~~~~~~~~~~~
> > > -
> > > -USB video class hardware, as well as many cameras offering a similar higher
> > > -level interface natively, generally use the concept of frame interval (or frame
> > > -rate) on device level in firmware or hardware. This means lower level controls
> > > -implemented by raw cameras may not be used on uAPI (or even kAPI) to control the
> > > -frame interval on these devices.
> > > -
> > >  Rotation, orientation and flipping
> > >  ----------------------------------
> > >  
> > > -Some systems have the camera sensor mounted upside down compared to its natural
> > > -mounting rotation. In such cases, drivers shall expose the information to
> > > -userspace with the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
> > > -<v4l2-camera-sensor-rotation>` control.
> > > -
> > > -Sensor drivers shall also report the sensor's mounting orientation with the
> > > -:ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.
> > > -
> > >  Use ``v4l2_fwnode_device_parse()`` to obtain rotation and orientation
> > >  information from system firmware and ``v4l2_ctrl_new_fwnode_properties()`` to
> > >  register the appropriate controls.
> > >  
> > > -Sensor drivers that have any vertical or horizontal flips embedded in the
> > > -register programming sequences shall initialize the V4L2_CID_HFLIP and
> > > -V4L2_CID_VFLIP controls with the values programmed by the register sequences.
> > > -The default values of these controls shall be 0 (disabled). Especially these
> > > -controls shall not be inverted, independently of the sensor's mounting
> > > -rotation.
> > > +.. _media-camera-sensor-examples:
> > > +
> > > +Example drivers
> > > +---------------
> > > +
> > > +Features implemented by sensor drivers vary, and depending on the set of
> > > +supported features and other qualities, particular sensor drivers better serve
> > > +the purpose of an example. The following drivers are known to be good examples:
> > > +
> > > +.. flat-table:: Example sensor drivers
> > > +    :header-rows: 0
> > > +    :widths:      1 1 1 2
> > > +
> > > +    * - Driver name
> > > +      - File(s)
> > > +      - Driver type
> > > +      - Example topic
> > > +    * - CCS
> > > +      - ``drivers/media/i2c/ccs/``
> > > +      - Freely configurable
> > > +      - Power management (ACPI and DT), UAPI
> > > +    * - imx319
> > > +      - ``drivers/media/i2c/imx319.c``
> > 
> > I wonder if you meant imx219 here. imx319 doesn't seem to be a
> > particularly good example.
> 
> For power management it is: it supports DT, ACPI and probing while powered
> off. This wasn't reflected in this patch though, I'll fix it for v2.
> 
> I can add imx219 there, too, for UAPI and mode selection. Imx319 doesn't do
> that badly either.
> 
> > > +      - Register list based
> > > +      - UAPI, mode selection
> > 
> > If you meant imx219, I think power management can be listed too. And
> > soon the driver will get streams support :-)
> 
> Imx219 is lacking ACPI support.
> 
> I'll use this in v2:
> 
>     * - Driver name
>       - File(s)
>       - Driver type
>       - Example topic
>     * - CCS
>       - ``drivers/media/i2c/ccs/``
>       - Freely configurable
>       - Power management (ACPI and DT), UAPI
>     * - imx219
>       - ``drivers/media/i2c/imx219.c``
>       - Register list based
>       - Power management (DT), UAPI, mode selection
>     * - imx319
>       - ``drivers/media/i2c/imx319.c``
>       - Register list based
>       - Power management (ACPI and DT)
>     * - ov8865
>       - ``drivers/media/i2c/ov8865.c``
>       - Register list based
>       - Power management (ACPI and DT)

It's not nice for developers to have to look at different drivers and
takes bits and pieces from different places, especially if it's not
clear which bits they should take on one side and which pieces on the
other side. Ideally we should be able to collapse all thre register
list based drivers into a single entry, but I understand we can't do
that yet. Could we however list only one of the imx319 and ov8865 ?

> > > +    * - ov8865
> > > +      - ``drivers/media/i2c/ov8865.c``
> > > +      - Register list based
> > > +      - Power management (ACPI and DT)
> > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > new file mode 100644
> > > index 000000000000..18befb4ecd8d
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > 
> > I wonder if this is the best location. The documentation isn't
> > driver-specific. Still, moving it out of driver-api is an improvement,
> > we can keep improving on top.
> > 
> > In particular, I plan to add documentation on how drivers for raw
> > sensors should map the sensor configuration to subdevs, formats and
> > selection rectangles. I think this should go to
> > userspace-api/media/v4l/, not userspace-api/media/drivers/. I will thus
> > likely rework this file.
> 
> I'd put it to latter but I have no strong opinion on that. If you can find
> a good place in the former, sure.
> 
> > > @@ -0,0 +1,104 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +.. _media_using_camera_sensor_drivers:
> > > +
> > > +Using camera sensor drivers
> > > +===========================
> > > +
> > > +This section describes common practices for how the V4L2 sub-device interface is
> > > +used to control the camera sensor drivers.
> > > +
> > > +You may also find :ref:`media_writing_camera_sensor_drivers` useful.
> > > +
> > > +Frame size
> > > +----------
> > > +
> > > +There are two distinct ways to configure the frame size produced by camera
> > > +sensors.
> > > +
> > > +Freely configurable camera sensor drivers
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +Freely configurable camera sensor drivers expose the device's internal
> > > +processing pipeline as one or more sub-devices with different cropping and
> > > +scaling configurations. The output size of the device is the result of a series
> > > +of cropping and scaling operations from the device's pixel array's size.
> > > +
> > > +An example of such a driver is the CCS driver.
> > > +
> > > +Register list based drivers
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +Register list based drivers generally, instead of able to configure the device
> > > +they control based on user requests, are limited to a number of preset
> > > +configurations that combine a number of different parameters that on hardware
> > > +level are independent. How a driver picks such configuration is based on the
> > > +format set on a source pad at the end of the device's internal pipeline.
> > > +
> > > +Most sensor drivers are implemented this way.
> > > +
> > > +Frame interval configuration
> > > +----------------------------
> > > +
> > > +There are two different methods for obtaining possibilities for different frame
> > > +intervals as well as configuring the frame interval. Which one to implement
> > > +depends on the type of the device.
> > > +
> > > +Raw camera sensors
> > > +~~~~~~~~~~~~~~~~~~
> > > +
> > > +Instead of a high level parameter such as frame interval, the frame interval is
> > > +a result of the configuration of a number of camera sensor implementation
> > > +specific parameters. Luckily, these parameters tend to be the same for more or
> > > +less all modern raw camera sensors.
> > > +
> > > +The frame interval is calculated using the following equation::
> > > +
> > > +	frame interval = (analogue crop width + horizontal blanking) *
> > > +			 (analogue crop height + vertical blanking) / pixel rate
> > > +
> > > +The formula is bus independent and is applicable for raw timing parameters on
> > > +large variety of devices beyond camera sensors. Devices that have no analogue
> > > +crop, use the full source image size, i.e. pixel array size.
> > > +
> > > +Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > > +``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> > > +is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> > > +the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> > > +sub-device. The unit of that control is pixels per second.
> > > +
> > > +Register list based drivers need to implement read-only sub-device nodes for the
> > > +purpose. Devices that are not register list based need these to configure the
> > > +device's internal processing pipeline.
> > > +
> > > +The first entity in the linear pipeline is the pixel array. The pixel array may
> > > +be followed by other entities that are there to allow configuring binning,
> > > +skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
> > > +<VIDIOC_SUBDEV_G_SELECTION>`.
> > > +
> > > +USB cameras etc. devices
> > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +USB video class hardware, as well as many cameras offering a similar higher
> > > +level interface natively, generally use the concept of frame interval (or frame
> > > +rate) on device level in firmware or hardware. This means lower level controls
> > > +implemented by raw cameras may not be used on uAPI (or even kAPI) to control the
> > > +frame interval on these devices.
> > > +
> > > +Rotation, orientation and flipping
> > > +----------------------------------
> > > +
> > > +Some systems have the camera sensor mounted upside down compared to its natural
> > > +mounting rotation. In such cases, drivers shall expose the information to
> > > +userspace with the :ref:`V4L2_CID_CAMERA_SENSOR_ROTATION
> > > +<v4l2-camera-sensor-rotation>` control.
> > > +
> > > +Sensor drivers shall also report the sensor's mounting orientation with the
> > > +:ref:`V4L2_CID_CAMERA_SENSOR_ORIENTATION <v4l2-camera-sensor-orientation>`.
> > > +
> > > +Sensor drivers that have any vertical or horizontal flips embedded in the
> > > +register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
> > > +<v4l2-cid-hflip>` and :ref:`V4L2_CID_VFLIP <v4l2-cid-vflip>` controls with the
> > > +values programmed by the register sequences.  The default values of these
> > 
> > s/  / /
> > 
> > With the above comments addressed,
> 
> Yes.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> > > +controls shall be 0 (disabled). Especially these controls shall not be inverted,
> > > +independently of the sensor's mounting rotation.
> > > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> > > index 783f92f01a4c..1726f8ec86fa 100644
> > > --- a/Documentation/userspace-api/media/drivers/index.rst
> > > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > > @@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
> > >  	:numbered:
> > >  
> > >  	aspeed-video
> > > +	camera-sensor
> > >  	ccs
> > >  	cx2341x-uapi
> > >  	dw100
> > > diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> > > index 4463fce694b0..57893814a1e5 100644
> > > --- a/Documentation/userspace-api/media/v4l/control.rst
> > > +++ b/Documentation/userspace-api/media/v4l/control.rst
> > > @@ -143,9 +143,13 @@ Control IDs
> > >      recognise the difference between digital and analogue gain use
> > >      controls ``V4L2_CID_DIGITAL_GAIN`` and ``V4L2_CID_ANALOGUE_GAIN``.
> > >  
> > > +.. _v4l2-cid-hflip:
> > > +
> > >  ``V4L2_CID_HFLIP`` ``(boolean)``
> > >      Mirror the picture horizontally.
> > >  
> > > +.. _v4l2-cid-vflip:
> > > +
> > >  ``V4L2_CID_VFLIP`` ``(boolean)``
> > >      Mirror the picture vertically.
> > >  

-- 
Regards,

Laurent Pinchart
