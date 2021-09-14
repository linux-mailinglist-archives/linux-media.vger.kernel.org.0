Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C2F40AC08
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 12:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbhINKzC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 06:55:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:54835 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231667AbhINKzB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 06:55:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="307508589"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="307508589"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 03:53:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="432952180"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116]) ([10.213.234.116])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 03:53:38 -0700
Subject: Re: [Intel-gfx] [PATCH 01/26] dma-buf: add
 dma_resv_for_each_fence_unlocked
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-2-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <1eee4105-e154-9d1d-b92b-d17c6f8f8432@linux.intel.com>
Date:   Tue, 14 Sep 2021 11:53:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913131707.45639-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 13/09/2021 14:16, Christian König wrote:
> Abstract the complexity of iterating over all the fences
> in a dma_resv object.
> 
> The new loop handles the whole RCU and retry dance and
> returns only fences where we can be sure we grabbed the
> right one.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
>   2 files changed, 99 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 84fbe60629e3..213a9b7251ca 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>   }
>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
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

If rcu lock is allowed to be dropped while walking the list what 
guarantees list of fences hasn't been freed?

Like:

1st call
   -> gets seqcount
   -> stores cursor->fences

rcu lock dropped/re-acquired

2nd call
   -> dereferences into cursor->fences -> boom?

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
>   /**
>    * dma_resv_copy_fences - Copy all fences from src to dst.
>    * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 9100dd3dc21f..f5b91c292ee0 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -149,6 +149,39 @@ struct dma_resv {
>   	struct dma_resv_list __rcu *fence;
>   };
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

Is_first is useful to callers - like they are legitimately allowed to 
look inside this, what could otherwise be private object? What is the 
intended use case, given when true the returned fence can be either 
exclusive or first from a shared list?

> +	bool is_exclusive;

Is_exclusive could be written as index == -1 in the code, right? If so 
then an opportunity to remove some redundancy.

> +};
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

Has the fact RCU lock can be dropped so there is potential to walk over 
completely different snapshots been discussed?

At least if I followed the code correctly - it appears there is 
potential the walk restarts from the start (exclusive slot) at any point 
during the walk.

Because theoretically I think you could take an atomic snapshot of 
everything (given you have a cursor object) and then release it on the 
end condition.

Regards,

Tvrtko

> +
>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>   
> @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> +					 struct dma_resv_cursor *cursor,
> +					 bool first, bool all_fences);
>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>   			unsigned *pshared_count, struct dma_fence ***pshared);
>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> 
