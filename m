Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A77E97E9E
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 17:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbfHUPY2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 21 Aug 2019 11:24:28 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:49306 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727943AbfHUPY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 11:24:28 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 18216017-1500050 
        for multiple; Wed, 21 Aug 2019 16:24:25 +0100
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
Message-ID: <156640106246.20466.15153611256655352471@skylake-alporthouse-com>
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
Date:   Wed, 21 Aug 2019 16:24:22 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christian König (2019-08-21 13:31:45)
> @@ -117,17 +120,10 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>                 busy_check_writer(rcu_dereference(obj->base.resv->fence_excl));
>  
>         /* Translate shared fences to READ set of engines */
> -       list = rcu_dereference(obj->base.resv->fence);
> -       if (list) {
> -               unsigned int shared_count = list->shared_count, i;
> -
> -               for (i = 0; i < shared_count; ++i) {
> -                       struct dma_fence *fence =
> -                               rcu_dereference(list->shared[i]);
> -
> -                       args->busy |= busy_check_reader(fence);
> -               }
> -       }
> +       readers = dma_resv_fences_get_rcu(&obj->base.resv->readers);
> +       dma_fence_array_for_each(fence, cursor, readers)
> +               args->busy |= busy_check_reader(fence);
> +       dma_fence_put(readers);

That's underwhelming, the full-mb shows up in scaling tests (I'll test
the impact of this series later). Something like,

do {
	read = 0;
	fences = dma_resv_fences_get_deref(&obj->base.resv->readers);
	dma_fence_array_for_each(fence, cursor, fences)
		read |= busy_check_reader(fence);
	smp_rmb();
} while (dma_resv_fences_get_deref(obj->readers) != fences)

do {
	fences = dma_resv_fences_get_deref(&obj->base.resv->fences);
	write = busy_check_writer(fences);
	smp_rmb();
} while (dma_resv_fences_get_deref(obj->writes) != fences)

args->busy = write | read;

Perhaps?
-Chris
