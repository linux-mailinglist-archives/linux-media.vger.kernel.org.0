Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AB940AB9E
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 12:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhINK2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 06:28:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:60055 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231206AbhINK2E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 06:28:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="244283050"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="244283050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 03:26:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="432945409"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116]) ([10.213.234.116])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 03:26:45 -0700
Subject: Re: [Intel-gfx] [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-16-christian.koenig@amd.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f9ebc539-3965-b57f-7040-78aaba72afbd@linux.intel.com>
Date:   Tue, 14 Sep 2021 11:26:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913131707.45639-16-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 13/09/2021 14:16, Christian König wrote:
> Simplifying the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/i915_request.c | 36 ++++++-----------------------
>   1 file changed, 7 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 37aef1308573..b81045ceb619 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1583,38 +1583,16 @@ i915_request_await_object(struct i915_request *to,
>   			  struct drm_i915_gem_object *obj,
>   			  bool write)
>   {
> -	struct dma_fence *excl;
> +	struct dma_resv_cursor cursor;
> +	struct dma_fence *fence;
>   	int ret = 0;
>   
> -	if (write) {
> -		struct dma_fence **shared;
> -		unsigned int count, i;
> -
> -		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
> -					  &shared);
> -		if (ret)
> -			return ret;
> -
> -		for (i = 0; i < count; i++) {
> -			ret = i915_request_await_dma_fence(to, shared[i]);
> -			if (ret)
> -				break;
> -
> -			dma_fence_put(shared[i]);
> +	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, write, fence) {

I think callers have the object locked for this one. At least if you 
haven't tried it it's worth asking CI (you have the assert already so it 
will tell you). But I think it's important to have an atomic snapshot here.

Regards,

Tvrtko

> +		ret = i915_request_await_dma_fence(to, fence);
> +		if (ret) {
> +			dma_fence_put(fence);
> +			break;
>   		}
> -
> -		for (; i < count; i++)
> -			dma_fence_put(shared[i]);
> -		kfree(shared);
> -	} else {
> -		excl = dma_resv_get_excl_unlocked(obj->base.resv);
> -	}
> -
> -	if (excl) {
> -		if (ret == 0)
> -			ret = i915_request_await_dma_fence(to, excl);
> -
> -		dma_fence_put(excl);
>   	}
>   
>   	return ret;
> 
