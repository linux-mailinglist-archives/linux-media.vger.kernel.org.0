Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D31B423DE5
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 14:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238036AbhJFMmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 08:42:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:8932 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231207AbhJFMmn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 08:42:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="226294060"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; 
   d="scan'208";a="226294060"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 05:40:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; 
   d="scan'208";a="589740133"
Received: from ccronin-mobl.ger.corp.intel.com (HELO [10.213.247.242]) ([10.213.247.242])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 05:40:45 -0700
Subject: Re: [PATCH 1/2] dma-buf: add dma_resv_for_each_fence v3
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
References: <20211006123609.2026-1-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <d3b344cf-d7b8-437a-b751-106d42b4f26f@linux.intel.com>
Date:   Wed, 6 Oct 2021 13:40:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006123609.2026-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 06/10/2021 13:36, Christian König wrote:
> A simpler version of the iterator to be used when the dma_resv object is
> locked.
> 
> v2: fix index check here as well
> v3: minor coding improvement, some documentation cleanup
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c | 51 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-resv.h   | 20 +++++++++++++++
>   2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index a480af9581bd..2f98caa68ae5 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -423,6 +423,57 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
>   }
>   EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>   
> +/**
> + * dma_resv_iter_first - first fence from a locked dma_resv object
> + * @cursor: cursor to record the current position
> + *
> + * Return the first fence in the dma_resv object while holding the
> + * &dma_resv.lock.
> + */
> +struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
> +{
> +	struct dma_fence *fence;
> +
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->index = 0;
> +	if (cursor->all_fences)
> +		cursor->fences = dma_resv_shared_list(cursor->obj);
> +	else
> +		cursor->fences = NULL;
> +
> +	fence = dma_resv_excl_fence(cursor->obj);
> +	if (!fence)
> +		fence = dma_resv_iter_next(cursor);
> +
> +	cursor->is_restarted = true;
> +	return fence;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_first);
> +
> +/**
> + * dma_resv_iter_next - next fence from a locked dma_resv object
> + * @cursor: cursor to record the current position
> + *
> + * Return the next fences from the dma_resv object while holding the
> + * &dma_resv.lock.
> + */
> +struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
> +{
> +	unsigned int idx;
> +
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->is_restarted = false;
> +	if (!cursor->fences || cursor->index >= cursor->fences->shared_count)
> +		return NULL;
> +
> +	idx = cursor->index++;
> +	return rcu_dereference_protected(cursor->fences->shared[idx],
> +					 dma_resv_held(cursor->obj));
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_next);
> +
>   /**
>    * dma_resv_copy_fences - Copy all fences from src to dst.
>    * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 764138ad8583..491359cea54c 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -179,6 +179,8 @@ struct dma_resv_iter {
>   
>   struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
>   struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
>   
>   /**
>    * dma_resv_iter_begin - initialize a dma_resv_iter object
> @@ -244,6 +246,24 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>   	for (fence = dma_resv_iter_first_unlocked(cursor);		\
>   	     fence; fence = dma_resv_iter_next_unlocked(cursor))
>   
> +/**
> + * dma_resv_for_each_fence - fence iterator
> + * @cursor: a struct dma_resv_iter pointer
> + * @obj: a dma_resv object pointer
> + * @all_fences: true if all fences should be returned
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object while holding the
> + * &dma_resv.lock. @all_fences controls if the shared fences are returned as
> + * well. The cursor initialisation is part of the iterator and the fence stays
> + * valid as long as the lock is held and so no extra reference to the fence is
> + * taken.
> + */
> +#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
> +	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
> +	     fence = dma_resv_iter_first(cursor); fence;	\
> +	     fence = dma_resv_iter_next(cursor))
> +
>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>   
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
