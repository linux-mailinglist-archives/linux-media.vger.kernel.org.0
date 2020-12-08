Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7062D2A5E
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 13:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbgLHMKK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 07:10:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729329AbgLHMKJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 07:10:09 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07641C061793
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 04:09:29 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id j10so18852523lja.5
        for <linux-media@vger.kernel.org>; Tue, 08 Dec 2020 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=fauBAgamrQMOxQgbSVY8UxSMJWrrp7YgQ6p2jYhVvJ0=;
        b=MO5u16nTzTkAvusymFKoNxL73ymfk4WiCzxEbxrH4NikvQGzftNbdVMIXIr6lgISKx
         lSo9uy0c6hQL+pYcGsAXlOM6g9EtflnpND6pVRF56I/QenE6PXYqmD1xQSNlELj94QQ4
         ThSDfa9/1itYRU9woeSwJlcOq2hNyYG4E9wYV+ZHQc1Rlvy9A/EExiuDqGs7s1HAuwWK
         fWpsfOsUgxhLTBUzHepkAwsCMVjx28wNzrGlmlkz69CEzdS5GKNtjq6dKfGFMsICLNQ8
         JILZBz3iI022UuemjiZ4ECuoGHgelkgl4ya/WDvjZSoOynXZzem4evC5WrZgOzZu8uNI
         Y5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=fauBAgamrQMOxQgbSVY8UxSMJWrrp7YgQ6p2jYhVvJ0=;
        b=pil27L0lnOJYxEoRfslsbfdWFLojcf4sza+J0W4aoEefwkuW+AZiVLW6CmizgdUU8u
         erZwneZH1WiNI6fGwO95hOH270Zs9cY0xo/+gwK39POoT+hHEj1RNDHizKB/HNT0jG/m
         jNT1ht/ioAsF2HBO63jKpKX1n39nfB8TVsjYSAe7VKhKxlKbPe/0sxTT+SWJtovGBciq
         XNtbdSZr82/xRxYHKtk8Nnelz6yS0NDseQiT9dGoGeykJAZYo0WezOi8Z9nzpy7tUvzB
         rrYAR4skckAZrLAnpTGImeUY6e7dr2DgrE7sIgfLvVIkPuSyT+iXGG7XBTu5iF1ei4bx
         822w==
X-Gm-Message-State: AOAM5304zfFAuHPtsYy4Jqr58xEWIk7+AMHOMAw4A26AeVswMySXmptu
        FbRy6kFfrASd7HTlL7PL7B/c3w==
X-Google-Smtp-Source: ABdhPJzvVrE0YhA8YIp/zgciECXYUosX7W12i47/JCQxbNuOSBLIKa80x81cfrRum3pDjIigbcCFxw==
X-Received: by 2002:a2e:9ecd:: with SMTP id h13mr10489327ljk.238.1607429367332;
        Tue, 08 Dec 2020 04:09:27 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.75])
        by smtp.gmail.com with ESMTPSA id k3sm3153963lfm.226.2020.12.08.04.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 04:09:26 -0800 (PST)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        sakari.ailus@linux.intel.com,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [RFC] Repurpose V4L2_CID_PIXEL_RATE for the sampling rate in the
 pixel array
Cc:     tfiga@chromium.org, Robert Foss <robert.foss@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <3dac47ae-54c1-e719-191f-613a0fa5e0c1@linaro.org>
Date:   Tue, 8 Dec 2020 15:09:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

I was checking how V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ controls are documented and used in recent
media_tree kernel, and found that the current usage of V4L2_CID_PIXEL_RATE is not consistent.

This topic seems to be a bit wider, but I'll focus on camera sensors and the corresponding receivers.

Not only the receiver drivers often use V4L2_CID_PIXEL_RATE to calculate the link frequency from (this is
much more common than using V4L2_CID_LINK_FREQ alone, or with fallback to V4L2_CID_PIXEL_RATE if
V4L2_CID_LINK_FREQ is not implemented).
The bigger issue is that V4L2_CID_PIXEL_RATE was intended to give the rate at which pixels are transmitted
(e.g. over CSI-2 link), while it is also seems to be used for the sampling rate in the pixel array.
The problem is that these two rates are different things, and may have different values.

The proposal is to repurpose V4L2_CID_PIXEL_RATE to report the sampling rate in the pixel array, and to
calculate the symbol rate at which pixels are transmitted over the link from V4L2_CID_LINK_FREQ value.
The receiver drivers currently using V4L2_CID_PIXEL_RATE to get the link frequency can be switched to use
the existing v4l2_get_link_rate() helper. We also need to push the sensor drivers to implement
V4L2_CID_LINK_FREQ, as quite a few of them do V4L2_CID_PIXEL_RATE only.

I am not sure about the userspace cases, but guess that the userspace is much more interested in frames
per second and exposure values than in link details. So it would rather use V4L2_CID_PIXEL_RATE for the
sampling rate in the pixel array anyway.

More details below.

1. V4L2_CID_PIXEL_RATE vs V4L2_CID_LINK_FREQ.
---------------------------------------------

According to [1]:
- V4L2_CID_LINK_FREQ control can be used to get or to set the frequency of the bus between transmitter
   (e.g. sensor) and receiver (e.g. RX phy on an SOC), This control is r/w by default, but is often made
   read-only by the sensor drivers,
- V4L2_CID_PIXEL_RATE control can be used to get pixel rate in the source pads of the subdev. This control
   is read-only by default.

[2] is even more explicit:
- V4L2_CID_LINK_FREQ control tells the receiver driver the frequency (and not the symbol rate) of the link,
- V4L2_CID_PIXEL_RATE control may be used by the receiver to obtain the pixel rate the transmitter uses.
   If the link is the MIPI CSI-2 D-PHY one, the value of the V4L2_CID_PIXEL_RATE
   is calculated as follows:
     pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample		(*)

[2] also requires the sensor driver connected through CSI-2 or parallel (BT.601 or BT.656) bus to implement
V4L2_CID_LINK_FREQ control, and for raw sensors V4L2_CID_PIXEL_RATE is also said to be mandatory.
Still only half of sensor drivers under driver/media/i2c in the current media tree have V4L2_CID_PIXEL_RATE
support and even less implement V4L2_CID_LINK_FREQ control.

(*) is valid for MIPI CSI-2 D-PHY only, but it is widely used by the receiver drivers to get CSI-2 link
frequency from V4L2_CID_PIXEL_RATE [3], [4], [5], [6].
For other bus types link frequency can also be calculated from the pixel rate and some other parameters.
There exists a helper function in drivers/media/v4l2-core/v4l2-common.c for that already [7]:
   s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int mul, unsigned int div)
which tries to get the link rate value using V4L2_CID_LINK_FREQ, and if it not supported by the sub-device,
it tries V4L2_CID_PIXEL_RATE and calculates the link frequency from the pixel rate using the multiplier and
the divider provided by the caller.
Unfortunately only one driver [8] uses v4l2_get_link_rate(). [9] implements a similar approach (error
handling is different) but on its own.

[10] and [11] use V4L2_CID_LINK_FREQ directly.

Only two drivers use V4L2_CID_PIXEL_RATE for something else than getting the link frequency [12], [13].

So in most of the cases the receiver drivers need to know the link frequency.
Often this link frequency is calculated from the pixel rate, but changing the drivers to use
V4L2_CID_LINK_FREQ directly looks fairly easy.


2. V4L2_CID_PIXEL_RATE: the rate at which pixels are transmitted, or the sampling rate in the pixel array?
----------------------------------------------------------------------------------------------------------

Let's start from the example: "imx219 8-bit raw modes are broken for camss, the 8MP@15fps one included".

The imx219 driver supports only 2 data lanes.
The link frequency is fixed at 456MHz.
At 8MP the fps is 15, which the driver refers to as 8MP@15fps mode.

Originally the driver supported 10-bit raw format only, so the pixel rate was:

   IMX219_pixel_rate = IMX219_link_freq * 2 * nr_of_lanes / bits_per_sample =
                       456 * 2 * 2 / 10 = 182.4 Mpix/sec

The line length (IMX219_PPL_DEFAULT) is set to 3448 (h blanking included), the frame length in this
mode (IMX219_VTS_15FPS) is 3526 (v blanking included). Then

   IMX219_frame_rate_8MP = IMX219_pixel_rate / IMX219_PPL_DEFAULT / IMX219_VTS_15FPS =
                           182400000 / 3448 / 3526 = 15.003 Hz
- OK, as expected.

The value for read-only V4L2_CID_HBLANK control is calculated as:
         hblank = IMX219_PPL_DEFAULT - mode->width;
- and can only change as the result of switching the modes.

Then 8-bit raw format was added. And it was done such that switching between 10 and 8 bits affects the
output data domain only - the pixel read domain continues to work just as before:
   - the number of bits per sample to read from the FIFO is set to 8 or 10
     (there is a FIFO between the "pixel read" and the "MIPI data output" halves of the sensor)
   - the divider for the "read from the FIFO" clock is set to 8 or 10 - this clock is 91.2 MHz for 10 bits
     and 114 MHz for 8 bits. So that the link frequency remains the same.

The important thing to note is that the clock at which the samples are written
to the FIFO remains at 91.2 MHz for both 10 and 8 bits.

V4L2_CID_PIXEL_RATE control handling was not changed - its value is always reported as 182.4 Mpix/sec.
This immediately broke the receivers which use V4L2_CID_PIXEL_RATE to configure their phy -
e.g. capturing in 8 bit modes doesn't work on Qualcomm boards using camss driver.

So my first impression was that this is a bug in the imx219 driver. But in fact this is a more generic
API problem: if we update V4L2_CID_PIXEL_RATE to fix the issue with the drivers calculating the link
frequency from it, from the equation below [14]:

   frame interval = (analogue crop width + horizontal blanking) *
                  (analogue crop height + vertical blanking) / pixel_rate	(**)

- we would see (if we treat the h blanking as it is treated in imx219 driver) that the fps
changed from 15 to 18.75 after switching from 10-bit to 8-bit raw format.
While in fact the fps is 15 in the both cases. If we changed camss to use V4L2_CID_LINK_FREQ (not
changed between 8 and 10 bits in this case), and repurposed V4L2_CID_PIXEL_RATE to report the sampling
rate in the pixel array (not changed between 8 and 10 bits in this case), then (**) would give
the correct frame interval and 8-bit modes would work with camss driver just fine.

As a summary, this issue happened because the equation (*) assumes that pixel_rate is the rate at
which pixels are transmitted (belongs to the "MIPI data output" domain), while the imx219 driver
and equation (**) assume that the pixel_rate is the sampling rate in the pixel array. And while
in case of the imx219 driver these two (different by nature) rates are the same for 10-bit raw
formats, for 8-bit raw formats the sampling rate in the pixel array is lower than the rate at
which pixels are transmitted. Because switching from 10 to 8 bits reconfigures the "MIPI data output"
domain *only*. And this implementation does make sense: this is quite natural for a user to see
no change in fps and exposure (in absolute units, not in lines) when he/she decides to use more
or less bits per pixel.

(As a side note - different clocks for reading the pixels from the image array and for sending them
out to MIPI transmitter is a documented feature of IMX219 sensor.)

If we return to (**) again, as I see it, this equation makes sense in the "pixel sampling" domain only.
And this is how it seems to be used in the camera sensor drivers. Also [15] does say "The unit of horizontal
blanking is pixels" about V4L2_CID_HBLANK - this is way easier to work with in the "pixel sampling" domain.
Even though h/v blanking is rather the notion of "MIPI data output" domain imho. So if we look at what
is happening on the CSI link when imx219 driver switches from 10-bit row to 8-bit row, we will see the
same link frequency, the increased symbol rate and hence the shorter time between packet header and packet
footer followed by increased line blanking interval for the lines with pixel data. While V4L2_CID_PIXEL_RATE
and V4L2_CID_HBLANK would report no changes at all (as current imx219 driver uses them as though they both
belong to the "pixel sampling" domain).

And again, if the rate at which pixels are transmitted and the sampling rate in the pixel array are the same,
the "pixel sampling" domain and the "data out" domain are no difference.


Thanks,
Andrey


[1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/ext-ctrls-image-process.html
[2] https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/csi2.html?#transmitter-drivers
[3] drivers/media/platform/ti-vpe/cal-camerarx.c
[4] drivers/staging/media/omap4iss/
[5] drivers/media/platform/rcar-vin/rcar-csi2.c
[6] drivers/media/platform/qcom/camss/camss-csiphy.c
[7] https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-common.html#c.v4l2_get_link_rate
[8] drivers/media/pci/intel/ipu3/ipu3-cio2.c
[9] drivers/media/i2c/st-mipid02.c
[10] drivers/staging/media/imx/imx6-mipi-csi2.c
[11] drivers/staging/media/atomisp/pci/
[12] drivers/media/platform/omap3isp/ispvideo.c
[13] drivers/staging/media/tegra-video/csi.c
[14] https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/camera-sensor.html?#raw-camera-sensors
[15] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/ext-ctrls-image-source.html
