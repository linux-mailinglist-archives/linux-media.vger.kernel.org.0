Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2CD3B01C7
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 12:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhFVKxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 06:53:25 -0400
Received: from mga04.intel.com ([192.55.52.120]:61676 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhFVKxY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 06:53:24 -0400
IronPort-SDR: OMz/fRFnAv7FV0b+hnkisREnP7ePnF/6jf+R85DnGM4vld7UWyrcSsKc8lBShZTjPjnmQGfZaA
 mlXNFE5SBMJA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="205204851"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="205204851"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 03:51:07 -0700
IronPort-SDR: q1Pyrk+VbviuTplSpfIxIL45+JbCau7AiuVwHwm3w5Dm9AEm7nPBAqdiCqRnaQXqrB65DswmHo
 a2ZF8Gl2ssuQ==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="417361140"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 03:51:06 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2A6CF2036A;
        Tue, 22 Jun 2021 13:51:04 +0300 (EEST)
Date:   Tue, 22 Jun 2021 13:51:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] Documentation: media: Improve camera sensor
 documentation
Message-ID: <20210622105104.GA3@paasikivi.fi.intel.com>
References: <20210203165038.4964-1-sakari.ailus@linux.intel.com>
 <20210204103100.hnro2sh6bnuth5lu@uno.localdomain>
 <40172887-1ad3-ab8c-69b0-0ac31f16f534@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40172887-1ad3-ab8c-69b0-0ac31f16f534@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Thu, Feb 04, 2021 at 03:39:14PM +0300, Andrey Konovalov wrote:
> Hi Jacopo,
> 
> On 04.02.2021 13:31, Jacopo Mondi wrote:
> > Hi Sakari,
> > 
> > On Wed, Feb 03, 2021 at 06:50:38PM +0200, Sakari Ailus wrote:
> > > Modernise the documentation to make it more precise and update the use of
> > > pixel rate control. In particular:
> > > 
> > > - Use non-proportional font for file names, properties as well as
> > >    controls.
> > > 
> > > - The unit of the HBLANK control is pixels, not lines.
> > > 
> > > - The unit of PIXEL_RATE control is pixels per second, not Hz.
> > > 
> > > - Separate CSI-2 and parallel documentation. CSI-2 already has its own
> > >    section.
> > > 
> > > - Include all DT properties needed for assigned clocks.
> > > 
> > > - SMIA driver's new name is CCS driver.
> > > 
> > > - The PIXEL_RATE control denotes pixel rate on the pixel array on camera
> > >    sensors. Do not suggest it is used to tell the maximum pixel rate on the
> > >    bus anymore.
> > > 
> > > Fixes: e4cf8c58af75 ("media: Documentation: media: Document how to write camera sensor drivers")
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > This replaces an earlier patch here:
> > > 
> > > <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20210201093914.12994-1-sakari.ailus@linux.intel.com/>
> > > 
> > >   .../driver-api/media/camera-sensor.rst        | 47 +++++++++----------
> > >   Documentation/driver-api/media/csi2.rst       | 36 +++++++-------
> > >   2 files changed, 43 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > index 3fc378b3b269..4e2efa6e8fa1 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -8,6 +8,15 @@ CSI-2
> > > 
> > >   Please see what is written on :ref:`MIPI_CSI_2`.
> > > 
> > > +Parallel (BT.601 and BT.656)
> > > +----------------------------
> > > +
> > > +For camera sensors that are connected to a bus where transmitter and receiver
> > > +require common configuration set by drivers, such as CSI-2 or parallel (BT.601
> > > +or BT.656) bus, the ``V4L2_CID_LINK_FREQ`` control is mandatory on transmitter
> > > +drivers. Receiver drivers can use the ``V4L2_CID_LINK_FREQ`` to query the
> > > +frequency used on the bus.
> > > +
> > 
> > Is this really part of the 'Parallel.." subsection ? It describes
> > something that applies to both busses. Actually, do parallel receivers
> > need to know the pixel clock lane frequency ? Actually yes, I see
> > omap3isp/ispvideo.c using the control to validate the frequency
> > against some platform constraints.
> > 
> > So yes, this applies to both parallel and CSI-2, so I would not place
> > it in the "Parallel" section
> > 
> > >   Handling clocks
> > >   ---------------
> > > 
> > > @@ -26,15 +35,16 @@ user.
> > >   ACPI
> > >   ~~~~
> > > 
> > > -Read the "clock-frequency" _DSD property to denote the frequency. The driver can
> > > -rely on this frequency being used.
> > > +Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
> > > +can rely on this frequency being used.
> > > 
> > >   Devicetree
> > >   ~~~~~~~~~~
> > > 
> > > -The currently preferred way to achieve this is using "assigned-clock-rates"
> > > -property. See Documentation/devicetree/bindings/clock/clock-bindings.txt for
> > > -more information. The driver then gets the frequency using clk_get_rate().
> > > +The currently preferred way to achieve this is using ``assigned-clocks``,
> > > +``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See
> > > +``Documentation/devicetree/bindings/clock/clock-bindings.txt`` for more
> > > +information. The driver then gets the frequency using ``clk_get_rate()``.
> > > 
> > >   This approach has the drawback that there's no guarantee that the frequency
> > >   hasn't been modified directly or indirectly by another driver, or supported by
> > > @@ -55,7 +65,8 @@ processing pipeline as one or more sub-devices with different cropping and
> > >   scaling configurations. The output size of the device is the result of a series
> > >   of cropping and scaling operations from the device's pixel array's size.
> > > 
> > > -An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
> > > +An example of such a driver is the CCS driver (see
> > > +``drivers/media/i2c/ccs``).
> > 
> > Do you need to break the line ?
> > 
> > > 
> > >   Register list based drivers
> > >   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > @@ -67,7 +78,7 @@ level are independent. How a driver picks such configuration is based on the
> > >   format set on a source pad at the end of the device's internal pipeline.
> > > 
> > >   Most sensor drivers are implemented this way, see e.g.
> > > -drivers/media/i2c/imx319.c for an example.
> > > +``drivers/media/i2c/imx319.c`` for an example.
> > > 
> > >   Frame interval configuration
> > >   ----------------------------
> > > @@ -94,9 +105,10 @@ large variety of devices beyond camera sensors. Devices that have no analogue
> > >   crop, use the full source image size, i.e. pixel array size.
> > > 
> > >   Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > > -``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
> > > -pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
> > > -unit of that control is Hz.
> > > +``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> > > +is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> > > +the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> > > +sub-device. The unit of that control is pixels per second.
> > 
> > Awesome, having the VBLANK cotrol unit specified is good. Do we need to say
> > the unit is 'frame lines, including blankings' or is it implied ?
> > 
> > Also note that in V4L2 the EXPOSURE control has currently no unit
> > specified as well and drivers implement it differently :(

This is also because there is different hardware. The vast majority is
pixel-based though.

> > 
> > > 
> > >   Register list based drivers need to implement read-only sub-device nodes for the
> > >   purpose. Devices that are not register list based need these to configure the
> > > @@ -132,7 +144,7 @@ runtime PM support to the sensor driver you are using. Likewise, new drivers
> > >   should not use s_power.
> > > 
> > >   Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
> > > -``drivers/media/i2c/smiapp/smiapp-core.c``. The two drivers work in both ACPI
> > > +``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI
> > >   and DT based systems.
> > > 
> > >   Control framework
> > > @@ -150,16 +162,3 @@ used to obtain device's power state after the power state transition:
> > >   The function returns a non-zero value if it succeeded getting the power count or
> > >   runtime PM was disabled, in either of which cases the driver may proceed to
> > >   access the device.
> > > -
> > > -Controls
> > > ---------
> > > -
> > > -For camera sensors that are connected to a bus where transmitter and receiver
> > > -require common configuration set by drivers, such as CSI-2 or parallel (BT.601
> > > -or BT.656) bus, the ``V4L2_CID_LINK_FREQ`` control is mandatory on transmitter
> > > -drivers. Receiver drivers can use the ``V4L2_CID_LINK_FREQ`` to query the
> > > -frequency used on the bus.
> > > -
> > > -The transmitter drivers should also implement ``V4L2_CID_PIXEL_RATE`` control in
> > > -order to tell the maximum pixel rate to the receiver. This is required on raw
> > > -camera sensors.
> > > diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> > > index 11c52b0be8b8..c79df33bdeaa 100644
> > > --- a/Documentation/driver-api/media/csi2.rst
> > > +++ b/Documentation/driver-api/media/csi2.rst
> > > @@ -19,21 +19,18 @@ be used for CSI-2 interfaces.
> > >   Transmitter drivers
> > >   -------------------
> > > 
> > > -CSI-2 transmitter, such as a sensor or a TV tuner, drivers need to
> > > -provide the CSI-2 receiver with information on the CSI-2 bus
> > > -configuration. These include the V4L2_CID_LINK_FREQ and
> > > -V4L2_CID_PIXEL_RATE controls and
> > > -(:c:type:`v4l2_subdev_video_ops`->s_stream() callback). These
> > > -interface elements must be present on the sub-device represents the
> > > -CSI-2 transmitter.
> > > -
> > > -The V4L2_CID_LINK_FREQ control is used to tell the receiver driver the
> > > -frequency (and not the symbol rate) of the link. The V4L2_CID_PIXEL_RATE
> > > -control may be used by the receiver to obtain the pixel rate the transmitter
> > > -uses. The :c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
> > > -ability to start and stop the stream.
> > > -
> > > -The value of the V4L2_CID_PIXEL_RATE is calculated as follows::
> > > +CSI-2 transmitter, such as a sensor or a TV tuner, drivers need to provide the
> > 
> > CSI-2 transmitters ?
> > 
> > > +CSI-2 receiver with information on the CSI-2 bus configuration. These include
> > > +the ``V4L2_CID_LINK_FREQ`` control and
> > > +(:c:type:`v4l2_subdev_video_ops`->s_stream() callback). These interface elements
> > > +must be present on the sub-device representing the CSI-2 transmitter.
> > > +
> > > +The ``V4L2_CID_LINK_FREQ`` control is used to tell the receiver driver the
> > > +frequency (and not the symbol rate) of the link. The
> > > +:c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an ability to
> > > +start and stop the stream.
> > > +
> > > +The pixel rate on the bus is calculated as follows::
> > > 
> > >   pixel_rate = link_freq * 2 * nr_of_lanes * 16 / k / bits_per_sample
> > 
> > What's 'k' and why '* 16' ?
> 
> This is explained below (see at --->).
> 
> > Isn't the bus pixel rate simply
> > 
> >          link_freq * 2 * nr_of_lanes / bits_per_sample ?
> 
> This is correct for D-PHY only (k == 16). For C-PHY different value of k
> must be used.
> 
> > > 
> > > @@ -45,7 +42,7 @@ where
> > >      * - variable or constant
> > >        - description
> > >      * - link_freq
> > > -     - The value of the V4L2_CID_LINK_FREQ integer64 menu item.
> > > +     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
> > >      * - nr_of_lanes
> > >        - Number of data lanes used on the CSI-2 link. This can
> > >          be obtained from the OF endpoint configuration.
> > > @@ -56,6 +53,13 @@ where
> 
> The 'k' definition is here
> --->
> > >      * - k
> > >        - 16 for D-PHY and 7 for C-PHY
> > > +.. note::
> > > +
> > > +	The pixel rate calculated this way is **not** the same as the pixel rate
> > > +	on the camera sensor's pixel array, and should not be used as the value
> > > +	of the control (unless the value also matches the rate on the pixel
> > > +	array).
> > 
> > I would say
> > 
> >          The pixel rate calculated this way is **not** the same as the
> >          pixel sampling rate on the sensor's pixel matrix, but only
> >          represents the pixel transmission rate on the bus.
> 
> This sounds OK for me. Just maybe the "is **not** the same" statement
> is a bit too strong. I would say "may be **not** the same", as for most
> of the current camera sensor drivers these two rates have the same value
> (though a modification to a driver can change that any time).

I used "is **not** the same thing". That conveys they are indeed different
things, and not just different values.

I reworked the text, also unifying the parallel and CSI-2 bits where they
do not differ. I'll repost soon.

> 
> > Followed by a description of what PIXEL_RATE represents and how it
> > should be used, to make it clear the two are different.
> > 
> >          The pixel matrix sampling rate is instead used to calculate
> >          the sensor timings, in example to transform an image exposure
> >          duration from unit of lines in wall-clock time.
> > 
> > Please be aware that the controls documentation reports:
> > 
> > ``V4L2_CID_LINK_FREQ (integer menu)``
> >      Data bus frequency.
> 
> Yeah... This:
> 
> >                          Together with the media bus pixel code, bus type
> >      (clock cycles per sample), the data bus frequency defines the pixel
> >      rate (``V4L2_CID_PIXEL_RATE``) in the pixel array (or possibly
> >      elsewhere, if the device is not an image sensor).
> 
> - isn't (always) true...
> 
> > The frame rate can
> >      be calculated from the pixel clock, image width and height and
> >      horizontal and vertical blanking. While the pixel rate control may
> >      be defined elsewhere than in the subdev containing the pixel array,
> >      the frame rate cannot be obtained from that information. This is
> >      because only on the pixel array it can be assumed that the vertical
> >      and horizontal blanking information is exact: no other blanking is
> >      allowed in the pixel array. The selection of frame rate is performed
> >      by selecting the desired horizontal and vertical blanking. The unit
> >      of this control is Hz.
> > 
> > ``V4L2_CID_PIXEL_RATE (64-bit integer)``
> >      Pixel rate in the source pads of the subdev. This control is
> >      read-only and its unit is pixels / second.
> > 
> > I think these needs to be reworked to make it clear PIXEL_RATE !=
> > pixel sampling rate.
> 
> I second that.

Yes, but it deserves a new patch.

> 
> > Would you like to do so if you agree, or should I send a patch on top
> > of this one ?
> > 
> > > +
> > 
> > Thanks, much apreciated effort.
> 
> +1
> 
> Thanks,
> Andrey
> 
> > >   The transmitter drivers must, if possible, configure the CSI-2
> > >   transmitter to *LP-11 mode* whenever the transmitter is powered on but
> > >   not active, and maintain *LP-11 mode* until stream on. Only at stream
> > > --
> > > 2.29.2
> > > 

-- 
Sakari Ailus
