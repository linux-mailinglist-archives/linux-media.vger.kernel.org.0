Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4851DA574
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 01:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgESX1r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 19:27:47 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:11081 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgESX1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 19:27:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec46b670000>; Tue, 19 May 2020 16:27:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 19 May 2020 16:27:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 19 May 2020 16:27:47 -0700
Received: from [10.2.164.184] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 May
 2020 23:27:46 +0000
Subject: Re: [PATCH 1/1] Documentation: media: Document how to write camera
 sensor drivers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <bingbu.cao@intel.com>,
        Maxime Ripard <maxime@cerno.tech>
References: <20200512105914.9948-1-sakari.ailus@linux.intel.com>
 <ab436563-9b22-ee4d-5c96-84857720f2f7@xs4all.nl>
 <20200518103524.GB20066@paasikivi.fi.intel.com>
 <823ddac0-5ac1-b27e-a408-b0763b7fe5d8@nvidia.com>
 <20200519225015.GS20066@paasikivi.fi.intel.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <31dfb6ce-59f0-6950-aef9-cb6bd69ba4b7@nvidia.com>
Date:   Tue, 19 May 2020 16:27:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519225015.GS20066@paasikivi.fi.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589930855; bh=2+ykHmhvs+14DkbQtRR0a/6a7IHVyNQPX00XYUs1zNE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=dqFHzNdBDqkj4XVTWpiKWXAk/9Z4YlnuDPZHN8bv7vJjTofqFxP8ZBA27JhlDux8y
         f+36iVYlQBR5i5zG4zLhbreaBtKf7MUHbChO70gcJz1vE+tNKssBeaBcVvzDpoHtfr
         p9KgklCfW/e8cd9ZSPYkB4evdCAeJot2x+Mb+mbnhsJh5aIqX6PGz8oLWC4AGepT52
         dIaeDM9RjcyTQNweRco1O6jHlVCnCYTR3QNZWOoTUbwKfhhCAe6nrCeZUi63Od8/du
         EokEOrpDRAlHEaSbWladKisvK3yqiGzvViUQMVLCMExZN1/ONRW3rdI+hPrlecqLbH
         xH0UAnxKRUYLA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/19/20 3:50 PM, Sakari Ailus wrote:
> Hi Sowjanya,
>
> On Mon, May 18, 2020 at 08:19:55AM -0700, Sowjanya Komatineni wrote:
>> On 5/18/20 3:35 AM, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> Thanks for the review.
>>>
>>> On Mon, May 18, 2020 at 11:50:34AM +0200, Hans Verkuil wrote:
>>>> On 12/05/2020 12:59, Sakari Ailus wrote:
>>>>> While we have had some example drivers, there has been up to date no
>>>>> formal documentation on how camera sensor drivers should be written; what
>>>>> are the practices, why, and where they apply.
>>>>>
>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>> ---
>>>>> The HTML documentation can be found here:
>>>>>
>>>>> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/doc/output/driver-api/media/camera-sensor.html>
>>>>>
>>>>>    .../driver-api/media/camera-sensor.rst        | 98 +++++++++++++++++++
>>>>>    Documentation/driver-api/media/csi2.rst       |  2 +
>>>>>    Documentation/driver-api/media/index.rst      |  1 +
>>>>>    3 files changed, 101 insertions(+)
>>>>>    create mode 100644 Documentation/driver-api/media/camera-sensor.rst
>>>>>
>>>>> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
>>>>> new file mode 100644
>>>>> index 000000000000..345e3ae30340
>>>>> --- /dev/null
>>>>> +++ b/Documentation/driver-api/media/camera-sensor.rst
>>>>> @@ -0,0 +1,98 @@
>>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>>> +
>>>>> +Writing camera sensor drivers
>>>>> +=============================
>>>>> +
>>>>> +CSI-2
>>>>> +-----
>>>>> +
>>>>> +Please see what is written on :ref:`MIPI_CSI_2`.
>>>>> +
>>>>> +Handling clocks
>>>>> +---------------
>>>>> +
>>>>> +Camera sensors have an internal clock tree including a PLL and a number of
>>>>> +divisors. The clock tree is generally configured by the driver based on a few
>>>>> +input parameters that are specific to the hardware:: the external clock frequency
>>>>> +and the link frequency. The two parameters generally are obtained from system
>>>>> +firmware. No other frequencies should be used in any circumstances.
>>>>> +
>>>>> +The reason why the clock frequencies are so important is that the clock signals
>>>>> +come out of the SoC, and in many cases a specific frequency is designed to be
>>>>> +used in the system. Using another frequency may cause harmful effects
>>>>> +elsewhere. Therefore only the pre-determined frequencies are configurable by the
>>>>> +user.
>>>>> +
>>>>> +Frame size
>>>>> +----------
>>>>> +
>>>>> +There are two distinct ways to configure the frame size produced by camera
>>>>> +sensors.
>>>>> +
>>>>> +Freely configurable camera sensor drivers
>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> +
>>>>> +Freely configurable camera sensor drivers expose the device's internal
>>>>> +processing pipeline as one or more sub-devices with different cropping and
>>>>> +scaling configurations. The output size of the device is the result of a series
>>>>> +of cropping and scaling operations from the device's pixel array's size.
>>>>> +
>>>>> +An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
>>>>> +
>>>>> +Register list based drivers
>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> +
>>>>> +Register list based drivers generally, instead of able to configure the device
>>>>> +they control based on user requests, are limited to a number of preset
>>>>> +configurations that combine a number of different parameters that on hardware
>>>>> +level are independent. How a driver picks such configuration is based on the
>>>>> +format set on a source pad at the end of the device's internal pipeline.
>>>>> +
>>>>> +Most sensor drivers are implemented this way, see e.g.
>>>>> +drivers/media/i2c/imx319.c for an example.
>>>>> +
>>>>> +Frame interval configuration
>>>>> +----------------------------
>>>>> +
>>>>> +There are two different methods for obtaining possibilities for different frame
>>>>> +intervals as well as configuring the frame interval. Which one to implement
>>>>> +depends on the type of the device.
>>>>> +
>>>>> +Raw camera sensors
>>>>> +~~~~~~~~~~~~~~~~~~
>>>>> +
>>>>> +Instead of a high level parameter such as frame interval, the frame interval is
>>>>> +a result of the configuration of a number of camera sensor implementation
>>>>> +specific parameters. Luckily, these parameters tend to be the same for more or
>>>>> +less all modern raw camera sensors.
>>>>> +
>>>>> +The frame interval is calculated using the following equation::
>>>>> +
>>>>> +	frame interval = (analogue crop width + horizontal blanking) *
>>>>> +			 (analogue crop height + vertical blanking) / pixel rate
>>>>> +
>>>>> +The formula is bus independent and is applicable for raw timing parameters on
>>>>> +large variety of devices beyond camera sensors. Devices that have no analogue
>>>>> +crop, use the full source image size, i.e. pixel array size.
>>>>> +
>>>>> +Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
>>>>> +``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
>>>>> +pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
>>>>> +unit of that control is Hz.
>>>>> +
>>>>> +Register list based drivers need to implement read-only sub-device nodes for the
>>>>> +purpose. Devices that are not register list based need these to configure the
>>>>> +device's internal processing pipeline.
>>>>> +
>>>>> +The first entity in the linear pipeline is the pixel array. The pixel array may
>>>>> +be followed by other entities that are there to allow configuring binning,
>>>>> +skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
>>>>> +
>>>>> +USB cameras etc. devices
>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> +
>>>>> +USB video class hardware, as well as many cameras offering a higher level
>>>>> +control interface, generally use the concept of frame interval (or frame rate)
>>>>> +on the level of device hardware interface. This means lower level controls
>>>>> +exposed by raw cameras may not be used as an interface to control the frame
>>>>> +interval on these devices.
>>>>> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
>>>>> index e111ff7bfd3d..da8b356389f0 100644
>>>>> --- a/Documentation/driver-api/media/csi2.rst
>>>>> +++ b/Documentation/driver-api/media/csi2.rst
>>>>> @@ -1,5 +1,7 @@
>>>>>    .. SPDX-License-Identifier: GPL-2.0
>>>>> +.. _MIPI_CSI_2:
>>>>> +
>>>>>    MIPI CSI-2
>>>>>    ==========
>>>>> diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
>>>>> index 328350924853..c140692454b1 100644
>>>>> --- a/Documentation/driver-api/media/index.rst
>>>>> +++ b/Documentation/driver-api/media/index.rst
>>>>> @@ -34,6 +34,7 @@ Please see:
>>>>>        mc-core
>>>>>        cec-core
>>>>>        csi2
>>>>> +    camera-sensor
>>>>>        drivers/index
>>>>>
>>>> Can you add a section on power management? I've CC-ed Sowjanya as well, since she
>>>> had some questions about that (off-line), and I don't know the answer on the right
>>>> way to handle power management for sensors.
>>> Sure. There's nothing special in here per se, but given the history and
>>> interaction with the control framework it's worth documenting that
>>> separately. Many drivers are also being used on both ACPI and DT that makes
>>> the drivers somewhat more convoluted.
>>
>> Hi Sakari,
>>
>> Are there any generic implementation guidelines for sensor drivers regarding
>> keeping pads in LP-11 when they are powered on and not being used?
> That's documented in the CSI-2 document, to which this refers to.
>
>> Also is it mandatory for sensor drivers to implement s_power callback where
>> during on time it powers on and keeps pads in LP-11 state?
> That's a good question.
>
> The s_power callback should not be needed for this, but in practice another
> callback is required to replace it. Please see:
>
> <URL:https://lkml.org/lkml/2017/2/18/59>
>
> Patches are accepted to address that. The ISP (or bridge) driver would call
> phy_prepare callback before starting streaming and phy_unprepare when LP-11
> state is no longer needed.
>
>> I see some sensor drivers have RPM enabled and keep sensor power on only
>> when they are being used during configuring and during streaming other wise
>> sensor power will be off and also not all drivers have s_power callback
>> implemented and some drivers with s_power implemented does only power on but
>> does not keep pads in LP-11.
>>
>> Reason for asking is for Tegra CSI receiver, we need to perform pads
>> calibration after every power on of Tegra CSI MIPI Pads.
>>
>> Calibration will be done only when link is is LP-11 state.
>>
>> Would like to have proper implementation for Tegra CSI MIPI pads calibration
>> based on this.
> Note that not all devices support explicitly transitioning to LP-11 mode.
> In this case the drivers usually start streaming and then stop. This could
> be unreliable.
>
Thanks Sakari. phy_prepare/unprepare is useful for cases like this but 
like you said as not all sensors may support explicit LP-11 state or its 
not mandatory for sensor drivers to implement these callbacks, will try 
to handle it on Tegra driver side either with explicit sensor sub-device 
stream start and stop during pads calibration and then enable sensor 
stream again for actual capture or with triggering calibration start 
prior to sensor stream enable and checking for calibration status after 
sensor stream enable.

Thanks & Regards,

Sowjanya

