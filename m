Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F9897DC2
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 16:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbfHUO4a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 21 Aug 2019 10:56:30 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:55146 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726530AbfHUO4a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 10:56:30 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 18215656-1500050 
        for multiple; Wed, 21 Aug 2019 15:56:27 +0100
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
 <20190821123147.110736-6-christian.koenig@amd.com>
 <156639930822.1374.18129686805314896871@skylake-alporthouse-com>
In-Reply-To: <156639930822.1374.18129686805314896871@skylake-alporthouse-com>
Message-ID: <156639938517.1374.16561849999409019681@skylake-alporthouse-com>
Subject: Re: [PATCH 05/10] dma-buf/resv: add dma_resv_prune_fences
Date:   Wed, 21 Aug 2019 15:56:25 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Chris Wilson (2019-08-21 15:55:08)
> Quoting Christian König (2019-08-21 13:31:42)
> > Add a new dma_resv_prune_fences() function to improve memory management.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >  drivers/dma-buf/dma-resv.c                 | 37 ++++++++++++++++++++++
> >  drivers/gpu/drm/i915/gem/i915_gem_wait.c   |  3 +-
> >  drivers/gpu/drm/i915/i915_gem_batch_pool.c |  2 +-
> >  drivers/gpu/drm/i915/i915_vma.c            |  3 +-
> >  drivers/gpu/drm/ttm/ttm_bo.c               |  2 +-
> >  include/linux/dma-resv.h                   |  1 +
> >  6 files changed, 42 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 42a8f3f11681..24adc32d36d4 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -301,6 +301,43 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
> >  }
> >  EXPORT_SYMBOL(dma_resv_add_excl_fence);
> >  
> > +/**
> > + * dma_resv_prune_fences - prune signaled fences from the resv object
> > + * @obj: the reservation object to prune
> > + *
> > + * Prune all signaled fences from the reservation object.
> > + */
> > +void dma_resv_prune_fences(struct dma_resv *obj)
> > +{
> > +       struct dma_resv_list *list;
> > +       struct dma_fence *fence;
> > +       unsigned int i;
> > +
> > +       dma_resv_assert_held(obj);
> > +
> > +       fence = dma_resv_get_excl(obj);
> > +       if (dma_fence_is_signaled(fence)) {
> > +               RCU_INIT_POINTER(obj->fence_excl, NULL);
> > +               dma_fence_put(fence);
> > +       }
> > +
> > +       list = dma_resv_get_list(obj);
> > +       if (!list)
> > +               return;
> > +
> > +       for (i = 0; i < list->shared_count; ++i) {
> > +               fence = rcu_dereference_protected(list->shared[i],
> > +                                                 dma_resv_held(obj));
> > +
> > +               if (!dma_fence_is_signaled(fence))
> > +                       continue;
> > +
> > +               RCU_INIT_POINTER(list->shared[i], dma_fence_get_stub());
> > +               dma_fence_put(fence);
> 
> Not worth reusing the compaction logic from add_shared_fence?

Scratch that, you're going to rewrite the shared fence container.
-Chris
