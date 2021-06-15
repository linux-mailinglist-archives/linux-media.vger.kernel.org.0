Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1793A86EF
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 18:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFOQ5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 12:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhFOQ5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 12:57:33 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65651C06175F
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 09:55:28 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id q20-20020a4a6c140000b029024915d1bd7cso3678024ooc.12
        for <linux-media@vger.kernel.org>; Tue, 15 Jun 2021 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+RaZJtsUnxE0LQhLgGIH6UV1neEgEYWyhmaxMuF1UDE=;
        b=VrBoYlpG3wNUBP3sbRO2ADGwvl9BBKp0P2yGMmzY7ZCUOuwgg6oK5YUVcBo+fj3gnR
         avZWr4kNiTMUNJu6BWEbsO/e5Wno19s/0EUzN2BPM3GHCrrBTmwJlI3Hzwp178w9TGnt
         K8tAjo7+V2O8iquaV5Xmf5PZfKJvh76wfBpNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+RaZJtsUnxE0LQhLgGIH6UV1neEgEYWyhmaxMuF1UDE=;
        b=GRgTas29lwG2erHEjk9rtTndXa7MBygVR9xev4KMNunsk+OzNJJbNkFeMxPd8bU4eQ
         pga/duDXLYuDCrofns9G2csDzXyy1PmgBtc1wfuPonZ/hxuLyorwzO1DuK/qHt/GqKb7
         cdvahq+cSLB8r0J6obQ14Jwiv2HHLMZr4QpNES2RvpamHoqe0EFRdAbBuFz4NpnUJkAR
         cUKCZe+et7wdlq1ozs5KU2rUnYrwUuUzpL7ezin3w6/1oJTyX3bLht/hDIZ6T0lQ+XF1
         +5MZkaR00uj4d/nmKBF4zY5/67UzB/ma2wTa9dfxLgzSlAxe1wBvDSiUU9J6qOhJf462
         7eHg==
X-Gm-Message-State: AOAM533Dz0OScLrJTs+W4FQyNX18J95/uRP3LhZZpYKQvfqRXun4kyNy
        N89EnpCzUcKLLbHkjakt5rGkaA==
X-Google-Smtp-Source: ABdhPJzYUKrrelOAEP5pQNrS0CNPNMjjx7cG2nUYfg+jzD3ZgZoSWPchkoTPjLj3kiiadimBxRdE6A==
X-Received: by 2002:a4a:df47:: with SMTP id j7mr109033oou.79.1623776127691;
        Tue, 15 Jun 2021 09:55:27 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l10sm4135693otj.17.2021.06.15.09.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 09:55:27 -0700 (PDT)
Subject: Re: [PATCH] media: Fix Media Controller API config checks
To:     Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20210611015849.42589-1-skhan@linuxfoundation.org>
 <3745852a-a14d-3e66-dd9f-409ec7e43f48@xs4all.nl>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ee53183f-6c44-4ddb-a8b1-40d650772c73@linuxfoundation.org>
Date:   Tue, 15 Jun 2021 10:55:26 -0600
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

Hans,

Can you share your full config with me?

thanks,
-- Shuah

