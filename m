Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9E5E166800
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 21:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgBTUIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 15:08:38 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36620 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbgBTUIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 15:08:38 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so3425966wma.1
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2020 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2R18gBeefFDn7PhQhknKi2vA9kbrotIjLif/qMcqs1E=;
        b=h3wrZuko9Z0tTphiCEiKhJPLboZaaQRDdNxpmVETaXXtKEG0b7kbi69nm2E1knuBJI
         xzF9/0ZvXNIGPQ977lECZ66IsQk9daQ/FLkh9FnXdliVRkxmMC5d+0qoyIkWlKSEIhpt
         5Ix1QXcNNVOO6ihpCy24vAC58abKim0ReeSWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2R18gBeefFDn7PhQhknKi2vA9kbrotIjLif/qMcqs1E=;
        b=iX0iXQ/Di7PvdDn/WDEkYI8NT0WEezaBrkTCnfXwuf7t1z3nwdBPlZycngTvEFfTut
         kHLOeO3sBeBXySVz258gDIGy021m1mycoIpupBamPRmg9uuWzdmmeLVRB5qdFwtNHJ96
         EWHpwlckqSLuq5/FVN308/QP91eaJR2PZ925QoFvQ1tjgT2OMfLGE23wD3+ap+RepURT
         zGt0DrUt1wjhsPGj519bSlxAIFNOgZNM/FDgNthEeGnqc1tBPtpDx4VNW7d7F2pJwBUk
         j25aaZPxrVwwPFe/EzIHFrH5JDiZfQtGPopWD89i7O998veqdwsobn+54tctR0c7esWT
         Chng==
X-Gm-Message-State: APjAAAUsCB+vFENOp+2xSkrh7K/p5Q6OGCSN+ZRhjY22h6J6t8nBglJK
        DPLNioVq8AUpw19RZ7rd+Jz8Cg==
X-Google-Smtp-Source: APXvYqzSYcm1ZL8tLYGM+DG6teDYZMDC4wcfWZfvx5SIT6ZlUvTamimJE2dpMpEsZAk0tq7rC6BiqA==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr6648607wmg.16.1582229314153;
        Thu, 20 Feb 2020 12:08:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g19sm485097wmh.36.2020.02.20.12.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 12:08:33 -0800 (PST)
Date:   Thu, 20 Feb 2020 21:08:31 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
Message-ID: <20200220200831.GA2363188@phenom.ffwll.local>
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 20, 2020 at 08:46:27PM +0100, Thomas Hellström (VMware) wrote:
> On 2/20/20 7:04 PM, Daniel Vetter wrote:
> > On Thu, Feb 20, 2020 at 10:39:06AM +0100, Thomas Hellström (VMware) wrote:
> > > On 2/19/20 7:42 AM, Thomas Hellström (VMware) wrote:
> > > > On 2/18/20 10:01 PM, Daniel Vetter wrote:
> > > > > On Tue, Feb 18, 2020 at 9:17 PM Thomas Hellström (VMware)
> > > > > <thomas_os@shipmail.org> wrote:
> > > > > > On 2/17/20 6:55 PM, Daniel Vetter wrote:
> > > > > > > On Mon, Feb 17, 2020 at 04:45:09PM +0100, Christian König wrote:
> > > > > > > > Implement the importer side of unpinned DMA-buf handling.
> > > > > > > > 
> > > > > > > > v2: update page tables immediately
> > > > > > > > 
> > > > > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > > > > ---
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66
> > > > > > > > ++++++++++++++++++++-
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 ++
> > > > > > > >     2 files changed, 71 insertions(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > > > index 770baba621b3..48de7624d49c 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > > > @@ -453,7 +453,71 @@ amdgpu_dma_buf_create_obj(struct
> > > > > > > > drm_device *dev, struct dma_buf *dma_buf)
> > > > > > > >        return ERR_PTR(ret);
> > > > > > > >     }
> > > > > > > > 
> > > > > > > > +/**
> > > > > > > > + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
> > > > > > > > + *
> > > > > > > > + * @attach: the DMA-buf attachment
> > > > > > > > + *
> > > > > > > > + * Invalidate the DMA-buf attachment, making sure that
> > > > > > > > the we re-create the
> > > > > > > > + * mapping before the next use.
> > > > > > > > + */
> > > > > > > > +static void
> > > > > > > > +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> > > > > > > > +{
> > > > > > > > +    struct drm_gem_object *obj = attach->importer_priv;
> > > > > > > > +    struct ww_acquire_ctx *ticket = dma_resv_locking_ctx(obj->resv);
> > > > > > > > +    struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> > > > > > > > +    struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> > > > > > > > +    struct ttm_operation_ctx ctx = { false, false };
> > > > > > > > +    struct ttm_placement placement = {};
> > > > > > > > +    struct amdgpu_vm_bo_base *bo_base;
> > > > > > > > +    int r;
> > > > > > > > +
> > > > > > > > +    if (bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
> > > > > > > > +            return;
> > > > > > > > +
> > > > > > > > +    r = ttm_bo_validate(&bo->tbo, &placement, &ctx);
> > > > > > > > +    if (r) {
> > > > > > > > +            DRM_ERROR("Failed to invalidate DMA-buf
> > > > > > > > import (%d))\n", r);
> > > > > > > > +            return;
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > > +    for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
> > > > > > > > +            struct amdgpu_vm *vm = bo_base->vm;
> > > > > > > > +            struct dma_resv *resv = vm->root.base.bo->tbo.base.resv;
> > > > > > > > +
> > > > > > > > +            if (ticket) {
> > > > > > > Yeah so this is kinda why I've been a total pain about the
> > > > > > > exact semantics
> > > > > > > of the move_notify hook. I think we should flat-out require
> > > > > > > that importers
> > > > > > > _always_ have a ticket attach when they call this, and that
> > > > > > > they can cope
> > > > > > > with additional locks being taken (i.e. full EDEADLCK) handling.
> > > > > > > 
> > > > > > > Simplest way to force that contract is to add a dummy 2nd
> > > > > > > ww_mutex lock to
> > > > > > > the dma_resv object, which we then can take #ifdef
> > > > > > > CONFIG_WW_MUTEX_SLOWPATH_DEBUG. Plus mabye a WARN_ON(!ticket).
> > > > > > > 
> > > > > > > Now the real disaster is how we handle deadlocks. Two issues:
> > > > > > > 
> > > > > > > - Ideally we'd keep any lock we've taken locked until the
> > > > > > > end, it helps
> > > > > > >      needless backoffs. I've played around a bit with that
> > > > > > > but not even poc
> > > > > > >      level, just an idea:
> > > > > > > 
> > > > > > > https://cgit.freedesktop.org/~danvet/drm/commit/?id=b1799c5a0f02df9e1bb08d27be37331255ab7582
> > > > > > > 
> > > > > > > 
> > > > > > >      Idea is essentially to track a list of objects we had to
> > > > > > > lock as part of
> > > > > > >      the ttm_bo_validate of the main object.
> > > > > > > 
> > > > > > > - Second one is if we get a EDEADLCK on one of these
> > > > > > > sublocks (like the
> > > > > > >      one here). We need to pass that up the entire callchain,
> > > > > > > including a
> > > > > > >      temporary reference (we have to drop locks to do the
> > > > > > > ww_mutex_lock_slow
> > > > > > >      call), and need a custom callback to drop that temporary reference
> > > > > > >      (since that's all driver specific, might even be
> > > > > > > internal ww_mutex and
> > > > > > >      not anything remotely looking like a normal dma_buf).
> > > > > > > This probably
> > > > > > >      needs the exec util helpers from ttm, but at the
> > > > > > > dma_resv level, so that
> > > > > > >      we can do something like this:
> > > > > > > 
> > > > > > > struct dma_resv_ticket {
> > > > > > >         struct ww_acquire_ctx base;
> > > > > > > 
> > > > > > >         /* can be set by anyone (including other drivers)
> > > > > > > that got hold of
> > > > > > >          * this ticket and had to acquire some new lock. This
> > > > > > > lock might
> > > > > > >          * protect anything, including driver-internal stuff, and isn't
> > > > > > >          * required to be a dma_buf or even just a dma_resv. */
> > > > > > >         struct ww_mutex *contended_lock;
> > > > > > > 
> > > > > > >         /* callback which the driver (which might be a dma-buf exporter
> > > > > > >          * and not matching the driver that started this
> > > > > > > locking ticket)
> > > > > > >          * sets together with @contended_lock, for the main
> > > > > > > driver to drop
> > > > > > >          * when it calls dma_resv_unlock on the contended_lock. */
> > > > > > >         void (drop_ref*)(struct ww_mutex *contended_lock);
> > > > > > > };
> > > > > > > 
> > > > > > > This is all supremely nasty (also ttm_bo_validate would need to be
> > > > > > > improved to handle these sublocks and random new objects
> > > > > > > that could force
> > > > > > > a ww_mutex_lock_slow).
> > > > > > > 
> > > > > > Just a short comment on this:
> > > > > > 
> > > > > > Neither the currently used wait-die or the wound-wait algorithm
> > > > > > *strictly* requires a slow lock on the contended lock. For
> > > > > > wait-die it's
> > > > > > just very convenient since it makes us sleep instead of spinning with
> > > > > > -EDEADLK on the contended lock. For wound-wait IIRC one could just
> > > > > > immediately restart the whole locking transaction after an
> > > > > > -EDEADLK, and
> > > > > > the transaction would automatically end up waiting on the contended
> > > > > > lock, provided the mutex lock stealing is not allowed. There is however
> > > > > > a possibility that the transaction will be wounded again on another
> > > > > > lock, taken before the contended lock, but I think there are ways to
> > > > > > improve the wound-wait algorithm to reduce that probability.
> > > > > > 
> > > > > > So in short, choosing the wound-wait algorithm instead of wait-die and
> > > > > > perhaps modifying the ww mutex code somewhat would probably help
> > > > > > passing
> > > > > > an -EDEADLK up the call chain without requiring passing the contended
> > > > > > lock, as long as each locker releases its own locks when receiving an
> > > > > > -EDEADLK.
> > > > > Hm this is kinda tempting, since rolling out the full backoff tricker
> > > > > across driver boundaries is going to be real painful.
> > > > > 
> > > > > What I'm kinda worried about is the debug/validation checks we're
> > > > > losing with this. The required backoff has this nice property that
> > > > > ww_mutex debug code can check that we've fully unwound everything when
> > > > > we should, that we've blocked on the right lock, and that we're
> > > > > restarting everything without keeling over. Without that I think we
> > > > > could end up with situations where a driver in the middle feels like
> > > > > handling the EDEADLCK, which might go well most of the times (the
> > > > > deadlock will probably be mostly within a given driver, not across).
> > > > > Right up to the point where someone creates a deadlock across drivers,
> > > > > and the lack of full rollback will be felt.
> > > > > 
> > > > > So not sure whether we can still keep all these debug/validation
> > > > > checks, or whether this is a step too far towards clever tricks.
> > > > I think we could definitely find a way to keep debugging to make sure
> > > > everything is unwound before attempting to restart the locking
> > > > transaction. But the debug check that we're restarting on the contended
> > > > lock only really makes sense for wait-die, (and we could easily keep it
> > > > for wait-die). The lock returning -EDEADLK for wound-wait may actually
> > > > not be the contending lock but an arbitrary lock that the wounded
> > > > transaction attempts to take after it is wounded.
> > > > 
> > > > So in the end IMO this is a tradeoff between added (possibly severe)
> > > > locking complexity into dma-buf and not being able to switch back to
> > > > wait-die efficiently if we need / want to do that.
> > > > 
> > > > /Thomas
> > > And as a consequence an interface *could* be:
> > > 
> > > *) We introduce functions
> > > 
> > > void ww_acquire_relax(struct ww_acquire_ctx *ctx);
> > > int ww_acquire_relax_interruptible(struct ww_acquire_ctx *ctx);
> > > 
> > > that can be used instead of ww_mutex_lock_slow() in the absence of a
> > > contending lock to avoid spinning on -EDEADLK. While trying to take the
> > > contending lock is probably the best choice there are various second best
> > > approaches that can be explored, for example waiting on the contending
> > > acquire to finish or in the wound-wait case, perhaps do nothing. These
> > > functions will also help us keep the debugging.
> > Hm ... I guess this could work. Trouble is, it only gets rid of the
> > slowpath locking book-keeping headaches, we still have quite a few others.
> > 
> > > *) A function returning -EDEADLK to a caller *must* have already released
> > > its own locks.
> > So this ties to another question, as in should these callbacks have to
> > drops the locks thei acquire (much simpler code) or not (less thrashing,
> > if we drop locks we might end up in a situation where threads thrash
> > around instead of realizing quicker that they're actually deadlocking and
> > one of them should stop and back off).
> 
> Hmm.. Could you describe such a thrashing case with an example?

Ignoring cross device fun and all that, just a simplified example of why
holding onto locks you've acquired for eviction is useful, at least in a
slow path.

- one thread trying to do an execbuf with a huge bo

vs.

- an entire pile of thread that try to do execbuf with just a few small bo

First thread is in the eviction loop, selects a bo, wins against all the
other thread since it's been doing this forever already, gets the bo moved
out, unlocks.

Since it's competing against lots of other threads with small bo, it'll
have to do that a lot of times. Often enough to create a contiguous hole.
If you have a smarter allocator that tries to create that hole more
actively, just assume that the single huge bo is a substantial part of
total vram.

The other threads will be quicker in cramming new stuff in, even if they
occasionally lose the ww dance against the single thread. So the big
thread livelocks.

If otoh the big thread would keep onto all the locks, eventually it have
the entire vram locked, and every other thread is guaranteed to lose
against it in the ww dance and queue up behind. And it could finally but
its huge bo into vram and execute.

Vary example for multi-gpu and more realism, but that's roughly it.

Aside, a lot of the stuff Christian has been doing in ttm is to improve
the chances that the competing threads will hit one of the locked objects
of the big thread, and at least back off a bit. That's at least my
understanding of what's been happening.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
