Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBFFB3B2A08
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 10:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhFXIOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 04:14:53 -0400
Received: from mga01.intel.com ([192.55.52.88]:50782 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231713AbhFXIOw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 04:14:52 -0400
IronPort-SDR: qcCH9VqGBbqZ3I2wjSnhY2Iic9oBfpMa1ETSeriPQSwu59hbV0TtgwtR8AbD9oN9Dopc4EdgMR
 6Pqa5BkH2DAA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="229009289"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="229009289"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 01:12:33 -0700
IronPort-SDR: SjmqeISF0EixiB3z88p4Q+AGgtct9QcYs7klLbHoTxUPLyVYgknSmMjlRnKZpQ4VpmF2QorQH9
 bUQ3Ks3G8xBw==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="454974328"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 01:12:32 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 095072036A;
        Thu, 24 Jun 2021 11:12:00 +0300 (EEST)
Date:   Thu, 24 Jun 2021 11:11:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/6] Documentation: media: Improve camera sensor
 documentation
Message-ID: <20210624081159.GJ3@paasikivi.fi.intel.com>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
 <20210622112200.13914-2-sakari.ailus@linux.intel.com>
 <20210623151101.flfbfw2crpwqkpna@uno.localdomain>
 <20210623155009.GG3@paasikivi.fi.intel.com>
 <4e0c7396-98d4-8950-691c-001de2626e37@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e0c7396-98d4-8950-691c-001de2626e37@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

Thanks for the review.

On Thu, Jun 24, 2021 at 07:50:46AM +0300, Andrey Konovalov wrote:
> Hi Sakari,
> 
> Thank you for this work.
> And thank you Jacopo for the review.
> 
> Looks fine overall; just few minor things.
> 
> On 23.06.2021 18:50, Sakari Ailus wrote:
> > Hi Jacopo,
> > 
> > Thanks for the review.
> > 
> > On Wed, Jun 23, 2021 at 05:11:01PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari,
> > >    thanks for addressing comments on v1
> > > 
> > > just a few minros, the rest looks very good!
> > > 
> > > On Tue, Jun 22, 2021 at 02:21:55PM +0300, Sakari Ailus wrote:
> > > > Modernise the documentation to make it more precise and update the use of
> > > > pixel rate control and various other changes. In particular:
> > > > 
> > > > - Use non-proportional font for file names, properties as well as
> > > >    controls.
> > > > 
> > > > - The unit of the HBLANK control is pixels, not lines.
> > > > 
> > > > - The unit of PIXEL_RATE control is pixels per second, not Hz.
> > > > 
> > > > - Merge common requirements for CSI-2 and parallel busses.
> > > > 
> > > > - Include all DT properties needed for assigned clocks.
> > > > 
> > > > - Fix referencing the link rate control.
> > > > 
> > > > - SMIA driver's new name is CCS driver.
> > > > 
> > > > - The PIXEL_RATE control denotes pixel rate on the pixel array on camera
> > > >    sensors. Do not suggest it is used to tell the maximum pixel rate on the
> > > >    bus anymore.
> > > > 
> > > > - Improve ReST syntax (plain struct and function names).
> > > > 
> > > > - Remove the suggestion to use s_power() in receiver drivers.
> > > > 
> > > > - Make MIPI website URL use HTTPS, add Wikipedia links to BT.601 and
> > > >    BT.656.
> > > > 
> > > > Fixes: e4cf8c58af75 ("media: Documentation: media: Document how to write camera sensor drivers")
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >   .../driver-api/media/camera-sensor.rst        |  45 +++----
> > > >   Documentation/driver-api/media/index.rst      |   2 +-
> > > >   .../driver-api/media/{csi2.rst => tx-rx.rst}  | 114 +++++++++++-------
> > > >   .../media/v4l/ext-ctrls-image-process.rst     |   2 +
> > > >   4 files changed, 90 insertions(+), 73 deletions(-)
> > > >   rename Documentation/driver-api/media/{csi2.rst => tx-rx.rst} (39%)
> > > > 
> > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > index 7160336aa475..c7d4891bd24e 100644
> > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > @@ -3,10 +3,10 @@
> > > >   Writing camera sensor drivers
> > > >   =============================
> > > > 
> > > > -CSI-2
> > > > ------
> > > > +CSI-2 and parallel (BT.601 and BT.656) busses
> > > > +---------------------------------------------
> > > > 
> > > > -Please see what is written on :ref:`MIPI_CSI_2`.
> > > > +Please see :ref:`transmitter-receiver`.
> > > > 
> > > >   Handling clocks
> > > >   ---------------
> > > > @@ -26,15 +26,16 @@ user.
> > > >   ACPI
> > > >   ~~~~
> > > > 
> > > > -Read the "clock-frequency" _DSD property to denote the frequency. The driver can
> > > > -rely on this frequency being used.
> > > > +Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
> > > > +can rely on this frequency being used.
> > > > 
> > > >   Devicetree
> > > >   ~~~~~~~~~~
> > > > 
> > > > -The currently preferred way to achieve this is using "assigned-clock-rates"
> > > > -property. See Documentation/devicetree/bindings/clock/clock-bindings.txt for
> > > > -more information. The driver then gets the frequency using clk_get_rate().
> > > > +The currently preferred way to achieve this is using ``assigned-clocks``,
> > > > +``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See
> > > > +``Documentation/devicetree/bindings/clock/clock-bindings.txt`` for more
> > > > +information. The driver then gets the frequency using ``clk_get_rate()``.
> > > > 
> > > >   This approach has the drawback that there's no guarantee that the frequency
> > > >   hasn't been modified directly or indirectly by another driver, or supported by
> > > > @@ -55,7 +56,7 @@ processing pipeline as one or more sub-devices with different cropping and
> > > >   scaling configurations. The output size of the device is the result of a series
> > > >   of cropping and scaling operations from the device's pixel array's size.
> > > > 
> > > > -An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
> > > > +An example of such a driver is the CCS driver (see ``drivers/media/i2c/ccs``).
> > > > 
> > > >   Register list based drivers
> > > >   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > @@ -67,7 +68,7 @@ level are independent. How a driver picks such configuration is based on the
> > > >   format set on a source pad at the end of the device's internal pipeline.
> > > > 
> > > >   Most sensor drivers are implemented this way, see e.g.
> > > > -drivers/media/i2c/imx319.c for an example.
> > > > +``drivers/media/i2c/imx319.c`` for an example.
> > > > 
> > > >   Frame interval configuration
> > > >   ----------------------------
> > > > @@ -94,9 +95,10 @@ large variety of devices beyond camera sensors. Devices that have no analogue
> > > >   crop, use the full source image size, i.e. pixel array size.
> > > > 
> > > >   Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > > > -``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
> > > > -pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
> > > > -unit of that control is Hz.
> > > > +``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> > > > +is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> > > > +the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> > > > +sub-device. The unit of that control is pixels per second.
> > > > 
> > > >   Register list based drivers need to implement read-only sub-device nodes for the
> > > >   purpose. Devices that are not register list based need these to configure the
> > > > @@ -125,14 +127,14 @@ general, the device must be powered on at least when its registers are being
> > > >   accessed and when it is streaming.
> > > > 
> > > >   Existing camera sensor drivers may rely on the old
> > > > -:c:type:`v4l2_subdev_core_ops`->s_power() callback for bridge or ISP drivers to
> > > > +struct v4l2_subdev_core_ops->s_power() callback for bridge or ISP drivers to
> > > >   manage their power state. This is however **deprecated**. If you feel you need
> > > >   to begin calling an s_power from an ISP or a bridge driver, instead please add
> > > >   runtime PM support to the sensor driver you are using. Likewise, new drivers
> > > >   should not use s_power.
> > > > 
> > > >   Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
> > > > -``drivers/media/i2c/smiapp/smiapp-core.c``. The two drivers work in both ACPI
> > > > +``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI
> > > >   and DT based systems.
> > > > 
> > > >   Control framework
> > > > @@ -149,16 +151,3 @@ used to obtain device's power state after the power state transition:
> > > >   The function returns a non-zero value if it succeeded getting the power count or
> > > >   runtime PM was disabled, in either of which cases the driver may proceed to
> > > >   access the device.
> > > > -
> > > > -Controls
> > > > ---------
> > > > -
> > > > -For camera sensors that are connected to a bus where transmitter and receiver
> > > > -require common configuration set by drivers, such as CSI-2 or parallel (BT.601
> > > > -or BT.656) bus, the ``V4L2_CID_LINK_FREQ`` control is mandatory on transmitter
> > > > -drivers. Receiver drivers can use the ``V4L2_CID_LINK_FREQ`` to query the
> > > > -frequency used on the bus.
> > > > -
> > > > -The transmitter drivers should also implement ``V4L2_CID_PIXEL_RATE`` control in
> > > > -order to tell the maximum pixel rate to the receiver. This is required on raw
> > > > -camera sensors.
> > > > diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
> > > > index 813d7db59da7..08e206567408 100644
> > > > --- a/Documentation/driver-api/media/index.rst
> > > > +++ b/Documentation/driver-api/media/index.rst
> > > > @@ -37,7 +37,7 @@ Documentation/userspace-api/media/index.rst
> > > >       rc-core
> > > >       mc-core
> > > >       cec-core
> > > > -    csi2
> > > > +    tx-rx
> > > >       camera-sensor
> > > > 
> > > >       drivers/index
> > > > diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/tx-rx.rst
> > > > similarity index 39%
> > > > rename from Documentation/driver-api/media/csi2.rst
> > > > rename to Documentation/driver-api/media/tx-rx.rst
> > > > index 11c52b0be8b8..6331f93fb249 100644
> > > > --- a/Documentation/driver-api/media/csi2.rst
> > > > +++ b/Documentation/driver-api/media/tx-rx.rst
> > > > @@ -1,39 +1,71 @@
> > > >   .. SPDX-License-Identifier: GPL-2.0
> > > > 
> > > > -.. _MIPI_CSI_2:
> > > > +.. _transmitter-receiver:
> > > > +
> > > > +Pixel data transmitter and receiver drivers
> > > > +===========================================
> > > > +
> > > > +V4L2 supports various devices that transmit and receiver pixel data. Examples of
> > > 
> > > s/and receiver/and receives/
> > 
> > "receive"; it's plural. :-)
> 
> Correct
> 
> > > 
> > > > +these devices include a camera sensor, a TV tuner and a parallel or a CSI-2
> > > > +receiver in an SoC.
> > > > +
> > > > +Bus types
> > > > +---------
> > > > +
> > > > +The following busses are the most common. This section discusses these two only.
> > > > 
> > > >   MIPI CSI-2
> > > > -==========
> > > > +^^^^^^^^^^
> > > > 
> > > >   CSI-2 is a data bus intended for transferring images from cameras to
> > > >   the host SoC. It is defined by the `MIPI alliance`_.
> > > > 
> > > > -.. _`MIPI alliance`: http://www.mipi.org/
> > > > +.. _`MIPI alliance`: https://www.mipi.org/
> > > > 
> > > > -Media bus formats
> > > > ------------------
> > > > +Parallel
> > > > +^^^^^^^^
> > > > 
> > > > -See :ref:`v4l2-mbus-pixelcode` for details on which media bus formats should
> > > > -be used for CSI-2 interfaces.
> > > > +`BT.601`_ and `BT.656`_ are the most common parallel busses.
> > > > +
> > > > +.. _`BT.601`: https://en.wikipedia.org/wiki/Rec._601
> > > > +.. _`BT.656`: https://en.wikipedia.org/wiki/ITU-R_BT.656
> > > > 
> > > >   Transmitter drivers
> > > >   -------------------
> > > > 
> > > > -CSI-2 transmitter, such as a sensor or a TV tuner, drivers need to
> > > > -provide the CSI-2 receiver with information on the CSI-2 bus
> > > > -configuration. These include the V4L2_CID_LINK_FREQ and
> > > > -V4L2_CID_PIXEL_RATE controls and
> > > > -(:c:type:`v4l2_subdev_video_ops`->s_stream() callback). These
> > > > -interface elements must be present on the sub-device represents the
> > > > -CSI-2 transmitter.
> > > > +Transmitter drivers generally need to provide the receiver drivers with the
> > > > +configuration of the transmitter. What is required depends on the type of the
> > > > +bus. These are common for both busses.
> > > > +
> > > > +Media bus pixel code
> > > > +^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +The media bus pixel codes document parallel formats. Should the pixel data be
> > > > +transported over a serial bus, the media bus pixel code that describes a
> > > > +parallel format that transfers a sample on a single clock cycle is used.
> > > 
> > > I guess you intend to document that, in example,
> > > MEDIA_BUS_FMT_YUYV8_2X8 has to be used on parallel busses, as the bus
> > > width is meaningful, while MEDIA_BUS_FMT_YUYV8_1X16 should be used on
> > > serial busses as the bus width it's not. I guess this could be
> > > reported as an example ?
> 
> Looks like a good idea for me.
> 
> > We actually have such an example in media bus pixel code documentation.
> > 
> > How about removing the paragraph and leaving just the reference below?
> 
> The reference would work for me.

Left the reference only.

> 
> > > 
> > > > +
> > > > +See :ref:`v4l2-mbus-pixelcode`.
> > > > +
> > > > +Link frequency
> > > > +^^^^^^^^^^^^^^
> > > > +
> > > > +The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > > > +receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > > +
> > > > +``.s_stream()`` callback
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^
> > > > 
> > > > -The V4L2_CID_LINK_FREQ control is used to tell the receiver driver the
> > > > -frequency (and not the symbol rate) of the link. The V4L2_CID_PIXEL_RATE
> > > > -control may be used by the receiver to obtain the pixel rate the transmitter
> > > > -uses. The :c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
> > > > -ability to start and stop the stream.
> > > > +The struct struct v4l2_subdev_video_ops->s_stream() callback is used by the
> > > > +receiver driver to control the transmitter driver's streaming state.
> > > > 
> > > > -The value of the V4L2_CID_PIXEL_RATE is calculated as follows::
> > > > +
> > > > +CSI-2 transmitter drivers
> > > > +-------------------------
> > > > +
> > > > +Pixel rate
> > > > +^^^^^^^^^^
> > > > +
> > > > +The pixel rate on the bus is calculated as follows::
> > > > 
> > > >   	pixel_rate = link_freq * 2 * nr_of_lanes * 16 / k / bits_per_sample
> > > > 
> > > > @@ -45,27 +77,38 @@ where
> > > >      * - variable or constant
> > > >        - description
> > > >      * - link_freq
> > > > -     - The value of the V4L2_CID_LINK_FREQ integer64 menu item.
> > > > +     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
> > > >      * - nr_of_lanes
> > > >        - Number of data lanes used on the CSI-2 link. This can
> > > >          be obtained from the OF endpoint configuration.
> > > >      * - 2
> > > > -     - Two bits are transferred per clock cycle per lane.
> > > > +     - Data is transferred on both rising and falling edge of the signal.
> > > >      * - bits_per_sample
> > > >        - Number of bits per sample.
> > > >      * - k
> > > >        - 16 for D-PHY and 7 for C-PHY
> > > > 
> > > > -The transmitter drivers must, if possible, configure the CSI-2
> > > > -transmitter to *LP-11 mode* whenever the transmitter is powered on but
> > > > -not active, and maintain *LP-11 mode* until stream on. Only at stream
> > > > -on should the transmitter activate the clock on the clock lane and
> > > > -transition to *HS mode*.
> > > > +.. note::
> > > > +
> > > > +	The pixel rate calculated this way is **not** be the same thing than
> 
> s/is **not** be the same thing/is **not** the same thing/

Oops!

> 
> Also maybe s/than/as ("not the same thing as"), but this is up to you.

This is correct indeed. Fixed both.

> 
> > > > +	the pixel rate on the camera sensor's pixel array.
> > > 
> > > .. as reported by the V4L2_CID_PIXEL_RATE control.
> > 
> > Good point. I'll use "... which is reported by ...", to
> > 
> > > 
> > > > +
> > > > +LP-11 and LP-111 modes
> > > > +^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +The transmitter drivers must, if possible, configure the CSI-2 transmitter to
> > > 
> > > s/drivers/driver/
> > > Or if you want to keep it plural drop "The" ?
> > 
> > It could be singular, and indefinite. I think this is better since it
> > obviously applies to all such drivers.
> 
> I am for the original "The transmitter drivers" or even "All the transmitter drivers"

I kept the original.

> 
> > > 
> > > > +*LP-11 or LP-111 mode* whenever the transmitter is powered on but not active,
> > > > +and maintain *LP-11 or LP-111 mode* until stream on. Only at stream on should
> > > > +the transmitter activate the clock on the clock lane and transition to *HS
> > > 
> > > "Only at stream on time the transmitter should"
> > > 
> > > Sounds better to me, but not being a native speaker I might very well
> > > be wrong :)
> > 
> > Agreed, I added "time".
> > 
> > > 
> > > All minors, thanks for clearing this up
> > > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks!

I'll send v3 soon. There was also a typo in the third patch (why wait for
compile testing?) that I'll also fix with that.

-- 
Kind regards,

Sakari Ailus
