Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C634112A3
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 12:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbhITKLI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 06:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235698AbhITKLC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 06:11:02 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACFDC061762
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 03:09:36 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d21so27942886wra.12
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3VemnJCb4o4i8G4jW2f7/S7wTJolafn8kMYbyHr6SFk=;
        b=eSGIIcJaT4kNOCy+9SOq9MXZUInm7154x0Y0TDUf1zJUnCm3MYD2V1eiaEDFM+ikIu
         mTn9HImJPxCawMjCUC6YlVF7Ch+njUhzUpgD5ZWlQRzZC+qUmSTh5hAu9+JwMlZh7reb
         MKImCjo4FtxgVLUdjSSJsu8KwWEDlhcb6qP4Eg+DuHmVGo98S5QndTPgr81vqFVn5qiw
         GQVBzB7dR8ZUn7uILPeIIkf2YnJRkE9LrfrCHvWtHsNUKJ4QnsK3j1mVbzbrLSsCYC19
         y61gqOdNFGytLhVMVSWuN1G3WnbRbMiXXx51AYgIU8DVlGA5ghHfbbszX/BhmAPHnOW4
         R1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3VemnJCb4o4i8G4jW2f7/S7wTJolafn8kMYbyHr6SFk=;
        b=i2z3/L5rz98hhGYPi3+5RsHF1HyGpapIQ/4bE6o8F+F7aBMC/az1pv98YdNhdS3qZe
         aeVwn1Igb+3GHGrMOzF/+pun12gbs40mNL4/pvJ239oVFedzl/nAVcooNzRXcKFgbkfo
         j26PbbSWBvVPZ/wh5VLCDIqovn/qiE9mUaYx5ThGwIvaxNQiYwnD9fa6Lw84EOVqnRic
         sagb90OdRUd6+LtSfDAAT4J3Z5Kf85HE7+BdBzPG4GnJNA0NBQqogt44r2dG57H2z5Zm
         Kawh02ikNgXsJKs5l4RnDGrHhoiQwK6Ib90ri9uC3DBoRbB5nJ957KmcTjVQFnP9Bmq/
         hvhw==
X-Gm-Message-State: AOAM532yVxzil3sd6cf48Jnuvor4o4BBr7Emdwr/OitZCQvQ6Na4aTfP
        CRreWi+4M4xvdc0xS1fF0uk=
X-Google-Smtp-Source: ABdhPJz/o/fBTI27PJ7q0BWsTxmcjTrE8Gty+CrpeqGWtFMAVDa+3w99KLO7NaciY60qWWbKLQH2Mw==
X-Received: by 2002:adf:f207:: with SMTP id p7mr27559291wro.166.1632132574548;
        Mon, 20 Sep 2021 03:09:34 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c14sm9748086wrd.50.2021.09.20.03.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 03:09:33 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 01/26] dma-buf: add
 dma_resv_for_each_fence_unlocked v2
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-2-christian.koenig@amd.com>
 <YUSWzm+TjD7GHHO5@phenom.ffwll.local>
 <8268d2e8-8a37-0ff1-7065-c8aaf5c8672b@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e4aa2e1e-753e-655c-423f-93a0bb853b9d@gmail.com>
Date:   Mon, 20 Sep 2021 12:09:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8268d2e8-8a37-0ff1-7065-c8aaf5c8672b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.09.21 um 10:43 schrieb Tvrtko Ursulin:
> On 17/09/2021 14:23, Daniel Vetter wrote:
>> On Fri, Sep 17, 2021 at 02:34:48PM +0200, Christian König wrote:
>>> Abstract the complexity of iterating over all the fences
>>> in a dma_resv object.
>>>
>>> The new loop handles the whole RCU and retry dance and
>>> returns only fences where we can be sure we grabbed the
>>> right one.
>>>
>>> v2: fix accessing the shared fences while they might be freed,
>>>      improve kerneldoc, rename _cursor to _iter, add
>>>      dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/dma-buf/dma-resv.c | 61 +++++++++++++++++++++++++++
>>>   include/linux/dma-resv.h   | 84 
>>> ++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 145 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>> index 84fbe60629e3..3e77cad2c9d4 100644
>>> --- a/drivers/dma-buf/dma-resv.c
>>> +++ b/drivers/dma-buf/dma-resv.c
>>> @@ -323,6 +323,67 @@ void dma_resv_add_excl_fence(struct dma_resv 
>>> *obj, struct dma_fence *fence)
>>>   }
>>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>>   +/**
>>> + * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
>>> + * @cursor: cursor to record the current position
>>> + * @first: if we should start over
>>> + *
>>> + * Return all the fences in the dma_resv object which are not yet 
>>> signaled.
>>> + * The returned fence has an extra local reference so will stay alive.
>>> + * If a concurrent modify is detected the whole iterration is 
>>> started over again.
>>> + */
>>> +struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter 
>>> *cursor,
>>
>> Bit ocd, but I'd still just call that iter_next.
>>
>>> +                          bool first)
>>
>> Hm I'd put all the init code into iter_begin ...
>
> @Christian:
>
> Could you engineer something in here which would, at least in debug 
> builds, catch failures to call "iter begin" before using the iterator 
> macro?

Yeah, I've already played with the thought of somehow teaching lockdep 
that. But then abandoned this as abusive of lockdep.

>
>>
>>> +{
>>> +    struct dma_resv *obj = cursor->obj;
>>
>> Aren't we missing rcu_read_lock() around the entire thing here?
>>
>>> +
>>> +    first |= read_seqcount_retry(&obj->seq, cursor->seq);
>>> +    do {
>>> +        /* Drop the reference from the previous round */
>>> +        dma_fence_put(cursor->fence);
>>> +
>>> +        cursor->is_first = first;
>>> +        if (first) {
>>> +            cursor->seq = read_seqcount_begin(&obj->seq);
>>> +            cursor->index = -1;
>>> +            cursor->fences = dma_resv_shared_list(obj);
>>
>> And then also call iter_begin from here. That way we guarantee that
>> read_seqcount_begin is always called before _retry(). It's not a problem
>> with the seqcount implementation (I think at least), but it definitely
>> looks funny.
>>
>> Calling iter_begin here also makes it clear that we're essentially
>> restarting.
>>
>>> +
>>> +            cursor->fence = dma_resv_excl_fence(obj);
>>> +            if (cursor->fence &&
>>> +                test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>
>> Please use the right dma_fence wrapper here for this and don't look 
>> at the
>> bits/flags outside of dma_fence.[hc] code. I just realized that we don't
>> have the right amount of barriers in there for the fastpath, i.e. if we
>> have:
>>
>> x = 0; /* static initializer */
>>
>> thread a
>>     x = 1;
>>     dma_fence_signal(fence);
>>
>>
>> thread b;
>>     if (dma_fence_is_signalled(fence))
>>         printk("%i\n", x);
>>
>> Then you might actually be able to observe x == 0 in thread b. Which is
>> not what we want at all.
>
> @Daniel:
>
> What do you mean here - in terms of if 'x' is "external" (not part of 
> dma-fence), then are you suggesting dma-fence code should serialise it 
> by using barriers?
>
> That would sound incorrect to me, or in other words, I think it's fine 
> if x == 0 is observed in your example thread B since that code is 
> mixing external data with dma-fence.

No, Daniel is right. The problem is that on architectures other than x86 
barriers are per memory address (or rather cache line in practice).

So you need to be really careful that you see the fully consistent state 
and not just one variable but others in the old state.

But this was buggy before as well. I'm just pulling the existing test 
into the new iterator.

>
> Hm also, there is that annoying bit where by using 
> dma_fence_is_signaled any code becomes a fence signaling critical 
> path, which I never bought into. There should be a way to test the 
> signaled status without actually doing the signaling. Or I am 
> misunderstanding something so badly that is really really has to be 
> like this?

You are mixing things up. Testing is unproblematic, signaling is the 
problematic one.

>
>> So no open-coding of dma_fence flag bits code outside of drm_fence.[hc]
>> please. And yes i915-gem code is unfortunately a disaster.
>
> Don't even miss an opportunity for some good trashing no? :D
>
> But yes, deconstructed dma_fence_signal I thought we were supposed to 
> add to core. Or at least propose, don't exactly remember how that went.

The problem is that you need to grab a reference to call 
dma_fence_signal while testing the flag works without one.

Regards,
Christian.

>
>>
>>> + &cursor->fence->flags))
>>> +                cursor->fence = NULL;
>>> +        } else {
>>> +            cursor->fence = NULL;
>>> +        }
>>> +
>>> +        if (cursor->fence) {
>>> +            cursor->fence = dma_fence_get_rcu(cursor->fence);
>>> +        } else if (cursor->all_fences && cursor->fences) {
>>> +            struct dma_resv_list *fences = cursor->fences;
>>> +
>>> +            while (++cursor->index < fences->shared_count) {
>>> +                cursor->fence = rcu_dereference(
>>> +                    fences->shared[cursor->index]);
>>> +                if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>> +                          &cursor->fence->flags))
>>> +                    break;
>>> +            }
>>> +            if (cursor->index < fences->shared_count)
>>> +                cursor->fence =
>>> +                    dma_fence_get_rcu(cursor->fence);
>>> +            else
>>> +                cursor->fence = NULL;
>>> +        }
>>
>> The control flow here is very hairy, but I'm not sure how to best do 
>> this.
>> With my suggestion to move the read_seqcount_begin into iter_begin maybe
>> something like this:
>>
>> iter_next()
>> {
>>     do {
>>         dma_fence_put(cursor->fence)
>>         cursor->fence = NULL;
>>
>>         if (cursor->index == -1) { /* reset by iter_begin()
>>             cursor->fence = get_exclusive();
>>             cusor->index++;
>>         } else {
>>             cursor->fence = shared_fences[++cursor->index]
>>         }
>>
>>         if (!dma_fence_is_signalled(cursor->fence))
>>             continue; /* just grab the next fence. */
>>
>>         cursor->fence =  dma_fence_get_rcu(cursor->fence);
>>
>>         if (!cursor->fence || read_seqcount_retry()) {
>>             /* we lost the race, restart completely */
>>             iter_begin(); /* ->fence will be cleaned up at beginning 
>> of the loop */
>>             continue;
>>         }
>>
>>         return cursor->fence;
>>     } while (true);
>> }
>>
>> Maybe I missed something, but that avoids the duplication of all the
>> tricky code, i.e. checking for signalling, rcu protected conditional
>> fence_get, and the retry is also nicely at the end.
>>> +
>>> +        /* For the eventually next round */
>>> +        first = true;
>>> +    } while (read_seqcount_retry(&obj->seq, cursor->seq));
>>> +
>>> +    return cursor->fence;
>>> +}
>>> +EXPORT_SYMBOL_GPL(dma_resv_iter_walk_unlocked);
>>> +
>>>   /**
>>>    * dma_resv_copy_fences - Copy all fences from src to dst.
>>>    * @dst: the destination reservation object
>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>> index 9100dd3dc21f..693d16117153 100644
>>> --- a/include/linux/dma-resv.h
>>> +++ b/include/linux/dma-resv.h
>>> @@ -149,6 +149,90 @@ struct dma_resv {
>>>       struct dma_resv_list __rcu *fence;
>>>   };
>>>   +/**
>>> + * struct dma_resv_iter - current position into the dma_resv fences
>>> + *
>>> + * Don't touch this directly in the driver, use the accessor 
>>> function instead.
>>> + */
>>> +struct dma_resv_iter {
>>> +    /** @obj: The dma_resv object we iterate over */
>>> +    struct dma_resv *obj;
>>> +
>>> +    /** @all_fences: If all fences should be returned */
>>> +    bool all_fences;
>>> +
>>> +    /** @fence: the currently handled fence */
>>> +    struct dma_fence *fence;
>>> +
>>> +    /** @seq: sequence number to check for modifications */
>>> +    unsigned int seq;
>>> +
>>> +    /** @index: index into the shared fences */
>>
>> If you go with my suggestion (assuming it works): Please add "-1 
>> indicates
>> to pick the exclusive fence instead."
>>
>>> +    unsigned int index;
>>> +
>>> +    /** @fences: the shared fences */
>>> +    struct dma_resv_list *fences;
>>> +
>>> +    /** @is_first: true if this is the first returned fence */
>>> +    bool is_first;
>>
>> I think if we just rely on -1 == exclusive fence/is_first we don't need
>> this one here?
>>
>>> +};
>>> +
>>> +struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter 
>>> *cursor,
>>> +                          bool first);
>>> +
>>> +/**
>>> + * dma_resv_iter_begin - initialize a dma_resv_iter object
>>> + * @cursor: The dma_resv_iter object to initialize
>>> + * @obj: The dma_resv object which we want to iterator over
>>> + * @all_fences: If all fences should be returned or just the 
>>> exclusive one
>>
>> Please add: "Callers must clean up the iterator with 
>> dma_resv_iter_end()."
>>
>>> + */
>>> +static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
>>> +                    struct dma_resv *obj,
>>> +                    bool all_fences)
>>> +{
>>> +    cursor->obj = obj;
>>> +    cursor->all_fences = all_fences;
>>> +    cursor->fence = NULL;
>>> +}
>>> +
>>> +/**
>>> + * dma_resv_iter_end - cleanup a dma_resv_iter object
>>> + * @cursor: the dma_resv_iter object which should be cleaned up
>>> + *
>>> + * Make sure that the reference to the fence in the cursor is properly
>>> + * dropped.
>>
>> Please add:
>>
>> "This function must be called every time dma_resv_iter_begin() was 
>> called
>> to clean up any references."
>>> + */
>>> +static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
>>> +{
>>> +    dma_fence_put(cursor->fence);
>>> +}
>>> +
>>> +/**
>>> + * dma_resv_iter_is_exclusive - test if the current fence is the 
>>> exclusive one
>>> + * @cursor: the cursor of the current position
>>> + *
>>> + * Returns true if the currently returned fence is the exclusive one.
>>> + */
>>> +static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter 
>>> *cursor)
>>> +{
>>> +    return cursor->index == -1;
>>> +}
>>> +
>>> +/**
>>> + * dma_resv_for_each_fence_unlocked - unlocked fence iterator
>>> + * @cursor: a struct dma_resv_iter pointer
>>> + * @fence: the current fence
>>> + *
>>> + * Iterate over the fences in a struct dma_resv object without 
>>> holding the
>>> + * dma_resv::lock. The RCU read side lock must be hold when using 
>>> this, but can
>>> + * be dropped and re-taken as necessary inside the loop. The cursor 
>>> needs to be
>>> + * initialized with dma_resv_iter_begin_unlocked() and cleaned up with
>>
>> We don't have an _unlocked version?
>
> @Christian:
>
> I'd also mention that the fence reference is held during the walk so 
> someone is less likely to grab extra ones.
>
>>
>>> + * dma_resv_iter_end_unlocked().
>>> + */
>>> +#define dma_resv_for_each_fence_unlocked(cursor, fence)            \
>>> +    for (fence = dma_resv_iter_walk_unlocked(cursor, true);        \
>>> +         fence; fence = dma_resv_iter_walk_unlocked(cursor, false))
>>> +
>>>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>>   #define dma_resv_assert_held(obj) 
>>> lockdep_assert_held(&(obj)->lock.base)
>>>   --
>>> 2.25.1
>>>
>>
>
> Regards,
>
> Tvrtko
>

