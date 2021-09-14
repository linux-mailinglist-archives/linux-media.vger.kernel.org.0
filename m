Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7B240B58D
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 19:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhINRFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 13:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhINRFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 13:05:53 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40485C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 10:04:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b6so21364449wrh.10
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 10:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=s6NBKR7y7iR6nyMoIHrWCanthQm5/nplOlRlK5HkjxQ=;
        b=Eu2o4mosQzMA4qcdoIqmvS5dtfrxnUBmvXP+vlCuK9h7Tku1NUnXMFwfrI2Kby4v36
         6r2SN1eTzfpK+dm1b3QGzU1WqA8SYV71YO974fWKLjvVOdCbcSDqIcvjD7Lt0QVDYyzo
         tiPXOaEj9JcwfpeKaaZlRZm0KpSxZ/3rKzJN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=s6NBKR7y7iR6nyMoIHrWCanthQm5/nplOlRlK5HkjxQ=;
        b=GK7fVH+Vq2aH+roJZB0zbnumsUypjX9auFPqwta3AU85an/o5cQ1oNH8D7T02T88rs
         BMc66WZ6WJBmwVuxXlRvF560nVP2fM+E5RKnZMnAp+LtfsMWwo1ZIXZE1UZ4ojG9Xerh
         lvemIkKyYowmJVVboaJNoICBJWvk7t13idcv2Zgvux2ePmbZ/5tygCBQzG1VJTLEGg5A
         l+bg1lR0dfI1ao4fzUVu06Ej0ET6vFEV2CdtEvI/qfofhZItAuXB/MCMyCGMRhzkf1kY
         ZJSVMQIBF6QTb7OMcNtUbY6zRXrQCZa3yFUCzcaR8M/COkl9s8FaKg6y+6c/uP+lsv3V
         9J9w==
X-Gm-Message-State: AOAM533R7pf1OpfNadd80n45uKb/uZwIo6uWiBrWNtpOocpdVbgF4Tgt
        VnGWFR58UrCtTWvpSbG1R0dvYQ==
X-Google-Smtp-Source: ABdhPJxm577Xn3MWr5qE/TxMJiVDmxQj0Go43zigyz9oIMcdgFVXnaqOY3josuoGrx90jJYkMC7fTw==
X-Received: by 2002:a5d:6590:: with SMTP id q16mr245393wru.52.1631639073700;
        Tue, 14 Sep 2021 10:04:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w14sm2269192wro.8.2021.09.14.10.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 10:04:32 -0700 (PDT)
Date:   Tue, 14 Sep 2021 19:04:31 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, daniel@ffwll.ch
Subject: Re: [PATCH 01/14] dma-buf: add dma_resv_for_each_fence_unlocked
Message-ID: <YUDWHw19iUMfFr7K@phenom.ffwll.local>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 10, 2021 at 10:26:42AM +0200, Christian König wrote:
> Abstract the complexity of iterating over all the fences
> in a dma_resv object.
> 
> The new loop handles the whole RCU and retry dance and
> returns only fences where we can be sure we grabbed the
> right one.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 84fbe60629e3..213a9b7251ca 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
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
> +					 struct dma_resv_cursor *cursor,
> +					 bool all_fences, bool first)
> +{
> +	struct dma_fence *fence = NULL;
> +
> +	do {
> +		/* Drop the reference from the previous round */
> +		dma_fence_put(fence);
> +
> +		cursor->is_first = first;
> +		if (first) {
> +			cursor->seq = read_seqcount_begin(&obj->seq);
> +			cursor->index = -1;
> +			cursor->fences = dma_resv_shared_list(obj);
> +			cursor->is_exclusive = true;
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
> +			cursor->is_exclusive = false;
> +			while (++cursor->index < fences->shared_count) {
> +				fence = rcu_dereference(fences->shared[
> +							cursor->index]);
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
> index 9100dd3dc21f..f5b91c292ee0 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -149,6 +149,39 @@ struct dma_resv {
>  	struct dma_resv_list __rcu *fence;
>  };
>  
> +/**
> + * struct dma_resv_cursor - current position into the dma_resv fences
> + * @seq: sequence number to check
> + * @index: index into the shared fences
> + * @shared: the shared fences
> + * @is_first: true if this is the first returned fence
> + * @is_exclusive: if the current fence is the exclusive one
> + */
> +struct dma_resv_cursor {
> +	unsigned int seq;
> +	unsigned int index;
> +	struct dma_resv_list *fences;
> +	bool is_first;
> +	bool is_exclusive;
> +};

A bit a bikeshed, but I think I'd be nice to align this with the other
iterators we have, e.g. for the drm_connector list.

So struct dma_resv_fence_iter, dma_resv_fence_iter_begin/next/end().

Also I think the for_each macro must not include begin/end calls. If we
include that then it saves 2 lines of code at the cost of a pile of
awkward bugs because people break; out of the loop or return early  (only
continue is safe) and we leak a fence. Or worse.

Explicit begin/end is much more robust at a very marginal cost imo.

Otherwise I think this fence iterator is a solid concept that yeah we
should roll out everywhere.
-Daniel

> +
> +/**
> + * dma_resv_for_each_fence_unlocked - fence iterator
> + * @obj: a dma_resv object pointer
> + * @cursor: a struct dma_resv_cursor pointer
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
>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>  
> @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> +					 struct dma_resv_cursor *cursor,
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
