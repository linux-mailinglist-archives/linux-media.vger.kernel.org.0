Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440EF40AE23
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbhINMsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:48:47 -0400
Received: from mga07.intel.com ([134.134.136.100]:9167 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232613AbhINMsp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:48:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285672229"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="285672229"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 05:47:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="544056474"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116]) ([10.213.234.116])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 05:47:26 -0700
Subject: Re: [Intel-gfx] [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-19-christian.koenig@amd.com>
 <46a40614-b448-7f2d-7b6b-0705c4277e2b@linux.intel.com>
 <6c0217a7-6ac8-0c12-4087-ee55f456f99c@gmail.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f9b65430-de19-7c3b-c77f-5a88114037c5@linux.intel.com>
Date:   Tue, 14 Sep 2021 13:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6c0217a7-6ac8-0c12-4087-ee55f456f99c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 14/09/2021 13:32, Christian König wrote:
> Am 14.09.21 um 14:27 schrieb Tvrtko Ursulin:
>>
>> On 13/09/2021 14:16, Christian König wrote:
>>> This is maybe even a fix since the RCU usage here looks incorrect.
>>
>> What you think is incorrect? Pointless extra rcu locking?
> 
> Yeah, exactly that. I also wondered for a second if rcu_read_lock() can 
> nest or not. But obviously it either works or lockdep hasn't complained 
> yet.
> 
> But I've made a mistake here and at a couple of other places to remove 
> to many rcu_read_lock() calls. Thanks for pointing that out, going to 
> fix it as well.

Ack.

>> Also, FWIW, I submitted a patch to remove this function altogether 
>> since its IMO pretty useless, just failed in getting anyone to ack it 
>> so far.
> 
> I was on the edge of suggesting that as well since it's only debugfs 
> usage looked quite pointless to me.
> 
> Feel free to CC me on the patch and you can have my acked-by.

Patch is here 
https://patchwork.freedesktop.org/patch/451864/?series=94202&rev=1, thanks!

Regards,

Tvrtko

> Thanks,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 +++++++--------
>>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> index e9eecebf5c9d..3343922af4d6 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> @@ -500,16 +500,15 @@ static inline struct intel_engine_cs *
>>>   i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>>>   {
>>>       struct intel_engine_cs *engine = NULL;
>>> +    struct dma_resv_cursor cursor;
>>>       struct dma_fence *fence;
>>>   -    rcu_read_lock();
>>> -    fence = dma_resv_get_excl_unlocked(obj->base.resv);
>>> -    rcu_read_unlock();
>>> -
>>> -    if (fence && dma_fence_is_i915(fence) && 
>>> !dma_fence_is_signaled(fence))
>>> -        engine = to_request(fence)->engine;
>>> -    dma_fence_put(fence);
>>> -
>>> +    dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
>>> +                     fence) {
>>> +        if (fence && dma_fence_is_i915(fence) &&
>>> +            !dma_fence_is_signaled(fence))
>>> +            engine = to_request(fence)->engine;
>>> +    }
>>>       return engine;
>>>   }
>>>
> 
