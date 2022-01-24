Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F218498548
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243945AbiAXQwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:52:39 -0500
Received: from mga06.intel.com ([134.134.136.31]:35216 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241226AbiAXQwj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643043158; x=1674579158;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=fu1nTdM6Ey9Y88os1dkd6NMK6cktB4QUGnnOy1VQzQ4=;
  b=Z2BFUoofV5ZiGK+4Cy8Pxk4jye4d+vRviDmtT+Ka9x2THw0pt+OdnEXL
   D7XOj+4s+rUthJtcV265/vllJmbdepOxzZuiFLdK6Ntyv5+JPYRVAsRpS
   grMFXQOhcj8lV/buuQ9pjaORT2gI3yMruXkimCDh5dX2O9E6lN/i6mz48
   WVwUI+NQXrxgn4c8vVkK4rfMLzOXy4jv3Fop1hb/kRARI1B2VPlBOiGxV
   B3dmdrvBju0QINvX+3WCMg4UoOEXiLsTbIhTzd1BYYdBM9waGewO7imyo
   96kYPb0IXlDMclikcaPKrLoL4L5VpZv/ggr4QilvNzZTK0FgQJr33pWsp
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="306805218"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="306805218"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:52:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="624141222"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.70]) ([10.249.254.70])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:52:34 -0800
Message-ID: <b609fb36-b4e0-738c-01d3-b74c760a9e82@linux.intel.com>
Date:   Mon, 24 Jan 2022 17:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 08/11] dma-buf: add dma_fence_chain_contained helper
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-9-christian.koenig@amd.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220124130328.2376-9-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/24/22 14:03, Christian König wrote:
> It's a reoccurring pattern that we need to extract the fence
> from a dma_fence_chain object. Add a helper for this.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/dma-buf/dma-fence-chain.c |  6 ++----
>   include/linux/dma-fence-chain.h   | 15 +++++++++++++++
>   2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 084c6927b735..06f8ef97c6e8 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -148,8 +148,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
>   
>   	dma_fence_get(&head->base);
>   	dma_fence_chain_for_each(fence, &head->base) {
> -		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> -		struct dma_fence *f = chain ? chain->fence : fence;
> +		struct dma_fence *f = dma_fence_chain_contained(fence);
>   
>   		dma_fence_get(f);
>   		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
> @@ -165,8 +164,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
>   static bool dma_fence_chain_signaled(struct dma_fence *fence)
>   {
>   	dma_fence_chain_for_each(fence, fence) {
> -		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> -		struct dma_fence *f = chain ? chain->fence : fence;
> +		struct dma_fence *f = dma_fence_chain_contained(fence);
>   
>   		if (!dma_fence_is_signaled(f)) {
>   			dma_fence_put(fence);
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index ee906b659694..10d51bcdf7b7 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -66,6 +66,21 @@ to_dma_fence_chain(struct dma_fence *fence)
>   	return container_of(fence, struct dma_fence_chain, base);
>   }
>   
> +/**
> + * dma_fence_chain_contained - return the contained fence
> + * @fence: the fence to test
> + *
> + * If the fence is a dma_fence_chain the function returns the fence contained
> + * inside the chain object, otherwise it returns the fence itself.
> + */
> +static inline struct dma_fence *
> +dma_fence_chain_contained(struct dma_fence *fence)
> +{
> +	struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> +
> +	return chain ? chain->fence : fence;
> +}
> +
>   /**
>    * dma_fence_chain_alloc
>    *
