Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7780740AEC4
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 15:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhINNTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 09:19:38 -0400
Received: from mga01.intel.com ([192.55.52.88]:8965 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233312AbhINNTd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 09:19:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="244323499"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="244323499"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 06:18:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="544067834"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116]) ([10.213.234.116])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 06:18:14 -0700
Subject: Re: [Intel-gfx] [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-14-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7d5d6454-2d74-53e7-73ea-2d0d60b3c44c@linux.intel.com>
Date:   Tue, 14 Sep 2021 14:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913131707.45639-14-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 13/09/2021 14:16, Christian König wrote:
> This makes the function much simpler since the complex
> retry logic is now handled else where.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 30 +++++++-----------------
>   1 file changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> index 6234e17259c1..c6c6d747b33e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_i915_gem_busy *args = data;
>   	struct drm_i915_gem_object *obj;
> -	struct dma_resv_list *list;
> -	unsigned int seq;
> +	struct dma_resv_cursor cursor;
> +	struct dma_fence *fence;
>   	int err;
>   
>   	err = -ENOENT;
> @@ -109,28 +109,16 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
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
> +	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, true, fence) {

To preserve strictly identical behaviour, I think add before the below 
if-else:

	if (cursor.is_first)
		args->busy = 0;

As mentioned elsewhere in the thread I am not convinced it is hugely 
important, all that can happen without it is that stale read activity 
gets reported, and this ioctl is not really that sensitive to that.

Regards,

Tvrtko

> +		if (cursor.is_exclusive)
> +			/* Translate the exclusive fence to the READ *and* WRITE engine */
> +			args->busy = busy_check_writer(fence);
> +		else
> +			/* Translate shared fences to READ set of engines */
>   			args->busy |= busy_check_reader(fence);
> -		}
>   	}
>   
> -	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
> -		goto retry;
> -
>   	err = 0;
>   out:
>   	rcu_read_unlock();
> 
