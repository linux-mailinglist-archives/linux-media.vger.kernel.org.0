Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C19B3FFBD3
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 10:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348177AbhICIXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 04:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348122AbhICIXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 04:23:03 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D36C061575
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 01:22:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i6so7033448wrv.2
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MgMZnvLFXAcSBdvB9Oxgj/mRrofgWEwJiqDsGLdXgQc=;
        b=ohorBxGGL874DiMlNf0oZ8t7n+49x8bJ2gftr1I1Q0cKWBj13bs5G8PvKMWlOEl2+X
         xYY44rW/kP8t9ic4mbVdXfL6e8g4inoOUm8Vj8lEgiJPNaWMNeOt8lnDFvZWsSiPXjrf
         gB+VJftyUa5qsxCrUb9BW5xrJDEIDtBOr4XKiRfqjJ64nhENIc8rKXwdw/3+BiNDnR4l
         2XXgm1lVZy3xtYcORP33b3uw94lNG48Zj0tpX6ZoewM3BCQosAfUO0VQkDAkhcOU1suJ
         eyhR+LHEto7JhQ575B8zgwjfwqMLwtDx8lwljeQx8QtcXjOjJxRhoLHd903VTETt6o2T
         DlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MgMZnvLFXAcSBdvB9Oxgj/mRrofgWEwJiqDsGLdXgQc=;
        b=LNfvobnmIW8UYqLtrCyhnfQZSnjWlKFV4PXRw9AGwonp8tmYsZ5a52x5V8niWbRqm0
         +JUcFntSV4erqpX3mobs8CirV5GrAW51UFyNF3DgOtejqKnCJ03iGKA5TpLEHrYzju0m
         4VHxbVjwjPqTYHI17H1EnI/zQVz2Qcf5G7ir1HrOn9y4ebeOJhqi3uCJoO+NZapRImve
         ZhWBlIpf2AOYBwR4J9hWnRMpgwsA9inRrfoPpZLmL9VTkWWcqC3+V7EDyST91OtCd/d5
         7ILFTl4QFtdf6gKJbhKsymtAX0TyjCitNBCKKanSQzrYoJicF8eTQJ4bp+TOXLWcEV3X
         SEgQ==
X-Gm-Message-State: AOAM531ScKnN9CS3bmV4pH7C2L2Zmo2EgZrsQVoZH9p7ormLv4CL//7T
        ZalcZI7eg6pXgNh3LB5lBzIb2KCcrv/jpn8b
X-Google-Smtp-Source: ABdhPJwXY6GkZxqh7co8a/VRchCKbhjMyuqujyVMVqVrZPFQA1Kc45qboE2uhd8vPXT3FWi3vJTNIw==
X-Received: by 2002:adf:c785:: with SMTP id l5mr2653367wrg.360.1630657322464;
        Fri, 03 Sep 2021 01:22:02 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id a77sm3919302wmd.31.2021.09.03.01.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 01:22:02 -0700 (PDT)
Subject: Re: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210901120240.7339-1-christian.koenig@amd.com>
 <20210901120240.7339-3-christian.koenig@amd.com>
 <YTDi8BNRXcEkf8a4@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <992a4531-da58-d6e5-8cb2-a21407743397@gmail.com>
Date:   Fri, 3 Sep 2021 10:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTDi8BNRXcEkf8a4@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 02.09.21 um 16:42 schrieb Daniel Vetter:
> On Wed, Sep 01, 2021 at 02:02:40PM +0200, Christian König wrote:
>> That the caller doesn't need to keep a reference is rather
>> risky and not defensive at all.
>>
>> Especially dma_buf_poll got that horrible wrong, so better
>> remove that sentence and also clarify that the callback
>> might be called in atomic or interrupt context.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Still on the fence between documenting the precise rules and documenting
> the safe rules, but this is tricky enough that you got me convinced. Plus
> shorter, simpler, clearer kerneldoc has much better chances of being read,
> understood and followed.

I think that for documentation we should apply the same rules we have 
for code.

E.g. keep it simple until you absolutely have to make it complex and 
keep it defensive with the least probability for something to go wrong.

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks,
Christian.

>
>> ---
>>   drivers/dma-buf/dma-fence.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index ce0f5eff575d..1e82ecd443fa 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>>    * @cb: the callback to register
>>    * @func: the function to call
>>    *
>> + * Add a software callback to the fence. The caller should keep a reference to
>> + * the fence.
>> + *
>>    * @cb will be initialized by dma_fence_add_callback(), no initialization
>>    * by the caller is required. Any number of callbacks can be registered
>>    * to a fence, but a callback can only be registered to one fence at a time.
>>    *
>> - * Note that the callback can be called from an atomic context.  If
>> - * fence is already signaled, this function will return -ENOENT (and
>> + * If fence is already signaled, this function will return -ENOENT (and
>>    * *not* call the callback).
>>    *
>> - * Add a software callback to the fence. Same restrictions apply to
>> - * refcount as it does to dma_fence_wait(), however the caller doesn't need to
>> - * keep a refcount to fence afterward dma_fence_add_callback() has returned:
>> - * when software access is enabled, the creator of the fence is required to keep
>> - * the fence alive until after it signals with dma_fence_signal(). The callback
>> - * itself can be called from irq context.
>> + * Note that the callback can be called from an atomic context or irq context.
>>    *
>>    * Returns 0 in case of success, -ENOENT if the fence is already signaled
>>    * and -EINVAL in case of error.
>> -- 
>> 2.25.1
>>

