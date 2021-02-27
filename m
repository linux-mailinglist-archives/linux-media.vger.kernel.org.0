Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C80326C08
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 07:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhB0GzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Feb 2021 01:55:04 -0500
Received: from mout02.posteo.de ([185.67.36.66]:58599 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229846AbhB0GzD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Feb 2021 01:55:03 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 6D6E62400FB
        for <linux-media@vger.kernel.org>; Sat, 27 Feb 2021 07:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1614408844; bh=ufZtowbQ37jG8EMPFWVgAZriSg9D93PLAd53zqxaNFw=;
        h=Date:From:To:Cc:Subject:From;
        b=qYkGr640aoNlqCslFfJHvgxGpotfk9ssCKK3mANnQkTlrpRsq+J8PskA4mpx0i+uk
         x9xrLkRErj9DPSB+qFUV4TXDyoN8FvFg7lgG6lbEFIoy2mEfGDiGVoULV1e77WmuHB
         GmzI8nPx7OtL4CjVhHGR8l2nakbUqwob1QmhXVuPPkj3U+q1QJHdxyK3+XUvtWJjLj
         Vh50mH7weJ8xDaW4NvU9NQH5m2394MxUs64VfCOU4ZSuP6Aqz8L9I+7wAGepF4geuw
         4DMNjvERmztCNuzFeOJR8XYZjoNjw+E0wwNNwcH9EaTf8NH0dN8vnclkBA1vD+ps4L
         XdvLSUh7NoB6A==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Dncgv5nQFz6tmF;
        Sat, 27 Feb 2021 07:54:03 +0100 (CET)
Date:   Sat, 27 Feb 2021 07:54:03 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        dafna.hirschfeld@collabora.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH 0/1] OV13850 image sensor driver
Message-ID: <20210227065403.r7x2me4l7wlyu2nw@basti-TUXEDO-Book-XA1510>
References: <20210130182313.32903-1-sebastian.fricke@posteo.net>
 <eef6095e-a395-611d-5491-822366d8851b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <eef6095e-a395-611d-5491-822366d8851b@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Andrey,

Thank you for your review and sorry for taking ages to give feedback to
your review, I had a lot of other tasks flying in, and additionally your
question about the Bayer pattern order required some analysis from my
side more about this below.

On 01.02.2021 14:56, Andrey Konovalov wrote:
>Hi Sebastian,
>
>Thank you for your patch!
>
>I only have a few generic comments at the moment.
>
>It looks like the DT bindings (together with the MAINTAINERS changes) should be a separate
>patch in the patchset.

Yes, I will definitly do this, I wanted to show where I am currently at
with this first patch and I will clean this up in the next patch.

>
>ov13850_g_frame_interval() should be dropped - you have the blanking controls already:
>https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/camera-sensor.html?#frame-interval-configuration

Thank you for the resource and thanks for the hint, I will address this
in the next version.

>
>I've checked the Rockchip BSP kernel from which you ported this driver from, and it is fixed to use
>2 data lanes only too.
>This puzzles me, as CAM1320 module, NanoPi M4, NanoPC-T4 - they all have 4-lane interfaces...
>It's OK to have only 2 lanes supported in the this patchset though.

I will address this in a future version, for now I would like to have
the clean basic version.

>
>Couple more comments below.
>
>On 30.01.2021 21:23, Sebastian Fricke wrote:
>>Hello,
>>
>>I would like to start a discussion about how I should proceed with the OV13850 driver, which I ported from the Rockchip BSP kernel [1], added new features, and started to refactor. My goal is to merge the driver with the upstream kernel and I would like to maintain it as well.
>>One of the biggest problems that I am currently facing is the lack of information from Omnivision, I have requested a datasheet but was just brushed aside, as I don't provide enough financial incentive for them :(.
>>
>>This means there is a list of registers, that I found in the downstream driver, that I cannot locate on the leaked datasheet [2]. I don't have too many experiences in reverse-engineering and so before I spend too much time guessing what these registers do, I thought I might ask here for advice. This is also the major reason for this driver still being register list based, I would really like to change that as register list based drivers feel like big black boxes, especially when access to data-sheets is restricted.
>>
>>My ultimate goal for this driver would be to switch to register maps instead of raw i2c access, to change the driver from a register list based driver to a freely configurable sensor driver,
>
>That would be great!
>I've take a very quick look at the datasheet you've used, and at first 
>glance getting rid of the fixed modes is doable (e.g. as a follow up 
>patch set).

The current code takes a different register list for the two modes and I
found out that a lot of those registers care about the crop location and
size. But there is a set of register 0x37* & 0x38* & 0x40* & 0x54*
(total 15 registers per mode), that are unknown to me as they are not
declared in the data-sheet. Both modes use completely different values
for those registers, so my current thought was: "I guess I can only get
rid of the fixed modes once I know what those registers do.". But I
might be wrong and maybe I can make a subset of those registers freely
configurable. Still, as you said already, this will probably be a future
patch set.

>
>>figure out what the unknown registers do, and drop everything that is not required, and overall improve the driver to correspond with the latest kernel APIs.
>>
>>Here is a list of things that I currently adjusted:
>>- Label all registers, that are located on the data-sheet in order to make the code more descriptive on its own
>>- Add the get_selection subdev IOCTL
>>- Enable event handling
>>- Add controls for toggling horizontal mirror and vertical flip
>
>Quick question: does this sensor changes the output Bayer order on these flips?
>E.g. this is the case for imx219:
>https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/imx219.c#n646
>But there exist other sensors for which the Bayer order doesn't change
>on [hv]flips.

I thought quite a bit about this question and I've written about my
analysis and thought process here: https://sebastianfricke.me/effects-of-image-mirroring-on-bayer-pattern-order/

In the end, I was still not entirely sure and maybe you can provide me
further hints as I have not worked too much with raw videos before.
With my current point of view, I believe that the order does not change,
then again as written in my analysis the data-sheet is not really clear
about this point and the sentence in the flip section leads more to the
conclusion that the order does change.

>
>>- Remove the Rockchip camera module header file, that was used to add further information about the camera in the device tree, as well user-configurations for AWB. I removed this feature after comparing my driver to multiple drivers and none of the others used a similar mechanism.
>>- Remove multiple if-guards around code blocks, this change was again inspired by the comparison to other drivers
>>
>>There are a few things, that I have not been able to test so far, because I lack the proper hardware:
>>- The full-resolution 4224x3136 as the platform I am working on (rkisp1) only permits resolutions until: 4032x3024
>>- The r2a register list as my device only fits to r1a
>>
>>And here is a list of questions, where I hope to find an answer here:
>>- The datasheet mentions that the FORMAT_0 register can be set to `vbin` and `vbinf`, what does the `f` mean? I have already searched for acronymns but couldn't find anything.
>>- The datasheet mentions a few registers to configure the white balance manually, I played around with these but couldn't see any visual difference. Does that automatically mean that the datasheet doesn't match the device or is there maybe another mechanism that overwrites my changes? [2] (section 5-9)
>>
>>[1] - https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/drivers/media/i2c/ov13850.c
>>[2] - http://download.tfirefly.com/product/RK3288/Docs/Peripherals/OV13850%20datasheet/Sensor_OV13850-G04A_OmniVision_SpecificationV1.pdf
>>
>>By the way, if anyone is interested, I write about my progress with the driver here: https://sebastianfricke.me/porting-the-ov13850-camera/
>
>Thanks! This looks quite useful!

Great good to hear, I will extend it further with the new features I add
and problems that I encounter.

>
>
>Thanks,
>Andrey

Thank you

Sebastian

>
>>Sebastian Fricke (1):
>>   media: i2c: OV13850 image sensor support
>>
>>  .../bindings/media/i2c/ovti,ov13850.yaml      |  125 ++
>>  MAINTAINERS                                   |    8 +
>>  drivers/media/i2c/Kconfig                     |   12 +
>>  drivers/media/i2c/Makefile                    |    1 +
>>  drivers/media/i2c/ov13850.c                   | 1774 +++++++++++++++++
>>  5 files changed, 1920 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13850.yaml
>>  create mode 100644 drivers/media/i2c/ov13850.c
>>
