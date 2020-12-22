Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E272E1018
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 23:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgLVWYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 17:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgLVWYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 17:24:37 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142A2C0613D3
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 14:23:57 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id y19so35435183lfa.13
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 14:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=36Vta6G2ociO5p9XdEUKuEfMeMzjCogIcT7BOZoRCM0=;
        b=At1LvZWxg0o997JyWsjc/U/3LRi+VRfU4uoxZrEXHfZoJPvnIbDQe8aMfWtful7vjj
         AUoVC2H5K/tZ2tukvoy0NjVd5gFHrs+JPcw+4XMmuEO3j5xs/GLvOEwNWSFByH11tID/
         +vY9cwrtQzpCCE22nC6Yne1h187X7r4M2Eb4hdjqnQemWL8q78Lea4fJQ+3k8WXarNbE
         G5Vc6/uarSS0bUdo9XhWoNfd17Lk37+f7000j4ty6iR2j7D2C9a/N80P7XBiHneEgA/2
         WQsdnQdp3jppWNEgAiwC6DXh/UE1ZdHBF+sljW/6KMzMA+8F18ehG7xMdHs1fpOPAf7K
         pXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=36Vta6G2ociO5p9XdEUKuEfMeMzjCogIcT7BOZoRCM0=;
        b=exh6wRP2qsIvyeqVfHegeXyEX7m0SKS+U/PrViTZ59nTkFF0+c6YOQW7ZH1bYoPaUV
         n/+nuROVHNb1L/Iv7m9NLYyQ8FnwJSKE5I1yKuDA8YZMnrOcLs0LRur1GWn/aKwde0R4
         mexMBsTHND/OoYhRhi3N/0VO7/0tO6FzIBnE8WZXdtwA49REuduZvqb4uC+1FjTlDKM6
         BZ3DtpZNl8pRIgGZhpL2gOYoy9gOZzxSYGJeayqq5OHOR6Nt8mhXFi0WTYs7GEK6udIM
         RBxbyupfhQ4nARSoTnLVcLPwkZf+HMwFGMumQu+9yEa0ZDLG8qSmCViOyf3CUgo9XkjV
         LMvg==
X-Gm-Message-State: AOAM533oELOyslrAWIBQp7lVwqqcgZgpnGn6BM3/37br4Xcow0jYtxRn
        Qa//6O/nZAFe5LzmJE/3uRnQsg==
X-Google-Smtp-Source: ABdhPJyIQNoCQzLNFup6EWPg09Ve7ZlD7oRVzo3E62Nu4pDr+woWs9S74JJrLezzW92xLWFATbbz5g==
X-Received: by 2002:a2e:b5b5:: with SMTP id f21mr4324665ljn.239.1608675835385;
        Tue, 22 Dec 2020 14:23:55 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id k2sm2839695lfo.256.2020.12.22.14.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 14:23:54 -0800 (PST)
Subject: Re: [RFC] Repurpose V4L2_CID_PIXEL_RATE for the sampling rate in the
 pixel array
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        tfiga@chromium.org, Robert Foss <robert.foss@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil@xs4all.nl
References: <3dac47ae-54c1-e719-191f-613a0fa5e0c1@linaro.org>
 <20201221114538.GM26370@paasikivi.fi.intel.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <e972029e-6ffd-a9b4-8e47-23ab3ccb9896@linaro.org>
Date:   Wed, 23 Dec 2020 01:23:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201221114538.GM26370@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for your feedback!

On 21.12.2020 14:45, Sakari Ailus wrote:
> Hi Andrey,
> 
> Thanks for your e-mail.
> 
> Could you wrap the lines before 80 characters? It's a bit hard to read...
> 
> On Tue, Dec 08, 2020 at 03:09:25PM +0300, Andrey Konovalov wrote:
>> Greetings,
>>
>> I was checking how V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ controls
>> are documented and used in recent media_tree kernel, and found that the
>> current usage of V4L2_CID_PIXEL_RATE is not consistent.
>>
>> This topic seems to be a bit wider, but I'll focus on camera sensors and
>> the corresponding receivers.
>>
>> Not only the receiver drivers often use V4L2_CID_PIXEL_RATE to calculate
>> the link frequency from (this is much more common than using
>> V4L2_CID_LINK_FREQ alone, or with fallback to V4L2_CID_PIXEL_RATE if
>> V4L2_CID_LINK_FREQ is not implemented). The bigger issue is that
>> V4L2_CID_PIXEL_RATE was intended to give the rate at which pixels are
>> transmitted (e.g. over CSI-2 link), while it is also seems to be used for
>> the sampling rate in the pixel array. The problem is that these two rates
>> are different things, and may have different values.
> 
> The PIXEL_RATE control indeed has signified, well, the pixel rate, and
> pixel rate may be different things depending on where it is found.
> 
> The original use has been both on pixel matrix as well as on the
> CSI-2 transmitter but of course this is a problem if the two are the same
> sub-device.

OK, I see.
I am very used to the "two are the same sub-device" case, but this is not
the only option indeed.

>> The proposal is to repurpose V4L2_CID_PIXEL_RATE to report the sampling
>> rate in the pixel array, and to calculate the symbol rate at which pixels
>> are transmitted over the link from V4L2_CID_LINK_FREQ value. The receiver
>> drivers currently using V4L2_CID_PIXEL_RATE to get the link frequency can
>> be switched to use the existing v4l2_get_link_rate() helper. We also need
>> to push the sensor drivers to implement V4L2_CID_LINK_FREQ, as quite a
>> few of them do V4L2_CID_PIXEL_RATE only.
> 
> Indeed. That has been the idea for some time actually, but first all the
> receiver drivers need to be converted to use LINK_FREQ. This is easiest
> done by using the wrapper the ipu3-cio2 driver already uses as it still
> works even if the sensor driver only implemented PIXEL_RATE.

Yes, v4l2_get_link_rate().

>> I am not sure about the userspace cases, but guess that the userspace is
>> much more interested in frames per second and exposure values than in
>> link details. So it would rather use V4L2_CID_PIXEL_RATE for the sampling
>> rate in the pixel array anyway.
> 
> That's the case if the sensor driver exposes the rest of the configuration
> as the device's native parameters (such as analogue crop rectangle and
> horizontal and vertical blanking).

These (analogue crop rectangle and horizontal and vertical blanking) are
in my plans too. (For some of the sensors I have access to and the datasheets
for.)

> The majority of drivers do not do that,
> at least currently, but instead use SUBDEV_[GS]_FRAME_INTERVAL. This is not
> a native interface for camera sensors, and it is not well suited for
> conveying what other frame intervals are available.
> 
>>
>> More details below.
>>
>> 1. V4L2_CID_PIXEL_RATE vs V4L2_CID_LINK_FREQ.
>> ---------------------------------------------
>>
>> According to [1]: - V4L2_CID_LINK_FREQ control can be used to get or to
>> set the frequency of the bus between transmitter
>>    (e.g. sensor) and receiver (e.g. RX phy on an SOC), This control is r/w
>>    by default, but is often made read-only by the sensor drivers,
>> - V4L2_CID_PIXEL_RATE control can be used to get pixel rate in the source pads of the subdev. This control
>>    is read-only by default.
>>
>> [2] is even more explicit: - V4L2_CID_LINK_FREQ control tells the
>> receiver driver the frequency (and not the symbol rate) of the link, -
>> V4L2_CID_PIXEL_RATE control may be used by the receiver to obtain the
>> pixel rate the transmitter uses.
>>    If the link is the MIPI CSI-2 D-PHY one, the value of the
>>    V4L2_CID_PIXEL_RATE is calculated as follows:
>>      pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
>> (*)
>>
>> [2] also requires the sensor driver connected through CSI-2 or parallel
>> (BT.601 or BT.656) bus to implement V4L2_CID_LINK_FREQ control, and for
>> raw sensors V4L2_CID_PIXEL_RATE is also said to be mandatory. Still only
>> half of sensor drivers under driver/media/i2c in the current media tree
>> have V4L2_CID_PIXEL_RATE support and even less implement
>> V4L2_CID_LINK_FREQ control.
>>
>> (*) is valid for MIPI CSI-2 D-PHY only, but it is widely used by the
> 
> Correct. The only driver just got support for CSI-2 C-PHY, so the
> documentation needs to be adjusted, too. I actually recently sent a patch
> to address that.

Nice, thanks!

>> receiver drivers to get CSI-2 link frequency from V4L2_CID_PIXEL_RATE
>> [3], [4], [5], [6]. For other bus types link frequency can also be
>> calculated from the pixel rate and some other parameters. There exists a
>> helper function in drivers/media/v4l2-core/v4l2-common.c for that already
>> [7]:
>>    s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int
>> mul, unsigned int div) which tries to get the link rate value using
>> V4L2_CID_LINK_FREQ, and if it not supported by the sub-device, it tries
>> V4L2_CID_PIXEL_RATE and calculates the link frequency from the pixel rate
>> using the multiplier and the divider provided by the caller.
>> Unfortunately only one driver [8] uses v4l2_get_link_rate(). [9]
>> implements a similar approach (error handling is different) but on its
>> own.
>>
>> [10] and [11] use V4L2_CID_LINK_FREQ directly.
>>
>> Only two drivers use V4L2_CID_PIXEL_RATE for something else than getting
>> the link frequency [12], [13].
>>
>> So in most of the cases the receiver drivers need to know the link
>> frequency. Often this link frequency is calculated from the pixel rate,
>> but changing the drivers to use V4L2_CID_LINK_FREQ directly looks fairly
>> easy.
>>
>>
>> 2. V4L2_CID_PIXEL_RATE: the rate at which pixels are transmitted, or the
>> sampling rate in the pixel array?
>> ----------------------------------------------------------------------------------------------------------
>>
>> Let's start from the example: "imx219 8-bit raw modes are broken for
>> camss, the 8MP@15fps one included".
>>
>> The imx219 driver supports only 2 data lanes. The link frequency is fixed
>> at 456MHz. At 8MP the fps is 15, which the driver refers to as 8MP@15fps
>> mode.
>>
>> Originally the driver supported 10-bit raw format only, so the pixel rate
>> was:
>>
>>    IMX219_pixel_rate = IMX219_link_freq * 2 * nr_of_lanes /
>>                        bits_per_sample = 456 * 2 * 2 / 10 = 182.4 Mpix/sec
>>
>> The line length (IMX219_PPL_DEFAULT) is set to 3448 (h blanking
>> included), the frame length in this mode (IMX219_VTS_15FPS) is 3526 (v
>> blanking included). Then
>>
>>    IMX219_frame_rate_8MP = IMX219_pixel_rate / IMX219_PPL_DEFAULT /
>>                            IMX219_VTS_15FPS = 182400000 / 3448 / 3526 =
>>                            15.003 Hz - OK, as
>> expected.
>>
>> The value for read-only V4L2_CID_HBLANK control is calculated as: hblank
>>          = IMX219_PPL_DEFAULT - mode->width; - and can only change
>> as the result of switching the modes.
>>
>> Then 8-bit raw format was added. And it was done such that switching
>> between 10 and 8 bits affects the output data domain only - the pixel
>> read domain continues to work just as before:
>>    - the number of bits per sample to read from the FIFO is set to 8 or 10
>>      (there is a FIFO between the "pixel read" and the "MIPI data output"
>>    halves of the sensor) - the divider for the "read from the FIFO" clock
>>    is set to 8 or 10 - this clock is 91.2 MHz for 10 bits
>>      and 114 MHz for 8 bits. So that the link frequency remains the same.
>>
>> The important thing to note is that the clock at which the samples are
>> written to the FIFO remains at 91.2 MHz for both 10 and 8 bits.
>>
>> V4L2_CID_PIXEL_RATE control handling was not changed - its value is
>> always reported as 182.4 Mpix/sec. This immediately broke the receivers
>> which use V4L2_CID_PIXEL_RATE to configure their phy - e.g. capturing in
>> 8 bit modes doesn't work on Qualcomm boards using camss driver.
>>
>> So my first impression was that this is a bug in the imx219 driver. But
>> in fact this is a more generic API problem: if we update
>> V4L2_CID_PIXEL_RATE to fix the issue with the drivers calculating the
>> link frequency from it, from the equation below [14]:
>>
>>    frame interval = (analogue crop width + horizontal blanking) *
>>                   (analogue crop height + vertical blanking) / pixel_rate
>> (**)
>>
>> - we would see (if we treat the h blanking as it is treated in imx219
>> driver) that the fps changed from 15 to 18.75 after switching from 10-bit
>> to 8-bit raw format. While in fact the fps is 15 in the both cases. If we
>> changed camss to use V4L2_CID_LINK_FREQ (not changed between 8 and 10
>> bits in this case), and repurposed V4L2_CID_PIXEL_RATE to report the
>> sampling rate in the pixel array (not changed between 8 and 10 bits in
>> this case), then (**) would give the correct frame interval and 8-bit
>> modes would work with camss driver just fine.
>>
>> As a summary, this issue happened because the equation (*) assumes that
>> pixel_rate is the rate at which pixels are transmitted (belongs to the
>> "MIPI data output" domain), while the imx219 driver and equation (**)
>> assume that the pixel_rate is the sampling rate in the pixel array. And
>> while in case of the imx219 driver these two (different by nature) rates
>> are the same for 10-bit raw formats, for 8-bit raw formats the sampling
>> rate in the pixel array is lower than the rate at which pixels are
>> transmitted. Because switching from 10 to 8 bits reconfigures the "MIPI
>> data output" domain *only*. And this implementation does make sense: this
>> is quite natural for a user to see no change in fps and exposure (in
>> absolute units, not in lines) when he/she decides to use more or less
>> bits per pixel.
>>
>> (As a side note - different clocks for reading the pixels from the image
>> array and for sending them out to MIPI transmitter is a documented
>> feature of IMX219 sensor.)
>>
>> If we return to (**) again, as I see it, this equation makes sense in the
>> "pixel sampling" domain only. And this is how it seems to be used in the
>> camera sensor drivers. Also [15] does say "The unit of horizontal
>> blanking is pixels" about V4L2_CID_HBLANK - this is way easier to work
>> with in the "pixel sampling" domain. Even though h/v blanking is rather
>> the notion of "MIPI data output" domain imho. So if we look at what is
>> happening on the CSI link when imx219 driver switches from 10-bit row to
>> 8-bit row, we will see the same link frequency, the increased symbol rate
>> and hence the shorter time between packet header and packet footer
>> followed by increased line blanking interval for the lines with pixel
>> data. While V4L2_CID_PIXEL_RATE and V4L2_CID_HBLANK would report no
>> changes at all (as current imx219 driver uses them as though they both
>> belong to the "pixel sampling" domain).
>>
>> And again, if the rate at which pixels are transmitted and the sampling
>> rate in the pixel array are the same, the "pixel sampling" domain and the
>> "data out" domain are no difference.
> 
> Over the past 15 years, a lot of different camera sensor drivers have been
> merged. The capabilities and interfaces exposed by the drivers have changed
> a little over time and also sensor's capabilities and the driver writer's
> use cases have had an effect on the interfaces the drivers implement. The
> APIs have remained the same, while at the same time they haven't been
> exactly a perfect match for the capabilities of the register list based
> drivers.
> 
> So with that background, it's perhaps not surprising that in some areas
> there's variation in how the subdev API is being used by the drivers.
> 
> If there's a desire to improve this, it means changing the user space
> interface of a number of drivers. I don't know how they are being used
> currently. Removing a control from a driver or changing its semantics does
> have some potential for breaking user space.

That's correct.

> If changes in the interface end up being done, they should be compatible
> the goal of providing all the necessary information on sensor configuration
> to the user space, not just the pixel rate in the pixel array. This
> includes analogue crop rectangle, binning (and subsampling), scaling and
> digital crop configurations. Selecting the actual configuration would still
> be based on the source pad of the sub-device representing the sensor's
> transmitter. This means often implementing more sub-devices, in many cases
> the same way the CCS driver does already.

Guess this worth trying on some of the drivers. To prove the concept, to
get an idea of how much extra efforts this adds when writing a new driver,
and to see how these efforts could be minimized.
It should better be done with a new driver (not to break the user space),
but changing a recently added driver not yet widely used might work too.

> I'm also not sure it's worth changing drivers that already use
> SUBDEV_[GS]_FRAME_INTERVAL; they're so far from the target and are most
> likely for older hardware. The more obvious target are drivers that already
> expose the blanking controls.

Leaving the SUBDEV_[GS]_FRAME_INTERVAL drivers alone sounds good for me.

> This is what I could think of to remedy the problems:
> 
> 1. Make all receiver drivers use LINK_FREQ instead of PIXEL_RATE.

I am going to do that for the camss driver anyway.
So I could add the other receiver drivers to the patchset, though I wouldn't
be able to test all or most of them except the camss.

> 2. Remove PIXEL_RATE from sensor drivers in places where it is used to
> convey the pixel rate on the data bus. Steps from this onward may be
> implemented one driver at a time.

Agreed. "One driver at a time" works the best for me.

> 3. Add back the pixel rate control that represents the pixel rate in the
> pixel array. The blanking controls need to be aligned with the analogue
> crop size.
> 
> 4. Implement more sub-devices to convey the sensor's current configuration
> to the user, including analogue crop, binning, scaling and digital crop.
> 
> There's a chance of breaking something in the user space from 2. onwards.
> 
> If you skip the 4. step, the frame rate configuration could work but the
> rest of the sensor configuration (cropping, binning, scaling etc.) would
> remain unknown to the user space.

For 2.-4. I could look at imx290 and ov8856 drivers first (I would have to
regardless of what is discussed in this mail thread).
Currently the both drivers use the same pixel rate on the data bus and in
the pixel array. So there is nothing crying to be fixed ASAP here.
Also for imx290 the PLL setup isn't documented in the datasheet
(just "write these 7 numbers into that 7 registers <period>") which leaves
no room for improvements. For ov8856 the situation looks better.
The both drivers have no cropping or binning support at all at the moment
(don't even report the default analogue crop rectangle) - this needs to
be addressed. (ov8856 is more interesting in this respect as it supports
binning plus both analogue, and digital crop. For imx290 digital crop can be
implemented, but analogue crop could probably not; binning isn't available.)
imx290 driver has quite some fixes in the RPi kernel tree, so the mainline
driver needs to sync up.

> The above does not address selection of modes in register list based
> drivers. It would be nice to have a solution for that, too, but the general
> issue is that it does not fit to the model V4L2 has --- considering all the
> configurations independent. They are that on hardware level but register
> list based drivers do not configure them like that.

Right. One side of the problem is that the sensor datasheets often force
people to implement register list based drivers by providing only partial
description of the hardware.

But there are register list drivers which support only one mode - hence
selection of modes is no problem.
E.g. imx334 driver being upstreamed now, and ov8856 driver.
The latter lists 4 modes currently, but 3280x2464 vs 3264x2448
and 1640x1232 vs 1632x1224 look like different settings for the same mode
(which is a bug imho; each pair should be merged into one mode), and the
16..x12.. ones are the 32..x24.. ones with binning (could be handled through
the selection API?).

> Any thoughts, opinions, comments etc. on this are very welcome.
> 
> Cc also Hans and Mauro.
> 

Thanks,
Andrey
