Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93ADF161BB8
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 20:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgBQTie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 14:38:34 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41080 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgBQTie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 14:38:34 -0500
Received: by mail-ot1-f67.google.com with SMTP id r27so17173692otc.8
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 11:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I61ESAqvmsXBqM2Hj0FAxIDyP6wd3OVog0zMOhR3c0I=;
        b=ThcK6AZnQg5cQ/sewGkGPqdbV9R7hjfW1FoWnJ64RM2aqfKHxBw2iLOxe3bpGLvk1f
         YWAILoCPmYbWXpaykr5epIyw2IHTEuXerpTY1BNeyGeVPkGFXji6+kBplPS8yBs9c5WH
         viYf3KxAvHKLAtuKX+tbtBjN6DGoYDaLX395M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I61ESAqvmsXBqM2Hj0FAxIDyP6wd3OVog0zMOhR3c0I=;
        b=jV2iKXkEyWhGjOgFK4f1A3/anWnjXuWYdc2C8G+xG1/Np/FX9xu90xAe8xQYq0vid3
         IVTbNwRY7D6y8CFuccXfiYzxNyaIjvEJ+B33D2qJEdCpkk1Kk9QhFwERTvb6zSYwokHP
         /x2IGy607vtli5r1nYdolMknQ0ouhY6AwnvitqpcfuopsRV9olA1YNZlI4U3gfrJj1i7
         9xiFx5mbE34tdp2gtr/3ULPVAK6k+pdYH7PwHv5WNkft19DI9VG/x2PItBEE5yPkwlAY
         qtsRfwVpTYNPz5LO8ujpBqQXcEaOkZIv43eccxddCxILC38UrfcVEXM4Tm3mvsFxG2ap
         yZwA==
X-Gm-Message-State: APjAAAX/zjGgclWIQYK+zMsvzGKKPldEJOIiSVxu7sRxhvPFqo7CrC84
        zV/5Xt/Yoi66QuvPiEF111CrHG/9xMAPW56I3brsOuSn
X-Google-Smtp-Source: APXvYqxqRLWsf23M5SejvObaVt0QQRa/E9oJndC9A22+CmBO2L6qmEsWpp6Bc0ttDq5ry9M7nOuF0S41i9vGPiJ2pbw=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr14093098otq.281.1581968312843;
 Mon, 17 Feb 2020 11:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-6-christian.koenig@amd.com> <20200217175518.GL2363188@phenom.ffwll.local>
 <59995ab9-b74b-67c5-0090-f526788713b9@gmail.com>
In-Reply-To: <59995ab9-b74b-67c5-0090-f526788713b9@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 17 Feb 2020 20:38:21 +0100
Message-ID: <CAKMK7uEYSvbpXS3gNU3tN2yvnBbSNSCV_twQn7SWOV6zC+pdNQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 17, 2020 at 7:58 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 17.02.20 um 18:55 schrieb Daniel Vetter:
> > On Mon, Feb 17, 2020 at 04:45:09PM +0100, Christian K=C3=B6nig wrote:
> >> Implement the importer side of unpinned DMA-buf handling.
> >>
> >> v2: update page tables immediately
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66 +++++++++++++++++++=
+-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 ++
> >>   2 files changed, 71 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_dma_buf.c
> >> index 770baba621b3..48de7624d49c 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >> @@ -453,7 +453,71 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev,=
 struct dma_buf *dma_buf)
> >>      return ERR_PTR(ret);
> >>   }
> >>
> >> +/**
> >> + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
> >> + *
> >> + * @attach: the DMA-buf attachment
> >> + *
> >> + * Invalidate the DMA-buf attachment, making sure that the we re-crea=
te the
> >> + * mapping before the next use.
> >> + */
> >> +static void
> >> +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> >> +{
> >> +    struct drm_gem_object *obj =3D attach->importer_priv;
> >> +    struct ww_acquire_ctx *ticket =3D dma_resv_locking_ctx(obj->resv)=
;
> >> +    struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> >> +    struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
> >> +    struct ttm_operation_ctx ctx =3D { false, false };
> >> +    struct ttm_placement placement =3D {};
> >> +    struct amdgpu_vm_bo_base *bo_base;
> >> +    int r;
> >> +
> >> +    if (bo->tbo.mem.mem_type =3D=3D TTM_PL_SYSTEM)
> >> +            return;
> >> +
> >> +    r =3D ttm_bo_validate(&bo->tbo, &placement, &ctx);
> >> +    if (r) {
> >> +            DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", =
r);
> >> +            return;
> >> +    }
> >> +
> >> +    for (bo_base =3D bo->vm_bo; bo_base; bo_base =3D bo_base->next) {
> >> +            struct amdgpu_vm *vm =3D bo_base->vm;
> >> +            struct dma_resv *resv =3D vm->root.base.bo->tbo.base.resv=
;
> >> +
> >> +            if (ticket) {
> > Yeah so this is kinda why I've been a total pain about the exact semant=
ics
> > of the move_notify hook. I think we should flat-out require that import=
ers
> > _always_ have a ticket attach when they call this, and that they can co=
pe
> > with additional locks being taken (i.e. full EDEADLCK) handling.
>
> That is pretty much exactly my thinking as well.
>
> And is also the sole reason why I started looking into the ww_mutex
> cursor handling a while back (e.g. the initial version with the horrible
> macro hack).
>
> But this is really really hard to get right. So my thinking for now is
> to push this series upstream to at least unblock my ongoing P2P work.

Hm, but at least the move_notify stuff and the locking nightmare
around that feels rushed if we just push that. Otoh it's indeed
getting painful, and we'll probably have another few rounds of
headaches to sort this all out. What about a

config EXPERIMENTAL_DYNAMIC_DMA_BUF
    depends on BROKEN

Wrapped around the new ->move_notify hook, plus all relevant code?
That way you can land at least something, in-tree refactoring might
become easier with at least some example of what it needs to achieve.
But we're also not tricking anyone into believing that this is
production ready.

> > Simplest way to force that contract is to add a dummy 2nd ww_mutex lock=
 to
> > the dma_resv object, which we then can take #ifdef
> > CONFIG_WW_MUTEX_SLOWPATH_DEBUG. Plus mabye a WARN_ON(!ticket).
> >
> > Now the real disaster is how we handle deadlocks. Two issues:
> >
> > - Ideally we'd keep any lock we've taken locked until the end, it helps
> >    needless backoffs. I've played around a bit with that but not even p=
oc
> >    level, just an idea:
> >
> > https://cgit.freedesktop.org/~danvet/drm/commit/?id=3Db1799c5a0f02df9e1=
bb08d27be37331255ab7582
> >
> >    Idea is essentially to track a list of objects we had to lock as par=
t of
> >    the ttm_bo_validate of the main object.
> >
> > - Second one is if we get a EDEADLCK on one of these sublocks (like the
> >    one here). We need to pass that up the entire callchain, including a
> >    temporary reference (we have to drop locks to do the ww_mutex_lock_s=
low
> >    call), and need a custom callback to drop that temporary reference
> >    (since that's all driver specific, might even be internal ww_mutex a=
nd
> >    not anything remotely looking like a normal dma_buf). This probably
> >    needs the exec util helpers from ttm, but at the dma_resv level, so =
that
> >    we can do something like this:
> >
> > struct dma_resv_ticket {
> >       struct ww_acquire_ctx base;
> >
> >       /* can be set by anyone (including other drivers) that got hold o=
f
> >        * this ticket and had to acquire some new lock. This lock might
> >        * protect anything, including driver-internal stuff, and isn't
> >        * required to be a dma_buf or even just a dma_resv. */
> >       struct ww_mutex *contended_lock;
> >
> >       /* callback which the driver (which might be a dma-buf exporter
> >        * and not matching the driver that started this locking ticket)
> >        * sets together with @contended_lock, for the main driver to dro=
p
> >        * when it calls dma_resv_unlock on the contended_lock. */
> >       void (drop_ref*)(struct ww_mutex *contended_lock);
> > };
>
> My initial thinking was to make all of this part of the core ww_mutex
> implementation, but then I quickly found that this won't work.
>
> > This is all supremely nasty (also ttm_bo_validate would need to be
> > improved to handle these sublocks and random new objects that could for=
ce
> > a ww_mutex_lock_slow).
>
> The next idea was to have it based on dma_resv objects, but as you also
> figured out you then need to drop the reference to the contended lock
> somehow...
>
> So my current working plan was to use GEM object to avoid the callback...

I've heard noise that someone is looking into adding dynamic dma-buf
support to stuff like rdma drivers. Because interconnects and big
machines. Plus feels a bit awkward to mandate a gem library if you
want to use dynamic dma-buf support in your driver. Hence why I think
something around dma_resv (but with enough flexibility that it doesn't
insist that the contending lock must be a dma_resv itself).

> > Plan B would be to throw our hands into and declare that "move_notify i=
s
> > best effort only and can fail for any reason". Exactly like ttm evictio=
n
> > currently does, even with all your hacks to do at least some dma_resv_l=
ock
> > (but not the full slowpath).
>
> I would seriously NAK that. We have tried that with TTM and the whole
> idea is just braindead.
>
> You can use trylock based eviction for things like best effort shrinker
> callbacks. But that's pretty much it.

Yeah trylock works pretty well for balancing caches, right up to the
point where you actually have to shrink stuff. Then suddenly all the
locks are contended because everyone is running low on memory :-/ We
have glorious amounts of experience with our best effort system memory
shrinker in i915 ...

> > Given how much "fun" you have with all the low memory handling and ttm
> > fundamentally being best-effort only (despite that dma_resv would allow=
 us
> > to do this right, with some work) I'm not sure that's a good idea to
> > extend to a cross-driver interface. Personally I'd lean towards fixing
> > this first fully (in ttm/amdgpu), and then using that to implement
> > move_notify correctly.
>
> Well have you seen this: https://fosdem.org/2020/schedule/event/ttm/ :)

Oh cool, I was waiting for the upload. Will watch asap. btw slides somewher=
e?

> > Or just add an int return value here and mandate that importers must
> > handle eviction failures. Exactly like ttm_mem_evict_first can currentl=
y
> > still fail for various reasons.
> >
> > (Sorry this isn't exactly the mail you hoped for)
>
> Well it's actually the mail I expected. I'm thinking about exactly those
> problems for over a year now as well.
>
> For the rather specific amdgpu case I could work around that by
> utilizing the HMM work to invalidate page tables on the fly, but that
> doesn't really help with memory management in general.

Yeah, so move_notify is maybe solveable with better hw and hmm, but
there's other scenarios where I think the cross-driver ww_mutex
locking will be needed, for fundamental reasons. Scenario:
- a bunch of gpus in pcie slots, all in the same machine
- because pcie is slot a nice interconnect (iirc you guys call yours
xgmi or something like that)
- working sets that are bigger than vram of a single gpu
- lots of buffer sharing ofc

1. So driver has an imported dma-buf, currently not mapped anywhere
because ti got thrown out (or first use).
2. Importer calls dma_buf_map_attachement
3. Exporter realizes there's a nice xgmi link and p2p would be much
better if that object is in vram.
4. Exporter does ttm_bo_validate or equivalent to get the bo into
vram, including eviction and lots of locking
5. In turn this might bite back to the importer through some
move_notify of objects still mapped, but at the end of the lru.

So ->move_notify might not be the worst, eventually I think we'll need
the full locking dance across drivers (or at least across drm_device
instances, there might be internal upcasting going on so you get your
buffers placed in the right vram and all that directly).

> So YES, I totally agree that we need some sort of GEM execution context
> or something like this to lock buffers on the fly as we try to make room
> for others.

So what's the plan? Merge current series (with the bikesheds address)
under this CONFIG_EXPERIMENTAL_DYN_DMABUF and then see where we land
from there? Trying to get all the pieces lined up out of tree feels
like it's going to be too much :-/
-Daniel

>
> Regards,
> Christian.
>
> >
> > Cheers, Daniel
> >
> >> +                    /* When we get an error here it means that somebo=
dy
> >> +                     * else is holding the VM lock and updating page =
tables
> >> +                     * So we can just continue here.
> >> +                     */
> >> +                    r =3D dma_resv_lock(resv, ticket);
> >> +                    if (r)
> >> +                            continue;
> >> +
> >> +            } else {
> >> +                    /* TODO: This is more problematic and we actually=
 need
> >> +                     * to allow page tables updates without holding t=
he
> >> +                     * lock.
> >> +                     */
> >> +                    if (!dma_resv_trylock(resv))
> >> +                            continue;
> >> +            }
> >> +
> >> +            r =3D amdgpu_vm_clear_freed(adev, vm, NULL);
> >> +            if (!r)
> >> +                    r =3D amdgpu_vm_handle_moved(adev, vm);
> >> +
> >> +            if (r && r !=3D -EBUSY)
> >> +                    DRM_ERROR("Failed to invalidate VM page tables (%=
d))\n",
> >> +                              r);
> >> +
> >> +            dma_resv_unlock(resv);
> >> +    }
> >> +}
> >> +
> >>   static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops =3D=
 {
> >> +    .move_notify =3D amdgpu_dma_buf_move_notify
> >>   };
> >>
> >>   /**
> >> @@ -489,7 +553,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(str=
uct drm_device *dev,
> >>              return obj;
> >>
> >>      attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> >> -                                    &amdgpu_dma_buf_attach_ops, NULL)=
;
> >> +                                    &amdgpu_dma_buf_attach_ops, obj);
> >>      if (IS_ERR(attach)) {
> >>              drm_gem_object_put(obj);
> >>              return ERR_CAST(attach);
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_object.c
> >> index 8ae260822908..8c480c898b0d 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> @@ -926,6 +926,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo,=
 u32 domain,
> >>              return 0;
> >>      }
> >>
> >> +    if (bo->tbo.base.import_attach)
> >> +            dma_buf_pin(bo->tbo.base.import_attach);
> >> +
> >>      bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
> >>      /* force to pin into visible video ram */
> >>      if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
> >> @@ -1009,6 +1012,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
> >>
> >>      amdgpu_bo_subtract_pin_size(bo);
> >>
> >> +    if (bo->tbo.base.import_attach)
> >> +            dma_buf_unpin(bo->tbo.base.import_attach);
> >> +
> >>      for (i =3D 0; i < bo->placement.num_placement; i++) {
> >>              bo->placements[i].lpfn =3D 0;
> >>              bo->placements[i].flags &=3D ~TTM_PL_FLAG_NO_EVICT;
> >> --
> >> 2.17.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
