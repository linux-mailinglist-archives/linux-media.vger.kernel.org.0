Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C3640D9A1
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 14:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239412AbhIPMRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 08:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239438AbhIPMRL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 08:17:11 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A986C0613C1
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 05:15:49 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 140so4690450wma.0
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IRRs5XneX2vo2Gm7yuvudORdb1lagFg+pbee5Tr6lgg=;
        b=DtkJ/8rzTreJI6XHSbC7+rydW84FqEJvZc+Qkw3kqbSN0EPOpQF7G+oAjoI5orQOsi
         87cMsjfobWQEK+I6pzNzcv+DxCNEdFpDg2KIqKoTN5WAy8ef2WZTKpQbG+vXNtLZb/b7
         Uj5sq8zvpBkDyR7v4Km/YZLWrmwmRsgLJLPUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IRRs5XneX2vo2Gm7yuvudORdb1lagFg+pbee5Tr6lgg=;
        b=pq8lYHusQ3pzeJJF5f2NW/t9J2ccoLSy+XFRaJWTTWLuEQxP+EBWuQeBlKxjQNNWVA
         T1Pkxqeoy3ZHIUmVoylX5LYT28WD0zOpAHpiT9q2BxpEadebSQ5CRPJsryx/70Hb8Aan
         eGiXZeevRdOHU9SUWGL2QhBzXMPRKRPbhcP6ztSIBY/DOHeCV5Vl3grduYyAM5hqOeJ3
         Kqp7SO557mFPuInh9gTS+DFZG6tc8X5dY1d7MvH4EAFGW3MtiNgtZn9OO6Dhf8hHzwUR
         zIxy4z+RmX1GgRCQ+r8IqLgGNsMnMZuD/LIv86QCnCd0dixUsUb3VT9a1o50tfxE81tm
         DgHw==
X-Gm-Message-State: AOAM533kEHtQyIRJkKgPIZ/KZ4mg/77y7IwD53wIEW4LDBBsN2uAih8+
        Kj/+u/QzAJ4QLD8ODKTEId+fnyqKtCtoQw==
X-Google-Smtp-Source: ABdhPJxW1rIOmeDct5A4v6mCkBGYPjWqfoCdG963K5HHIFyuGzPWLCEVF9AqCiqTuD6U9Gvl6w1V+Q==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr9796894wmc.180.1631794547927;
        Thu, 16 Sep 2021 05:15:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a25sm7376193wmj.34.2021.09.16.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 05:15:47 -0700 (PDT)
Date:   Thu, 16 Sep 2021 14:15:45 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v2
Message-ID: <YUM1cY5HKixNUnQn@phenom.ffwll.local>
References: <20210916113042.3631-1-christian.koenig@amd.com>
 <20210916113042.3631-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210916113042.3631-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 16, 2021 at 01:30:17PM +0200, Christian König wrote:
> Abstract the complexity of iterating over all the fences
> in a dma_resv object.
> 
> The new loop handles the whole RCU and retry dance and
> returns only fences where we can be sure we grabbed the
> right one.
> 
> v2: fix accessing the shared fences while they might be freed,
>     improve kerneldoc, rename _cursor to _iter, add
>     dma_resv_iter_is_exclusive
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Replied in the other thread with the fully typed out example, this really
needs iter_init/next/end here. Or it's just way too fragile and tricky for
a generic helper that we roll out everywhere.
-Daniel

> ---
>  drivers/dma-buf/dma-resv.c | 62 ++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   | 50 ++++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 84fbe60629e3..77083170ec3b 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,6 +323,68 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
>  
> +/**
> + * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
> + * @obj: the dma_resv object
> + * @cursor: cursor to record the current position
> + * @all_fences: true returns also the shared fences
> + * @first: if we should start over
> + *
> + * Return all the fences in the dma_resv object which are not yet signaled.
> + * The returned fence has an extra local reference so will stay alive.
> + * If a concurrent modify is detected the whole iterator is started over again.
> + */
> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> +					 struct dma_resv_iter *cursor,
> +					 bool all_fences, bool first)
> +{
> +	struct dma_fence *fence = NULL;
> +
> +	first |= read_seqcount_retry(&obj->seq, cursor->seq);
> +	do {
> +		/* Drop the reference from the previous round */
> +		dma_fence_put(fence);
> +
> +		cursor->is_first = first;
> +		if (first) {
> +			cursor->seq = read_seqcount_begin(&obj->seq);
> +			cursor->index = -1;
> +			cursor->fences = dma_resv_shared_list(obj);
> +
> +			fence = dma_resv_excl_fence(obj);
> +			if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +					      &fence->flags))
> +				fence = NULL;
> +		} else {
> +			fence = NULL;
> +		}
> +
> +		if (fence) {
> +			fence = dma_fence_get_rcu(fence);
> +		} else if (all_fences && cursor->fences) {
> +			struct dma_resv_list *fences = cursor->fences;
> +
> +			while (++cursor->index < fences->shared_count) {
> +				fence = rcu_dereference(
> +					fences->shared[cursor->index]);
> +				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +					      &fence->flags))
> +					break;
> +			}
> +			if (cursor->index < fences->shared_count)
> +				fence = dma_fence_get_rcu(fence);
> +			else
> +				fence = NULL;
> +		}
> +
> +		/* For the eventually next round */
> +		first = true;
> +	} while (read_seqcount_retry(&obj->seq, cursor->seq));
> +
> +	return fence;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
> +
>  /**
>   * dma_resv_copy_fences - Copy all fences from src to dst.
>   * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 9100dd3dc21f..1cd686384c71 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -149,6 +149,53 @@ struct dma_resv {
>  	struct dma_resv_list __rcu *fence;
>  };
>  
> +/**
> + * struct dma_resv_iter - current position into the dma_resv fences
> + *
> + * Don't touch this directly in the driver, use the accessor function instead.
> + */
> +struct dma_resv_iter {
> +	/** @seq: sequence number to check for modifications */
> +	unsigned int seq;
> +
> +	/** @index: index into the shared fences */
> +	unsigned int index;
> +
> +	/** @fences: the shared fences */
> +	struct dma_resv_list *fences;
> +
> +	/** @is_first: true if this is the first returned fence */
> +	bool is_first;
> +};
> +
> +/**
> + * dma_resv_for_each_fence_unlocked - fence iterator
> + * @obj: a dma_resv object pointer
> + * @cursor: a struct dma_resv_iter pointer
> + * @all_fences: true if all fences should be returned
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object without holding the
> + * dma_resv::lock. The RCU read side lock must be hold when using this, but can
> + * be dropped and re-taken as necessary inside the loop. @all_fences controls
> + * if the shared fences are returned as well.
> + */
> +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
> +	for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
> +	     fence; dma_fence_put(fence),				    \
> +	     fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
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
>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>  
> @@ -366,6 +413,9 @@ void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> +					 struct dma_resv_iter *cursor,
> +					 bool first, bool all_fences);
>  int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>  			unsigned *pshared_count, struct dma_fence ***pshared);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
