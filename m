Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 712E1103CB0
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 14:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731213AbfKTN4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 08:56:25 -0500
Received: from mga11.intel.com ([192.55.52.93]:54173 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727988AbfKTN4Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 08:56:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 05:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; 
   d="scan'208";a="237738215"
Received: from cdonitzk-mobl1.ger.corp.intel.com (HELO [10.249.32.229]) ([10.249.32.229])
  by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2019 05:56:20 -0800
Subject: Re: [PATCH 2/3] dma-resv: Also prime acquire ctx for lockdep
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Huang Rui <ray.huang@amd.com>, Eric Anholt <eric@anholt.net>,
        Ben Skeggs <bskeggs@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Rob Herring <robh@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
 <20191119210844.16947-3-daniel.vetter@ffwll.ch>
 <7fb69a1a-170a-9afa-7de8-d511cbd20c39@amd.com>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <12b1c5c8-2eaf-d33b-9840-c356bcb45b29@linux.intel.com>
Date:   Wed, 20 Nov 2019 14:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7fb69a1a-170a-9afa-7de8-d511cbd20c39@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Op 20-11-2019 om 12:30 schreef Christian König:
> Am 19.11.19 um 22:08 schrieb Daniel Vetter:
>> Semnatically it really doesn't matter where we grab the ticket. But
>> since the ticket is a fake lockdep lock, it matters for lockdep
>> validation purposes.
>>
>> This means stuff like grabbing a ticket and then doing
>> copy_from/to_user isn't allowed anymore. This is a changed compared to
>> the current ttm fault handler, which doesn't bother with having a full
>> reservation. Since I'm looking into fixing the TODO entry in
>> ttm_mem_evict_wait_busy() I think that'll have to change sooner or
>> later anyway, better get started. A bit more context on why I'm
>> looking into this: For backwards compat with existing i915 gem code I
>> think we'll have to do full slowpath locking in the i915 equivalent of
>> the eviction code. And with dynamic dma-buf that will leak across
>> drivers, so another thing we need to standardize and make sure it's
>> done the same way everyway.
>>
>> Unfortunately this means another full audit of all drivers:
>>
>> - gem helpers: acquire_init is done right before taking locks, so no
>>    problem. Same for acquire_fini and unlocking, which means nothing
>>    that's not already covered by the dma_resv_lock rules will be caught
>>    with this extension here to the acquire_ctx.
>>
>> - etnaviv: An absolute massive amount of code is run between the
>>    acquire_init and the first lock acquisition in submit_lock_objects.
>>    But nothing that would touch user memory and could cause a fault.
>>    Furthermore nothing that uses the ticket, so even if I missed
>>    something, it would be easy to fix by pushing the acquire_init right
>>    before the first use. Similar on the unlock/acquire_fini side.
>>
>> - i915: Right now (and this will likely change a lot rsn) the acquire
>>    ctx and actual locks are right next to each another. No problem.
>>
>> - msm has a problem: submit_create calls acquire_init, but then
>>    submit_lookup_objects() has a bunch of copy_from_user to do the
>>    object lookups. That's the only thing before submit_lock_objects
>>    call dma_resv_lock(). Despite all the copypasta to etnaviv, etnaviv
>>    does not have this issue since it copies all the userspace structs
>>    earlier. submit_cleanup does not have any such issues.
>>
>>    With the prep patch to pull out the acquire_ctx and reorder it msm
>>    is going to be safe too.
>>
>> - nouveau: acquire_init is right next to ttm_bo_reserve, so all good.
>>    Similar on the acquire_fini/ttm_bo_unreserve side.
>>
>> - ttm execbuf utils: acquire context and locking are even in the same
>>    functions here (one function to reserve everything, the other to
>>    unreserve), so all good.
>>
>> - vc4: Another case where acquire context and locking are handled in
>>    the same functions (one function to lock everything, the other to
>>    unlock).
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> Cc: Huang Rui <ray.huang@amd.com>
>> Cc: Eric Anholt <eric@anholt.net>
>> Cc: Ben Skeggs <bskeggs@redhat.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
> Acked-by: Christian König <christian.koenig@amd.com>
>
>> ---
>>   drivers/dma-buf/dma-resv.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index d3c760e19991..079e38fde33a 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -100,7 +100,9 @@ static void dma_resv_list_free(struct dma_resv_list *list)
>>   static void __init dma_resv_lockdep(void)
>>   {
>>       struct mm_struct *mm = mm_alloc();
>> +    struct ww_acquire_ctx ctx;
>>       struct dma_resv obj;
>> +    int ret;
>>         if (!mm)
>>           return;
>> @@ -108,10 +110,14 @@ static void __init dma_resv_lockdep(void)
>>       dma_resv_init(&obj);
>>         down_read(&mm->mmap_sem);
>> -    ww_mutex_lock(&obj.lock, NULL);
>> +    ww_acquire_init(&ctx, &reservation_ww_class);
>> +    ret = dma_resv_lock(&obj, &ctx);
>> +    if (ret == -EDEADLK)
>> +        dma_resv_lock_slow(&obj, &ctx);
>>       fs_reclaim_acquire(GFP_KERNEL);
>>       fs_reclaim_release(GFP_KERNEL);
>>       ww_mutex_unlock(&obj.lock);
>> +    ww_acquire_fini(&ctx);
>>       up_read(&mm->mmap_sem);
>>      
>>       mmput(mm);
>

For whole series:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

typo in patch 3 btw :)

