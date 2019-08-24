Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1AB9BDF1
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2019 15:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfHXNWe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 24 Aug 2019 09:22:34 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:58236 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727440AbfHXNWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Aug 2019 09:22:34 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 18250784-1500050 
        for multiple; Sat, 24 Aug 2019 14:22:28 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From:   Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To:     =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-9-christian.koenig@amd.com>
In-Reply-To: <20190821123147.110736-9-christian.koenig@amd.com>
Message-ID: <156665294650.4019.8311918110818842888@skylake-alporthouse-com>
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
Date:   Sat, 24 Aug 2019 14:22:26 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-08-21 13:31:45)
> @@ -528,20 +352,9 @@ void dma_resv_prune_fences(struct dma_resv *obj)
>                 dma_fence_put(fence);
>         }
>  
> -       list = dma_resv_get_list(obj);
> -       if (!list)
> -               return;
> -
> -       for (i = 0; i < list->shared_count; ++i) {
> -               fence = rcu_dereference_protected(list->shared[i],
> -                                                 dma_resv_held(obj));
> -
> -               if (!dma_fence_is_signaled(fence))
> -                       continue;
> -
> -               RCU_INIT_POINTER(list->shared[i], dma_fence_get_stub());
> -               dma_fence_put(fence);
> -       }
> +       fence = dma_resv_fences_deref(obj, &obj->readers);
> +       if (dma_fence_is_signaled(fence))
> +               dma_resv_fences_set(obj, &obj->readers, NULL);

Something to note is that a dma-fence-array is not automatically
signaled and dma_fence_is_signaled() does not check the array.
-Chris
