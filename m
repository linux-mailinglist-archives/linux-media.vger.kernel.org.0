Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE841495ABD
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 08:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343953AbiAUHdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 02:33:03 -0500
Received: from mga03.intel.com ([134.134.136.65]:55741 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239626AbiAUHdB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 02:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642750381; x=1674286381;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=j6D2M5eJcGFfscpsShMvN4Ex93Qg3ANgb4qLkoAi0Oo=;
  b=F3xTLLyXF4ymflBvktbFW40W6ArYre7GBuCXRoVztRVU8TxpmnPlkGrM
   vz+gCQZlDKOEUJHMGA6oK8c5jrQdv255VRyJSaZgUjBPAruUWjsCbF+1K
   +5GsU8HR5JEbga0W+riebIoaqTUcRAIrXByc+Qu6fJGkwW4YOLa2XCLjY
   rFXm8hDQo49a4F1YS/x62bqP9r8WfuRD/NpK6vnBC7WUWJ9yR8rGwSfn7
   o1ZfHN218MkotbPUY18Rxs+/xw5u11PkBe/Ud1gDvoqtF/IbVcPEWQg3J
   nqV6aRw6ROj8vGpfRcdt6Ap7b9CMw6WxSb9rMZJCcTDw3UOJhJZjrYIqi
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245538635"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="245538635"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 23:33:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="533168548"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.132]) ([10.249.254.132])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 23:32:59 -0800
Message-ID: <ca907ad0-9199-d13e-5033-7113d732d476@linux.intel.com>
Date:   Fri, 21 Jan 2022 08:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Linaro-mm-sig] [PATCH 3/9] dma-buf: Warn about dma_fence_chain
 container rules
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220120132747.2348-1-christian.koenig@amd.com>
 <20220120132747.2348-4-christian.koenig@amd.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220120132747.2348-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/20/22 14:27, Christian König wrote:
> Chaining of dma_fence_chain objects is only allowed through the prev
> fence and not through the contained fence.
>
> Warn about that when we create a dma_fence_chain.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/dma-buf/dma-fence-chain.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 1b4cb3e5cec9..fa33f6b7f77b 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -254,5 +254,13 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>   
>   	dma_fence_init(&chain->base, &dma_fence_chain_ops,
>   		       &chain->lock, context, seqno);
> +
> +	/* Chaining dma_fence_chain container together is only allowed through

Nit: Multi-line comment.

Otherwise, Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> +	 * the prev fence and not through the contained fence.
> +	 *
> +	 * The correct way of handling this is to flatten out the fence
> +	 * structure into a dma_fence_array by the caller instead.
> +	 */
> +	WARN_ON(dma_fence_is_chain(fence));
>   }
>   EXPORT_SYMBOL(dma_fence_chain_init);
