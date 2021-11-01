Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266D74420D8
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 20:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhKATbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 15:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhKATbP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 15:31:15 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C01C061714;
        Mon,  1 Nov 2021 12:28:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f3so30148050lfu.12;
        Mon, 01 Nov 2021 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oUizDfgwFNYdL5n8t93Z0CbMWx8hyiTVK1QWUlqRL/Q=;
        b=qEH27vzYm2AHnn13IP3Acl+1k1FWd9og+36OEIHAjo56EAjTLsxZCzmKFXgN5OiAa2
         YuX133+pK9Mv1ns/UlG4c3B7NTZygGaUtRdql/VDVdteJpxHfN5YiBnQNNiwZVges9bd
         hjk3tzfVS7VE82RrIcilaXM2do42n8Dz5WwsR6CUa/tm1wxVCZaLyyscDsf7q7gYn3Kn
         slUHUH0SLxTkE4c39BHF4w5ifXcikuXG0tn3evuL/Da4YLJHUXn00uh/0aHl1Z8cqxgs
         ZXQnWA/jcrzxsLdesDXLf0N6wGGu2Vi93TrAjs+Sm5o20JgrSDSMKhs8bL9xZouBzERX
         Ti8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oUizDfgwFNYdL5n8t93Z0CbMWx8hyiTVK1QWUlqRL/Q=;
        b=1aOQziBn0YrBz6PbY5Oht1ZJwavaEOBBb8iijO0vLlot8E/iMkerdExm7RxyPK145p
         O5Q/hS9cKt02sRFzrarCWkeiExI0a6XvI4dITFGhIptf8UmUriL51tEAn6fkW0W1moG7
         nqStTusWSFoI56jazGGUVopDb5EKnUCGl3QmHFEzSkr3K15I43xvK847cooc709dB9o0
         34WNiW8DfB+44bUIZpKZqvL5AjLfZ0w5Y3O7nrcAHpF3tlSafLFBbXwZ1cd266Zt9tVS
         FZbsWGSlyxoj1v/rGrF3l7ryZ697tMqwFbLo3a5kUxsxfpZpB2gzFzjJNSswPvRN5Bj5
         2MJQ==
X-Gm-Message-State: AOAM533RkIOUz/Ww8z8cJ/0YfjhhvG+XLtnVqb7DbJnSFcMr/yNJA0WC
        1LtjhxABqoPLZ1H2ETaUTbw=
X-Google-Smtp-Source: ABdhPJx4PduTsZO++oiInqWsTNhdAevMfOOiT7uK/gx2Q0I8LxiEf88BoZeKfktj3dRaXwDnpM1/8Q==
X-Received: by 2002:ac2:5d2d:: with SMTP id i13mr29160344lfb.175.1635794919383;
        Mon, 01 Nov 2021 12:28:39 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
        by smtp.gmail.com with ESMTPSA id w24sm1486579lfu.24.2021.11.01.12.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 12:28:38 -0700 (PDT)
Message-ID: <76e1264b-87d3-c7cb-c9d5-bcf461fbb2bf@gmail.com>
Date:   Mon, 1 Nov 2021 22:28:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] media: em28xx: fix memory leak in em28xx_init_dev
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot <syzkaller@googlegroups.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211101095539.423246-1-mudongliangabcd@gmail.com>
 <20211101183249.GA28019@kili>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211101183249.GA28019@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/1/21 21:32, Dan Carpenter wrote:
> On Mon, Nov 01, 2021 at 05:55:39PM +0800, Dongliang Mu wrote:
>> In the em28xx_init_rev, if em28xx_audio_setup fails, this function fails
>> to deallocate the media_dev allocated in the em28xx_media_device_init.
>> 
>> Fix this by adding em28xx_unregister_media_device to free media_dev.
>> 
>> BTW, this patch is tested in my local syzkaller instance, and it can
>> prevent the memory leak from occurring again.
>> 
>> CC: Pavel Skripkin <paskripkin@gmail.com>
>> Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
>> Reported-by: syzbot <syzkaller@googlegroups.com>
> 
> Is this really a syzbot warning?  If so it should be in the format:
> 
> Reported-by: syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com
> 
> Syzbot is different from syzkaller.  Syzkaller is the fuzzer and syzbot
> is the program which reports syzkaller bugs.
> 

Bug report is from his local instance. He just wants to give credit to 
syzbot for finding it

>> ---
>>  drivers/media/usb/em28xx/em28xx-cards.c | 19 +++++++++++++------
>>  1 file changed, 13 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
>> index c1e0dccb7408..fca68939ca50 100644
>> --- a/drivers/media/usb/em28xx/em28xx-cards.c
>> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
>> @@ -3625,8 +3625,10 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
>>  
> 
> There is no check to see if the em28xx_media_device_init() fails.  I

I guess, it should work, since there a lot of checks to see if this 
pointer is valid, i.e driver can work even without this pointer, AFAIK

> don't love that we call unregister() to undo the init() but it seems
> like it should work...

Same here, but it is out of scope of this patch :)



With regards,
Pavel Skripkin
