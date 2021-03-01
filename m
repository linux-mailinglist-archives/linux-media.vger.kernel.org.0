Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6EB3277AA
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 07:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhCAGgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 01:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbhCAGgK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 01:36:10 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05538C06174A
        for <linux-media@vger.kernel.org>; Sun, 28 Feb 2021 22:35:30 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p21so23600879lfu.11
        for <linux-media@vger.kernel.org>; Sun, 28 Feb 2021 22:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NLYIfD/csRuJVOu4WHfZIujFxEmGzIl1QmZbg/GZ51k=;
        b=xf/Twbu2R4/GDP0Yfv1tXBlq4FZelZsXxAQtykL6E5+yNsaCa7q9MIHysDZ5Rqdsq6
         KqsCckVaTuE7Nbp7cWVy5zUnlvAVADjiWDic5rN0OmBKBcgSxYvRLL9YjlV/sx2T6awE
         YRm+XZdgOFTFoOkLHsVAsqH5k8enc/t09KLdVMaAA/aZLBhKk2uqNa2g2FF/TmX/pGlo
         9HERWOzijtHx148cHjmIJLvaa+cNiMPdPwu6r7hOmh2abvPAUjb2aS8UYpyznwfY2IT8
         mbsI1cUwtQjPHvVCn/vPCEy9Ba50GkywPmglLwfNA6k30TYjEoyg/LFWkPQfdIrjhrva
         2k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NLYIfD/csRuJVOu4WHfZIujFxEmGzIl1QmZbg/GZ51k=;
        b=sqL2HWqGzFdaiWRHICNtorXGZ9Of/vkCG6SiV0PDurpk2LQ9pMLwHbCV2avvyxBITU
         vQEFi5x0NzZLX3sKlMkRcgCTRVki9Wy2hAsIi8tfAT/poB6Y1T5IVmbHCV9jMLi85LOI
         YHl6UvaKP4dzIOliMlQK8iVTOR1tZRlu66sRCRTlBtEoq4aeZqFi8+xDMgOtcNKuEjU+
         9HTlSrsotLAqeO11QUj2aPjAy2iDszp/aeXiLxiEJGCMffh+8mqqepSRzVzVd/a4cEsZ
         ELGeVo5mmu9PSxZ/Zyerqb9mLWu33jrJiWqGpnNCbVf9ujXyDReTdNJsPtkb0lT19ayR
         ICzg==
X-Gm-Message-State: AOAM530gFVX6cOKzeBy7dcAtTnyWheCamjg2CIaTq7I3EOoBCIqgWTix
        hr+gG/sonCIClGkjJcH6FdwBDfolXxGmTw==
X-Google-Smtp-Source: ABdhPJzA4CKKu9I/JVKtoSDz1zIu7tS2jNectKuaMxSC2dQxQrpjF8tyMGNzpg3RbtVqCU9DEcIHVw==
X-Received: by 2002:ac2:4350:: with SMTP id o16mr8587868lfl.585.1614580528273;
        Sun, 28 Feb 2021 22:35:28 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id s10sm2344785ljo.115.2021.02.28.22.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 22:35:27 -0800 (PST)
Subject: Re: [PATCH 0/1] OV13850 image sensor driver
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        dafna.hirschfeld@collabora.com, sakari.ailus@linux.intel.com
References: <20210130182313.32903-1-sebastian.fricke@posteo.net>
 <eef6095e-a395-611d-5491-822366d8851b@linaro.org>
 <20210227065403.r7x2me4l7wlyu2nw@basti-TUXEDO-Book-XA1510>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <8677924c-b6f4-3462-4a27-a912c48bd519@linaro.org>
Date:   Mon, 1 Mar 2021 09:35:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210227065403.r7x2me4l7wlyu2nw@basti-TUXEDO-Book-XA1510>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

On 27.02.2021 09:54, Sebastian Fricke wrote:
> Hey Andrey,
> 
> Thank you for your review and sorry for taking ages to give feedback to
> your review, I had a lot of other tasks flying in, and additionally your
> question about the Bayer pattern order required some analysis from my
> side more about this below.
> 
> On 01.02.2021 14:56, Andrey Konovalov wrote:
>> Hi Sebastian,
>>
>> Thank you for your patch!
>>
>> I only have a few generic comments at the moment.
>>
>> It looks like the DT bindings (together with the MAINTAINERS changes) should be a separate
>> patch in the patchset.
> 
> Yes, I will definitly do this, I wanted to show where I am currently at
> with this first patch and I will clean this up in the next patch.
> 
>>
>> ov13850_g_frame_interval() should be dropped - you have the blanking controls already:
>> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/camera-sensor.html?#frame-interval-configuration
> 
> Thank you for the resource and thanks for the hint, I will address this
> in the next version.
> 
>>
>> I've checked the Rockchip BSP kernel from which you ported this driver from, and it is fixed to use
>> 2 data lanes only too.
>> This puzzles me, as CAM1320 module, NanoPi M4, NanoPC-T4 - they all have 4-lane interfaces...
>> It's OK to have only 2 lanes supported in the this patchset though.
> 
> I will address this in a future version, for now I would like to have
> the clean basic version.
> 
>>
>> Couple more comments below.
>>
>> On 30.01.2021 21:23, Sebastian Fricke wrote:
>>> Hello,
>>>
>>> I would like to start a discussion about how I should proceed with the OV13850 driver, which I ported from the Rockchip BSP 
>>> kernel [1], added new features, and started to refactor. My goal is to merge the driver with the upstream kernel and I would 
>>> like to maintain it as well.
>>> One of the biggest problems that I am currently facing is the lack of information from Omnivision, I have requested a 
>>> datasheet but was just brushed aside, as I don't provide enough financial incentive for them :(.
>>>
>>> This means there is a list of registers, that I found in the downstream driver, that I cannot locate on the leaked datasheet 
>>> [2]. I don't have too many experiences in reverse-engineering and so before I spend too much time guessing what these 
>>> registers do, I thought I might ask here for advice. This is also the major reason for this driver still being register list 
>>> based, I would really like to change that as register list based drivers feel like big black boxes, especially when access to 
>>> data-sheets is restricted.
>>>
>>> My ultimate goal for this driver would be to switch to register maps instead of raw i2c access, to change the driver from a 
>>> register list based driver to a freely configurable sensor driver,
>>
>> That would be great!
>> I've take a very quick look at the datasheet you've used, and at first glance getting rid of the fixed modes is doable (e.g. 
>> as a follow up patch set).
> 
> The current code takes a different register list for the two modes and I
> found out that a lot of those registers care about the crop location and
> size. But there is a set of register 0x37* & 0x38* & 0x40* & 0x54*
> (total 15 registers per mode), that are unknown to me as they are not
> declared in the data-sheet. Both modes use completely different values
> for those registers, so my current thought was: "I guess I can only get
> rid of the fixed modes once I know what those registers do.". But I
> might be wrong and maybe I can make a subset of those registers freely
> configurable. Still, as you said already, this will probably be a future
> patch set.
> 
>>
>>> figure out what the unknown registers do, and drop everything that is not required, and overall improve the driver to 
>>> correspond with the latest kernel APIs.
>>>
>>> Here is a list of things that I currently adjusted:
>>> - Label all registers, that are located on the data-sheet in order to make the code more descriptive on its own
>>> - Add the get_selection subdev IOCTL
>>> - Enable event handling
>>> - Add controls for toggling horizontal mirror and vertical flip
>>
>> Quick question: does this sensor changes the output Bayer order on these flips?
>> E.g. this is the case for imx219:
>> https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/imx219.c#n646
>> But there exist other sensors for which the Bayer order doesn't change
>> on [hv]flips.
> 
> I thought quite a bit about this question and I've written about my
> analysis and thought process here: https://sebastianfricke.me/effects-of-image-mirroring-on-bayer-pattern-order/
> 
> In the end, I was still not entirely sure and maybe you can provide me
> further hints as I have not worked too much with raw videos before.
> With my current point of view, I believe that the order does not change,
> then again as written in my analysis the data-sheet is not really clear
> about this point and the sentence in the flip section leads more to the
> conclusion that the order does change.

I've checked the captured images (thank you Sebastian for providing them),
and indeed, the bayer order doesn't change on h/v flips - it is always BGGR.

Thanks,
Andrey

>>> - Remove the Rockchip camera module header file, that was used to add further information about the camera in the device 
>>> tree, as well user-configurations for AWB. I removed this feature after comparing my driver to multiple drivers and none of 
>>> the others used a similar mechanism.
>>> - Remove multiple if-guards around code blocks, this change was again inspired by the comparison to other drivers
>>>
>>> There are a few things, that I have not been able to test so far, because I lack the proper hardware:
>>> - The full-resolution 4224x3136 as the platform I am working on (rkisp1) only permits resolutions until: 4032x3024
>>> - The r2a register list as my device only fits to r1a
>>>
>>> And here is a list of questions, where I hope to find an answer here:
>>> - The datasheet mentions that the FORMAT_0 register can be set to `vbin` and `vbinf`, what does the `f` mean? I have already 
>>> searched for acronymns but couldn't find anything.
>>> - The datasheet mentions a few registers to configure the white balance manually, I played around with these but couldn't see 
>>> any visual difference. Does that automatically mean that the datasheet doesn't match the device or is there maybe another 
>>> mechanism that overwrites my changes? [2] (section 5-9)
>>>
>>> [1] - https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/drivers/media/i2c/ov13850.c
>>> [2] - 
>>> http://download.tfirefly.com/product/RK3288/Docs/Peripherals/OV13850%20datasheet/Sensor_OV13850-G04A_OmniVision_SpecificationV1.pdf 
>>>
>>>
>>> By the way, if anyone is interested, I write about my progress with the driver here: 
>>> https://sebastianfricke.me/porting-the-ov13850-camera/
>>
>> Thanks! This looks quite useful!
> 
> Great good to hear, I will extend it further with the new features I add
> and problems that I encounter.
> 
>>
>>
>> Thanks,
>> Andrey
> 
> Thank you
> 
> Sebastian
> 
>>
>>> Sebastian Fricke (1):
>>>   media: i2c: OV13850 image sensor support
>>>
>>>  .../bindings/media/i2c/ovti,ov13850.yaml      |  125 ++
>>>  MAINTAINERS                                   |    8 +
>>>  drivers/media/i2c/Kconfig                     |   12 +
>>>  drivers/media/i2c/Makefile                    |    1 +
>>>  drivers/media/i2c/ov13850.c                   | 1774 +++++++++++++++++
>>>  5 files changed, 1920 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13850.yaml
>>>  create mode 100644 drivers/media/i2c/ov13850.c
>>>
