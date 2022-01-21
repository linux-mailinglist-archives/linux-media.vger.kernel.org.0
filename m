Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8080F495AB8
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 08:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378991AbiAUHbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 02:31:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:17458 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1378999AbiAUHbR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 02:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642750277; x=1674286277;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ASOROsILjd0PMR1PX1r+grUH0Atx+d5KkMA1O6KZxbA=;
  b=RCc3FBkN0qEhPvu0YMRvP+ODPV2RMbcIBgNq078s6lhCfA2tLn8Z1xZu
   m+vHQfMHiT227QyiQyhM42l1KF5GBxzz5BFPzxk4NnHL8dle5Vuu/xge6
   49abwuJ9RR0I1XNthJoY0x4MruWY6zw+0VdvmrZRl1Jo67AjPedKqSvDP
   T1LsFbGGDSqs9TTvsfa3lEy9MnTrNQz1+SPc52+B0kS9EW5xUdDajXniC
   85yymv5gyB2ZTLbiwXvBmPnjiZL1ytVUfb9e+eJRLqlhO+etSNvaDvjVX
   CerbhO90lQB+OK4+PFAHog8CWuOCNVyvGnaO4WPMwq9WPG0PGqfxDpg9W
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="226262450"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="226262450"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 23:31:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="533167635"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.132]) ([10.249.254.132])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 23:31:15 -0800
Message-ID: <be78e61c-992c-4fa6-7a2b-b9b93310a34d@linux.intel.com>
Date:   Fri, 21 Jan 2022 08:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Linaro-mm-sig] [PATCH 2/9] dma-buf: warn about dma_fence_array
 container rules
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220120132747.2348-1-christian.koenig@amd.com>
 <20220120132747.2348-3-christian.koenig@amd.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220120132747.2348-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/20/22 14:27, Christian König wrote:
> It's not allowed to nest another dma_fence container into a dma_fence_array
> or otherwise we can run into recursion.
>
> Warn about that when we create a dma_fence_array.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 3e07f961e2f3..4bfbcb885bbc 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -176,6 +176,19 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   
>   	array->base.error = PENDING_ERROR;
>   
> +	/* dma_fence_array objects should never contain any other fence
Nit: First comment line of multi-line comments shouldn't contain text.
> +	 * containers or otherwise we run into recursion and potential kernel
> +	 * stack overflow on operations on the dma_fence_array.
> +	 *
> +	 * The correct way of handling this is to flatten out the array by the
> +	 * caller instead.
> +	 *
> +	 * Enforce this here by checking that we don't create a dma_fence_array
> +	 * with any container inside.
> +	 */
> +	while (seqno--)
> +		WARN_ON(dma_fence_is_container(fences[seqno]));
> +

s/seqno/num_fences/g ?

Thanks,

Thomas



>   	return array;
>   }
>   EXPORT_SYMBOL(dma_fence_array_create);

