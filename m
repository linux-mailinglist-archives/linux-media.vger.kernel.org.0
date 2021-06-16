Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961593A8F3E
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 05:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFPDRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 23:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhFPDRJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 23:17:09 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75930C06175F
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 20:15:03 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so1149111otl.0
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 20:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XX8UtdPe5UHi4QT2fZ9fVYOjixFm5+p0JuSE18O5Og4=;
        b=iPDEXNVH5GeTa8tOCBCzkuIjNLBj0+HdOS3hepZ8X0Rf7QT/hmMXiCADRekwUdNfW1
         plZ+yv58BNuTK956KHbfUsMzlyzNSq29dpdoPMPO/7U0RS0lvOR+VIW8acsM55SFOxQg
         FQksOdfraDRnwDaYFbe94LYVx1Fle12443mSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XX8UtdPe5UHi4QT2fZ9fVYOjixFm5+p0JuSE18O5Og4=;
        b=dpGPc6s50jKsEv7TcwPvhaKUv9jIpx1kgAsUEirPpKR64KBXdZIai7tNNesrWt3cAx
         zqpZqRBl0C3BaJSMCjdnqUyJPuIyq09+ubWtcHZodQWu+3ls28N2eRC7zVAfXcbjH3kB
         5ZCWWuZ+LIbECAH7HaMv0rTksj+QoHHuYUd6RW9CpFqPgPG2kVS3pEG70w1+QLUacwIC
         4BKH6oxR6wUBpCgpdUd889PFRP0dfEdCyXAdSjxKhT7RvZq/Q93c9mvnSU1GRpJSuc47
         BiiPXH56Qz55407kXRVM5HE0Ewyr60FPGAixRr9P6v+mgVC6pveQ1pue5Bf7sFCANGlc
         TWsQ==
X-Gm-Message-State: AOAM531FflecVUXdKdTSUIfnw6Pn69J2s/A3pZAsnf1yHQBScRpbUkNu
        rgQHV6VqhI0Ux3QudtfUXCfrEQ==
X-Google-Smtp-Source: ABdhPJwMTm3G+sFKstZYZM1dWqWL7LBvK2+Fx/PfxBEHT05p8XLhS4hfRLr8UG6YV1l8tWQS+mnF5Q==
X-Received: by 2002:a9d:6c6:: with SMTP id 64mr2090919otx.199.1623813302785;
        Tue, 15 Jun 2021 20:15:02 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i26sm198103oig.13.2021.06.15.20.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 20:15:02 -0700 (PDT)
Subject: Re: [PATCH] media: Fix Media Controller API config checks
To:     Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20210611015849.42589-1-skhan@linuxfoundation.org>
 <3745852a-a14d-3e66-dd9f-409ec7e43f48@xs4all.nl>
 <ee53183f-6c44-4ddb-a8b1-40d650772c73@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <6b1bbc25-83fb-2c40-1dff-c2eb755a99cc@linuxfoundation.org>
Date:   Tue, 15 Jun 2021 21:15:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ee53183f-6c44-4ddb-a8b1-40d650772c73@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/15/21 10:55 AM, Shuah Khan wrote:
> On 6/15/21 7:36 AM, Hans Verkuil wrote:
>> Hi Shuah,
>>
>> On 11/06/2021 03:58, Shuah Khan wrote:
>>> Smatch static checker warns that "mdev" can be null:
>>>
>>> sound/usb/media.c:287 snd_media_device_create()
>>>      warn: 'mdev' can also be NULL
>>>
>>> If CONFIG_MEDIA_CONTROLLER is disabled, this file should not be included
>>> in the build.
>>>
>>> The below conditions in the sound/usb/Makefile are in place to ensure 
>>> that
>>> media.c isn't included in the build.
>>>
>>> sound/usb/Makefile:
>>> snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
>>>
>>> select SND_USB_AUDIO_USE_MEDIA_CONTROLLER if MEDIA_CONTROLLER &&
>>>         (MEDIA_SUPPORT=y || MEDIA_SUPPORT=SND_USB_AUDIO)
>>>
>>> The following config check in include/media/media-dev-allocator.h is
>>> in place to enable the API only when CONFIG_MEDIA_CONTROLLER and
>>> CONFIG_USB are enabled.
>>>
>>>   #if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
>>>
>>> This check doesn't work as intended when CONFIG_USB=m. When 
>>> CONFIG_USB=m,
>>> CONFIG_USB_MODULE is defined and CONFIG_USB is not. The above config 
>>> check
>>> doesn't catch that CONFIG_USB is defined as a module and disables the 
>>> API.
>>> This results in sound/usb enabling Media Controller specific ALSA driver
>>> code, while Media disables the Media Controller API.
>>>
>>> Fix the problem requires two changes:
>>>
>>> 1. Change the check to use IS_ENABLED to detect when CONFIG_USB is 
>>> enabled
>>>     as a module or static. Since CONFIG_MEDIA_CONTROLLER is a bool, 
>>> leave
>>>     the check unchanged to be consistent with drivers/media/Makefile.
>>>
>>> 2. Change the drivers/media/mc/Makefile to include mc-dev-allocator.o
>>>     in mc-objs when CONFIG_USB is y or m.
>>
>> If I test this patch, then I get:
>>
>> drivers/media/mc/mc-dev-allocator.c:97:22: error: redefinition of 
>> 'media_device_usb_allocate'
>>     97 | struct media_device *media_device_usb_allocate(struct 
>> usb_device *udev,
>>        |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from drivers/media/mc/mc-dev-allocator.c:24:
>> include/media/media-dev-allocator.h:55:36: note: previous definition 
>> of 'media_device_usb_allocate' was here
>>     55 | static inline struct media_device *media_device_usb_allocate(
>>        |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/mc/mc-dev-allocator.c:119:6: error: redefinition of 
>> 'media_device_delete'
>>    119 | void media_device_delete(struct media_device *mdev, const 
>> char *module_name,
>>        |      ^~~~~~~~~~~~~~~~~~~
>> In file included from drivers/media/mc/mc-dev-allocator.c:24:
>> include/media/media-dev-allocator.h:59:20: note: previous definition 
>> of 'media_device_delete' was here
>>     59 | static inline void media_device_delete(
>>        |                    ^~~~~~~~~~~~~~~~~~~
>>
>> The .config has:
>>
>> # CONFIG_USB_SUPPORT is not set
>> CONFIG_MEDIA_CONTROLLER=y
>>
> 

Hi Hans,

I don't know why I made the logic fancy and complex. Fixed now and
sending v2 shortly. I made sure all the combinations are tested now.

thanks,
-- Shuah

