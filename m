Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13053D94A5
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 19:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhG1Ryr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 13:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhG1Ryq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 13:54:46 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1010AC061757;
        Wed, 28 Jul 2021 10:54:44 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id g15so3613825wrd.3;
        Wed, 28 Jul 2021 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NCi0jAjCmMiWhIm88564IZOvQhfokt9OTmx/HAgNoeU=;
        b=ciy3jBBMgz1Wvdi9e75bwJaamrLwxhD9iNdsb35j2WXMMzO0oxFm9KN3deU889GlpV
         6mirPftyucHsAOQ31kuTq2sMNrkjQVma2zrqNs5TYN770S01T5GnHAybbxfg4wqkX8GR
         IXhLwVYtoHk09V5E/VspF1LIQ5RmurkXE6lpyowd5IQ2tMrLwxTPWppM6pf3SsYLaG3n
         gq+ToRiXf6rNcAxNoha7ZkIeVN+WGvnP7dLiMSupUhIqQkvqGH5qY+GADodi696pRSrH
         u92nAZr9gecD4uj2u3oJGe1HpkRQ21bBc0Vzre8khlbbKzebeivjrjLxeFzvghsD2i/n
         GNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NCi0jAjCmMiWhIm88564IZOvQhfokt9OTmx/HAgNoeU=;
        b=oPYbENnfhEv0x2l/VxWCw8abnowAamT/+8ganivaXEn0WVkzma/8AXZzypaaXqR5DM
         gyI9BRbgi69iKJFn8yPOdGOI9a0LNvC7uRRrcvFGGdHvjisiC2MChF8tJO60GaXFlQy3
         u3jkLhP8TmLFP4vSuBaIKLsdEpdV63cFGxnxXbfhyTuMALWkY56nv9xGHj+ZW5jnz0PR
         uLwn1//xbi2g2J+iR38bqBt0KiQ6/hULZbiT/+dRjtQgU90Y8MATLddOH+uSAGEMBr3k
         O6d50KioULhpgVl2hFfUed1/2xpexhj44DFFQlrKyvBs6eerXbXUDmh5qx8JedX8Lt8j
         n+mQ==
X-Gm-Message-State: AOAM530c96AxiNdKUju2TX9mULN6zlYRY8Z55/Grl6RueiE1av7GjgvR
        CMpI0+xv006Zlsegqik+9hy1PaWZ2Kyemq1Xcqw=
X-Google-Smtp-Source: ABdhPJzjlBg1/ZHjtRBiGYe+EtpDh7VTPUXyXiw80WP8D0dSELrXfz/NmO4FerlKTwuJtJtHWMP+VkCN5KlDocQEMCE=
X-Received: by 2002:adf:ea41:: with SMTP id j1mr570219wrn.147.1627494882065;
 Wed, 28 Jul 2021 10:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com> <20210726233854.2453899-2-robdclark@gmail.com>
 <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com> <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
 <9edd7083-e6b3-b230-c273-8f2fbe76ca17@amd.com> <703dc9c3-5657-432e-ca0b-25bdd67a2abd@gmail.com>
 <CAF6AEGvSpvc2po93b2eKB2cSzx_a+BtPWhQgRs-1NFFZfUbJNw@mail.gmail.com> <e5e71356-1c58-04ac-2609-70d268941b8d@amd.com>
In-Reply-To: <e5e71356-1c58-04ac-2609-70d268941b8d@amd.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 28 Jul 2021 10:58:51 -0700
Message-ID: <CAF6AEGu3NMyRp1pC5iZQoHhKhu_xBFBqkkfbG36dx8bVzYdWMA@mail.gmail.com>
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 28, 2021 at 10:23 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 28.07.21 um 17:15 schrieb Rob Clark:
> > On Wed, Jul 28, 2021 at 4:37 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 28.07.21 um 09:03 schrieb Christian K=C3=B6nig:
> >>> Am 27.07.21 um 16:25 schrieb Rob Clark:
> >>>> On Tue, Jul 27, 2021 at 12:11 AM Christian K=C3=B6nig
> >>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>> Am 27.07.21 um 01:38 schrieb Rob Clark:
> >>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>
> >>>>>> Add a way to hint to the fence signaler of an upcoming deadline,
> >>>>>> such as
> >>>>>> vblank, which the fence waiter would prefer not to miss. This is t=
o
> >>>>>> aid
> >>>>>> the fence signaler in making power management decisions, like boos=
ting
> >>>>>> frequency as the deadline approaches and awareness of missing
> >>>>>> deadlines
> >>>>>> so that can be factored in to the frequency scaling.
> >>>>>>
> >>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>>> ---
> >>>>>>     drivers/dma-buf/dma-fence.c | 39
> >>>>>> +++++++++++++++++++++++++++++++++++++
> >>>>>>     include/linux/dma-fence.h   | 17 ++++++++++++++++
> >>>>>>     2 files changed, 56 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fen=
ce.c
> >>>>>> index ce0f5eff575d..2e0d25ab457e 100644
> >>>>>> --- a/drivers/dma-buf/dma-fence.c
> >>>>>> +++ b/drivers/dma-buf/dma-fence.c
> >>>>>> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence
> >>>>>> **fences, uint32_t count,
> >>>>>>     }
> >>>>>>     EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >>>>>>
> >>>>>> +
> >>>>>> +/**
> >>>>>> + * dma_fence_set_deadline - set desired fence-wait deadline
> >>>>>> + * @fence:    the fence that is to be waited on
> >>>>>> + * @deadline: the time by which the waiter hopes for the fence to=
 be
> >>>>>> + *            signaled
> >>>>>> + *
> >>>>>> + * Inform the fence signaler of an upcoming deadline, such as
> >>>>>> vblank, by
> >>>>>> + * which point the waiter would prefer the fence to be signaled
> >>>>>> by.  This
> >>>>>> + * is intended to give feedback to the fence signaler to aid in p=
ower
> >>>>>> + * management decisions, such as boosting GPU frequency if a peri=
odic
> >>>>>> + * vblank deadline is approaching.
> >>>>>> + */
> >>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
> >>>>>> deadline)
> >>>>>> +{
> >>>>>> +     unsigned long flags;
> >>>>>> +
> >>>>>> +     if (dma_fence_is_signaled(fence))
> >>>>>> +             return;
> >>>>>> +
> >>>>>> +     spin_lock_irqsave(fence->lock, flags);
> >>>>>> +
> >>>>>> +     /* If we already have an earlier deadline, keep it: */
> >>>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags)=
 &&
> >>>>>> +         ktime_before(fence->deadline, deadline)) {
> >>>>>> +             spin_unlock_irqrestore(fence->lock, flags);
> >>>>>> +             return;
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     fence->deadline =3D deadline;
> >>>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
> >>>>>> +
> >>>>>> +     spin_unlock_irqrestore(fence->lock, flags);
> >>>>>> +
> >>>>>> +     if (fence->ops->set_deadline)
> >>>>>> +             fence->ops->set_deadline(fence, deadline);
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
> >>>>>> +
> >>>>>>     /**
> >>>>>>      * dma_fence_init - Initialize a custom fence.
> >>>>>>      * @fence: the fence to initialize
> >>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> >>>>>> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
> >>>>>> --- a/include/linux/dma-fence.h
> >>>>>> +++ b/include/linux/dma-fence.h
> >>>>>> @@ -88,6 +88,7 @@ struct dma_fence {
> >>>>>>                 /* @timestamp replaced by @rcu on
> >>>>>> dma_fence_release() */
> >>>>>>                 struct rcu_head rcu;
> >>>>>>         };
> >>>>>> +     ktime_t deadline;
> >>>>> Mhm, adding the flag sounds ok to me but I'm a bit hesitating addin=
g
> >>>>> the
> >>>>> deadline as extra field here.
> >>>>>
> >>>>> We tuned the dma_fence structure intentionally so that it is only 6=
4
> >>>>> bytes.
> >>>> Hmm, then I guess you wouldn't be a fan of also adding an hrtimer?
> >>>>
> >>>> We could push the ktime_t (and timer) down into the derived fence
> >>>> class, but I think there is going to need to be some extra storage
> >>>> *somewhere*.. maybe the fence signaler could get away with just
> >>>> storing the nearest upcoming deadline per fence-context instead?
> >>> I would just push that into the driver instead.
> >>>
> >>> You most likely don't want the deadline per fence anyway in complex
> >>> scenarios, but rather per frame. And a frame is usually composed from
> >>> multiple fences.
> > Right, I ended up keeping track of the nearest deadline in patch 5/4
> > which added drm/msm support:
> >
> >    https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
patchwork.freedesktop.org%2Fpatch%2F447138%2F&amp;data=3D04%7C01%7Cchristia=
n.koenig%40amd.com%7Cce6ace85263d448bbc9f08d951d9f06c%7C3dd8961fe4884e608e1=
1a82d994e183d%7C0%7C0%7C637630819606427306%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=
=3DameszAOlClaZNeUDlYr37ZdIytVXNgiEUKuctjXLqZ0%3D&amp;reserved=3D0
> >
> > But if we do have the ktime_t in dma_fence in dma_fence, we can add
> > some checks and avoid calling back to the driver if a later deadline
> > is set on a fence that already has an earlier deadline.  OTOH I
> > suppose I can push all that back to the driver to start, and we can
> > revisit once we have more drivers implementing deadline support.
>
> I still think that all of this is rather specific to your use case and
> have strong doubt that anybody else will implement that.

i915 does already have a similar thing in it's hand-rolled atomic
commit path.  So I think msm won't be the only one.  It should be also
useful to the other mobile GPUs with a gpu vs kms driver split,
although looking at the other gpu devfreq implementations, I don't
think they've yet gotten to this point in the fine tuning..

BR,
-R

> >> Thinking more about it we could probably kill the spinlock pointer and
> >> make the flags 32bit if we absolutely need that here.
> > If we had a 'struct dma_fence_context' we could push the spinlock, ops
> > pointer, and u64 context into that and replace with a single
> > dma_fence_context ptr, fwiw
>
> That won't work. We have a lot of use cases where you can't allocate
> memory, but must allocate a context.
>
> Christian.
>
> >
> > BR,
> > -R
> >
> >> But I still don't see the need for that, especially since most drivers
> >> probably won't implement it.
> >>
> >> Regards,
> >> Christian.
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> BR,
> >>>> -R
> >>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>>         u64 context;
> >>>>>>         u64 seqno;
> >>>>>>         unsigned long flags;
> >>>>>> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
> >>>>>>         DMA_FENCE_FLAG_SIGNALED_BIT,
> >>>>>>         DMA_FENCE_FLAG_TIMESTAMP_BIT,
> >>>>>>         DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> >>>>>> +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> >>>>>>         DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
> >>>>>>     };
> >>>>>>
> >>>>>> @@ -261,6 +263,19 @@ struct dma_fence_ops {
> >>>>>>          */
> >>>>>>         void (*timeline_value_str)(struct dma_fence *fence,
> >>>>>>                                    char *str, int size);
> >>>>>> +
> >>>>>> +     /**
> >>>>>> +      * @set_deadline:
> >>>>>> +      *
> >>>>>> +      * Callback to allow a fence waiter to inform the fence
> >>>>>> signaler of an
> >>>>>> +      * upcoming deadline, such as vblank, by which point the
> >>>>>> waiter would
> >>>>>> +      * prefer the fence to be signaled by.  This is intended to
> >>>>>> give feedback
> >>>>>> +      * to the fence signaler to aid in power management
> >>>>>> decisions, such as
> >>>>>> +      * boosting GPU frequency.
> >>>>>> +      *
> >>>>>> +      * This callback is optional.
> >>>>>> +      */
> >>>>>> +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadli=
ne);
> >>>>>>     };
> >>>>>>
> >>>>>>     void dma_fence_init(struct dma_fence *fence, const struct
> >>>>>> dma_fence_ops *ops,
> >>>>>> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struc=
t
> >>>>>> dma_fence *fence, bool intr)
> >>>>>>         return ret < 0 ? ret : 0;
> >>>>>>     }
> >>>>>>
> >>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
> >>>>>> deadline);
> >>>>>> +
> >>>>>>     struct dma_fence *dma_fence_get_stub(void);
> >>>>>>     struct dma_fence *dma_fence_allocate_private_stub(void);
> >>>>>>     u64 dma_fence_context_alloc(unsigned num);
>
