Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0303344D5B0
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 12:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbhKKLVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 06:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKLVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 06:21:21 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09B7C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 03:18:32 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id u18so9195119wrg.5
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 03:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FCBgmSdMWITgJW2L8m1gtyu9V1eNdyphN4ypTf5HJH4=;
        b=MpgvikC7h0+FEukajCIYIXo+KJQ4tdrl5fE0GxLSoxhgGMEO/G4oqVzhfWioygKx1j
         dOI9o0E/NRy9SUOH69v8lsmIqfvF1os2SjBC2DlUrkdsieRmSyUBM+IZ5xV9vAxdXqer
         KyQ2Mh8UCTF6fMc6n4UsZiihHE+SRSw6QZ05AOJBWTTbsXxqKk046uVTZDaddjLxEDfS
         X0kSNVXBvVu7PMwHaVCWpBYLPoevPdwf1rhMKQGJiCHEHTzqPvWau83HIYByaMA8n5+m
         p5rXipdi97YP6d8fzgCVWaLZ4Jqp0Ze/SoprH+m28oCWJ9bHQq6wbqyAQJmNIfQMZFrF
         auiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FCBgmSdMWITgJW2L8m1gtyu9V1eNdyphN4ypTf5HJH4=;
        b=xvCjbDj3IoDrFR5xsh+bEdSmhoAKnqFpBlO7b17rpAmM2MS8ZbCwvMuapz94pYLHFg
         5DegNoMfYW6FRYt1LwrP7gNXmligRLNMklll0UbhpeTUB6t/8eYt0WozassJjQBx0OZh
         8FbQ+Xfsp+zGmR/hGKP8lxNJAKv6dRdeIECfo3AVFcUyrA38sBXLgvNdeKv7r/KOeuR8
         4ZLwNxl29JNNENhXeFeGO4G3f0b4ohuoIq9CbUJKDXpeoTnZq+Bqh37FVa1wMwUli6dN
         MLFHcTW1R5ZRJVDcy6J41BGXILzg8NhJxKV5MOqEiT3AaIbCQaKdkPUqCYVt0Msk8yyO
         4tCQ==
X-Gm-Message-State: AOAM531SEEDE5nOO5CQy8CqSiaOxTErQ/BRs0W8QHYEPNYl5HvWuzK8R
        X6+hiIWfGOh9WMZxik5nPwsEGlXEo/8=
X-Google-Smtp-Source: ABdhPJzTZELvAH1wqyeQyoHfwpDWhKLUE8yGAmSM0K2uJpOC8aQNpr0z1A2oTvyYRFTGbCc/L6wGIQ==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr7914892wrw.166.1636629511211;
        Thu, 11 Nov 2021 03:18:31 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id x8sm2588240wrw.6.2021.11.11.03.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 03:18:30 -0800 (PST)
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
 <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
Date:   Thu, 11 Nov 2021 11:18:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

On 11/11/2021 10:35, Hans de Goede wrote:
> Hi,
>
> On 11/10/21 01:01, Daniel Scally wrote:
>> Hi Hans
>>
>> On 09/11/2021 16:35, Daniel Scally wrote:
>>>>>> That's not working correctly for me at the moment, but I think this is a
>>>>>> surmountable problem rather than the wrong approach, so I'm just working
>>>>>> through the differences to try and get the matching working.
>>>>> OK, I eventually got this working - the dw9719 registers as
>>>>> /dev/v4l-subdev7 for me now ... long story short is the attached patch
>>>>> was needed to make the references work, as the internals of v4l2 aren't
>>>>> checking for fwnode->secondary. Prior to your latest series as well, an
>>>>> additional problem was that once the VCMs fwnode was linked to the
>>>>> sensor's the .complete() callback for ipu3-cio2 would never call
>>>>> (because it needs ALL the devices for the linked fwnodes to be bound to
>>>>> do that)...which meant the VCMs never got instantiated, because that was
>>>>> where that function was called. With your new set separating those
>>>>> processes it works well, so yes I like that new approach very much :D
>>>>>
>>>>>
>>>>> In the end we don't have to add a call creating the subdev's - it turns
>>>>> out that v4l2 knows it's part of ipu3-cio2's v4l2-device so it registers
>>>>> the nodes for the vcm when .complete() is called for that driver. I
>>>>> still think we should add a bit creating the link to expose to userspace
>>>>> in match_notify() though.
>>>>>
>>>>>
>>>>> Trying to list controls for the dw9719 with v4l2-ctl -d /dev/v4l-subdev7
>>>>> -L fails with an IOCTL error, so I have some remedial work on the driver
>>>>> which I'll do tonight; I'd expect to be able to control focus with
>>>>> v4l2-ctl -d /dev/v4l-subdev7 -c absolute_focus=n once this is sorted.
>>>> That is great, thank you so much. I wanted to look into this myself
>>>> today but I got distracted by other stuff.
>>> No problem; I'll link you the patches for the updated versions of
>>> everything once I've sorted the IOCTL error tonight.
>>
>> OK, this is running now. With the attached patches on top of your v5
>> series and the 4-patch series from earlier today, the dw9719 registers
>> as a v4l2 subdev and I can control it with v4l2-ctl -d /dev/v4l-subdev7
>> -c focus_absolute=1200 (or whatever value).
> Great, thank you! I've given this a quick test and indeed everything
> works :)
>
> I did notice a typo in a comment in the dw9719.c file which I added
> myself, can you squash in this fix pleas? :


No problem, will do

> Also I think that the 
>
> "device property: Check fwnode->secondary when finding properties"
>
> That patch looks good to me, so please add my:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Can you submit this upstream please?


Thanks; I'll post it later yes (and thanks for your R-b too Andy)

> I will prepare a new version of my:
>
> "[PATCH v5 00/11] Add support for X86/ACPI camera sensor/PMIC setup with clk and regulator platform data"
>
> series, addressing the few remaining comments and adding the regulator
> data + instantiating support for the VCM.
>
>> One problem I'm experiencing
>> is that the focus position I set isn't maintained; it holds for a couple
>> of seconds and then resets to the "normal" focus...this happens when the
>> .close() callback for the driver is called, which happens right after
>> the control value is applied. All the other VCM drivers in the kernel
>> power down on .close() so I did the same>
> Right, I believe that this is fine though, we expect people to use
> libcamera with this and once libcamera gets autofocus support, then
> I would expect libcamera to keep the fd open the entire time while
> streaming.


OK - as long as that's how it works then I agree that this is fine as is
yes.


> What is necessary is some way for libcamera to:
>
> 1. See if there is a VCM which belongs to the sensor; and
> 2. If there is a VCM figure out which v4l2-subdev it is.
>
> Also see this email thread, where Hans Verkuil came to the
> conclusion that this info is currently missing from the MC
> representation (link is to the conclusion):
>
> https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/026144.html


Yeah I read through that thread too, and had a brief chat with Laurent
about it. My plan was to add a new type of link called an "ancillary
link" between two entities, and automatically create those in
match_notify() based on the function field of the matching entities, and
expose them as part of the media graph. I've started working on that but
not progressed far enough to share anything. Libcamera would need
updating with support for that too though.

>
> Regards,
>
> Hans
>
