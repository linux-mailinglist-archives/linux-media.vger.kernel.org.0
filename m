Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D4F30B243
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 22:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhBAVrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 16:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhBAVqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 16:46:53 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A3FC061573
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 13:46:06 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id v15so18538899ljk.13
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 13:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hL6T0ARhP0XjKCz4RQxgmhqIiGPrhof0DqiCa0vMx+Y=;
        b=M//Aj4evprO6TQ0DtUE39sezBtgBy5OxNL4wZp5vhoimafJ/mp+/IyNiXb6jUTt0de
         iRf7MZIIs4NUZIoH7lDlorLo+t4c4wDLzuGa9rztmLLzPGDT0HeM8Yb7Gyj26FzY8nz2
         bxmmdOS/Jf5taUUDvGze43VK2dm+Z3easGHZK7da/bsisGmFkFneVBBs5rt0IAJ9px3b
         bAjCZBXKkd08y61fGYQriJffV7FqOXda4X+dO3Nloh6ZKA+j6GwiAFOCkfSVWwzDUhdf
         oNpwoWp6DKBLHxW9ql62XDZuxR1QtdGzKTUMC647PhBcTlnomoqOzYF76RehNbWD/CML
         uB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hL6T0ARhP0XjKCz4RQxgmhqIiGPrhof0DqiCa0vMx+Y=;
        b=IbJCetjggLiJI6ukrt+0uKcMfxRnEPj9KuDyhZFvCJXj9OhR8QmLQoNsbZxD7EaM/Z
         c4GkCtVzOi4BcIP13nxwBwvnIfz6moBRHCReNfftRtk9Zuo0uI5bz9bZG2kiKTiQ/s0n
         DQlB1K0WJvkFV3aW+lYzNdOCH6M7pK9CJ33hMUsNZX/qgn6H5vXvguS4+lZLJkp6JiiN
         RAZWyLtq/BMDgYjdMm+W+y7JC3N86c8/lhw3aKziT7JjxdoanfVvAH2+Yw0LX9ZUcghd
         PxxhZy47efn0qZWQ/dAiMxwaGIS/pAzeAXueej73rE8MEijenkO/KoYCxQqTYpw72qGG
         M6Pg==
X-Gm-Message-State: AOAM5325bB9ndnlmVwSlRcqvxsWqSE1wuJWL4ezo8IKpl+u3vLob3D4f
        q3A+GQ/r2NFMAuwgcn7qPwz/JQ==
X-Google-Smtp-Source: ABdhPJyE8fINDiO94E9915rWlFV7O7xiJFwLYN6DMPthGIEM4Wx+iIUcJ7IV1a0ctVleFDdayWBJmQ==
X-Received: by 2002:a2e:a550:: with SMTP id e16mr10988615ljn.264.1612215964917;
        Mon, 01 Feb 2021 13:46:04 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id g17sm3127067lfb.30.2021.02.01.13.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 13:46:04 -0800 (PST)
Subject: Re: [RFC] Repurpose V4L2_CID_PIXEL_RATE for the sampling rate in the
 pixel array
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        tfiga@chromium.org, Robert Foss <robert.foss@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        mchehab@kernel.org, hverkuil@xs4all.nl
References: <20210201175426.anq5pjajwyri5v7w@uno.localdomain>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <8d11f0b9-702c-f2ea-040e-2313112e5b7a@linaro.org>
Date:   Tue, 2 Feb 2021 00:46:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201175426.anq5pjajwyri5v7w@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 01.02.2021 20:54, Jacopo Mondi wrote:
> Hi Andrey, Sakari,
> 
> On Mon, Dec 21, 2020 at 01:45:38PM +0200, Sakari Ailus wrote:
>> Hi Andrey,
>>
>> Thanks for your e-mail.
>>
>> Could you wrap the lines before 80 characters? It's a bit hard to read...
>>
>> On Tue, Dec 08, 2020 at 03:09:25PM +0300, Andrey Konovalov wrote:
>>> Greetings,
>>>
>>> I was checking how V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ controls
>>> are documented and used in recent media_tree kernel, and found that the
>>> current usage of V4L2_CID_PIXEL_RATE is not consistent.
>>>
>>> This topic seems to be a bit wider, but I'll focus on camera sensors and
>>> the corresponding receivers.
>>>
>>> Not only the receiver drivers often use V4L2_CID_PIXEL_RATE to calculate
>>> the link frequency from (this is much more common than using
>>> V4L2_CID_LINK_FREQ alone, or with fallback to V4L2_CID_PIXEL_RATE if
>>> V4L2_CID_LINK_FREQ is not implemented). The bigger issue is that
>>> V4L2_CID_PIXEL_RATE was intended to give the rate at which pixels are
>>> transmitted (e.g. over CSI-2 link), while it is also seems to be used for
>>> the sampling rate in the pixel array. The problem is that these two rates
>>> are different things, and may have different values.
>>
>> The PIXEL_RATE control indeed has signified, well, the pixel rate, and
>> pixel rate may be different things depending on where it is found.
>>
>> The original use has been both on pixel matrix as well as on the
>> CSI-2 transmitter but of course this is a problem if the two are the same
>> sub-device.
>>
>>>
>>> The proposal is to repurpose V4L2_CID_PIXEL_RATE to report the sampling
>>> rate in the pixel array, and to calculate the symbol rate at which pixels
>>> are transmitted over the link from V4L2_CID_LINK_FREQ value. The receiver
>>> drivers currently using V4L2_CID_PIXEL_RATE to get the link frequency can
>>> be switched to use the existing v4l2_get_link_rate() helper. We also need
>>> to push the sensor drivers to implement V4L2_CID_LINK_FREQ, as quite a
>>> few of them do V4L2_CID_PIXEL_RATE only.
>>
>> Indeed. That has been the idea for some time actually, but first all the
>> receiver drivers need to be converted to use LINK_FREQ. This is easiest
>> done by using the wrapper the ipu3-cio2 driver already uses as it still
>> works even if the sensor driver only implemented PIXEL_RATE.
>>
>>>
>>> I am not sure about the userspace cases, but guess that the userspace is
>>> much more interested in frames per second and exposure values than in
>>> link details. So it would rather use V4L2_CID_PIXEL_RATE for the sampling
>>> rate in the pixel array anyway.
>>
>> That's the case if the sensor driver exposes the rest of the configuration
>> as the device's native parameters (such as analogue crop rectangle and
>> horizontal and vertical blanking). The majority of drivers do not do that,
>> at least currently, but instead use SUBDEV_[GS]_FRAME_INTERVAL. This is not
>> a native interface for camera sensors, and it is not well suited for
>> conveying what other frame intervals are available.
>>
>>>
>>> More details below.
>>>
>>> 1. V4L2_CID_PIXEL_RATE vs V4L2_CID_LINK_FREQ.
>>> ---------------------------------------------
>>>
>>> According to [1]: - V4L2_CID_LINK_FREQ control can be used to get or to
>>> set the frequency of the bus between transmitter
>>>    (e.g. sensor) and receiver (e.g. RX phy on an SOC), This control is r/w
>>>    by default, but is often made read-only by the sensor drivers,
>>> - V4L2_CID_PIXEL_RATE control can be used to get pixel rate in the source pads of the subdev. This control
>>>    is read-only by default.
>>>
>>> [2] is even more explicit: - V4L2_CID_LINK_FREQ control tells the
>>> receiver driver the frequency (and not the symbol rate) of the link, -
>>> V4L2_CID_PIXEL_RATE control may be used by the receiver to obtain the
>>> pixel rate the transmitter uses.
>>>    If the link is the MIPI CSI-2 D-PHY one, the value of the
>>>    V4L2_CID_PIXEL_RATE is calculated as follows:
>>>      pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
>>> (*)
>>>
>>> [2] also requires the sensor driver connected through CSI-2 or parallel
>>> (BT.601 or BT.656) bus to implement V4L2_CID_LINK_FREQ control, and for
>>> raw sensors V4L2_CID_PIXEL_RATE is also said to be mandatory. Still only
>>> half of sensor drivers under driver/media/i2c in the current media tree
>>> have V4L2_CID_PIXEL_RATE support and even less implement
>>> V4L2_CID_LINK_FREQ control.
>>>
>>> (*) is valid for MIPI CSI-2 D-PHY only, but it is widely used by the
>>
>> Correct. The only driver just got support for CSI-2 C-PHY, so the
>> documentation needs to be adjusted, too. I actually recently sent a patch
>> to address that.
> 
> OT: not to deviate the conversation, but isn't the usage of
> v4l2_get_link_rate() in ipu3 ([8]) missing a / 2 to account for the
> CSI-2 DDR ? Anyway, back to the topic..

It looks like it is. v4l2_get_link_rate()'s 2nd and 3d args are just "mul"
and "div", so the 3d arg in ipu3 driver calling v4l2_get_link_rate()
should be "lanes * 2".

>>> receiver drivers to get CSI-2 link frequency from V4L2_CID_PIXEL_RATE
>>> [3], [4], [5], [6]. For other bus types link frequency can also be
>>> calculated from the pixel rate and some other parameters. There exists a
>>> helper function in drivers/media/v4l2-core/v4l2-common.c for that already
>>> [7]:
>>>    s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int
>>> mul, unsigned int div) which tries to get the link rate value using
>>> V4L2_CID_LINK_FREQ, and if it not supported by the sub-device, it tries
>>> V4L2_CID_PIXEL_RATE and calculates the link frequency from the pixel rate
>>> using the multiplier and the divider provided by the caller.
>>> Unfortunately only one driver [8] uses v4l2_get_link_rate(). [9]
>>> implements a similar approach (error handling is different) but on its
>>> own.
>>>
>>> [10] and [11] use V4L2_CID_LINK_FREQ directly.
>>>
>>> Only two drivers use V4L2_CID_PIXEL_RATE for something else than getting
>>> the link frequency [12], [13].
>>>
>>> So in most of the cases the receiver drivers need to know the link
>>> frequency. Often this link frequency is calculated from the pixel rate,
>>> but changing the drivers to use V4L2_CID_LINK_FREQ directly looks fairly
>>> easy.
> 
> I don't have much to add to what you and Sakari said here, and I can't
> not agree that the usage of the PIXEL_RATE to calculate LINK_FREQUENCY
> might be misleading. I would add the I never really got why
> LINK_FREQUENCY has to be menu control. It might make sense for
> mode-based sensor drivers, where for each known mode the link
> frequency can be pre-calculated, but for freely configurable sensors I
> don't actually see the point. Also, if I were to re-design this I
> would not use a control but rather add link frequency to the
> get_mbus_config() kAPI to be used during the transmitter/receiver
> subdevices setup phase.

IIRC Sakari was saying that the link frequency affects the EMI caused
by the device, and this limits the allowed range of values for link
frequency. I take it as passing the EMI tests is much easier if only
small set of fixed frequencies is allowed.

And I am not sure if having the link frequency freely configurable in
a wider continuous range would make the sensor driver significantly more
flexible (while e.g. full binning and crop support is a big advantage over
limited number of fixed resolution modes).

>>> 2. V4L2_CID_PIXEL_RATE: the rate at which pixels are transmitted, or the
>>> sampling rate in the pixel array?
>>> ----------------------------------------------------------------------------------------------------------
>>>
>>> Let's start from the example: "imx219 8-bit raw modes are broken for
>>> camss, the 8MP@15fps one included".
>>>
>>> The imx219 driver supports only 2 data lanes. The link frequency is fixed
>>> at 456MHz. At 8MP the fps is 15, which the driver refers to as 8MP@15fps
>>> mode.
>>>
>>> Originally the driver supported 10-bit raw format only, so the pixel rate
>>> was:
>>>
>>>    IMX219_pixel_rate = IMX219_link_freq * 2 * nr_of_lanes /
>>>                        bits_per_sample = 456 * 2 * 2 / 10 = 182.4 Mpix/sec
>>>
>>> The line length (IMX219_PPL_DEFAULT) is set to 3448 (h blanking
>>> included), the frame length in this mode (IMX219_VTS_15FPS) is 3526 (v
>>> blanking included). Then
>>>
>>>    IMX219_frame_rate_8MP = IMX219_pixel_rate / IMX219_PPL_DEFAULT /
>>>                            IMX219_VTS_15FPS = 182400000 / 3448 / 3526 =
>>>                            15.003 Hz - OK, as
>>> expected.
>>>
>>> The value for read-only V4L2_CID_HBLANK control is calculated as: hblank
>>>          = IMX219_PPL_DEFAULT - mode->width; - and can only change
>>> as the result of switching the modes.
>>>
>>> Then 8-bit raw format was added. And it was done such that switching
>>> between 10 and 8 bits affects the output data domain only - the pixel
>>> read domain continues to work just as before:
>>>    - the number of bits per sample to read from the FIFO is set to 8 or 10
>>>      (there is a FIFO between the "pixel read" and the "MIPI data output"
>>>    halves of the sensor) - the divider for the "read from the FIFO" clock
>>>    is set to 8 or 10 - this clock is 91.2 MHz for 10 bits
>>>      and 114 MHz for 8 bits. So that the link frequency remains the same.
>>>
>>> The important thing to note is that the clock at which the samples are
>>> written to the FIFO remains at 91.2 MHz for both 10 and 8 bits.
>>>
>>> V4L2_CID_PIXEL_RATE control handling was not changed - its value is
>>> always reported as 182.4 Mpix/sec. This immediately broke the receivers
>>> which use V4L2_CID_PIXEL_RATE to configure their phy - e.g. capturing in
>>> 8 bit modes doesn't work on Qualcomm boards using camss driver.
>>>
>>> So my first impression was that this is a bug in the imx219 driver. But
>>> in fact this is a more generic API problem: if we update
>>> V4L2_CID_PIXEL_RATE to fix the issue with the drivers calculating the
>>> link frequency from it, from the equation below [14]:
>>>
>>>    frame interval = (analogue crop width + horizontal blanking) *
>>>                   (analogue crop height + vertical blanking) / pixel_rate
>>> (**)
>>>
>>> - we would see (if we treat the h blanking as it is treated in imx219
>>> driver) that the fps changed from 15 to 18.75 after switching from 10-bit
>>> to 8-bit raw format. While in fact the fps is 15 in the both cases. If we
>>> changed camss to use V4L2_CID_LINK_FREQ (not changed between 8 and 10
>>> bits in this case), and repurposed V4L2_CID_PIXEL_RATE to report the
>>> sampling rate in the pixel array (not changed between 8 and 10 bits in
>>> this case), then (**) would give the correct frame interval and 8-bit
>>> modes would work with camss driver just fine.
>>>
>>> As a summary, this issue happened because the equation (*) assumes that
>>> pixel_rate is the rate at which pixels are transmitted (belongs to the
>>> "MIPI data output" domain), while the imx219 driver and equation (**)
>>> assume that the pixel_rate is the sampling rate in the pixel array. And
>>> while in case of the imx219 driver these two (different by nature) rates
>>> are the same for 10-bit raw formats, for 8-bit raw formats the sampling
>>> rate in the pixel array is lower than the rate at which pixels are
>>> transmitted. Because switching from 10 to 8 bits reconfigures the "MIPI
>>> data output" domain *only*. And this implementation does make sense: this
>>> is quite natural for a user to see no change in fps and exposure (in
>>> absolute units, not in lines) when he/she decides to use more or less
>>> bits per pixel.
>>>
>>> (As a side note - different clocks for reading the pixels from the image
>>> array and for sending them out to MIPI transmitter is a documented
>>> feature of IMX219 sensor.)
>>>
>>> If we return to (**) again, as I see it, this equation makes sense in the
>>> "pixel sampling" domain only. And this is how it seems to be used in the
>>> camera sensor drivers. Also [15] does say "The unit of horizontal
>>> blanking is pixels" about V4L2_CID_HBLANK - this is way easier to work
>>> with in the "pixel sampling" domain. Even though h/v blanking is rather
>>> the notion of "MIPI data output" domain imho. So if we look at what is
>>> happening on the CSI link when imx219 driver switches from 10-bit row to
>>> 8-bit row, we will see the same link frequency, the increased symbol rate
>>> and hence the shorter time between packet header and packet footer
>>> followed by increased line blanking interval for the lines with pixel
>>> data. While V4L2_CID_PIXEL_RATE and V4L2_CID_HBLANK would report no
>>> changes at all (as current imx219 driver uses them as though they both
>>> belong to the "pixel sampling" domain).
> 
> Isn't this expected ?

Yes, this is expected.

By "h/v blanking is rather the notion of "MIPI data output" domain imho"
I just meant that V4L2_CID_HBLANK / V4L2_CID_VBLANK usually operate on
"Horizontal Total Size" (in pixels) / "Vertical Total Size" (in lines)
registers (the names vary between sensor families), there are no registers
which directly corresponded to this controls. Blanking is what
is usually shown on the MIPI CSI-2 timing diagrams instead.
For me V4L2_CID_[HV]BLANK-ing is rather a way to express how sampling is
done in the pixel array...

> The pixel rate being accessible to userspace is mostly useful to
> transform parameters expressed in abstract 'lines' (or 'pixels') such
> as the exposure time (or the horizontal blankings) to a wall clock
> time in some second sub-unit.
... and they perfectly fit this usage.

> Shouldn't they be expressed in the
> 'pixel sampling' domain then

Yes, they should.

> and let the CSI-2 transmitter adjust them
> to respect the frame rate/link frequency ratio ? (in my mental picture
> I'm missing where that adjustement happens though, and I assume it's
> encoded in some part of the mode registers list)

To my understanding (as long as we are looking at the streaming phase only)
the CSI transmitter and receiver don't care much of what is happening
between FrameEnd and FrameStart (frame blanking) and between the packet
footer and the packet header (line blanking). The CSI receiver does need
to know the link frequency to set its clock high enough, and to tune the
delays (or something - I am not an expert there), and that's it.

>>> And again, if the rate at which pixels are transmitted and the sampling
>>> rate in the pixel array are the same, the "pixel sampling" domain and the
>>> "data out" domain are no difference.
>>
>> Over the past 15 years, a lot of different camera sensor drivers have been
>> merged. The capabilities and interfaces exposed by the drivers have changed
>> a little over time and also sensor's capabilities and the driver writer's
>> use cases have had an effect on the interfaces the drivers implement. The
>> APIs have remained the same, while at the same time they haven't been
>> exactly a perfect match for the capabilities of the register list based
>> drivers.
>>
>> So with that background, it's perhaps not surprising that in some areas
>> there's variation in how the subdev API is being used by the drivers.
>>
>> If there's a desire to improve this, it means changing the user space
>> interface of a number of drivers. I don't know how they are being used
>> currently. Removing a control from a driver or changing its semantics does
>> have some potential for breaking user space.
>>
>> If changes in the interface end up being done, they should be compatible
>> the goal of providing all the necessary information on sensor configuration
>> to the user space, not just the pixel rate in the pixel array. This
>> includes analogue crop rectangle, binning (and subsampling), scaling and
>> digital crop configurations. Selecting the actual configuration would still
>> be based on the source pad of the sub-device representing the sensor's
>> transmitter. This means often implementing more sub-devices, in many cases
>> the same way the CCS driver does already.
> 
> libcamera is actually struggling with the same questions. So far we
> got away using the selection API to retrieve the analogue crop size
> and other information on the pixel array, but when it's about how to
> convey other parameters, such as the subsampling mode in use, the
> current API fall shorts. One use case for sub-sampling is to estimate
> the FOV and make it possible to identify 'modes' that have the same
> FOV but might be faster to transmit (higher frame rate).
> 
> Digital scalers could be instead worked around by using multiple
> subdevs and make the scaling step explicit between pads of different
> entities, that's my understanding at least.
> 
> Ideally, with multiple subdevices in place, and an opportune usage of
> selection targets those information might be made available with the
> current API probably, by mapping the analogue crop rectangle and the
> sub-sampling to the TGT_CROP and TGT_COMPOSE target of a dedicated
> sub-devices. Digital scalers would require yet another sudbdev..

Yes, splitting the camera sensors into multiple subdevices sounds
promising. To look how this is implemented in the ccs driver and how
this approach could be used for other camera sensor drivers is in
my todo list.

>> I'm also not sure it's worth changing drivers that already use
>> SUBDEV_[GS]_FRAME_INTERVAL; they're so far from the target and are most
>> likely for older hardware. The more obvious target are drivers that already
>> expose the blanking controls.
>>
>> This is what I could think of to remedy the problems:
>>
>> 1. Make all receiver drivers use LINK_FREQ instead of PIXEL_RATE.
> 
> could using a kAPI to convey the link frequency make the transition
> less painful? so that if there's any userspace component that relies
> on the LINK_FREQUENCY control we don't break it ?

The LINK_FREQUENCY control would not change (unless it would be replaced
with kAPI). This is PIXEL_RATE control which behavior might change for
some camera sensor drivers.
If PIXEL_RATE implementation in the sensor driver is correct, and the sensor
driver doesn't use different rates to read the pixels from the image array
and to send them over the CSI-2 link, there should be no breakage at all
(as far as I can see).

>> 2. Remove PIXEL_RATE from sensor drivers in places where it is used to
>> convey the pixel rate on the data bus.

- and replace it with LINK_FREQUENCY (quite some sensor drivers implement
PIXEL_RATE only)

>> Steps from this onward may be
>> implemented one driver at a time.
>>
>> 3. Add back the pixel rate control that represents the pixel rate in the
>> pixel array. The blanking controls need to be aligned with the analogue
>> crop size.
>>
>> 4. Implement more sub-devices to convey the sensor's current configuration
>> to the user, including analogue crop, binning, scaling and digital crop.
>>
>> There's a chance of breaking something in the user space from 2. onwards.
>>
>> If you skip the 4. step, the frame rate configuration could work but the
>> rest of the sensor configuration (cropping, binning, scaling etc.) would
>> remain unknown to the user space.
>>
>> The above does not address selection of modes in register list based
>> drivers. It would be nice to have a solution for that, too, but the general
>> issue is that it does not fit to the model V4L2 has --- considering all the
>> configurations independent. They are that on hardware level but register
>> list based drivers do not configure them like that.
>>
>> Any thoughts, opinions, comments etc. on this are very welcome.
>>
> 
> Let me point you to the libcamera component that
> handles camera sensors and which is currently limited to use a few
> selection targets and a few controls. Ideally, if we grow the
> two side together to support more complex use cases, it provides a
> place where to test any new/repurposed API.

Yes, the both sides would benefit from that.

> https://git.linuxtv.org/libcamera.git/tree/src/libcamera/camera_sensor.cpp#n666
> https://git.linuxtv.org/libcamera.git/tree/Documentation/sensor_driver_requirements.rst

Noted, thanks!

> Thanks
>     j

Thanks,
Andrey

>> Cc also Hans and Mauro.
>>
>> --
>> Kind regards,
>>
>> Sakari Ailus
>>
