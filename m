Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1187A4148AE
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 14:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbhIVMWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 08:22:02 -0400
Received: from mga14.intel.com ([192.55.52.115]:15220 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233626AbhIVMWC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 08:22:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="223225227"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="223225227"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 05:20:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="703740646"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151]) ([10.213.200.151])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 05:20:31 -0700
Subject: Re: [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-14-christian.koenig@amd.com>
 <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
 <4c357136-3279-ff57-1c4f-62276534c887@linux.intel.com>
 <acc297ce-287e-295c-8b54-223610fb2093@gmail.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <6f8140bd-9cff-e0d8-e014-b3fb8d2d8ab0@linux.intel.com>
Date:   Wed, 22 Sep 2021 13:20:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <acc297ce-287e-295c-8b54-223610fb2093@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 22/09/2021 13:15, Christian König wrote:
> Am 22.09.21 um 13:46 schrieb Tvrtko Ursulin:
>>
>> On 22/09/2021 11:21, Tvrtko Ursulin wrote:
>>>
>>> On 22/09/2021 10:10, Christian König wrote:
>>>> This makes the function much simpler since the complex
>>>> retry logic is now handled else where.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 
>>>> ++++++++++--------------
>>>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> index 6234e17259c1..313afb4a11c7 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>>>> *data,
>>>>   {
>>>>       struct drm_i915_gem_busy *args = data;
>>>>       struct drm_i915_gem_object *obj;
>>>> -    struct dma_resv_list *list;
>>>> -    unsigned int seq;
>>>> +    struct dma_resv_iter cursor;
>>>> +    struct dma_fence *fence;
>>>>       int err;
>>>>       err = -ENOENT;
>>>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>>        * to report the overall busyness. This is what the wait-ioctl 
>>>> does.
>>>>        *
>>>>        */
>>>> -retry:
>>>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>>>> -
>>>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>>>> -    args->busy = 
>>>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>>>> -
>>>> -    /* Translate shared fences to READ set of engines */
>>>> -    list = dma_resv_shared_list(obj->base.resv);
>>>> -    if (list) {
>>>> -        unsigned int shared_count = list->shared_count, i;
>>>> -
>>>> -        for (i = 0; i < shared_count; ++i) {
>>>> -            struct dma_fence *fence =
>>>> -                rcu_dereference(list->shared[i]);
>>>> -
>>>> +    args->busy = false;
>>>
>>> You can drop this line, especially since it is not a boolean. With that:
>>>
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Having said this, one thing to add in the commit message is some 
>> commentary that although simpler in code, the new implementation has a 
>> lot more atomic instructions due all the extra fence get/put.
>>
>> Saying this because I remembered busy ioctl is quite an over-popular 
>> one. Thinking about traces from some real userspaces I looked at in 
>> the past.
>>
>> So I think ack from maintainers will be required here. Because I just 
>> don't know if any performance impact will be visible or not. So view 
>> my r-b as "code looks fine" but I am on the fence if it should 
>> actually be merged. Probably leaning towards no actually - given how 
>> the code is localised here and I dislike burdening old platforms with 
>> more CPU time it could be cheaply left as is.
> 
> Well previously we would have allocated memory, which as far as I know 
> has more overhead than a few extra atomic operations.

It doesn't, it only uses dma_resv_excl_fence and dma_resv_shared_list.

Regards,

Tvrtko

> On the other hand I could as well stick with dma_resv_get_fences() here.
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>> +        if (dma_resv_iter_is_restarted(&cursor))
>>>> +            args->busy = 0;
>>>> +
>>>> +        if (dma_resv_iter_is_exclusive(&cursor))
>>>> +            /* Translate the exclusive fence to the READ *and* 
>>>> WRITE engine */
>>>> +            args->busy |= busy_check_writer(fence);
>>>> +        else
>>>> +            /* Translate shared fences to READ set of engines */
>>>>               args->busy |= busy_check_reader(fence);
>>>> -        }
>>>>       }
>>>> -
>>>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>>>> -        goto retry;
>>>> +    dma_resv_iter_end(&cursor);
>>>>       err = 0;
>>>>   out:
>>>>
> 
