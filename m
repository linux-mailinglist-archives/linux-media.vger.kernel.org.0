Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260C941114D
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 10:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235952AbhITIsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 04:48:53 -0400
Received: from mga14.intel.com ([192.55.52.115]:20260 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231625AbhITIsw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 04:48:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="222739230"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; 
   d="scan'208";a="222739230"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 01:47:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; 
   d="scan'208";a="473500252"
Received: from gbradyx-mobl2.ger.corp.intel.com (HELO [10.213.235.119]) ([10.213.235.119])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 01:47:24 -0700
Subject: Re: [Intel-gfx] [PATCH 14/26] drm/i915: use the new iterator in
 i915_sw_fence_await_reservation v3
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-15-christian.koenig@amd.com>
 <93b93f00-7ad3-9ea3-e947-77297b4552c9@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <60595ff8-7935-c0a4-7c0f-2a4c3a1d62b9@linux.intel.com>
Date:   Mon, 20 Sep 2021 09:47:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <93b93f00-7ad3-9ea3-e947-77297b4552c9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 20/09/2021 09:45, Tvrtko Ursulin wrote:
> 
> On 17/09/2021 13:35, Christian König wrote:
>> Simplifying the code a bit.
>>
>> v2: use dma_resv_for_each_fence instead, according to Tvrtko the lock is
>>      held here anyway.
>> v3: back to using dma_resv_for_each_fence_unlocked.
> 
> It did not work out - what happened?
Wait, my suggestion to try the locked iterator was against 
i915_request_await_object. I haven't looked at this one at the time or 
even now.

Regards,

Tvrtko


> Regards,
> 
> Tvrtko
> 
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/i915_sw_fence.c | 57 ++++++++--------------------
>>   1 file changed, 15 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c 
>> b/drivers/gpu/drm/i915/i915_sw_fence.c
>> index c589a681da77..7635b0478ea5 100644
>> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
>> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
>> @@ -572,56 +572,29 @@ int i915_sw_fence_await_reservation(struct 
>> i915_sw_fence *fence,
>>                       unsigned long timeout,
>>                       gfp_t gfp)
>>   {
>> -    struct dma_fence *excl;
>> +    struct dma_resv_iter cursor;
>> +    struct dma_fence *f;
>>       int ret = 0, pending;
>>       debug_fence_assert(fence);
>>       might_sleep_if(gfpflags_allow_blocking(gfp));
>> -    if (write) {
>> -        struct dma_fence **shared;
>> -        unsigned int count, i;
>> -
>> -        ret = dma_resv_get_fences(resv, &excl, &count, &shared);
>> -        if (ret)
>> -            return ret;
>> -
>> -        for (i = 0; i < count; i++) {
>> -            if (shared[i]->ops == exclude)
>> -                continue;
>> -
>> -            pending = i915_sw_fence_await_dma_fence(fence,
>> -                                shared[i],
>> -                                timeout,
>> -                                gfp);
>> -            if (pending < 0) {
>> -                ret = pending;
>> -                break;
>> -            }
>> -
>> -            ret |= pending;
>> -        }
>> -
>> -        for (i = 0; i < count; i++)
>> -            dma_fence_put(shared[i]);
>> -        kfree(shared);
>> -    } else {
>> -        excl = dma_resv_get_excl_unlocked(resv);
>> -    }
>> -
>> -    if (ret >= 0 && excl && excl->ops != exclude) {
>> -        pending = i915_sw_fence_await_dma_fence(fence,
>> -                            excl,
>> -                            timeout,
>> +    rcu_read_lock();
>> +    dma_resv_iter_begin(&cursor, resv, write);
>> +    dma_resv_for_each_fence_unlocked(&cursor, f) {
>> +        rcu_read_unlock();
>> +        pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>>                               gfp);
>> -        if (pending < 0)
>> +        rcu_read_lock();
>> +        if (pending < 0) {
>>               ret = pending;
>> -        else
>> -            ret |= pending;
>> -    }
>> -
>> -    dma_fence_put(excl);
>> +            break;
>> +        }
>> +        ret |= pending;
>> +    }
>> +    dma_resv_iter_end(&cursor);
>> +    rcu_read_unlock();
>>       return ret;
>>   }
>>
