Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA3F69FA38
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 18:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjBVRd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 12:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBVRd4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 12:33:56 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292F82D14C;
        Wed, 22 Feb 2023 09:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677087235; x=1708623235;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dBfK1f9SoIdQd//p3pK+J5jmUGdNq+Hb8SM5LrvByCw=;
  b=nqXyNJyShezFT07hRqpypcwPJicHLGglaYiqo5TFpQFjLHso+Idef8OB
   YWcHlcMLPIakg4DuvFWzd0llRKYz5SxATtopMVZi+o88w3rTd5imkvPpb
   rHmAsgg33nmfQz0BeaAzYMYfIv4NxXNjJsp34pXGgqH/CC4YE1sX1JtoG
   3NzqOsAijMnuZlOLNT9jtpx9X1MHARDuWOxazVoWhc0rN4C7P5fd4vxlm
   S7WVpOKU1G+1fzT2CQjXrr0BN/307nNh312OsrcFEWsUVeGQmRGnS+dhi
   K3cMqj/ZQIRPdbI5M6qg0r0HWB5sbvFy3ETUtQxSdlJy6vuiw13s08EO+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="321129860"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="321129860"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 09:33:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="704541133"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="704541133"
Received: from hhammad-mobl1.ger.corp.intel.com (HELO [10.213.231.87]) ([10.213.231.87])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 09:33:43 -0800
Message-ID: <d7b0614e-2cc3-1180-3571-409204ac5b00@linux.intel.com>
Date:   Wed, 22 Feb 2023 17:33:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 01/14] dma-buf/dma-fence: Add deadline awareness
Content-Language: en-US
To:     Rob Clark <robdclark@chromium.org>
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Gustavo Padovan <gustavo@padovan.org>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
        open list <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-2-robdclark@gmail.com>
 <b65a2fe2-6f68-2116-9599-2940e66d166b@linux.intel.com>
 <21f36640-3229-0b46-31a2-a47efc5be934@amd.com>
 <b8a16579-4be7-8e14-01e4-9d17c1570c8b@linux.intel.com>
 <CAJs_Fx61OpgFo_kSLoy+2z8mS=wcdK8eZfQBA6dQm9p0=qLU2g@mail.gmail.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAJs_Fx61OpgFo_kSLoy+2z8mS=wcdK8eZfQBA6dQm9p0=qLU2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 22/02/2023 17:16, Rob Clark wrote:
> On Wed, Feb 22, 2023 at 9:05 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 22/02/2023 15:28, Christian König wrote:
>>> Am 22.02.23 um 11:23 schrieb Tvrtko Ursulin:
>>>>
>>>> On 18/02/2023 21:15, Rob Clark wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> Add a way to hint to the fence signaler of an upcoming deadline, such as
>>>>> vblank, which the fence waiter would prefer not to miss.  This is to aid
>>>>> the fence signaler in making power management decisions, like boosting
>>>>> frequency as the deadline approaches and awareness of missing deadlines
>>>>> so that can be factored in to the frequency scaling.
>>>>>
>>>>> v2: Drop dma_fence::deadline and related logic to filter duplicate
>>>>>       deadlines, to avoid increasing dma_fence size.  The fence-context
>>>>>       implementation will need similar logic to track deadlines of all
>>>>>       the fences on the same timeline.  [ckoenig]
>>>>> v3: Clarify locking wrt. set_deadline callback
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>    drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
>>>>>    include/linux/dma-fence.h   | 20 ++++++++++++++++++++
>>>>>    2 files changed, 40 insertions(+)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>> index 0de0482cd36e..763b32627684 100644
>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>> @@ -912,6 +912,26 @@ dma_fence_wait_any_timeout(struct dma_fence
>>>>> **fences, uint32_t count,
>>>>>    }
>>>>>    EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>>>>    +
>>>>> +/**
>>>>> + * dma_fence_set_deadline - set desired fence-wait deadline
>>>>> + * @fence:    the fence that is to be waited on
>>>>> + * @deadline: the time by which the waiter hopes for the fence to be
>>>>> + *            signaled
>>>>> + *
>>>>> + * Inform the fence signaler of an upcoming deadline, such as
>>>>> vblank, by
>>>>> + * which point the waiter would prefer the fence to be signaled by.
>>>>> This
>>>>> + * is intended to give feedback to the fence signaler to aid in power
>>>>> + * management decisions, such as boosting GPU frequency if a periodic
>>>>> + * vblank deadline is approaching.
>>>>> + */
>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>>> +{
>>>>> +    if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
>>>>> +        fence->ops->set_deadline(fence, deadline);
>>>>> +}
>>>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
>>>>> +
>>>>>    /**
>>>>>     * dma_fence_describe - Dump fence describtion into seq_file
>>>>>     * @fence: the 6fence to describe
>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>> index 775cdc0b4f24..d77f6591c453 100644
>>>>> --- a/include/linux/dma-fence.h
>>>>> +++ b/include/linux/dma-fence.h
>>>>> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
>>>>>        DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>        DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>>>        DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>>>> +    DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>>>>
>>>> Would this bit be better left out from core implementation, given how
>>>> the approach is the component which implements dma-fence has to track
>>>> the actual deadline and all?
>>>>
>>>> Also taking a step back - are we all okay with starting to expand the
>>>> relatively simple core synchronisation primitive with side channel
>>>> data like this? What would be the criteria for what side channel data
>>>> would be acceptable? Taking note the thing lives outside drivers/gpu/.
>>>
>>> I had similar concerns and it took me a moment as well to understand the
>>> background why this is necessary. I essentially don't see much other
>>> approach we could do.
>>>
>>> Yes, this is GPU/CRTC specific, but we somehow need a common interface
>>> for communicating it between drivers and that's the dma_fence object as
>>> far as I can see.
>>
>> Yeah I also don't see any other easy options. Just wanted to raise this
>> as something which probably needs some wider acks.
>>
>> Also what about the "low level" part of my question about the reason, or
>> benefits, of defining the deadline bit in the common layer?
> 
> We could leave DMA_FENCE_FLAG_HAS_DEADLINE_BIT out, but OTOH managing
> a bitmask that is partially defined in core enum and partially in
> backend-driver has it's own drawbacks, and it isn't like we are
> running out of bits.. :shrug:

There is DMA_FENCE_FLAG_USER_BITS onwards which implementations could 
use to store their stuff?

And if we skip forward to "drm/scheduler: Add fence deadline support" 
that's the only place bit is used, right? Would it simply work to look 
at drm_sched_fence->deadline == 0 as bit not set? Or you see a need to 
interoperate with other fence implementations via that bit somehow?

Regards,

Tvrtko
