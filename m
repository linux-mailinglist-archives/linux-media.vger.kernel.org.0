Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D4830A6F5
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 12:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhBAL5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 06:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhBAL5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 06:57:22 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD50C06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 03:56:42 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id a12so22352080lfb.1
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 03:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lL1up+fr9orY+qHD7nEj6urF0rr0FBlK7Sa71iQpynU=;
        b=AWyVu75il2OIPEqDWBZ4Q03f6FgzbBjhy+CuCOnc8sySG1FPI3VWQKRADJiOX1qY//
         /R8bYe5acD+XzaFbk4d/sdSb4iYLD5bYqB98Vho50bXrwLtt5NyTNQWSS419Qin2PVMJ
         lKynyBDYahjH/kIuwdJDafk7u8E/f19jH8nmY5AhUg9Q/1HKIbABAR9J5aZFWx0ONSsG
         4FtwNr4DOEljEqRwjwa1RmOY4AjkvJe4ssHLpQxOF3aH+fL/OOKk36VGKTBBBJ84lJJ7
         18Mn3IQd5kuh8iw8sNCChAcaAtUGw5cv/X+tk8Ro9Zsjvlt2ArAnVX31Nihz5xKnuqPK
         52LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lL1up+fr9orY+qHD7nEj6urF0rr0FBlK7Sa71iQpynU=;
        b=noev6lK3AjTNYJfeAGC6zthowGwJ+DUNZNe5/cY7ArtYzBwDdZEFYIR6/dvo+otFOI
         1tTOgaaoa+crlSphATmbSbKIuVJDo5514QvVLYrs/zGJJtY6ZW08qzeShrb5NZMFhUI6
         7mgRtcW/vUFeZOH1nkw6LXL26ji91NOGOQDu/geqEYNoIcybxt7s0Dh6v/VTbnlB6pI9
         ZwTDVkvH0vYmSpFgX6128sC/8RYy9wzk2dbcA8PV/k/r8lq0x8kBYn3MyJHSPglIVlEW
         yWJaUCaNqA4haNAfhz5kuoWvQH0IjsLOw4I353O5B4JoENd94ByjT2zURlLmRDNZpeeV
         jRDA==
X-Gm-Message-State: AOAM5307urz8I+jCg6eoeO7WS2n8aan1PKusBoN6pl2f72RtZjmdaWaq
        L/rG7okoXuRo24LAu1E1f24OeA==
X-Google-Smtp-Source: ABdhPJzCjnOZcox2JJKzbarZaJwURov6ZjT8O7cEHcN/tYOCd7xyyLARQlxJLX/JdbepU1czk32MDw==
X-Received: by 2002:ac2:53b4:: with SMTP id j20mr8077438lfh.502.1612180600921;
        Mon, 01 Feb 2021 03:56:40 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id 64sm2970151lfj.278.2021.02.01.03.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 03:56:40 -0800 (PST)
Subject: Re: [PATCH 0/1] OV13850 image sensor driver
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        sakari.ailus@linux.intel.com
References: <20210130182313.32903-1-sebastian.fricke@posteo.net>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <eef6095e-a395-611d-5491-822366d8851b@linaro.org>
Date:   Mon, 1 Feb 2021 14:56:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210130182313.32903-1-sebastian.fricke@posteo.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

Thank you for your patch!

I only have a few generic comments at the moment.

It looks like the DT bindings (together with the MAINTAINERS changes) should be a separate
patch in the patchset.

ov13850_g_frame_interval() should be dropped - you have the blanking controls already:
https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/camera-sensor.html?#frame-interval-configuration

I've checked the Rockchip BSP kernel from which you ported this driver from, and it is fixed to use
2 data lanes only too.
This puzzles me, as CAM1320 module, NanoPi M4, NanoPC-T4 - they all have 4-lane interfaces...
It's OK to have only 2 lanes supported in the this patchset though.

Couple more comments below.

On 30.01.2021 21:23, Sebastian Fricke wrote:
> Hello,
> 
> I would like to start a discussion about how I should proceed with the OV13850 driver, which I ported from the Rockchip BSP kernel [1], added new features, and started to refactor. My goal is to merge the driver with the upstream kernel and I would like to maintain it as well.
> One of the biggest problems that I am currently facing is the lack of information from Omnivision, I have requested a datasheet but was just brushed aside, as I don't provide enough financial incentive for them :(.
> 
> This means there is a list of registers, that I found in the downstream driver, that I cannot locate on the leaked datasheet [2]. I don't have too many experiences in reverse-engineering and so before I spend too much time guessing what these registers do, I thought I might ask here for advice. This is also the major reason for this driver still being register list based, I would really like to change that as register list based drivers feel like big black boxes, especially when access to data-sheets is restricted.
> 
> My ultimate goal for this driver would be to switch to register maps instead of raw i2c access, to change the driver from a register list based driver to a freely configurable sensor driver,

That would be great!
I've take a very quick look at the datasheet you've used, and at first glance getting rid of the fixed modes is doable (e.g. as 
a follow up patch set).

> figure out what the unknown registers do, and drop everything that is not required, and overall improve the driver to correspond with the latest kernel APIs.
> 
> Here is a list of things that I currently adjusted:
> - Label all registers, that are located on the data-sheet in order to make the code more descriptive on its own
> - Add the get_selection subdev IOCTL
> - Enable event handling
> - Add controls for toggling horizontal mirror and vertical flip

Quick question: does this sensor changes the output Bayer order on these flips?
E.g. this is the case for imx219:
https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/imx219.c#n646
But there exist other sensors for which the Bayer order doesn't change
on [hv]flips.

> - Remove the Rockchip camera module header file, that was used to add further information about the camera in the device tree, as well user-configurations for AWB. I removed this feature after comparing my driver to multiple drivers and none of the others used a similar mechanism.
> - Remove multiple if-guards around code blocks, this change was again inspired by the comparison to other drivers
> 
> There are a few things, that I have not been able to test so far, because I lack the proper hardware:
> - The full-resolution 4224x3136 as the platform I am working on (rkisp1) only permits resolutions until: 4032x3024
> - The r2a register list as my device only fits to r1a
> 
> And here is a list of questions, where I hope to find an answer here:
> - The datasheet mentions that the FORMAT_0 register can be set to `vbin` and `vbinf`, what does the `f` mean? I have already searched for acronymns but couldn't find anything.
> - The datasheet mentions a few registers to configure the white balance manually, I played around with these but couldn't see any visual difference. Does that automatically mean that the datasheet doesn't match the device or is there maybe another mechanism that overwrites my changes? [2] (section 5-9)
> 
> [1] - https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/drivers/media/i2c/ov13850.c
> [2] - http://download.tfirefly.com/product/RK3288/Docs/Peripherals/OV13850%20datasheet/Sensor_OV13850-G04A_OmniVision_SpecificationV1.pdf
> 
> By the way, if anyone is interested, I write about my progress with the driver here: https://sebastianfricke.me/porting-the-ov13850-camera/

Thanks! This looks quite useful!


Thanks,
Andrey

> Sebastian Fricke (1):
>    media: i2c: OV13850 image sensor support
> 
>   .../bindings/media/i2c/ovti,ov13850.yaml      |  125 ++
>   MAINTAINERS                                   |    8 +
>   drivers/media/i2c/Kconfig                     |   12 +
>   drivers/media/i2c/Makefile                    |    1 +
>   drivers/media/i2c/ov13850.c                   | 1774 +++++++++++++++++
>   5 files changed, 1920 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13850.yaml
>   create mode 100644 drivers/media/i2c/ov13850.c
> 
