Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D433532BF
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 07:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhDCFjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 01:39:31 -0400
Received: from m15111.mail.126.com ([220.181.15.111]:59699 "EHLO
        m15111.mail.126.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbhDCFja (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 01:39:30 -0400
X-Greylist: delayed 1808 seconds by postgrey-1.27 at vger.kernel.org; Sat, 03 Apr 2021 01:39:30 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=rQkev
        JDewABD48/sFYiTAicdrL+ePg85zgsqOxS9BAI=; b=AbOfS0/jKRCR9OTJWCgcA
        y2er+8foc2KFLaGPHg0dTEYKKxiHbh6zgIJ83fvYYDRwUyaK0TkWrlO5H9vi7jhW
        +Sazj54SM8HoFSB5vzbLRy4dVY0axit9hDzoUaSBzbW6/DBFqeB06Ao6cpZ9Yo7k
        fsO7j1P9Ff0/H/8OgT6OeU=
Received: from [172.20.20.87] (unknown [182.150.46.145])
        by smtp1 (Coremail) with SMTP id C8mowAB3flJc+GdgHYX7Pw--.58783S2;
        Sat, 03 Apr 2021 13:08:46 +0800 (CST)
Subject: Re: [PATCH] drm/amdgpu: Fix a potential sdma invalid access
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, airlied@redhat.com, ray.huang@amd.com,
        Mihir.Patel@amd.com, nirmoy.aiemd@gmail.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <1617333527-89782-1-git-send-email-jinsdb@126.com>
 <9b876791-7fa4-46da-7aec-1d1bfde83f4e@amd.com>
From:   Qu Huang <jinsdb@126.com>
Message-ID: <84619284-d401-f018-d627-8e5dfef1ff1f@126.com>
Date:   Sat, 3 Apr 2021 13:08:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9b876791-7fa4-46da-7aec-1d1bfde83f4e@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAB3flJc+GdgHYX7Pw--.58783S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFW5CrWkXw43ZF17Cr4DArb_yoWruF4fpF
        yrJay7uF4Fvr1UJrZrZFs8X34ktr93A3WUKr45tr13X3W3Grn8XF18JrWj9FnrZr40qa17
        tr4kK3ySqr1jgaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b138nUUUUU=
X-Originating-IP: [182.150.46.145]
X-CM-SenderInfo: pmlq2vbe6rjloofrz/1tbimR5pDl9E2fqeUQAAsX
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

On 2021/4/3 0:25, Christian König wrote:
> Hi Qu,
>
> Am 02.04.21 um 05:18 schrieb Qu Huang:
>> Before dma_resv_lock(bo->base.resv, NULL) in amdgpu_bo_release_notify(),
>> the bo->base.resv lock may be held by ttm_mem_evict_first(),
>
> That can't happen since when bo_release_notify is called the BO has not
> more references and is therefore deleted.
>
> And we never evict a deleted BO, we just wait for it to become idle.
>
Yes, the bo reference counter return to zero will enter
ttm_bo_release(),but notify bo release (call amdgpu_bo_release_notify())
first happen, and then test if a reservation object's fences have been
signaled, and then mark bo as deleted and remove bo from the LRU list.

When ttm_bo_release() and ttm_mem_evict_first() is concurrent,
the Bo has not been removed from the LRU list and is not marked as
deleted, this will happen.

As a test, when we use CPU memset instead of SDMA fill in
amdgpu_bo_release_notify(), the result is page fault:

PID: 5490   TASK: ffff8e8136e04100  CPU: 4   COMMAND: "gemmPerf"
   #0 [ffff8e79eaa17970] machine_kexec at ffffffffb2863784
   #1 [ffff8e79eaa179d0] __crash_kexec at ffffffffb291ce92
   #2 [ffff8e79eaa17aa0] crash_kexec at ffffffffb291cf80
   #3 [ffff8e79eaa17ab8] oops_end at ffffffffb2f6c768
   #4 [ffff8e79eaa17ae0] no_context at ffffffffb2f5aaa6
   #5 [ffff8e79eaa17b30] __bad_area_nosemaphore at ffffffffb2f5ab3d
   #6 [ffff8e79eaa17b80] bad_area_nosemaphore at ffffffffb2f5acae
   #7 [ffff8e79eaa17b90] __do_page_fault at ffffffffb2f6f6c0
   #8 [ffff8e79eaa17c00] do_page_fault at ffffffffb2f6f925
   #9 [ffff8e79eaa17c30] page_fault at ffffffffb2f6b758
      [exception RIP: memset+31]
      RIP: ffffffffb2b8668f  RSP: ffff8e79eaa17ce8  RFLAGS: 00010a17
      RAX: bebebebebebebebe  RBX: ffff8e747bff10c0  RCX: 0000060b00200000
      RDX: 0000000000000000  RSI: 00000000000000be  RDI: ffffab807f000000
      RBP: ffff8e79eaa17d10   R8: ffff8e79eaa14000   R9: ffffab7c80000000
      R10: 000000000000bcba  R11: 00000000000001ba  R12: ffff8e79ebaa4050
      R13: ffffab7c80000000  R14: 0000000000022600  R15: ffff8e8136e04100
      ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
#10 [ffff8e79eaa17ce8] amdgpu_bo_release_notify at ffffffffc092f2d1 [amdgpu]
#11 [ffff8e79eaa17d18] ttm_bo_release at ffffffffc08f39dd [amdttm]
#12 [ffff8e79eaa17d58] amdttm_bo_put at ffffffffc08f3c8c [amdttm]
#13 [ffff8e79eaa17d68] amdttm_bo_vm_close at ffffffffc08f7ac9 [amdttm]
#14 [ffff8e79eaa17d80] remove_vma at ffffffffb29ef115
#15 [ffff8e79eaa17da0] exit_mmap at ffffffffb29f2c64
#16 [ffff8e79eaa17e58] mmput at ffffffffb28940c7
#17 [ffff8e79eaa17e78] do_exit at ffffffffb289dc95
#18 [ffff8e79eaa17f10] do_group_exit at ffffffffb289e4cf
#19 [ffff8e79eaa17f40] sys_exit_group at ffffffffb289e544
#20 [ffff8e79eaa17f50] system_call_fastpath at ffffffffb2f74ddb

Regards,
Qu.


> Regards,
> Christian.
>
>> and the VRAM mem will be evicted, mem region was replaced
>> by Gtt mem region. amdgpu_bo_release_notify() will then
>> hold the bo->base.resv lock, and SDMA will get an invalid
>> address in amdgpu_fill_buffer(), resulting in a VMFAULT
>> or memory corruption.
>>
>> To avoid it, we have to hold bo->base.resv lock first, and
>> check whether the mem.mem_type is TTM_PL_VRAM.
>>
>> Signed-off-by: Qu Huang <jinsdb@126.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 4b29b82..8018574 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -1300,12 +1300,16 @@ void amdgpu_bo_release_notify(struct
>> ttm_buffer_object *bo)
>>       if (bo->base.resv == &bo->base._resv)
>>           amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
>>
>> -    if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node ||
>> -        !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>> +    if (!(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>>           return;
>>
>>       dma_resv_lock(bo->base.resv, NULL);
>>
>> +    if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node) {
>> +        dma_resv_unlock(bo->base.resv);
>> +        return;
>> +    }
>> +
>>       r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
>>       if (!WARN_ON(r)) {
>>           amdgpu_bo_fence(abo, fence, false);
>> --
>> 1.8.3.1
>>

