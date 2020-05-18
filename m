Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9931D745C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 11:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgERJul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 05:50:41 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44211 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726040AbgERJul (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 05:50:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id acPqjsybztKAsacPujKmNE; Mon, 18 May 2020 11:50:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589795438; bh=mrZl0rEoQhyBd8+6odgWw6WsXdDY1I17D85nEFUQew8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=syzDdduXIgVgYdsVCsBWic/9g5og4O6WgMu34ZTAjWWJRWt5X8XBIUyJ/1jCu3qRn
         hUAOgWK0bmCS1h1lguKW/GzFj2n1hdKkD6a62Ja253oYgwmVEbTS7VbJO2E5fm13H7
         AsQTUTc1xYBY928fKEit8mOQbyIFlJT7/aUA+j0uxjGm2jrxZtvEpbJHW33cNSqP9o
         7+nU5gUI+8LEl8FUwoPl6QiJd2DjZ1/VSMBkHb2aw97EFtFEi5MzxnqMHdPbDf/85E
         /PdJUjTARdnL8DKQF7EBIUvDWDM92/BuhIewVEmyi5ZUNTdnug1nOqoDu4L2WROMFI
         6aWyjKe8JQkVw==
Subject: Re: [PATCH 1/1] Documentation: media: Document how to write camera
 sensor drivers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
        Maxime Ripard <maxime@cerno.tech>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
References: <20200512105914.9948-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ab436563-9b22-ee4d-5c96-84857720f2f7@xs4all.nl>
Date:   Mon, 18 May 2020 11:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200512105914.9948-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJxHeatxNt1T2AHZY8/nk1mqYxKo7IfAG9/wjjEpcBdlVbpLNAwgDRJkdy0hare+RG+LDNjzWNySGyZJcag3txu2rvKTBBYegr+WlJ+4C88qPvsw5sA3
 c83PyudhugKwV9VdDGv6PnbqJCC34Ts7T302HSjxnGYFnWGtpezFAO3ERvB7H6h+3oFW39/C7nojcaW6bIjpyZIWXyeOL6sWetMpREam65vQXsUy1rDONmXe
 TVKMHXARptaOyEswQMPUMhArGz8upEmNn01Vy//pysyh6Zzl/5Axt8bbmi9EkI4n+/GH8P2QQy6PGYR9+YKJbceTHIbrvdapF0p6USLWQDYoIlNamBO7sHTc
 /RMs+o4h
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/05/2020 12:59, Sakari Ailus wrote:
> While we have had some example drivers, there has been up to date no
> formal documentation on how camera sensor drivers should be written; what
> are the practices, why, and where they apply.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The HTML documentation can be found here:
> 
> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/doc/output/driver-api/media/camera-sensor.html>
> 
>  .../driver-api/media/camera-sensor.rst        | 98 +++++++++++++++++++
>  Documentation/driver-api/media/csi2.rst       |  2 +
>  Documentation/driver-api/media/index.rst      |  1 +
>  3 files changed, 101 insertions(+)
>  create mode 100644 Documentation/driver-api/media/camera-sensor.rst
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> new file mode 100644
> index 000000000000..345e3ae30340
> --- /dev/null
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -0,0 +1,98 @@
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
> 

Can you add a section on power management? I've CC-ed Sowjanya as well, since she
had some questions about that (off-line), and I don't know the answer on the right
way to handle power management for sensors.

Regards,

	Hans
