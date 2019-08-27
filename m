Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A139E6F4
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 13:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbfH0Lof convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 27 Aug 2019 07:44:35 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:63168 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726955AbfH0Lof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 07:44:35 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 18276809-1500050 
        for multiple; Tue, 27 Aug 2019 12:44:29 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
References: <20190826145731.1725-1-christian.koenig@amd.com>
 <20190826145731.1725-2-christian.koenig@amd.com>
In-Reply-To: <20190826145731.1725-2-christian.koenig@amd.com>
Message-ID: <156690626744.15406.4672497135424922383@skylake-alporthouse-com>
Subject: Re: [PATCH 1/9] dma-buf: fix dma_fence_array_signaled
Date:   Tue, 27 Aug 2019 12:44:27 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-08-26 15:57:23)
> The function is supposed to give a hint even if signaling is not enabled.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-array.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index d3fbd950be94..52068ee5eb35 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -103,8 +103,18 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>  static bool dma_fence_array_signaled(struct dma_fence *fence)
>  {
>         struct dma_fence_array *array = to_dma_fence_array(fence);
> +       int i, num_pending;
>  
> -       return atomic_read(&array->num_pending) <= 0;
> +       num_pending = atomic_read(&array->num_pending);
> +       if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +               return num_pending <= 0;
> +
> +       for (i = 0; i < array->num_fences; ++i)
> +               if (dma_fence_is_signaled(array->fences[i]) &&
> +                   --num_pending == 0)
> +                       return true;

num_fences may be 0 (it's not rejected in construction and works
currently as a simple always-signaled stub).

	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags)) {
		for (i = 0; i < array->num_fences; ++i)
			if (dma_fence_is_signaled(array->fences[i]) &&
			    --num_pending == 0)
				break;
	}

	return num_pending <= 0;
