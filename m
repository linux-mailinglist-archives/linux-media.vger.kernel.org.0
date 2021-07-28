Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4CD3D8CD8
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 13:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbhG1Lhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 07:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbhG1Lhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 07:37:41 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660D9C061757;
        Wed, 28 Jul 2021 04:37:40 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id b128so1186322wmb.4;
        Wed, 28 Jul 2021 04:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=x7dQKoEiN4Y7R3Tqb5Hw/QxBWYnx2kMDibC8HqvNYe4=;
        b=IttcygM3lgAOG/DzUraZ/ph9DjRhdhcm5mywlsUE9uoi0hMi4ryiY6GYOw2NXFL0QZ
         f+FLjUVvyBXKIUuUHnSENXxwfLGAfSfLOyEk2l6ZT4uqTjMKSru+JMQZDA0lRdDcJ0Un
         Ky68Bg+47k8jjNNTIIA6Mnsvovkft0l8tw4lJbiSeSqYeVgZLy2hiR4iJRMdeIgMbVgt
         UEBa4xAV+YV/cd+RTnVA26DEaXihYJTj6EGgiZRDl2iW95RciZ2Q0gDwN8hrC/GH3umN
         Kd2QsMLjmile4nDz7TXWy715pQWt+XAtCOlsUfcquwdtteXSuTFXZi8xFa6yM57dH+pI
         JMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=x7dQKoEiN4Y7R3Tqb5Hw/QxBWYnx2kMDibC8HqvNYe4=;
        b=HoBUoABVu9A5p01GZKZbPzMKmKzOtUx7jpcir2upbEMRWwi8x2E0+rOOuYHyO8PQWX
         D76RbYOnkr5wFOMjXQ+kZzzc3iUrH+QYXU3eLBEZn97XtV+tkbTAwiCtUjUxb2cbn5Vg
         OmhK06yFsl2Fetv0wKCX3qVeJGTCNiqQ7sKgTX8jB+yYW3zZArC0XbZZraX1UVZLU0Gq
         JnHnbTlceemAoIyAv/Y1p198pmRHxzmD/IZVRpDUIEIydvM2T1tK0j5eyW7qNEBB5/3c
         0965D0SPq5XqlIfwFdxxJbRm4s3zlSXAGwknZlHQmGFfsZKKPLVPjs4ZRbiDI6MlYJjP
         MaRQ==
X-Gm-Message-State: AOAM531IV26fAzogrO4oaj7rgTSQoV3jfPrBoXQmPTt3i7is1ANgpbsI
        XVP/4FF4IEZ8ajc3FPB7VV2r0Y5L4LI=
X-Google-Smtp-Source: ABdhPJyhlRuWNCGP/fuxPdZohPZ4g+6Dy16iPJvG307/5zbdd028y8U6Li7ED60kcXewkVk/1E6s0A==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr19380231wmi.82.1627472258968;
        Wed, 28 Jul 2021 04:37:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a5d:b580:2891:cbac? ([2a02:908:1252:fb60:6a5d:b580:2891:cbac])
        by smtp.gmail.com with ESMTPSA id n11sm377546wrs.81.2021.07.28.04.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 04:37:38 -0700 (PDT)
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-2-robdclark@gmail.com>
 <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
 <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
 <9edd7083-e6b3-b230-c273-8f2fbe76ca17@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <703dc9c3-5657-432e-ca0b-25bdd67a2abd@gmail.com>
Date:   Wed, 28 Jul 2021 13:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9edd7083-e6b3-b230-c273-8f2fbe76ca17@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 28.07.21 um 09:03 schrieb Christian König:
> Am 27.07.21 um 16:25 schrieb Rob Clark:
>> On Tue, Jul 27, 2021 at 12:11 AM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Am 27.07.21 um 01:38 schrieb Rob Clark:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Add a way to hint to the fence signaler of an upcoming deadline, 
>>>> such as
>>>> vblank, which the fence waiter would prefer not to miss. This is to 
>>>> aid
>>>> the fence signaler in making power management decisions, like boosting
>>>> frequency as the deadline approaches and awareness of missing 
>>>> deadlines
>>>> so that can be factored in to the frequency scaling.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    drivers/dma-buf/dma-fence.c | 39 
>>>> +++++++++++++++++++++++++++++++++++++
>>>>    include/linux/dma-fence.h   | 17 ++++++++++++++++
>>>>    2 files changed, 56 insertions(+)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>> index ce0f5eff575d..2e0d25ab457e 100644
>>>> --- a/drivers/dma-buf/dma-fence.c
>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence 
>>>> **fences, uint32_t count,
>>>>    }
>>>>    EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>>>
>>>> +
>>>> +/**
>>>> + * dma_fence_set_deadline - set desired fence-wait deadline
>>>> + * @fence:    the fence that is to be waited on
>>>> + * @deadline: the time by which the waiter hopes for the fence to be
>>>> + *            signaled
>>>> + *
>>>> + * Inform the fence signaler of an upcoming deadline, such as 
>>>> vblank, by
>>>> + * which point the waiter would prefer the fence to be signaled 
>>>> by.  This
>>>> + * is intended to give feedback to the fence signaler to aid in power
>>>> + * management decisions, such as boosting GPU frequency if a periodic
>>>> + * vblank deadline is approaching.
>>>> + */
>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t 
>>>> deadline)
>>>> +{
>>>> +     unsigned long flags;
>>>> +
>>>> +     if (dma_fence_is_signaled(fence))
>>>> +             return;
>>>> +
>>>> +     spin_lock_irqsave(fence->lock, flags);
>>>> +
>>>> +     /* If we already have an earlier deadline, keep it: */
>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
>>>> +         ktime_before(fence->deadline, deadline)) {
>>>> +             spin_unlock_irqrestore(fence->lock, flags);
>>>> +             return;
>>>> +     }
>>>> +
>>>> +     fence->deadline = deadline;
>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
>>>> +
>>>> +     spin_unlock_irqrestore(fence->lock, flags);
>>>> +
>>>> +     if (fence->ops->set_deadline)
>>>> +             fence->ops->set_deadline(fence, deadline);
>>>> +}
>>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
>>>> +
>>>>    /**
>>>>     * dma_fence_init - Initialize a custom fence.
>>>>     * @fence: the fence to initialize
>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
>>>> --- a/include/linux/dma-fence.h
>>>> +++ b/include/linux/dma-fence.h
>>>> @@ -88,6 +88,7 @@ struct dma_fence {
>>>>                /* @timestamp replaced by @rcu on 
>>>> dma_fence_release() */
>>>>                struct rcu_head rcu;
>>>>        };
>>>> +     ktime_t deadline;
>>> Mhm, adding the flag sounds ok to me but I'm a bit hesitating adding 
>>> the
>>> deadline as extra field here.
>>>
>>> We tuned the dma_fence structure intentionally so that it is only 64 
>>> bytes.
>> Hmm, then I guess you wouldn't be a fan of also adding an hrtimer?
>>
>> We could push the ktime_t (and timer) down into the derived fence
>> class, but I think there is going to need to be some extra storage
>> *somewhere*.. maybe the fence signaler could get away with just
>> storing the nearest upcoming deadline per fence-context instead?
>
> I would just push that into the driver instead.
>
> You most likely don't want the deadline per fence anyway in complex 
> scenarios, but rather per frame. And a frame is usually composed from 
> multiple fences.

Thinking more about it we could probably kill the spinlock pointer and 
make the flags 32bit if we absolutely need that here.

But I still don't see the need for that, especially since most drivers 
probably won't implement it.

Regards,
Christian.

>
> Regards,
> Christian.
>
>>
>> BR,
>> -R
>>
>>> Regards,
>>> Christian.
>>>
>>>>        u64 context;
>>>>        u64 seqno;
>>>>        unsigned long flags;
>>>> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
>>>>        DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>        DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>>        DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>>> +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>>>>        DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>>>>    };
>>>>
>>>> @@ -261,6 +263,19 @@ struct dma_fence_ops {
>>>>         */
>>>>        void (*timeline_value_str)(struct dma_fence *fence,
>>>>                                   char *str, int size);
>>>> +
>>>> +     /**
>>>> +      * @set_deadline:
>>>> +      *
>>>> +      * Callback to allow a fence waiter to inform the fence 
>>>> signaler of an
>>>> +      * upcoming deadline, such as vblank, by which point the 
>>>> waiter would
>>>> +      * prefer the fence to be signaled by.  This is intended to 
>>>> give feedback
>>>> +      * to the fence signaler to aid in power management 
>>>> decisions, such as
>>>> +      * boosting GPU frequency.
>>>> +      *
>>>> +      * This callback is optional.
>>>> +      */
>>>> +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>>>>    };
>>>>
>>>>    void dma_fence_init(struct dma_fence *fence, const struct 
>>>> dma_fence_ops *ops,
>>>> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct 
>>>> dma_fence *fence, bool intr)
>>>>        return ret < 0 ? ret : 0;
>>>>    }
>>>>
>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t 
>>>> deadline);
>>>> +
>>>>    struct dma_fence *dma_fence_get_stub(void);
>>>>    struct dma_fence *dma_fence_allocate_private_stub(void);
>>>>    u64 dma_fence_context_alloc(unsigned num);
>

