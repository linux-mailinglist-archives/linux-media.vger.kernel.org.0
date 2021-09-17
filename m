Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6092C40F907
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 15:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233147AbhIQNYx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 09:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhIQNYx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 09:24:53 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F123BC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 06:23:30 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id g16so15163556wrb.3
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 06:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xqEgOzw2hkzNjCzJ+z5EUUW52U7YW8L+C5Ug+fD01Nk=;
        b=BoBAPZpsSXb3KArozQkJYZXRxzCT0yMKW6Jlc3M4rteNVgOJk8axZGXXw0lk7z3dMb
         +cpn6zeRBykwUuJOH2vToX10D7itQytC/IfuQF/a2TXh2aTLv43DEmCqPIJAjLh4ll2M
         l4i4vgUtz9Lpls4rQyguvSXWikP2O1ycgPJ5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xqEgOzw2hkzNjCzJ+z5EUUW52U7YW8L+C5Ug+fD01Nk=;
        b=kBBnhLyKKC2rcSXNqJC0XVRU8BT/BcijyKiAYSW9W3A0328ihmzpw4pHwFITJbOGJ1
         yCh6cCyy+9eRQ/O7VZd2OveFaog4C19j293HxZYZpMR5Vsuu3l5GkpRlAMqCHkF440L7
         H7mGxyu3Qv4A18wEMOmME3lvClGmaGQH+dPzGJwU99aa61UH1psMjJ/AO+QdvXK+RHZD
         mY33EQfFSoHr2uwQqsoyVFs8wuMhu8aciwqKp98+nIIW06D7byHXS5i+aOPqlC/UP45J
         zhsc669ZN1lFIaspj3k13Oe2K5TCK2V8+CG7INzFoJp+n4k6WiuWkXweY2sJyGy1EjVs
         wNOw==
X-Gm-Message-State: AOAM531Nq12+YGmJCTgqXt/pyDaoewiOUTK/PPnBKVoerhNPJ5sL3WLK
        k1b+58c34c9GNzzJnoKUaq0mLQ==
X-Google-Smtp-Source: ABdhPJxTi18SUt1H+tebDFrr0xYs2nM3EYYT24Gj8svSn2PxVauf1Yefvi00Wd1U7stFzs07TwoOGQ==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr12237940wrs.60.1631885009360;
        Fri, 17 Sep 2021 06:23:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5sm1727608wmb.37.2021.09.17.06.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 06:23:28 -0700 (PDT)
Date:   Fri, 17 Sep 2021 15:23:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: Re: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v2
Message-ID: <YUSWzm+TjD7GHHO5@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 17, 2021 at 02:34:48PM +0200, Christian König wrote:
> Abstract the complexity of iterating over all the fences
> in a dma_resv object.
> 
> The new loop handles the whole RCU and retry dance and
> returns only fences where we can be sure we grabbed the
> right one.
> 
> v2: fix accessing the shared fences while they might be freed,
>     improve kerneldoc, rename _cursor to _iter, add
>     dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 61 +++++++++++++++++++++++++++
>  include/linux/dma-resv.h   | 84 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 145 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 84fbe60629e3..3e77cad2c9d4 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,6 +323,67 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
>  
> +/**
> + * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
> + * @cursor: cursor to record the current position
> + * @first: if we should start over
> + *
> + * Return all the fences in the dma_resv object which are not yet signaled.
> + * The returned fence has an extra local reference so will stay alive.
> + * If a concurrent modify is detected the whole iterration is started over again.
> + */
> +struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,

Bit ocd, but I'd still just call that iter_next.

> +					      bool first)

Hm I'd put all the init code into iter_begin ...

> +{
> +	struct dma_resv *obj = cursor->obj;

Aren't we missing rcu_read_lock() around the entire thing here?

> +
> +	first |= read_seqcount_retry(&obj->seq, cursor->seq);
> +	do {
> +		/* Drop the reference from the previous round */
> +		dma_fence_put(cursor->fence);
> +
> +		cursor->is_first = first;
> +		if (first) {
> +			cursor->seq = read_seqcount_begin(&obj->seq);
> +			cursor->index = -1;
> +			cursor->fences = dma_resv_shared_list(obj);

And then also call iter_begin from here. That way we guarantee that
read_seqcount_begin is always called before _retry(). It's not a problem
with the seqcount implementation (I think at least), but it definitely
looks funny.

Calling iter_begin here also makes it clear that we're essentially
restarting.

> +
> +			cursor->fence = dma_resv_excl_fence(obj);
> +			if (cursor->fence &&
> +			    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,

Please use the right dma_fence wrapper here for this and don't look at the
bits/flags outside of dma_fence.[hc] code. I just realized that we don't
have the right amount of barriers in there for the fastpath, i.e. if we
have:

x = 0; /* static initializer */

thread a
	x = 1;
	dma_fence_signal(fence);


thread b;
	if (dma_fence_is_signalled(fence))
		printk("%i\n", x);

Then you might actually be able to observe x == 0 in thread b. Which is
not what we want at all.

So no open-coding of dma_fence flag bits code outside of drm_fence.[hc]
please. And yes i915-gem code is unfortunately a disaster.

> +				     &cursor->fence->flags))
> +				cursor->fence = NULL;
> +		} else {
> +			cursor->fence = NULL;
> +		}
> +
> +		if (cursor->fence) {
> +			cursor->fence = dma_fence_get_rcu(cursor->fence);
> +		} else if (cursor->all_fences && cursor->fences) {
> +			struct dma_resv_list *fences = cursor->fences;
> +
> +			while (++cursor->index < fences->shared_count) {
> +				cursor->fence = rcu_dereference(
> +					fences->shared[cursor->index]);
> +				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +					      &cursor->fence->flags))
> +					break;
> +			}
> +			if (cursor->index < fences->shared_count)
> +				cursor->fence =
> +					dma_fence_get_rcu(cursor->fence);
> +			else
> +				cursor->fence = NULL;
> +		}

The control flow here is very hairy, but I'm not sure how to best do this.
With my suggestion to move the read_seqcount_begin into iter_begin maybe
something like this:

iter_next()
{
	do {
		dma_fence_put(cursor->fence)
		cursor->fence = NULL;

		if (cursor->index == -1) { /* reset by iter_begin()
			cursor->fence = get_exclusive();
			cusor->index++;
		} else {
			cursor->fence = shared_fences[++cursor->index]
		}

		if (!dma_fence_is_signalled(cursor->fence))
			continue; /* just grab the next fence. */

		cursor->fence =  dma_fence_get_rcu(cursor->fence);

		if (!cursor->fence || read_seqcount_retry()) {
			/* we lost the race, restart completely */
			iter_begin(); /* ->fence will be cleaned up at beginning of the loop */
			continue;
		}

		return cursor->fence;
	} while (true);
}

Maybe I missed something, but that avoids the duplication of all the
tricky code, i.e. checking for signalling, rcu protected conditional
fence_get, and the retry is also nicely at the end.
> +
> +		/* For the eventually next round */
> +		first = true;
> +	} while (read_seqcount_retry(&obj->seq, cursor->seq));
> +
> +	return cursor->fence;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_walk_unlocked);
> +
>  /**
>   * dma_resv_copy_fences - Copy all fences from src to dst.
>   * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 9100dd3dc21f..693d16117153 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -149,6 +149,90 @@ struct dma_resv {
>  	struct dma_resv_list __rcu *fence;
>  };
>  
> +/**
> + * struct dma_resv_iter - current position into the dma_resv fences
> + *
> + * Don't touch this directly in the driver, use the accessor function instead.
> + */
> +struct dma_resv_iter {
> +	/** @obj: The dma_resv object we iterate over */
> +	struct dma_resv *obj;
> +
> +	/** @all_fences: If all fences should be returned */
> +	bool all_fences;
> +
> +	/** @fence: the currently handled fence */
> +	struct dma_fence *fence;
> +
> +	/** @seq: sequence number to check for modifications */
> +	unsigned int seq;
> +
> +	/** @index: index into the shared fences */

If you go with my suggestion (assuming it works): Please add "-1 indicates
to pick the exclusive fence instead."

> +	unsigned int index;
> +
> +	/** @fences: the shared fences */
> +	struct dma_resv_list *fences;
> +
> +	/** @is_first: true if this is the first returned fence */
> +	bool is_first;

I think if we just rely on -1 == exclusive fence/is_first we don't need
this one here?

> +};
> +
> +struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
> +					      bool first);
> +
> +/**
> + * dma_resv_iter_begin - initialize a dma_resv_iter object
> + * @cursor: The dma_resv_iter object to initialize
> + * @obj: The dma_resv object which we want to iterator over
> + * @all_fences: If all fences should be returned or just the exclusive one

Please add: "Callers must clean up the iterator with dma_resv_iter_end()."

> + */
> +static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
> +					struct dma_resv *obj,
> +					bool all_fences)
> +{
> +	cursor->obj = obj;
> +	cursor->all_fences = all_fences;
> +	cursor->fence = NULL;
> +}
> +
> +/**
> + * dma_resv_iter_end - cleanup a dma_resv_iter object
> + * @cursor: the dma_resv_iter object which should be cleaned up
> + *
> + * Make sure that the reference to the fence in the cursor is properly
> + * dropped.

Please add:

"This function must be called every time dma_resv_iter_begin() was called
to clean up any references."
> + */
> +static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
> +{
> +	dma_fence_put(cursor->fence);
> +}
> +
> +/**
> + * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
> + * @cursor: the cursor of the current position
> + *
> + * Returns true if the currently returned fence is the exclusive one.
> + */
> +static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
> +{
> +	return cursor->index == -1;
> +}
> +
> +/**
> + * dma_resv_for_each_fence_unlocked - unlocked fence iterator
> + * @cursor: a struct dma_resv_iter pointer
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object without holding the
> + * dma_resv::lock. The RCU read side lock must be hold when using this, but can
> + * be dropped and re-taken as necessary inside the loop. The cursor needs to be
> + * initialized with dma_resv_iter_begin_unlocked() and cleaned up with

We don't have an _unlocked version?

> + * dma_resv_iter_end_unlocked().
> + */
> +#define dma_resv_for_each_fence_unlocked(cursor, fence)			\
> +	for (fence = dma_resv_iter_walk_unlocked(cursor, true);		\
> +	     fence; fence = dma_resv_iter_walk_unlocked(cursor, false))
> +
>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
