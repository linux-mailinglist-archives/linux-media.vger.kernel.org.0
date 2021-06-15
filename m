Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DA63A81ED
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 16:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFOOMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 10:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbhFOOMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 10:12:01 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3637FC061767
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 07:09:53 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso14360772otl.13
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G03LeVSqzx4r6UWRg21tN37T3lMTHXfodYVAYedgndk=;
        b=CQWma7GynKiGTf/Cfus0SAXooczcUtAUWmj8IMcII3ayR0fKCmZlvQCTp2kl51BNqC
         UBRoHcbAAUBRK+qrsVV2EAsxHEOBbQnbH9nChYvVvUDW34ReH9str/1pEbuzDJXnn6x2
         LE5uC+WvITpjeejAf1fIDtVu5tyUBV5lx0kGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G03LeVSqzx4r6UWRg21tN37T3lMTHXfodYVAYedgndk=;
        b=YTOwk+K1VDn8BO/XoSKmtei3pk//HOAK8v2XxxZNjjY78cvoQrpGa4aggrbLbm20uN
         U8swcJT6BmdnBGhWSg3lUzXaCTydnDGKDZT5TqwRqQcO6NZKp2RGhIfnHzbUXlSY67yQ
         jpXiaLSKvfhRmMjZCF+HkZdEkgs1tKnUQhlT9HsILQWwZQrGQKVT4n5SK4RZCVTPQGs/
         DikSftTufi190UhWMmpW2JQhyiKGF8NFvEumnSlcp9k4WLo3VzvJ0Rtn0P7DzRuIkjgS
         vTis1U9q83WTfSmzQTLBBrnkWKxXVPd0Jb8tp7J7mAj4zvtIhOrVWLBOEpriHS81AQBS
         hUSw==
X-Gm-Message-State: AOAM532q+38GNi0l5hndMLsjbF2zfBZf73f7fap1X/g/KHrbOCisulHP
        3RWGrDM0vXzeNSXXWkY9LLmVbQ==
X-Google-Smtp-Source: ABdhPJzif/rlAZ6AcdzlQfzAzDQSxFh0lbrTGIvzUs2Bf5Btgj19yIiD+Dgccd+ZOgiGbJJ3LAy97g==
X-Received: by 2002:a05:6830:17c8:: with SMTP id p8mr17682543ota.167.1623766192538;
        Tue, 15 Jun 2021 07:09:52 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id k8sm3760778ool.5.2021.06.15.07.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 07:09:51 -0700 (PDT)
Subject: Re: [PATCH] media: Fix Media Controller API config checks
To:     Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20210611015849.42589-1-skhan@linuxfoundation.org>
 <3745852a-a14d-3e66-dd9f-409ec7e43f48@xs4all.nl>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <04f0ce7b-71c3-948c-fdb0-72e234f8c7da@linuxfoundation.org>
Date:   Tue, 15 Jun 2021 08:09:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3745852a-a14d-3e66-dd9f-409ec7e43f48@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/15/21 7:36 AM, Hans Verkuil wrote:
> Hi Shuah,
> 
> On 11/06/2021 03:58, Shuah Khan wrote:
>> Smatch static checker warns that "mdev" can be null:
>>
>> sound/usb/media.c:287 snd_media_device_create()
>>      warn: 'mdev' can also be NULL
>>
>> If CONFIG_MEDIA_CONTROLLER is disabled, this file should not be included
>> in the build.
>>
>> The below conditions in the sound/usb/Makefile are in place to ensure that
>> media.c isn't included in the build.
>>
>> sound/usb/Makefile:
>> snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
>>
>> select SND_USB_AUDIO_USE_MEDIA_CONTROLLER if MEDIA_CONTROLLER &&
>>         (MEDIA_SUPPORT=y || MEDIA_SUPPORT=SND_USB_AUDIO)
>>
>> The following config check in include/media/media-dev-allocator.h is
>> in place to enable the API only when CONFIG_MEDIA_CONTROLLER and
>> CONFIG_USB are enabled.
>>
>>   #if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
>>
>> This check doesn't work as intended when CONFIG_USB=m. When CONFIG_USB=m,
>> CONFIG_USB_MODULE is defined and CONFIG_USB is not. The above config check
>> doesn't catch that CONFIG_USB is defined as a module and disables the API.
>> This results in sound/usb enabling Media Controller specific ALSA driver
>> code, while Media disables the Media Controller API.
>>
>> Fix the problem requires two changes:
>>
>> 1. Change the check to use IS_ENABLED to detect when CONFIG_USB is enabled
>>     as a module or static. Since CONFIG_MEDIA_CONTROLLER is a bool, leave
>>     the check unchanged to be consistent with drivers/media/Makefile.
>>
>> 2. Change the drivers/media/mc/Makefile to include mc-dev-allocator.o
>>     in mc-objs when CONFIG_USB is y or m.
> 
> If I test this patch, then I get:
> 
> drivers/media/mc/mc-dev-allocator.c:97:22: error: redefinition of 'media_device_usb_allocate'
>     97 | struct media_device *media_device_usb_allocate(struct usb_device *udev,
>        |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/media/mc/mc-dev-allocator.c:24:
> include/media/media-dev-allocator.h:55:36: note: previous definition of 'media_device_usb_allocate' was here
>     55 | static inline struct media_device *media_device_usb_allocate(
>        |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/media/mc/mc-dev-allocator.c:119:6: error: redefinition of 'media_device_delete'
>    119 | void media_device_delete(struct media_device *mdev, const char *module_name,
>        |      ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/media/mc/mc-dev-allocator.c:24:
> include/media/media-dev-allocator.h:59:20: note: previous definition of 'media_device_delete' was here
>     59 | static inline void media_device_delete(
>        |                    ^~~~~~~~~~~~~~~~~~~
> 
> The .config has:
> 
> # CONFIG_USB_SUPPORT is not set
> CONFIG_MEDIA_CONTROLLER=y
>
Oops. I tried different combinations of CONFIG_USB and didn't try this
one. Will send v2.

thanks,
-- Shuah
