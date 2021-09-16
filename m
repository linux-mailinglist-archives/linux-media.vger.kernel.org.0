Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A971140DC74
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 16:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238417AbhIPOLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 10:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238432AbhIPOLI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 10:11:08 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B98C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 07:09:47 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x6so9662027wrv.13
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HrRcPXrdDEH+H9e0C9TOoQvv4OnY9zUNEsCvg2s6SaY=;
        b=QEfPh+t0Fyz152s9QK8pRF14bJscnPwLuf3SuUh4P+mt/UqYPpNhZI/0eOGLnMqGft
         I4o4Cfu28/irbZ7hwKIsgixuzI5Et8OeQ3V0hmXuLdzDM+C1UCN6TA40ttMSo7PK96dp
         7RrGutrZP0o1c5RCjNCirVCYH2SPWwWgkxZgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HrRcPXrdDEH+H9e0C9TOoQvv4OnY9zUNEsCvg2s6SaY=;
        b=Zd6bu7/VAjSU7FXn24iFC2WboaR1kIYcYIJi6k3tzW8pY+WVdY7bX9x4d3uoom0HXB
         5SeO5Im/bW3CktUfmj+vMFNxgkeQpXjR8fjjnLj027/qr2M59C85tHAgxi7Z6CyQWwXl
         U/2WUMDNWhnJAP3EsMJRP8POZ5RxlMb+uM0l4jDdrciBdVmGMkpZbkYTs3H65iPZB+F/
         hVb1sjGs6VIUJJ3IgeFX1eKBF7fVN1OpQJi6i1BI/zSz2Oh+QDo1/6S54pD9UvBJJvpD
         qL0nbfJ/uOluwnAEaTacjvMYCHUBMLsT56NI2W4dZIbu5zH91Pfe6GuQ0EqDttyt5lDW
         yojg==
X-Gm-Message-State: AOAM532/yuVMC7XXylJJsGbDRAphXiqPOhJ/VWqlTubnvZWx6GKNqP1Z
        ZuZu4gk6usATRJVMafmecEkp2A==
X-Google-Smtp-Source: ABdhPJztpwtq5xDHGdrqxZVYyy5VO4TkSgk8kpPRppCqPm2HmIXpd08/XBiAvSoJ/+sIeWbyu/KYrg==
X-Received: by 2002:a5d:6741:: with SMTP id l1mr6387370wrw.289.1631801386120;
        Thu, 16 Sep 2021 07:09:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j2sm3568539wrq.35.2021.09.16.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 07:09:44 -0700 (PDT)
Date:   Thu, 16 Sep 2021 16:09:42 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 01/14] dma-buf: add dma_resv_for_each_fence_unlocked
Message-ID: <YUNQJlSwzoKNRYIk@phenom.ffwll.local>
References: <20210910082655.82168-1-christian.koenig@amd.com>
 <YUDWHw19iUMfFr7K@phenom.ffwll.local>
 <26f766c9-9a3c-3894-9256-e07090655dc2@gmail.com>
 <CAKMK7uFcU-Dh8kMDrfY1rigVf0J-_R8GJ-d+C-iYNmOWx57W7Q@mail.gmail.com>
 <0bc024c5-a54c-eb3c-4c88-3eb7fbf77261@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bc024c5-a54c-eb3c-4c88-3eb7fbf77261@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 16, 2021 at 02:49:26PM +0200, Christian König wrote:
> Am 16.09.21 um 14:14 schrieb Daniel Vetter:
> > On Thu, Sep 16, 2021 at 10:50 AM Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Am 14.09.21 um 19:04 schrieb Daniel Vetter:
> > > > On Fri, Sep 10, 2021 at 10:26:42AM +0200, Christian König wrote:
> > > > > Abstract the complexity of iterating over all the fences
> > > > > in a dma_resv object.
> > > > > 
> > > > > The new loop handles the whole RCU and retry dance and
> > > > > returns only fences where we can be sure we grabbed the
> > > > > right one.
> > > > > 
> > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > ---
> > > > >    drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
> > > > >    include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
> > > > >    2 files changed, 99 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > > > index 84fbe60629e3..213a9b7251ca 100644
> > > > > --- a/drivers/dma-buf/dma-resv.c
> > > > > +++ b/drivers/dma-buf/dma-resv.c
> > > > > @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
> > > > >    }
> > > > >    EXPORT_SYMBOL(dma_resv_add_excl_fence);
> > > > > +/**
> > > > > + * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
> > > > > + * @obj: the dma_resv object
> > > > > + * @cursor: cursor to record the current position
> > > > > + * @all_fences: true returns also the shared fences
> > > > > + * @first: if we should start over
> > > > > + *
> > > > > + * Return all the fences in the dma_resv object which are not yet signaled.
> > > > > + * The returned fence has an extra local reference so will stay alive.
> > > > > + * If a concurrent modify is detected the whole iterator is started over again.
> > > > > + */
> > > > > +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> > > > > +                                     struct dma_resv_cursor *cursor,
> > > > > +                                     bool all_fences, bool first)
> > > > > +{
> > > > > +    struct dma_fence *fence = NULL;
> > > > > +
> > > > > +    do {
> > > > > +            /* Drop the reference from the previous round */
> > > > > +            dma_fence_put(fence);
> > > > > +
> > > > > +            cursor->is_first = first;
> > > > > +            if (first) {
> > > > > +                    cursor->seq = read_seqcount_begin(&obj->seq);
> > > > > +                    cursor->index = -1;
> > > > > +                    cursor->fences = dma_resv_shared_list(obj);
> > > > > +                    cursor->is_exclusive = true;
> > > > > +
> > > > > +                    fence = dma_resv_excl_fence(obj);
> > > > > +                    if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > > +                                          &fence->flags))
> > > > > +                            fence = NULL;
> > > > > +            } else {
> > > > > +                    fence = NULL;
> > > > > +            }
> > > > > +
> > > > > +            if (fence) {
> > > > > +                    fence = dma_fence_get_rcu(fence);
> > > > > +            } else if (all_fences && cursor->fences) {
> > > > > +                    struct dma_resv_list *fences = cursor->fences;
> > > > > +
> > > > > +                    cursor->is_exclusive = false;
> > > > > +                    while (++cursor->index < fences->shared_count) {
> > > > > +                            fence = rcu_dereference(fences->shared[
> > > > > +                                                    cursor->index]);
> > > > > +                            if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > > +                                          &fence->flags))
> > > > > +                                    break;
> > > > > +                    }
> > > > > +                    if (cursor->index < fences->shared_count)
> > > > > +                            fence = dma_fence_get_rcu(fence);
> > > > > +                    else
> > > > > +                            fence = NULL;
> > > > > +            }
> > > > > +
> > > > > +            /* For the eventually next round */
> > > > > +            first = true;
> > > > > +    } while (read_seqcount_retry(&obj->seq, cursor->seq));
> > > > > +
> > > > > +    return fence;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
> > > > > +
> > > > >    /**
> > > > >     * dma_resv_copy_fences - Copy all fences from src to dst.
> > > > >     * @dst: the destination reservation object
> > > > > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > > > > index 9100dd3dc21f..f5b91c292ee0 100644
> > > > > --- a/include/linux/dma-resv.h
> > > > > +++ b/include/linux/dma-resv.h
> > > > > @@ -149,6 +149,39 @@ struct dma_resv {
> > > > >       struct dma_resv_list __rcu *fence;
> > > > >    };
> > > > > +/**
> > > > > + * struct dma_resv_cursor - current position into the dma_resv fences
> > > > > + * @seq: sequence number to check
> > > > > + * @index: index into the shared fences
> > > > > + * @shared: the shared fences
> > > > > + * @is_first: true if this is the first returned fence
> > > > > + * @is_exclusive: if the current fence is the exclusive one
> > > > > + */
> > > > > +struct dma_resv_cursor {
> > > > > +    unsigned int seq;
> > > > > +    unsigned int index;
> > > > > +    struct dma_resv_list *fences;
> > > > > +    bool is_first;
> > > > > +    bool is_exclusive;
> > > > > +};
> > > > A bit a bikeshed, but I think I'd be nice to align this with the other
> > > > iterators we have, e.g. for the drm_connector list.
> > > > 
> > > > So struct dma_resv_fence_iter, dma_resv_fence_iter_begin/next/end().
> > > I've renamed the structure to dma_resv_iter.
> > > 
> > > > Also I think the for_each macro must not include begin/end calls. If we
> > > > include that then it saves 2 lines of code at the cost of a pile of
> > > > awkward bugs because people break; out of the loop or return early  (only
> > > > continue is safe) and we leak a fence. Or worse.
> > > > 
> > > > Explicit begin/end is much more robust at a very marginal cost imo.
> > > The key point is that this makes it quite a bunch more complicated to
> > > implement. See those functions are easiest when you centralize them and
> > > try to not spread the functionality into begin/end.
> > > 
> > > The only thing I could see in the end function would be to drop the
> > > reference for the dma_fence and that is not really something I would
> > > like to do because we actually need to keep that reference in a bunch of
> > > cases.
> > Yeah but it's extremely fragile. See with drm_connector_iter we also have
> > the need to grab a reference to that connector in a few place, and I do
> > think that open-code that is much clearer instead of inheriting a
> > reference that the for_each macro acquired for you, and which you cleverly
> > leaked through a break; Compare
> > 
> > for_each_fence(fence) {
> > 	if (fence) {
> > 		found_fence = fence;
> > 		break;
> > 	}
> > }
> > 
> > /* do some itneresting stuff with found_fence */
> > 
> > dma_fence_put(found_fence); /* wtf, where is this fence reference from */
> > 
> > Versus what I'm proposing:
> > 
> > fence_iter_init(&fence_iter)
> > for_each_fence(fence, &fence_iter) {
> > 	if (fence) {
> > 		found_fence = fence;
> > 		dma_fence_get(found_fence);
> > 		break;
> > 	}
> > }
> > fence_iter_end(&fence_iter)
> > 
> > /* do some itneresting stuff with found_fence */
> > 
> > dma_fence_put(found_fence); /* 100% clear which reference we're putting here */
> > 
> > One of these patterns is maintainable and clear, at the cost of 3 more
> > lines. The other one is frankly just clever but fragile nonsense.
> > 
> > So yeah I really think we need the iter_init/end/next triple of functions
> > here. Too clever is no good at all. And yes that version means you have an
> > additional kref_get/put in there for the found fence, but I really don't
> > think that matters in any of these paths here.
> 
> Yeah, that's what I've pondered on as well but I thought that avoiding the
> extra get/put dance would be more important to avoid.

Yeah, but if that shows up in a benchmark/profile, we can fix it with some
fence_iter_get_fence() or so wrapper which explicitly hands the reference
over to you (by clearing the pointer in the iter or wherever so the
_next() or _end() do not call dma_fence_put anymore). So if necessary, we
can have clarity and speed here.

> Anyway, going to change that to make clear what happens here.
> 
> But question is can you go over the patch set and see if we can replace some
> more dma_fence_for_each_fence_unlock() with dma_fence_for_each_fence()
> because the lock is either held or can be taken? I would have a much better
> feeling to avoid the unlocked access in the first place.

Yeah fully agreed, I think we should aim as much for fully locked. Btw on
that did you see my other reply where I toss around an idea for the
dma_resv unsharing problem?
-Daniel

> 
> Thanks,
> Christian.
> 
> > 
> > Cheers, Daniel
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Otherwise I think this fence iterator is a solid concept that yeah we
> > > > should roll out everywhere.
> > > > -Daniel
> > > > 
> > > > > +
> > > > > +/**
> > > > > + * dma_resv_for_each_fence_unlocked - fence iterator
> > > > > + * @obj: a dma_resv object pointer
> > > > > + * @cursor: a struct dma_resv_cursor pointer
> > > > > + * @all_fences: true if all fences should be returned
> > > > > + * @fence: the current fence
> > > > > + *
> > > > > + * Iterate over the fences in a struct dma_resv object without holding the
> > > > > + * dma_resv::lock. The RCU read side lock must be hold when using this, but can
> > > > > + * be dropped and re-taken as necessary inside the loop. @all_fences controls
> > > > > + * if the shared fences are returned as well.
> > > > > + */
> > > > > +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
> > > > > +    for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
> > > > > +         fence; dma_fence_put(fence),                                   \
> > > > > +         fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
> > > > > +
> > > > >    #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
> > > > >    #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
> > > > > @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
> > > > >    int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
> > > > >    void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
> > > > >    void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> > > > > +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> > > > > +                                     struct dma_resv_cursor *cursor,
> > > > > +                                     bool first, bool all_fences);
> > > > >    int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
> > > > >                       unsigned *pshared_count, struct dma_fence ***pshared);
> > > > >    int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> > > > > --
> > > > > 2.25.1
> > > > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
