Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74F43D73C8
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 12:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236250AbhG0KyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 06:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbhG0KyT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 06:54:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF9EC061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 03:54:19 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80BB9EE;
        Tue, 27 Jul 2021 12:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627383256;
        bh=M36cO2hBPQ2OjnGCkZ3DlZf+w9N17ono/gLrwE80TKA=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=FdFOsdwwTVtnRfMYDIQ4cfMh7xZdBKjZj1alWU3SGJ78ABHwAGkZYtXIcv/oz9Za4
         peilf0oNf4Boj1ONVFdiK5xb1CxDxYPdKV71wXrMGMY4Lj+oJt8zIJlRJQuVjDSjWr
         F1buVtx6Odzf82ei5J9id2WDsjYtDfLs4hfC5ZDE=
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
 <20210624084046.13136-2-sakari.ailus@linux.intel.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 1/6] Documentation: media: Improve camera sensor
 documentation
Message-ID: <e725ce28-61ba-db6f-4c58-375bd7c328a7@ideasonboard.com>
Date:   Tue, 27 Jul 2021 11:54:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624084046.13136-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 24/06/2021 09:40, Sakari Ailus wrote:
> Modernise the documentation to make it more precise and update the use of
> pixel rate control and various other changes. In particular:
> 
> - Use non-proportional font for file names, properties as well as
>   controls.
> 
> - The unit of the HBLANK control is pixels, not lines.
> 
> - The unit of PIXEL_RATE control is pixels per second, not Hz.
> 
> - Merge common requirements for CSI-2 and parallel busses.>
> - Include all DT properties needed for assigned clocks.
> 
> - Fix referencing the link rate control.
> 
> - SMIA driver's new name is CCS driver.
> 
> - The PIXEL_RATE control denotes pixel rate on the pixel array on camera
>   sensors. Do not suggest it is used to tell the maximum pixel rate on the
>   bus anymore.
> 
> - Improve ReST syntax (plain struct and function names).
> 
> - Remove the suggestion to use s_power() in receiver drivers.
> 
> - Make MIPI website URL use HTTPS, add Wikipedia links to BT.601 and
>   BT.656.
> 
> Fixes: e4cf8c58af75 ("media: Documentation: media: Document how to write camera sensor drivers")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  .../driver-api/media/camera-sensor.rst        |  45 +++----
>  Documentation/driver-api/media/csi2.rst       |  94 --------------
>  Documentation/driver-api/media/index.rst      |   2 +-
>  Documentation/driver-api/media/tx-rx.rst      | 117 ++++++++++++++++++
>  .../media/v4l/ext-ctrls-image-process.rst     |   2 +
>  5 files changed, 137 insertions(+), 123 deletions(-)
>  delete mode 100644 Documentation/driver-api/media/csi2.rst
>  create mode 100644 Documentation/driver-api/media/tx-rx.rst
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index 7160336aa475..c7d4891bd24e 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -3,10 +3,10 @@
>  Writing camera sensor drivers
>  =============================
>  
> -CSI-2
> ------
> +CSI-2 and parallel (BT.601 and BT.656) busses

Busses looks odd to me, so I've got to look it up:
  https://www.grammarly.com/blog/busses-buses/

Though I found this one more of an entertaining read:
  https://www.merriam-webster.com/words-at-play/plural-of-bus

Technically, some dictionaries still reference busses it seems, so this
isn't specifically an error, just that buses is more commonly used (and
it doesn't appear to be a US/UK thing?)


> +---------------------------------------------
>  
> -Please see what is written on :ref:`MIPI_CSI_2`.
> +Please see :ref:`transmitter-receiver`.
>  
>  Handling clocks
>  ---------------
> @@ -26,15 +26,16 @@ user.
>  ACPI
>  ~~~~
>  
> -Read the "clock-frequency" _DSD property to denote the frequency. The driver can
> -rely on this frequency being used.
> +Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
> +can rely on this frequency being used.
>  
>  Devicetree
>  ~~~~~~~~~~
>  
> -The currently preferred way to achieve this is using "assigned-clock-rates"
> -property. See Documentation/devicetree/bindings/clock/clock-bindings.txt for
> -more information. The driver then gets the frequency using clk_get_rate().
> +The currently preferred way to achieve this is using ``assigned-clocks``,
> +``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See
> +``Documentation/devicetree/bindings/clock/clock-bindings.txt`` for more
> +information. The driver then gets the frequency using ``clk_get_rate()``.
>  
>  This approach has the drawback that there's no guarantee that the frequency
>  hasn't been modified directly or indirectly by another driver, or supported by
> @@ -55,7 +56,7 @@ processing pipeline as one or more sub-devices with different cropping and
>  scaling configurations. The output size of the device is the result of a series
>  of cropping and scaling operations from the device's pixel array's size.
>  
> -An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
> +An example of such a driver is the CCS driver (see ``drivers/media/i2c/ccs``).
>  
>  Register list based drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> @@ -67,7 +68,7 @@ level are independent. How a driver picks such configuration is based on the
>  format set on a source pad at the end of the device's internal pipeline.
>  
>  Most sensor drivers are implemented this way, see e.g.
> -drivers/media/i2c/imx319.c for an example.
> +``drivers/media/i2c/imx319.c`` for an example.
>  
>  Frame interval configuration
>  ----------------------------
> @@ -94,9 +95,10 @@ large variety of devices beyond camera sensors. Devices that have no analogue
>  crop, use the full source image size, i.e. pixel array size.
>  
>  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> -``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
> -pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
> -unit of that control is Hz.
> +``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> +is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> +the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> +sub-device. The unit of that control is pixels per second.
>  
>  Register list based drivers need to implement read-only sub-device nodes for the
>  purpose. Devices that are not register list based need these to configure the
> @@ -125,14 +127,14 @@ general, the device must be powered on at least when its registers are being
>  accessed and when it is streaming.
>  
>  Existing camera sensor drivers may rely on the old
> -:c:type:`v4l2_subdev_core_ops`->s_power() callback for bridge or ISP drivers to
> +struct v4l2_subdev_core_ops->s_power() callback for bridge or ISP drivers to
>  manage their power state. This is however **deprecated**. If you feel you need
>  to begin calling an s_power from an ISP or a bridge driver, instead please add
>  runtime PM support to the sensor driver you are using. Likewise, new drivers
>  should not use s_power.
>  
>  Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
> -``drivers/media/i2c/smiapp/smiapp-core.c``. The two drivers work in both ACPI
> +``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI
>  and DT based systems.
>  
>  Control framework
> @@ -149,16 +151,3 @@ used to obtain device's power state after the power state transition:
>  The function returns a non-zero value if it succeeded getting the power count or
>  runtime PM was disabled, in either of which cases the driver may proceed to
>  access the device.
> -
> -Controls
> ---------
> -
> -For camera sensors that are connected to a bus where transmitter and receiver
> -require common configuration set by drivers, such as CSI-2 or parallel (BT.601
> -or BT.656) bus, the ``V4L2_CID_LINK_FREQ`` control is mandatory on transmitter
> -drivers. Receiver drivers can use the ``V4L2_CID_LINK_FREQ`` to query the
> -frequency used on the bus.
> -
> -The transmitter drivers should also implement ``V4L2_CID_PIXEL_RATE`` control in
> -order to tell the maximum pixel rate to the receiver. This is required on raw
> -camera sensors.
> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> deleted file mode 100644
> index 11c52b0be8b8..000000000000
> --- a/Documentation/driver-api/media/csi2.rst
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0
> -
> -.. _MIPI_CSI_2:
> -
> -MIPI CSI-2
> -==========
> -
> -CSI-2 is a data bus intended for transferring images from cameras to
> -the host SoC. It is defined by the `MIPI alliance`_.
> -
> -.. _`MIPI alliance`: http://www.mipi.org/
> -
> -Media bus formats
> ------------------
> -
> -See :ref:`v4l2-mbus-pixelcode` for details on which media bus formats should
> -be used for CSI-2 interfaces.
> -
> -Transmitter drivers
> --------------------
> -
> -CSI-2 transmitter, such as a sensor or a TV tuner, drivers need to
> -provide the CSI-2 receiver with information on the CSI-2 bus
> -configuration. These include the V4L2_CID_LINK_FREQ and
> -V4L2_CID_PIXEL_RATE controls and
> -(:c:type:`v4l2_subdev_video_ops`->s_stream() callback). These
> -interface elements must be present on the sub-device represents the
> -CSI-2 transmitter.
> -
> -The V4L2_CID_LINK_FREQ control is used to tell the receiver driver the
> -frequency (and not the symbol rate) of the link. The V4L2_CID_PIXEL_RATE
> -control may be used by the receiver to obtain the pixel rate the transmitter
> -uses. The :c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
> -ability to start and stop the stream.
> -
> -The value of the V4L2_CID_PIXEL_RATE is calculated as follows::
> -
> -	pixel_rate = link_freq * 2 * nr_of_lanes * 16 / k / bits_per_sample
> -
> -where
> -
> -.. list-table:: variables in pixel rate calculation
> -   :header-rows: 1
> -
> -   * - variable or constant
> -     - description
> -   * - link_freq
> -     - The value of the V4L2_CID_LINK_FREQ integer64 menu item.
> -   * - nr_of_lanes
> -     - Number of data lanes used on the CSI-2 link. This can
> -       be obtained from the OF endpoint configuration.
> -   * - 2
> -     - Two bits are transferred per clock cycle per lane.
> -   * - bits_per_sample
> -     - Number of bits per sample.
> -   * - k
> -     - 16 for D-PHY and 7 for C-PHY
> -
> -The transmitter drivers must, if possible, configure the CSI-2
> -transmitter to *LP-11 mode* whenever the transmitter is powered on but
> -not active, and maintain *LP-11 mode* until stream on. Only at stream
> -on should the transmitter activate the clock on the clock lane and
> -transition to *HS mode*.
> -
> -Some transmitters do this automatically but some have to be explicitly
> -programmed to do so, and some are unable to do so altogether due to
> -hardware constraints.
> -
> -Stopping the transmitter
> -^^^^^^^^^^^^^^^^^^^^^^^^
> -
> -A transmitter stops sending the stream of images as a result of
> -calling the ``.s_stream()`` callback. Some transmitters may stop the
> -stream at a frame boundary whereas others stop immediately,
> -effectively leaving the current frame unfinished. The receiver driver
> -should not make assumptions either way, but function properly in both
> -cases.
> -
> -Receiver drivers
> -----------------
> -
> -Before the receiver driver may enable the CSI-2 transmitter by using
> -the :c:type:`v4l2_subdev_video_ops`->s_stream(), it must have powered
> -the transmitter up by using the
> -:c:type:`v4l2_subdev_core_ops`->s_power() callback. This may take
> -place either indirectly by using :c:func:`v4l2_pipeline_pm_get` or
> -directly.
> -
> -Formats
> --------
> -
> -The media bus pixel codes document parallel formats. Should the pixel data be
> -transported over a serial bus, the media bus pixel code that describes a
> -parallel format that transfers a sample on a single clock cycle is used.
> diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
> index 813d7db59da7..08e206567408 100644
> --- a/Documentation/driver-api/media/index.rst
> +++ b/Documentation/driver-api/media/index.rst
> @@ -37,7 +37,7 @@ Documentation/userspace-api/media/index.rst
>      rc-core
>      mc-core
>      cec-core
> -    csi2
> +    tx-rx
>      camera-sensor
>  
>      drivers/index
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> new file mode 100644
> index 000000000000..4c8584e7b6f2
> --- /dev/null
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -0,0 +1,117 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _transmitter-receiver:
> +
> +Pixel data transmitter and receiver drivers
> +===========================================
> +
> +V4L2 supports various devices that transmit and receiver pixel data. Examples of
> +these devices include a camera sensor, a TV tuner and a parallel or a CSI-2
> +receiver in an SoC.
> +
> +Bus types
> +---------
> +
> +The following busses are the most common. This section discusses these two only.
> +
> +MIPI CSI-2
> +^^^^^^^^^^
> +
> +CSI-2 is a data bus intended for transferring images from cameras to
> +the host SoC. It is defined by the `MIPI alliance`_.
> +
> +.. _`MIPI alliance`: https://www.mipi.org/
> +
> +Parallel
> +^^^^^^^^
> +
> +`BT.601`_ and `BT.656`_ are the most common parallel busses.
> +
> +.. _`BT.601`: https://en.wikipedia.org/wiki/Rec._601
> +.. _`BT.656`: https://en.wikipedia.org/wiki/ITU-R_BT.656
> +
> +Transmitter drivers
> +-------------------
> +
> +Transmitter drivers generally need to provide the receiver drivers with the
> +configuration of the transmitter. What is required depends on the type of the
> +bus. These are common for both busses.
> +
> +Media bus pixel code
> +^^^^^^^^^^^^^^^^^^^^
> +
> +See :ref:`v4l2-mbus-pixelcode`.
> +
> +Link frequency
> +^^^^^^^^^^^^^^
> +
> +The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> +receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> +

Would the symbol rate be the same as the pixel rate, or is the 'bit'
rate? ( I believe it's the bit rate, but I wonder if it needs to be
defined here to make it clear?)

I guess this is the distinction that the bus may send two bits per clock
cycle or such.


> +``.s_stream()`` callback
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The struct struct v4l2_subdev_video_ops->s_stream() callback is used by the
> +receiver driver to control the transmitter driver's streaming state.
> +
> +
> +CSI-2 transmitter drivers
> +-------------------------
> +
> +Pixel rate
> +^^^^^^^^^^
> +
> +The pixel rate on the bus is calculated as follows::
> +
> +	pixel_rate = link_freq * 2 * nr_of_lanes * 16 / k / bits_per_sample
> +
> +where
> +
> +.. list-table:: variables in pixel rate calculation
> +   :header-rows: 1
> +
> +   * - variable or constant
> +     - description
> +   * - link_freq
> +     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
> +   * - nr_of_lanes
> +     - Number of data lanes used on the CSI-2 link. This can
> +       be obtained from the OF endpoint configuration.
> +   * - 2
> +     - Data is transferred on both rising and falling edge of the signal.
> +   * - bits_per_sample
> +     - Number of bits per sample.
> +   * - k
> +     - 16 for D-PHY and 7 for C-PHY

Is 'k' a defined term here? It makes me assume kilo ... which clearly
isn't its usage with values of 16 and 7?


Fairly optional comments though so :

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> +
> +.. note::
> +
> +	The pixel rate calculated this way is **not** the same thing as the
> +	pixel rate on the camera sensor's pixel array which is indicated by the
> +	:ref:`V4L2_CID_PIXEL_RATE <v4l2-cid-pixel-rate>` control.
> +
> +LP-11 and LP-111 modes
> +^^^^^^^^^^^^^^^^^^^^^^
> +
> +The transmitter drivers must, if possible, configure the CSI-2 transmitter to
> +*LP-11 or LP-111 mode* whenever the transmitter is powered on but not active,
> +and maintain *LP-11 or LP-111 mode* until stream on. Only at stream on should
> +the transmitter activate the clock on the clock lane and transition to *HS
> +mode*.
> +
> +Some transmitters do this automatically but some have to be explicitly
> +programmed to do so, and some are unable to do so altogether due to
> +hardware constraints.
> +
> +The receiver thus need to be configured to expect LP-11 or LP-111 mode from the
> +transmitter before the transmitter driver's ``.s_stream()`` op is called.
> +
> +Stopping the transmitter
> +^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +A transmitter stops sending the stream of images as a result of
> +calling the ``.s_stream()`` callback. Some transmitters may stop the
> +stream at a frame boundary whereas others stop immediately,
> +effectively leaving the current frame unfinished. The receiver driver
> +should not make assumptions either way, but function properly in both
> +cases.
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 87698c15c027..37dad2f4df8c 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -20,6 +20,8 @@ Image Process Control IDs
>  ``V4L2_CID_IMAGE_PROC_CLASS (class)``
>      The IMAGE_PROC class descriptor.
>  
> +.. _v4l2-cid-link-freq:
> +
>  ``V4L2_CID_LINK_FREQ (integer menu)``
>      Data bus frequency. Together with the media bus pixel code, bus type
>      (clock cycles per sample), the data bus frequency defines the pixel
> 
