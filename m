Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373FF42D8C3
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 14:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhJNMGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 08:06:33 -0400
Received: from mga02.intel.com ([134.134.136.20]:21518 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230032AbhJNMGc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 08:06:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214823753"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="214823753"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 05:04:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="481235432"
Received: from thanners-mobl.ger.corp.intel.com (HELO [10.252.62.140]) ([10.252.62.140])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 05:04:20 -0700
Subject: Re: [PATCH 20/28] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-21-christian.koenig@amd.com>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <5accca25-8ac3-47ca-ee56-8b33c208fc80@linux.intel.com>
Date:   Thu, 14 Oct 2021 14:04:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005113742.1101-21-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Op 05-10-2021 om 13:37 schreef Christian König:
> Simplifying the code a bit.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c | 51 +++++-------------------
>  1 file changed, 9 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index f909aaa09d9c..a13193db1dba 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -37,55 +37,22 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>  				 unsigned int flags,
>  				 long timeout)
>  {
> -	struct dma_fence *excl;
> -	bool prune_fences = false;
> -
> -	if (flags & I915_WAIT_ALL) {
> -		struct dma_fence **shared;
> -		unsigned int count, i;
> -		int ret;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>  
> -		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
> -		if (ret)
> -			return ret;
> -
> -		for (i = 0; i < count; i++) {
> -			timeout = i915_gem_object_wait_fence(shared[i],
> -							     flags, timeout);
> -			if (timeout < 0)
> -				break;
> -
> -			dma_fence_put(shared[i]);
> -		}
> -
> -		for (; i < count; i++)
> -			dma_fence_put(shared[i]);
> -		kfree(shared);
> -
> -		/*
> -		 * If both shared fences and an exclusive fence exist,
> -		 * then by construction the shared fences must be later
> -		 * than the exclusive fence. If we successfully wait for
> -		 * all the shared fences, we know that the exclusive fence
> -		 * must all be signaled. If all the shared fences are
> -		 * signaled, we can prune the array and recover the
> -		 * floating references on the fences/requests.
> -		 */
> -		prune_fences = count && timeout >= 0;
> -	} else {
> -		excl = dma_resv_get_excl_unlocked(resv);
> +	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
> +		if (timeout < 0)
> +			break;
>  	}
> -
> -	if (excl && timeout >= 0)
> -		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
> -
> -	dma_fence_put(excl);
> +	dma_resv_iter_end(&cursor);
>  
>  	/*
>  	 * Opportunistically prune the fences iff we know they have *all* been
>  	 * signaled.
>  	 */
> -	if (prune_fences)
> +	if (timeout > 0)
>  		dma_resv_prune(resv);
>  
>  	return timeout;

When replying to tvrtko about correctness of the conversion, I just now noticed a logic bug here, the same logic bug also affects dma_resv_wait_timeout.

long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
			   unsigned long timeout)
{
	long ret = timeout ? timeout : 1;
	struct dma_resv_iter cursor;
	struct dma_fence *fence;

	dma_resv_iter_begin(&cursor, obj, wait_all);
	dma_resv_for_each_fence_unlocked(&cursor, fence) {

		ret = dma_fence_wait_timeout(fence, intr, ret);
		if (ret <= 0) {
			dma_resv_iter_end(&cursor);
			return ret;
		}
	}
	dma_resv_iter_end(&cursor);

	return ret;
}

It fails to handle the case correctly when timeout = 0, I think the original code probably did.
dma_fence_wait_timeout should be called with timeout = 0 explicitly.

Fixed code for inner loop:
ret = dma_fence_wait_timeout(fence, intr, timeout);
if (ret <= 0) break;
if (timeout) timeout = ret;

This bug also affects i915_gem_object_wait_reservation, so the whole series might need to be
respinned, or at least checked, if more wait conversions are affected.

~Maarten

