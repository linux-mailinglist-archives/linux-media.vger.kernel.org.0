Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208E931BB7A
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 15:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhBOOz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 09:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhBOOz0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 09:55:26 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8028C061756;
        Mon, 15 Feb 2021 06:54:45 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id jj19so11615180ejc.4;
        Mon, 15 Feb 2021 06:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vVdEfWSlmLCjTZzZsqvvIxgWNNo8H9xjhu0/9T9YVpU=;
        b=XlIog/eMeAk3If6nDNMJc83j9eaD9nfSoxl0yxZ4R4Xq3lypZ8xHagLCcVTP7/DuRo
         rl65fgWOqlyAcRN9WjoOI3SNfk1bKQSD64aK5ernmrZdVqDxF6yfj2B6mkbbkEfys+QJ
         fx6ngTmXggNrbsiBUHyK/Zq2I6yGWzajmCtxhCV5K3WibSWKws1CHCc4onZBYLnxDiyA
         nv48s2MBsHnGyYZUblPQwk9KTsfRQxXLB8P1z74f+PYG5A5MCPbdKJXu8JPBa6tbBBAC
         7wvyRyuLf6nVbeuWvHapgwZsCvNyWzdxEkKK7Q459rL2C/5lS31JL+CBBLaZneUTEWid
         DafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vVdEfWSlmLCjTZzZsqvvIxgWNNo8H9xjhu0/9T9YVpU=;
        b=o4wJKnsT/CpQ/DwSIDET5DkXq1wZSgtMmhj5O5K0eagMlhDgJMaCg2G3ePsdjaEOWj
         lU0yBEZF/NeHKG9ZBJghPpYLwsB4agVKlmewOVD2AOpZ0J2DnJdEdQ/mNI7/PC9iLsUa
         2KDkJBCrBiVv2LOFd4/R6RVZJrsFMBIEdawrIiX0vHkBWTOz/yRG6qNrZ3BspiIqdCOe
         WSgBOCCmIIjWd615AlS0WMknLhwwCrOrNnvGLyZgrrVShjYvuoy0v06QfeRjCqM6/kZk
         +3qUtmavTmtIRRI8atMzy34EoyvrSk07Yah1l5skDR+Np+KvQrAvJV5+1a+QhkuQNYAp
         CL0Q==
X-Gm-Message-State: AOAM533R1gx9VD0HTV9BWhMeghQp84BKFfEW1f0ZpJtoG3YNaKapsHcy
        GVU7gBnucUw0xVACZta9uek=
X-Google-Smtp-Source: ABdhPJyKyQ+rcI1yMgx5DeqIr7yds4RFmEThUICE4kKcuA/yo4/N31AymywJRuTF1ELr74NJdEQU1w==
X-Received: by 2002:a17:906:3412:: with SMTP id c18mr2583106ejb.146.1613400884593;
        Mon, 15 Feb 2021 06:54:44 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:83c6:b72d:87bd:4259? ([2a02:908:1252:fb60:83c6:b72d:87bd:4259])
        by smtp.gmail.com with ESMTPSA id q20sm10743492ejs.17.2021.02.15.06.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 06:54:44 -0800 (PST)
Subject: Re: [Linaro-mm-sig] DMA-buf and uncached system memory
To:     David Laight <David.Laight@ACULAB.COM>,
        =?UTF-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Simon Ser <contact@emersion.fr>
Cc:     "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
 <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
 <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
 <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
 <fa3f6eefc0a940b38448b0efd4b3f4e3@AcuMS.aculab.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <33ffa837-a88a-db1c-7861-c70d67557665@gmail.com>
Date:   Mon, 15 Feb 2021 15:54:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fa3f6eefc0a940b38448b0efd4b3f4e3@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 15.02.21 um 15:41 schrieb David Laight:
> From: Christian König
>> Sent: 15 February 2021 12:05
> ...
>> Snooping the CPU caches introduces some extra latency, so what can
>> happen is that the response to the PCIe read comes to late for the
>> scanout. The result is an underflow and flickering whenever something is
>> in the cache which needs to be flushed first.
> Aren't you going to get the same problem if any other endpoints are
> doing memory reads?

The PCIe device in this case is part of the SoC, so we have a high 
priority channel to memory.

Because of this the hardware designer assumed they have a guaranteed 
memory latency.

> Possibly even ones that don't require a cache snoop and flush.
>
> What about just the cpu doing a real memory transfer?
>
> Or a combination of the two above happening just before your request.
>
> If you don't have a big enough fifo you'll lose.
>
> I did 'fix' a similar(ish) issue with video DMA latency on an embedded
> system based the on SA1100/SA1101 by significantly reducing the clock
> to the VGA panel whenever the cpu was doing 'slow io'.
> (Interleaving an uncached cpu DRAM write between the slow io cycles
> also fixed it.)
> But the video was the only DMA device and that was an embedded system.
> Given the application note about video latency didn't mention what was
> actually happening, I'm not sure how many people actually got it working!

Yeah, I'm also not sure if AMD doesn't solve this with deeper fifos or 
more prefetching in future designs.

But you gave me at least one example where somebody had similar problems.

Thanks for the feedback,
Christian.

>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

