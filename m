Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECBC23AFB5
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 23:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgHCVji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 17:39:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50726 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgHCVji (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 17:39:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 97FCE26D594
Subject: Re: [PATCH v3 1/1] Documentation: media: Document how to write camera
 sensor drivers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl
References: <20200730162040.15560-1-sakari.ailus@linux.intel.com>
 <a8524ae2-6f85-8bbd-4a12-244d4580f038@collabora.com>
 <20200803212512.GX13316@paasikivi.fi.intel.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <4b23798e-5b0d-47b6-c227-fef517b59968@collabora.com>
Date:   Mon, 3 Aug 2020 18:39:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803212512.GX13316@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/3/20 6:25 PM, Sakari Ailus wrote:
> Hi Helen,
> 
> On Mon, Aug 03, 2020 at 12:25:54PM -0300, Helen Koike wrote:
>> Hi Sakari,
>>
>> Thanks for this.
> 
> Thanks for the comments!
> 
>>
>> On 7/30/20 1:20 PM, Sakari Ailus wrote:
>>> While we have had some example drivers, there has been up to date no
>>> formal documentation on how camera sensor drivers should be written; what
>>> are the practices, why, and where they apply.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>> since v2:
>>>
>>> - More verbose explanation on sensor driver's responsibilities.
>>>
>>> - Reword the explanation on power state vs. v4l2_ctrl_handler_setup.
>>>
>>>  .../driver-api/media/camera-sensor.rst        | 134 ++++++++++++++++++
>>>  Documentation/driver-api/media/csi2.rst       |   2 +
>>>  Documentation/driver-api/media/index.rst      |   1 +
>>>  3 files changed, 137 insertions(+)
>>>  create mode 100644 Documentation/driver-api/media/camera-sensor.rst
>>>
>>> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
>>> new file mode 100644
>>> index 000000000000..2121586e8ede
>>> --- /dev/null
>>> +++ b/Documentation/driver-api/media/camera-sensor.rst
>>> @@ -0,0 +1,134 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +Writing camera sensor drivers
>>> +=============================
>>> +
>>> +CSI-2
>>> +-----
>>> +
>>> +Please see what is written on :ref:`MIPI_CSI_2`.
>>> +
>>> +Handling clocks
>>> +---------------
>>> +
>>> +Camera sensors have an internal clock tree including a PLL and a number of
>>> +divisors. The clock tree is generally configured by the driver based on a few
>>> +input parameters that are specific to the hardware:: the external clock frequency
>>
>> Double colon
> 
> This is ReST. This should translate into a single colon.
> 
>>
>>> +and the link frequency. The two parameters generally are obtained from system
>>> +firmware. No other frequencies should be used in any circumstances.
>>
>> If I understand correctly, the firmware exposes a list of options that
>> userspace can chose from, right?
> 
> Correct.
> 
>>
>>> +
>>> +The reason why the clock frequencies are so important is that the clock signals
>>> +come out of the SoC, and in many cases a specific frequency is designed to be
>>> +used in the system. Using another frequency may cause harmful effects
>>> +elsewhere. Therefore only the pre-determined frequencies are configurable by the
>>> +user.
>>> +
>>> +Frame size
>>> +----------
>>> +
>>> +There are two distinct ways to configure the frame size produced by camera
>>> +sensors.
>>> +
>>> +Freely configurable camera sensor drivers
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +Freely configurable camera sensor drivers expose the device's internal
>>> +processing pipeline as one or more sub-devices with different cropping and
>>> +scaling configurations. The output size of the device is the result of a series
>>> +of cropping and scaling operations from the device's pixel array's size.
>>> +
>>> +An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
>>> +
>>> +Register list based drivers
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +Register list based drivers generally, instead of able to configure the device
>>> +they control based on user requests, are limited to a number of preset
>>> +configurations that combine a number of different parameters that on hardware
>>> +level are independent. How a driver picks such configuration is based on the
>>> +format set on a source pad at the end of the device's internal pipeline.
>>
>> If I understand correctly, the difference between the first and second way,
>> is that the first allows userspace to change the format on the subdevice's pads,
>> and the second one needs to be calculated from the format set in the video devices,
>> is this correct?
> 
> Yes, but video devices aren't necessarily involved. In a MC-centric drivers
> the interface is available through sub-device nodes in both above cases.

So the definition of a "Freely configurable camera sensor driver" is when
we have MC-centric driver exposing format configuration through pads, and
a "Register list based driver" is when the format configuration is propagated
in the pipeline from somewhere else right? And it can be a MC-centric device
where it doesn't expose format configuration through pads, or non Mc-centric,
where the subdevice is not exposed, is this correct?

I was wondering why it is called "Register list".

> 
>>
>>> +
>>> +Most sensor drivers are implemented this way, see e.g.
>>> +drivers/media/i2c/imx319.c for an example.
>>> +
>>> +Frame interval configuration
>>> +----------------------------
>>> +
>>> +There are two different methods for obtaining possibilities for different frame
>>> +intervals as well as configuring the frame interval. Which one to implement
>>> +depends on the type of the device.
>>> +
>>> +Raw camera sensors
>>> +~~~~~~~~~~~~~~~~~~
>>> +
>>> +Instead of a high level parameter such as frame interval, the frame interval is
>>> +a result of the configuration of a number of camera sensor implementation
>>> +specific parameters. Luckily, these parameters tend to be the same for more or
>>> +less all modern raw camera sensors.
>>> +
>>> +The frame interval is calculated using the following equation::
>>> +
>>> +	frame interval = (analogue crop width + horizontal blanking) *
>>> +			 (analogue crop height + vertical blanking) / pixel rate
>>> +
>>> +The formula is bus independent and is applicable for raw timing parameters on
>>> +large variety of devices beyond camera sensors. Devices that have no analogue
>>> +crop, use the full source image size, i.e. pixel array size.
>>> +
>>> +Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
>>> +``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
>>> +pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
>>> +unit of that control is Hz.
>>> +
>>> +Register list based drivers need to implement read-only sub-device nodes for the
>>> +purpose. Devices that are not register list based need these to configure the
>>> +device's internal processing pipeline.
>>> +
>>> +The first entity in the linear pipeline is the pixel array. The pixel array may
>>
>> A pixel array entity is the one that represents the "source" of the image, right?
> 
> Correct.
> 
> Please wrap lines before 80.
> 
>>
>>> +be followed by other entities that are there to allow configuring binning,
>>> +skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
>>> +
>>> +USB cameras etc. devices
>>> +~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +USB video class hardware, as well as many cameras offering a higher level
>>> +control interface, generally use the concept of frame interval (or frame rate)
>>> +on the level of device hardware interface. This means lower level controls
>>> +exposed by raw cameras may not be used as an interface to control the frame
>>> +interval on these devices.
>>
>> Sorry, it's not clear to me if you are referring to driver->hardware configuration, or
>> userspace->driver configuration (but maybe it's just me and my lack of knowledge).
> 
> Both actually. Would this be clearer:
> 
> USB video class hardware, as well as many cameras offering a similar higher
> level interface natively, generally use the concept of frame interval (or
> frame rate) on device level in firmware or hardware. This means lower level
> controls implemented by raw cameras may not be used on uAPI (or even kAPI)
> to control the frame interval on these devices.
> 

Yes :)

Thanks,
Helen
