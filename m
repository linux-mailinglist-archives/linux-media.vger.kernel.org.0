Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE2035558B
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 15:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344669AbhDFNor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 09:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244109AbhDFNoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 09:44:39 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1778C06174A;
        Tue,  6 Apr 2021 06:44:30 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b14so22808162lfv.8;
        Tue, 06 Apr 2021 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HndgTpsYb8opSkDPkPv2qTZWIUPT/aqLzD+oKEc8jTM=;
        b=E3rkPifMvPz4Pl7zBDpcrj79N2CEz5G67lBlHegmKK040XODxb86kfPv2iNiDja9U/
         kHpsLOBNbgy+WkvaWzbNquAUJw4nof1FK+1LXsWW444wNChddylL4YyNgh1gwen66SiO
         MMKUZQvFz3MNqwTfmbuc9DmOvCNi76VofDOfDzplOKl+NksKT80W0uTkQ0xOmNXCx4sE
         MoTF1f0kgteIzA+KHRXIP08JGBqMzHk9tIIqJhQbpyTVeWMDJ0pnmrOl3M5DH8kcbcOu
         uMNlzfEZpU2oEP7Yos75N8yNc7N/0+1fQuT0H8WoNeGFZua0jnAMoMyapFakwBoStIdJ
         CuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HndgTpsYb8opSkDPkPv2qTZWIUPT/aqLzD+oKEc8jTM=;
        b=li5Nua1CKLvlxpfjCcW2PKkvFwdMei8iAtaQ+RYd1vNwRIsC8LAShQyccxFDllR9W7
         TJUxI+CaT/1zzTlXYB03rkC+gOlPcikrNaT6C35pZ2036IafrZ7p06eIzIPzKyH93rtf
         6cex98WbFjsbnZ4gn0UwdUr2sWVVB/YfzKuGb3mQL5MLT1xtSimJUFFvea7XcgVKURwT
         wYnKcAqmyYUAOpJz/DQwUEny4bug2HTUI/aKADg+NJ0yMRRtc5auvpBNuN0ttw25+WWs
         xm1eFt+rI5oyZ5zEkc/rorMAhLldk2N4BmqoWzcNj3FfNiNiS3yRNATZNGZeGOxKt3bf
         LMzA==
X-Gm-Message-State: AOAM533miC1VqEBYtdYeEm8Y8wXhOX9ZLdw3kvN6Q41FdIkvlWoAg7mM
        Hn+9ys89TdPGfu0JM81l1nDD31jmlnU=
X-Google-Smtp-Source: ABdhPJzeaD9tEt3BwepFOC65yg0rMuwLuBGUU0XhNQ/+qIqHSNP57BIyNkk8vZYgpPMMUiPHxGVDVQ==
X-Received: by 2002:ac2:4a7c:: with SMTP id q28mr21517060lfp.154.1617716669478;
        Tue, 06 Apr 2021 06:44:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b166:1569:a6c7:85bf? ([2a02:908:1252:fb60:b166:1569:a6c7:85bf])
        by smtp.gmail.com with ESMTPSA id o11sm2219865ljg.42.2021.04.06.06.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 06:44:28 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix a potential sdma invalid access
To:     Qu Huang <jinsdb@126.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, airlied@redhat.com, ray.huang@amd.com,
        Mihir.Patel@amd.com, nirmoy.aiemd@gmail.com
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1617333527-89782-1-git-send-email-jinsdb@126.com>
 <9b876791-7fa4-46da-7aec-1d1bfde83f4e@amd.com>
 <84619284-d401-f018-d627-8e5dfef1ff1f@126.com>
 <fc8cf44b-e952-1c48-137a-77c35bbfbb24@amd.com>
 <c057c924-a668-7cff-c75b-844ec1b6cf05@126.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e3e22a04-575a-1b4a-d7bb-a9013b3c9f46@gmail.com>
Date:   Tue, 6 Apr 2021 15:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c057c924-a668-7cff-c75b-844ec1b6cf05@126.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Qu,

Am 06.04.21 um 08:04 schrieb Qu Huang:
> Hi Christian,
>
> On 2021/4/3 16:49, Christian König wrote:
>> Hi Qu,
>>
>> Am 03.04.21 um 07:08 schrieb Qu Huang:
>>> Hi Christian,
>>>
>>> On 2021/4/3 0:25, Christian König wrote:
>>>> Hi Qu,
>>>>
>>>> Am 02.04.21 um 05:18 schrieb Qu Huang:
>>>>> Before dma_resv_lock(bo->base.resv, NULL) in
>>>>> amdgpu_bo_release_notify(),
>>>>> the bo->base.resv lock may be held by ttm_mem_evict_first(),
>>>>
>>>> That can't happen since when bo_release_notify is called the BO has 
>>>> not
>>>> more references and is therefore deleted.
>>>>
>>>> And we never evict a deleted BO, we just wait for it to become idle.
>>>>
>>> Yes, the bo reference counter return to zero will enter
>>> ttm_bo_release(),but notify bo release (call 
>>> amdgpu_bo_release_notify())
>>> first happen, and then test if a reservation object's fences have been
>>> signaled, and then mark bo as deleted and remove bo from the LRU list.
>>>
>>> When ttm_bo_release() and ttm_mem_evict_first() is concurrent,
>>> the Bo has not been removed from the LRU list and is not marked as
>>> deleted, this will happen.
>>
>> Not sure on which code base you are, but I don't see how this can 
>> happen.
>>
>> ttm_mem_evict_first() calls ttm_bo_get_unless_zero() and
>> ttm_bo_release() is only called when the BO reference count becomes 
>> zero.
>>
>> So ttm_mem_evict_first() will see that this BO is about to be destroyed
>> and skips it.
>>
>
> Yes, you are right. My version of TTM is ROCM 3.3, so
> ttm_mem_evict_first() did not call ttm_bo_get_unless_zero(), check that
> ROCM 4.0 ttm doesn't have this issue. This is an oversight on my part.
>
>>>
>>> As a test, when we use CPU memset instead of SDMA fill in
>>> amdgpu_bo_release_notify(), the result is page fault:
>>>
>>> PID: 5490   TASK: ffff8e8136e04100  CPU: 4   COMMAND: "gemmPerf"
>>>   #0 [ffff8e79eaa17970] machine_kexec at ffffffffb2863784
>>>   #1 [ffff8e79eaa179d0] __crash_kexec at ffffffffb291ce92
>>>   #2 [ffff8e79eaa17aa0] crash_kexec at ffffffffb291cf80
>>>   #3 [ffff8e79eaa17ab8] oops_end at ffffffffb2f6c768
>>>   #4 [ffff8e79eaa17ae0] no_context at ffffffffb2f5aaa6
>>>   #5 [ffff8e79eaa17b30] __bad_area_nosemaphore at ffffffffb2f5ab3d
>>>   #6 [ffff8e79eaa17b80] bad_area_nosemaphore at ffffffffb2f5acae
>>>   #7 [ffff8e79eaa17b90] __do_page_fault at ffffffffb2f6f6c0
>>>   #8 [ffff8e79eaa17c00] do_page_fault at ffffffffb2f6f925
>>>   #9 [ffff8e79eaa17c30] page_fault at ffffffffb2f6b758
>>>      [exception RIP: memset+31]
>>>      RIP: ffffffffb2b8668f  RSP: ffff8e79eaa17ce8  RFLAGS: 00010a17
>>>      RAX: bebebebebebebebe  RBX: ffff8e747bff10c0  RCX: 
>>> 0000060b00200000
>>>      RDX: 0000000000000000  RSI: 00000000000000be  RDI: 
>>> ffffab807f000000
>>>      RBP: ffff8e79eaa17d10   R8: ffff8e79eaa14000   R9: 
>>> ffffab7c80000000
>>>      R10: 000000000000bcba  R11: 00000000000001ba  R12: 
>>> ffff8e79ebaa4050
>>>      R13: ffffab7c80000000  R14: 0000000000022600  R15: 
>>> ffff8e8136e04100
>>>      ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
>>> #10 [ffff8e79eaa17ce8] amdgpu_bo_release_notify at ffffffffc092f2d1
>>> [amdgpu]
>>> #11 [ffff8e79eaa17d18] ttm_bo_release at ffffffffc08f39dd [amdttm]
>>> #12 [ffff8e79eaa17d58] amdttm_bo_put at ffffffffc08f3c8c [amdttm]
>>> #13 [ffff8e79eaa17d68] amdttm_bo_vm_close at ffffffffc08f7ac9 [amdttm]
>>> #14 [ffff8e79eaa17d80] remove_vma at ffffffffb29ef115
>>> #15 [ffff8e79eaa17da0] exit_mmap at ffffffffb29f2c64
>>> #16 [ffff8e79eaa17e58] mmput at ffffffffb28940c7
>>> #17 [ffff8e79eaa17e78] do_exit at ffffffffb289dc95
>>> #18 [ffff8e79eaa17f10] do_group_exit at ffffffffb289e4cf
>>> #19 [ffff8e79eaa17f40] sys_exit_group at ffffffffb289e544
>>> #20 [ffff8e79eaa17f50] system_call_fastpath at ffffffffb2f74ddb
>>
>> Well that might be perfectly expected. VRAM is not necessarily CPU
>> accessible.
>>
> As a test，use CPU memset instead of SDMA fill, This is my code:
> void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
> {
>     struct amdgpu_bo *abo;
>     uint64_t num_pages;
>     struct drm_mm_node *mm_node;
>     struct amdgpu_device *adev;
>     void __iomem *kaddr;
>
>     if (!amdgpu_bo_is_amdgpu_bo(bo))
>         return;
>
>     abo = ttm_to_amdgpu_bo(bo);
>     num_pages = abo->tbo.num_pages;
>     mm_node = abo->tbo.mem.mm_node;
>     adev = amdgpu_ttm_adev(abo->tbo.bdev);
>     kaddr = adev->mman.aper_base_kaddr;
>
>     if (abo->kfd_bo)
>         amdgpu_amdkfd_unreserve_memory_limit(abo);
>
>     if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node ||
>         !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>         return;
>
>     dma_resv_lock(amdkcl_ttm_resvp(bo), NULL);
>     while (num_pages && mm_node) {
>         void *ptr = kaddr + (mm_node->start << PAGE_SHIFT);

That might not work as expected.

aper_base_kaddr can only point to a 256MiB window into VRAM, but VRAM 
itself is usually much larger.

So your memset_io() might end up in nirvana if the BO is allocated 
outside of the window.

> memset_io(ptr, AMDGPU_POISON & 0xff, mm_node->size <<PAGE_SHIFT);
>         num_pages -= mm_node->size;
>         ++mm_node;
>     }
>     dma_resv_unlock(amdkcl_ttm_resvp(bo));
> }
>
>
>
>
>
> I have used the old version through oversight, so I am sorry for your
> trouble.

No, problem. I was just wondering if I was missing something.

Regards,
Christian.

>
>
> Regards,
> Qu.
>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>> Qu.
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> and the VRAM mem will be evicted, mem region was replaced
>>>>> by Gtt mem region. amdgpu_bo_release_notify() will then
>>>>> hold the bo->base.resv lock, and SDMA will get an invalid
>>>>> address in amdgpu_fill_buffer(), resulting in a VMFAULT
>>>>> or memory corruption.
>>>>>
>>>>> To avoid it, we have to hold bo->base.resv lock first, and
>>>>> check whether the mem.mem_type is TTM_PL_VRAM.
>>>>>
>>>>> Signed-off-by: Qu Huang <jinsdb@126.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 8 ++++++--
>>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> index 4b29b82..8018574 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> @@ -1300,12 +1300,16 @@ void amdgpu_bo_release_notify(struct
>>>>> ttm_buffer_object *bo)
>>>>>       if (bo->base.resv == &bo->base._resv)
>>>>>           amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
>>>>>
>>>>> -    if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node ||
>>>>> -        !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>>>>> +    if (!(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>>>>>           return;
>>>>>
>>>>>       dma_resv_lock(bo->base.resv, NULL);
>>>>>
>>>>> +    if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node) {
>>>>> +        dma_resv_unlock(bo->base.resv);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>>       r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv,
>>>>> &fence);
>>>>>       if (!WARN_ON(r)) {
>>>>>           amdgpu_bo_fence(abo, fence, false);
>>>>> -- 
>>>>> 1.8.3.1
>>>>>
>>>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

