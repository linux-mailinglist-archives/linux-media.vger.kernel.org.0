Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F328741EB07
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352859AbhJAKj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:39:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:21632 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231316AbhJAKjZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Oct 2021 06:39:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="205551056"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="205551056"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 03:37:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="619007698"
Received: from howells-mobl.ger.corp.intel.com (HELO [10.213.208.92]) ([10.213.208.92])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 03:37:40 -0700
Subject: Re: [PATCH 17/28] drm/i915: use the new iterator in
 i915_gem_busy_ioctl v2
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-18-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c6837f74-0ba5-e3c2-5778-a9d120c6ea67@linux.intel.com>
Date:   Fri, 1 Oct 2021 11:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001100610.2899-18-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 01/10/2021 11:05, Christian König wrote:
> This makes the function much simpler since the complex
> retry logic is now handled else where.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Sorry I retract until you add the text about the increased cost of the 
added atomics. I think the point is important to discuss given proposal 
goes from zero atomics to num_fences * 2 (fence get/put unless I am 
mistaken) atomics per busy ioctl. That makes me lean towards just 
leaving this as is since it is not that complex.

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
>   1 file changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> index 6234e17259c1..dc72b36dae54 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_i915_gem_busy *args = data;
>   	struct drm_i915_gem_object *obj;
> -	struct dma_resv_list *list;
> -	unsigned int seq;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>   	int err;
>   
>   	err = -ENOENT;
> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>   	 * to report the overall busyness. This is what the wait-ioctl does.
>   	 *
>   	 */
> -retry:
> -	seq = raw_read_seqcount(&obj->base.resv->seq);
> -
> -	/* Translate the exclusive fence to the READ *and* WRITE engine */
> -	args->busy = busy_check_writer(dma_resv_excl_fence(obj->base.resv));
> -
> -	/* Translate shared fences to READ set of engines */
> -	list = dma_resv_shared_list(obj->base.resv);
> -	if (list) {
> -		unsigned int shared_count = list->shared_count, i;
> -
> -		for (i = 0; i < shared_count; ++i) {
> -			struct dma_fence *fence =
> -				rcu_dereference(list->shared[i]);
> -
> +	args->busy = 0;
> +	dma_resv_iter_begin(&cursor, obj->base.resv, true);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		if (dma_resv_iter_is_restarted(&cursor))
> +			args->busy = 0;
> +
> +		if (dma_resv_iter_is_exclusive(&cursor))
> +			/* Translate the exclusive fence to the READ *and* WRITE engine */
> +			args->busy |= busy_check_writer(fence);
> +		else
> +			/* Translate shared fences to READ set of engines */
>   			args->busy |= busy_check_reader(fence);
> -		}
>   	}
> -
> -	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
> -		goto retry;
> +	dma_resv_iter_end(&cursor);
>   
>   	err = 0;
>   out:
> 
