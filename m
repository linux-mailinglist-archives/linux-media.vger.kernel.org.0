Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E9AD116E
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 16:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731507AbfJIOjL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 10:39:11 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35083 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729491AbfJIOjL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 10:39:11 -0400
Received: by mail-ed1-f67.google.com with SMTP id v8so2277319eds.2
        for <linux-media@vger.kernel.org>; Wed, 09 Oct 2019 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DwZtdwlwJwHB4Og+axV05bA7jVqB3gQGGLTlsSz/Www=;
        b=A9Y69ZpMGWcGbTu7ZfuQjdWNSL0da14BghllPPYiwKbJZ9NVAnmMJCQKdnbXE0BZFK
         tILQXsrpZ5CrFFr/MjRutce0F4XeZUTUMdVmvfC3JLCP/ncJE6TFwSexGF3n1FQwAbEU
         ggXXGrhTKJOEZeF5pa9gbl4mvO7ENEGS9vbic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=DwZtdwlwJwHB4Og+axV05bA7jVqB3gQGGLTlsSz/Www=;
        b=aQ8CaWgu39Ou5i8V06ZImPFcP10sg+LNrzHxWNvbr6R878d6yO1CdaHaHn8A8LUzTN
         IId5Phfo3CarX63sZJq5EJSmqM4UxskQe4CDoYcZZfHxZyovopfkZbORsREJ6GdvKoqr
         K36mr29zgyCvm2Ohn2jrQLdX5oXuNjIeyw7jHy/dEZvnzKNE/FOxQHEhI+gXtZ3DTJdx
         4D3jCaBs0J7li/izaAZ3+0eo2LqQ35pXIy6sdLXpEj98eCvsIvbwN81Ybrgt3dDUoJWC
         prt0iq1/ZHk/zg88QrFQOWSvu9jl59x/vbcutfjlMvTZEiWMhZOPMPtnZ+Ia4wfvWo0t
         PD7g==
X-Gm-Message-State: APjAAAW9BkVsk1+jPRcOypq7jExIrnljtRxPivLCE2/46ffc9wjC9r6Z
        82qWta/+qAHJ9MAWo62GXmRzFRtO5Uo=
X-Google-Smtp-Source: APXvYqx9DDBtRquEOQt6q8DYsAdvyIZ+4fE+RikOtaQUlPJq/UJJ9LuxS5jA26BCRQFqxiZsOF862A==
X-Received: by 2002:a17:907:20c5:: with SMTP id qq5mr3149830ejb.96.1570631946767;
        Wed, 09 Oct 2019 07:39:06 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id i30sm380641ede.32.2019.10.09.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 07:39:05 -0700 (PDT)
Date:   Wed, 9 Oct 2019 16:39:03 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, sumit.semwal@linaro.org
Subject: Re: [PATCH 1/3] dma-buf: add dma_resv_ctx for deadlock handling
Message-ID: <20191009143903.GZ16989@phenom.ffwll.local>
References: <20190918175525.49441-1-christian.koenig@amd.com>
 <20191008151639.GP16989@phenom.ffwll.local>
 <44f5b8d8-f29b-5b33-b12d-610aba515272@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44f5b8d8-f29b-5b33-b12d-610aba515272@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 09, 2019 at 03:21:06PM +0200, Christian König wrote:
> Am 08.10.19 um 17:16 schrieb Daniel Vetter:
> > On Wed, Sep 18, 2019 at 07:55:23PM +0200, Christian König wrote:
> > > The ww_mutex framework allows for detecting deadlocks when multiple
> > > threads try to acquire the same set of locks in different order.
> > > 
> > > The problem is that handling those deadlocks was the burden of the user of
> > > the ww_mutex implementation and at least some users didn't got that right
> > > on the first try.
> > > 
> > > So introduce a new dma_resv_ctx object which can be used to
> > > simplify the deadlock handling. This is done by tracking all locked
> > > dma_resv objects in the context as well as the last contended object.
> > > 
> > > When a deadlock occurse we now unlock all previously locked objects and
> > > acquire the contended lock in the slow path. After this is done -EDEADLK
> > > is still returned to signal that all other locks now need to be
> > > re-acquired again.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > I pondered this quite a bit, some thoughts:
> > 
> > - doing this over dma-buf means we can only use this for the ww_mutx
> >    dance, not for anything else. Which means we need another layer on top
> >    for shared execbuf utils (which Gerd has started looking into, but I
> >    felt like not quite the right approach yet in his first draft series).
> 
> Yes, and I actually realized that this won't work on the dma_resv layer as
> well.
> 
> We need to base this on GEM to be able to do the correct ref/unref the
> locked objects.
> 
> > - With the ttm/gem merger we could just put this into drm_gem_object, and
> >    ttm/gem helpers could still use it. Plus we could build some shared
> >    execbuf utils on top of this, by essentially merging ttm_operation_ctx
> >    into drm_gem_operation_ctx. I think this would also simplify the ttm
> >    parameters a bit, since currently the ttm_operation_ctx doesn't have an
> >    explicit pointer to the ww_acquire_ctx (which feels like an oversight to
> >    me).
> 
> That ttm_operation_ctx doesn't contain a ww_acquire_ctx is intentional and
> mandatory for correct operation.
> 
> See for swapping things out from the MM callbacks you can't work with a
> ww_acquire_ctx and instead need to use trylock.
> 
> When you need a ww_acquire_ctx you can get that from the buffer object you
> try to allocate space for.

Hm I've seen that trick, and I'm not sure I like it. Imo an explicit
pointer that tells you which acquire_ctx to use, with the clear meaning
that if the pointer is NULL then only trylock is ok, would be a lot
cleaner. At least for execbuf utils the acquire_ctx is really central and
really should be in there somehow. Or embed it and have a flag whether
it's ok to use it or not.

Other plan would be to make sure that acquire_ctx and non-acquire_ctx
(i.e. mmu/shrinker callbacks) are clearly separate paths. That might be the
even better option going forward, since mixing them up leads to a huge
mess ime.

> > - Aside, quick question: Any reason why struct amdgpu_cs_parser doesn't
> >    subclass ttm_operation_ctx? From my naive understanding this would make
> >    tons of sense ...
> 
> amdgpu_cs_parser is already overloaded with to much crap which actually
> should be temporary allocated on the stack.
> 
> > - Maybe we could even build some lru/eviction helpers on top, perhaps with
> >    two lists, one for the set of buffers in the execbuf, the other for
> >    additional buffers we've reserved as part of the eviction dance (to
> >    solve the TODO in ttm_mem_evict_wait_busy).
> 
> That's what I'm currently working on, but some driver still need the
> struct_mutex for GEM ref/unref which is complicating things a bit.
> 
> So prototyping that in TTM BOs first before I move on to using the
> underlying GEM object.
> 
> > - Only downside would be that drivers outside of drivers/gpu won't be able
> >    to use these helpers. I don't see any immediate nor near-future need for
> >    that. All other drivers use so little memory they don't need to
> >    participate in the multi-lock dance, they just pin the few buffers they
> >    need and call it a day.
> 
> I can live with that.

Ok, sounds like we're agreing on all this. And I think once your series
here has landed, Gerd could rebase his execbuf helpers on top and we can
see what color suits them to get them landed.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Ofc not everything above would need to be done right away, that's more
> > ideas for todo.rst entries to make sure we all agree on the rough
> > direction.
> > 
> > Thoughts?
> > 
> > Also adding Gerd Hoffmann, since he looked into this.
> > 
> > Cheers, Daniel
> > > ---
> > >   drivers/dma-buf/Makefile       |   2 +-
> > >   drivers/dma-buf/dma-resv-ctx.c | 108 +++++++++++++++++++++++++++++++++
> > >   include/linux/dma-resv-ctx.h   |  68 +++++++++++++++++++++
> > >   include/linux/dma-resv.h       |   1 +
> > >   4 files changed, 178 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/dma-buf/dma-resv-ctx.c
> > >   create mode 100644 include/linux/dma-resv-ctx.h
> > > 
> > > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > > index 03479da06422..da7701c85de2 100644
> > > --- a/drivers/dma-buf/Makefile
> > > +++ b/drivers/dma-buf/Makefile
> > > @@ -1,6 +1,6 @@
> > >   # SPDX-License-Identifier: GPL-2.0-only
> > >   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> > > -	 dma-resv.o seqno-fence.o
> > > +	 dma-resv.o dma-resv-ctx.o seqno-fence.o
> > >   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> > >   obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
> > >   obj-$(CONFIG_UDMABUF)		+= udmabuf.o
> > > diff --git a/drivers/dma-buf/dma-resv-ctx.c b/drivers/dma-buf/dma-resv-ctx.c
> > > new file mode 100644
> > > index 000000000000..cad10fa6f80b
> > > --- /dev/null
> > > +++ b/drivers/dma-buf/dma-resv-ctx.c
> > > @@ -0,0 +1,108 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright 2019 Advanced Micro Devices, Inc.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtaining a
> > > + * copy of this software and associated documentation files (the "Software"),
> > > + * to deal in the Software without restriction, including without limitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > > + * and/or sell copies of the Software, and to permit persons to whom the
> > > + * Software is furnished to do so, subject to the following conditions:
> > > + *
> > > + * The above copyright notice and this permission notice shall be included in
> > > + * all copies or substantial portions of the Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > + *
> > > + * Authors:
> > > + *	Christian König <christian.koenig@amd.com>
> > > + */
> > > +
> > > +#include <linux/dma-resv-ctx.h>
> > > +
> > > +/**
> > > + * dma_resv_ctx_init - initialize a reservation context
> > > + * @ctx: the context to initialize
> > > + *
> > > + * Start using this reservation context to lock reservation objects for update.
> > > + */
> > > +void dma_resv_ctx_init(struct dma_resv_ctx *ctx)
> > > +{
> > > +	ww_acquire_init(&ctx->base, &reservation_ww_class);
> > > +	init_llist_head(&ctx->locked);
> > > +	ctx->contended = NULL;
> > > +}
> > > +EXPORT_SYMBOL(dma_resv_ctx_init);
> > > +
> > > +/**
> > > + * dma_resv_ctx_unlock_all - unlock all reservation objects
> > > + * @ctx: the context which holds the reservation objects
> > > + *
> > > + * Unlocks all reservation objects locked with this context.
> > > + */
> > > +void dma_resv_ctx_unlock_all(struct dma_resv_ctx *ctx)
> > > +{
> > > +	struct dma_resv *obj, *next;
> > > +
> > > +	if (ctx->contended)
> > > +		dma_resv_unlock(ctx->contended);
> > > +	ctx->contended = NULL;
> > > +
> > > +	llist_for_each_entry_safe(obj, next, ctx->locked.first, locked)
> > > +		ww_mutex_unlock(&obj->lock);
> > > +	init_llist_head(&ctx->locked);
> > > +}
> > > +EXPORT_SYMBOL(dma_resv_ctx_unlock_all);
> > > +
> > > +/**
> > > + * dma_resv_ctx_lock - lock a reservation object with deadlock handling
> > > + * @ctx: the context which should be used to lock the object
> > > + * @obj: the object which needs to be locked
> > > + * @interruptible: if we should wait interruptible
> > > + *
> > > + * Use @ctx to lock the reservation object. If a deadlock is detected we backoff
> > > + * by releasing all locked objects and use the slow path to lock the reservation
> > > + * object. After successfully locking in the slow path -EDEADLK is returned to
> > > + * signal that all other locks must be re-taken as well.
> > > + */
> > > +int dma_resv_ctx_lock(struct dma_resv_ctx *ctx, struct dma_resv *obj,
> > > +		      bool interruptible)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	if (unlikely(ctx->contended == obj))
> > > +		ctx->contended = NULL;
> > > +	else if (interruptible)
> > > +		ret = dma_resv_lock_interruptible(obj, &ctx->base);
> > > +	else
> > > +		ret = dma_resv_lock(obj, &ctx->base);
> > > +
> > > +	if (likely(!ret)) {
> > > +		/* don't use llist_add here, we have separate locking */
> > > +		obj->locked.next = ctx->locked.first;
> > > +		ctx->locked.first = &obj->locked;
> > > +		return 0;
> > > +	}
> > > +	if (unlikely(ret != -EDEADLK))
> > > +		return ret;
> > > +
> > > +	dma_resv_ctx_unlock_all(ctx);
> > > +
> > > +	if (interruptible) {
> > > +		ret = dma_resv_lock_slow_interruptible(obj, &ctx->base);
> > > +		if (unlikely(ret))
> > > +			return ret;
> > > +	} else {
> > > +		dma_resv_lock_slow(obj, &ctx->base);
> > > +	}
> > > +
> > > +	ctx->contended = obj;
> > > +	return -EDEADLK;
> > > +}
> > > +EXPORT_SYMBOL(dma_resv_ctx_lock);
> > > diff --git a/include/linux/dma-resv-ctx.h b/include/linux/dma-resv-ctx.h
> > > new file mode 100644
> > > index 000000000000..86473de65167
> > > --- /dev/null
> > > +++ b/include/linux/dma-resv-ctx.h
> > > @@ -0,0 +1,68 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright 2019 Advanced Micro Devices, Inc.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtaining a
> > > + * copy of this software and associated documentation files (the "Software"),
> > > + * to deal in the Software without restriction, including without limitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > > + * and/or sell copies of the Software, and to permit persons to whom the
> > > + * Software is furnished to do so, subject to the following conditions:
> > > + *
> > > + * The above copyright notice and this permission notice shall be included in
> > > + * all copies or substantial portions of the Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > + *
> > > + * Authors:
> > > + *	Christian König <christian.koenig@amd.com>
> > > + */
> > > +
> > > +#ifndef _LINUX_DMA_RESV_CTX_H
> > > +#define _LINUX_DMA_RESV_CTX_H
> > > +
> > > +#include <linux/llist.h>
> > > +#include <linux/dma-resv.h>
> > > +
> > > +/**
> > > + * struct dma_resv_ctx - context to lock reservation objects
> > > + * @base: ww_acquire_ctx used for deadlock detection
> > > + * @locked: list of dma_resv objects locked in this context
> > > + * @contended: contended dma_resv object
> > > + */
> > > +struct dma_resv_ctx {
> > > +	struct ww_acquire_ctx base;
> > > +	struct llist_head locked;
> > > +	struct dma_resv *contended;
> > > +};
> > > +
> > > +/**
> > > + * dma_resv_ctx_done - wrapper for ww_acquire_done
> > > + * @ctx: the reservation context which is done with locking
> > > + */
> > > +static inline void dma_resv_ctx_done(struct dma_resv_ctx *ctx)
> > > +{
> > > +	ww_acquire_done(&ctx->base);
> > > +}
> > > +
> > > +/**
> > > + * dma_resv_ctx_fini - wrapper for ww_acquire_fini
> > > + * @ctx: the reservation context which is finished
> > > + */
> > > +static inline void dma_resv_ctx_fini(struct dma_resv_ctx *ctx)
> > > +{
> > > +	ww_acquire_fini(&ctx->base);
> > > +}
> > > +
> > > +void dma_resv_ctx_init(struct dma_resv_ctx *ctx);
> > > +void dma_resv_ctx_unlock_all(struct dma_resv_ctx *ctx);
> > > +int dma_resv_ctx_lock(struct dma_resv_ctx *ctx, struct dma_resv *obj,
> > > +		      bool interruptible);
> > > +
> > > +#endif /* _LINUX_DMA_RESV_CTX_H */
> > > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > > index ee50d10f052b..1267822c2669 100644
> > > --- a/include/linux/dma-resv.h
> > > +++ b/include/linux/dma-resv.h
> > > @@ -71,6 +71,7 @@ struct dma_resv_list {
> > >    */
> > >   struct dma_resv {
> > >   	struct ww_mutex lock;
> > > +	struct llist_node locked;
> > >   	seqcount_t seq;
> > >   	struct dma_fence __rcu *fence_excl;
> > > -- 
> > > 2.17.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
