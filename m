Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C194B411138
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 10:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbhITIqn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 04:46:43 -0400
Received: from mga03.intel.com ([134.134.136.65]:3061 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230053AbhITIql (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 04:46:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="223133543"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; 
   d="scan'208";a="223133543"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 01:45:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; 
   d="scan'208";a="473489071"
Received: from gbradyx-mobl2.ger.corp.intel.com (HELO [10.213.235.119]) ([10.213.235.119])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 01:45:13 -0700
Subject: Re: [Intel-gfx] [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-14-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <6fbaca09-ec51-c44e-708c-334ef8be8595@linux.intel.com>
Date:   Mon, 20 Sep 2021 09:45:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917123513.1106-14-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 17/09/2021 13:35, Christian König wrote:
> This makes the function much simpler since the complex
> retry logic is now handled else where.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 32 ++++++++----------------
>   1 file changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> index 6234e17259c1..b1cb7ba688da 100644
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
> @@ -109,27 +109,17 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
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
> +	args->busy = false;
> +	dma_resv_iter_begin(&cursor, obj->base.resv, true);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {

You did not agree with my suggestion to reset args->busy on restart and 
so preserve current behaviour?

Regards,

Tvrtko

> +		if (dma_resv_iter_is_exclusive(&cursor))
> +			/* Translate the exclusive fence to the READ *and* WRITE engine */
> +			args->busy = busy_check_writer(fence);
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
