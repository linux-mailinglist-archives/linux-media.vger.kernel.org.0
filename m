Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7921645B6A0
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 09:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241369AbhKXImc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 03:42:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240683AbhKXImb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 03:42:31 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B34C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 00:39:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id i5so2768339wrb.2
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 00:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Lj9exkj41mUO3rbM11QfcWV5xN8OHMkxAp3EQf8/bSM=;
        b=FZfp/k4xVIMGKsK1pS+DXNKcXEQJdPCVFY40pCKuU0pzE2bw8gEftVYOh/SF8kE4Ox
         nNG2iYQ+Fp2c3hKTmbFB6uSrXmG5nrx9BqQkMU2REVj1EG/gKw21hu0zIumuDSqo8kqo
         GLql8mfjVSkMkgTXU7XCTdUchFE1Z1zdlzeyw4E0MTIXmnZnF18D8q1Ja8+uG+LYfEaJ
         Jmli9dp3iH8g9J9Ro9EnsuqHzAQzM/2mj26btXMMKcp8xrVNoizL0wi1PHYplDdrHy8k
         c4KllStj9+rUdeX04Bgo3seDx1kIPK14QmRjbyoTk04mFHwOQ3AYtfVIw3xjaW9M6ifX
         E3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Lj9exkj41mUO3rbM11QfcWV5xN8OHMkxAp3EQf8/bSM=;
        b=N7D/3M7w0Tqa/US9P1uJQ2k5vmDrUFxyzez1yRLuG61POWOujAlyYGihTdUAz6kYAG
         SNhpNavGB4/sb+HP211+VQz8qSLdG8trA4S8ErzeiatIKFUn6SD+LN76Fy6X2b8VDJhJ
         m+WDdUpMJX9SGSVM5y9Hb7MVsHXamIJ+B7QmlWOZ3R8sNl+8S1K3DXlqIpc5a3QIkboU
         ChYQiANpgFZx6VrTVt2Ey5Ct17FpHmRjoUPN84IHTUi998+OkmaNGQM4veGz98wh9QI7
         3NEb0AFB6ZDefeDO69zXrhRWA/NsoECFHP/ZfGTaH/Qe6a3Ac+2Mulw1cOVnbpdaIOyp
         /CzA==
X-Gm-Message-State: AOAM533eVtmXxmtWeE9qBuFJG6i1SvL9dpidVNm5ZeEH5oi6hAAKfymV
        X7Ca+nZfPDpYSWZlRWz6Mt3rTJtowGo=
X-Google-Smtp-Source: ABdhPJzxsYHWjGTwMP4ZkL8uZANLbMoSXkzUTzh5pUVvYh+kknnhH5dBF6rmtS+Rz/Rl/AMhqQeCOg==
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr15676044wrf.383.1637743160700;
        Wed, 24 Nov 2021 00:39:20 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id h27sm4313424wmc.43.2021.11.24.00.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 00:39:20 -0800 (PST)
Subject: Re: completely rework the dma_resv semantic
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     sumit.semwal@linaro.org, daniel@ffwll.ch,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20211123142111.3885-1-christian.koenig@amd.com>
 <20211124103111.17b08d79@eldfell>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <17d017ba-355f-8f25-4d9d-c820273c9be5@gmail.com>
Date:   Wed, 24 Nov 2021 09:39:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124103111.17b08d79@eldfell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 24.11.21 um 09:31 schrieb Pekka Paalanen:
> On Tue, 23 Nov 2021 15:20:45 +0100
> "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Hi guys,
>>
>> as discussed before this set of patches completely rework the dma_resv semantic
>> and spreads the new handling over all the existing drivers and users.
>>
>> First of all this drops the DAG approach because it requires that every single
>> driver implements those relatively complicated rules correctly and any
>> violation of that immediately leads to either corruption of freed memory or
>> even more severe security problems.
>>
>> Instead we just keep all fences around all the time until they are signaled.
>> Only fences with the same context are assumed to be signaled in the correct
>> order since this is exercised elsewhere as well. Replacing fences is now only
>> supported for hardware mechanism like VM page table updates where the hardware
>> can guarantee that the resource can't be accessed any more.
>>
>> Then the concept of a single exclusive fence and multiple shared fences is
>> dropped as well.
>>
>> Instead the dma_resv object is now just a container for dma_fence objects where
>> each fence has associated usage flags. Those use flags describe how the
>> operation represented by the dma_fence object is using the resource protected
>> by the dma_resv object. This allows us to add multiple fences for each usage
>> type.
>>
>> Additionally to the existing WRITE/READ usages this patch set also adds the new
>> KERNEL and OTHER usages. The KERNEL usages is used in cases where the kernel
>> needs to do some operation with the resource protected by the dma_resv object,
>> like copies or clears. Those are mandatory to wait for when dynamic memory
>> management is used.
>>
>> The OTHER usage is for cases where we don't want that the operation represented
>> by the dma_fence object participate in any implicit sync but needs to be
>> respected by the kernel memory management. Examples for those are VM page table
>> updates and preemption fences.
> Hi,
>
> reading just the cover letter I wonder if KERNEL and OTHER could have
> better names based on what you describe how they are used. WRITE and
> READ immediately give an idea of semantics, KERNEL and OTHER not so
> much.
>
> Some suggestions coming to my mind:
>
> KERNEL -> PREPARE or INITIALIZE or SANITIZE
> OTHER -> BOOKKEEP

Yes, I was entertaining similar thoughts for quite a while as well.

I think KERNEL fits better than the suggestions because that is really 
something only the kernel should use and we should not encourage anybody 
to use that for userspace submissions.

But using BOOKKEEP instead of OTHER sounds like a really good idea to 
me. Going to keep that in mind and if nobody has any better idea making 
the change for the next revision.

Thanks,
Christian.

>
>
> Thanks,
> pq
>
>> While doing this the new implementation cleans up existing workarounds all over
>> the place, but especially amdgpu and TTM. Surprisingly I also found two use
>> cases for the KERNEL/OTHER usage in i915 and Nouveau, those might need more
>> thoughts.
>>
>> In general the existing functionality should been preserved, the only downside
>> is that we now always need to reserve a slot before adding a fence. The newly
>> added call to the reservation function can probably use some more cleanup.
>>
>> TODOs: Testing, testing, testing, doublechecking the newly added
>> kerneldoc for any typos.
>>
>> Please review and/or comment,
>> Christian.
>>
>>

