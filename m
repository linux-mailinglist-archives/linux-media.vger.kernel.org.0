Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F2448231F
	for <lists+linux-media@lfdr.de>; Fri, 31 Dec 2021 10:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhLaJ7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Dec 2021 04:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhLaJ7R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Dec 2021 04:59:17 -0500
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AD8C061574
        for <linux-media@vger.kernel.org>; Fri, 31 Dec 2021 01:59:17 -0800 (PST)
Received: from [10.36.2.165] (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 05C3B2601EA;
        Fri, 31 Dec 2021 10:59:13 +0100 (CET)
Message-ID: <d0090976-6d4d-ab15-dcdf-9352ed12fea7@selasky.org>
Date:   Fri, 31 Dec 2021 10:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] Make sure we parse really received data.
Content-Language: en-US
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <06c00e24-cdad-8776-9fc1-2c0f3db5af9a@selasky.org>
 <CANiDSCtB=mu6wtZxkck3E0GnJT7OOVXKDe+yzEFK+ygsDwoxKg@mail.gmail.com>
From:   Hans Petter Selasky <hps@selasky.org>
In-Reply-To: <CANiDSCtB=mu6wtZxkck3E0GnJT7OOVXKDe+yzEFK+ygsDwoxKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/23/21 20:09, Ricardo Ribalda wrote:
> Hi Hans
> 
> Thanks for your patch
> 
> On Thu, 23 Dec 2021 at 16:42, Hans Petter Selasky <hps@selasky.org> wrote:
>>
>> Hi,
>>
>> USB control requests may return less data than we ask for.
>> Found using valgrind and webcamd on FreeBSD.
> 
> If the usb control request returns less data, then the checks for
> ret!=size will trigger.
> 
> Am I missing something obvious?
> 

Hi,

USB control transfers are allowed to be short terminated! But there is 
no flag to error out on short terminated control transfers, from what I 
can see. This is sometimes used for reading strings. You setup a fixed 
255 byte buffer, and then simply issue the control read string request. 
The length you get back is the actual string length.

 > If the usb control request returns less data, then the checks for
 > ret!=size will trigger.

Can you point in the code where this check is?

--HPS

> Best regards
> 
> 
>>
>> ==15522== Conditional jump or move depends on uninitialised value(s)
>> ==15522==    at 0x662EF4: uvc_fixup_video_ctrl (uvc_video.c:135)
>> ==15522==    by 0x662EF4: uvc_get_video_ctrl (uvc_video.c:297)
>> ==15522==    by 0x6640B0: uvc_video_init (uvc_video.c:2078)
>> ==15522==    by 0x65E79D: uvc_register_video (uvc_driver.c:2258)
>> ==15522==    by 0x65E79D: uvc_register_terms (uvc_driver.c:2300)
>> ==15522==    by 0x65E79D: uvc_register_chains (uvc_driver.c:2321)
>> ==15522==    by 0x65E79D: uvc_probe (uvc_driver.c:2463)
>> ==15522==    by 0x3C8F46: usb_linux_probe_p (linux_usb.c:449)
>> ==15522==    by 0x75B4B2: main (webcamd.c:1021)
>> ==15522==  Uninitialised value was created by a heap allocation
>> ==15522==    at 0x4853844: malloc (in
>> /usr/local/libexec/valgrind/vgpreload_memcheck-amd64-freebsd.so)
>> ==15522==    by 0x3BC8A4: kmalloc (linux_func.c:1807)
>> ==15522==    by 0x662C8C: uvc_get_video_ctrl (uvc_video.c:229)
>> ==15522==    by 0x6640B0: uvc_video_init (uvc_video.c:2078)
>> ==15522==    by 0x65E79D: uvc_register_video (uvc_driver.c:2258)
>> ==15522==    by 0x65E79D: uvc_register_terms (uvc_driver.c:2300)
>> ==15522==    by 0x65E79D: uvc_register_chains (uvc_driver.c:2321)
>> ==15522==    by 0x65E79D: uvc_probe (uvc_driver.c:2463)
>> ==15522==    by 0x3C8F46: usb_linux_probe_p (linux_usb.c:449)
>> ==15522==    by 0x75B4B2: main (webcamd.c:1021)
>>
>> Signed-off-by: Hans Petter Selasky <hps@selasky.org>
>> ---
>>    drivers/media/usb/uvc/uvc_video.c | 6 +++++-
>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_video.c
>> b/drivers/media/usb/uvc/uvc_video.c
>> index 9f37eaf28ce7..6233703f9a50 100644
>> --- a/drivers/media/usb/uvc/uvc_video.c
>> +++ b/drivers/media/usb/uvc/uvc_video.c
>> @@ -258,7 +258,11 @@ static int uvc_get_video_ctrl(struct uvc_streaming
>> *stream,
>>                          query == UVC_GET_DEF)
>>                  return -EIO;
>>
>> -       data = kmalloc(size, GFP_KERNEL);
>> +       /*
>> +        * Make sure we parse really received data
>> +        * by allocating a zeroed buffer.
>> +        */
>> +       data = kzalloc(size, GFP_KERNEL);
>>          if (data == NULL)
>>                  return -ENOMEM;
>>
>> --
>> 2.34.1
> 
> 
> 

