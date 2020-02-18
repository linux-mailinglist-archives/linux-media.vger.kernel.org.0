Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA1391633B2
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 22:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgBRVCN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 16:02:13 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39367 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRVCN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 16:02:13 -0500
Received: by mail-ot1-f68.google.com with SMTP id 77so20940414oty.6
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2020 13:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZXs0b63mL3PZU3asUslVXAsl1NCi/HJnnFlsyDDuhtw=;
        b=L02WlHVAhGUr4B0ox/7T8GH9MkzLT1iXKAqvfqpdW1hDAuMjyQZXcWPSV7707M8F+8
         fmnnXHyk+jb+U6va3g59aqkCWMYXoxuz+LDDZHE9QJWHmRv2y6h2XXiZ5EoqN/dH0pH9
         U875WAdlIbq3FeLfdJHP6PK8FXLDYxhSj8Lg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZXs0b63mL3PZU3asUslVXAsl1NCi/HJnnFlsyDDuhtw=;
        b=me/sQJDarMn0LyL9ctka6lRg1FF5vbSrLA+UYlVDTg9SG6QEDnerAK63r/3iXDd2IW
         bzUA8q0OaDLr5EcgKrueGhgnMCPoW9D2lSRCeUtpUCtL3aoNsEVcnUIwoorTVX7btgjK
         Oig47AU7Iyn1KvD4AAFv932G6VugfTWYEteYgeDt/9b9ln/ObilaLNceG73cYpMxm/yG
         ch9PmimXHGgWSTV8C5PtadpAIwCKWryoW7tjULG7BAsoRbK87pICAyij/QihfZYNS6YD
         Ju+Wj5ZC5+rnTvml6JRiNsf0RCt5Mh4Ikp6f4hjUMaP1AaNaKo0CZ2Y4uAvWRG8tMpUI
         CM8A==
X-Gm-Message-State: APjAAAXhrg41ZULTKrdJpEgHTiC8kq5fVirBCjWrRpuSyBvz0e8gzt7W
        BjpnF/O5v1Ng9N1ofNT6V28BF59ElauUe+EFea4/EA==
X-Google-Smtp-Source: APXvYqwSIRugn5Q8ZXDH39L8k+jG3tHLH5jVNIZFWNkCp0Ghr1mzJywd56UCCZpznd8/pyn+Gcq5nyAakAGLhgQnkPk=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr18233743otl.188.1582059730239;
 Tue, 18 Feb 2020 13:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-6-christian.koenig@amd.com> <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
In-Reply-To: <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 18 Feb 2020 22:01:58 +0100
Message-ID: <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 18, 2020 at 9:17 PM Thomas Hellstr=C3=B6m (VMware)
<thomas_os@shipmail.org> wrote:
>
> On 2/17/20 6:55 PM, Daniel Vetter wrote:
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
> >
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
> >
> > This is all supremely nasty (also ttm_bo_validate would need to be
> > improved to handle these sublocks and random new objects that could for=
ce
> > a ww_mutex_lock_slow).
> >
> Just a short comment on this:
>
> Neither the currently used wait-die or the wound-wait algorithm
> *strictly* requires a slow lock on the contended lock. For wait-die it's
> just very convenient since it makes us sleep instead of spinning with
> -EDEADLK on the contended lock. For wound-wait IIRC one could just
> immediately restart the whole locking transaction after an -EDEADLK, and
> the transaction would automatically end up waiting on the contended
> lock, provided the mutex lock stealing is not allowed. There is however
> a possibility that the transaction will be wounded again on another
> lock, taken before the contended lock, but I think there are ways to
> improve the wound-wait algorithm to reduce that probability.
>
> So in short, choosing the wound-wait algorithm instead of wait-die and
> perhaps modifying the ww mutex code somewhat would probably help passing
> an -EDEADLK up the call chain without requiring passing the contended
> lock, as long as each locker releases its own locks when receiving an
> -EDEADLK.

Hm this is kinda tempting, since rolling out the full backoff tricker
across driver boundaries is going to be real painful.

What I'm kinda worried about is the debug/validation checks we're
losing with this. The required backoff has this nice property that
ww_mutex debug code can check that we've fully unwound everything when
we should, that we've blocked on the right lock, and that we're
restarting everything without keeling over. Without that I think we
could end up with situations where a driver in the middle feels like
handling the EDEADLCK, which might go well most of the times (the
deadlock will probably be mostly within a given driver, not across).
Right up to the point where someone creates a deadlock across drivers,
and the lack of full rollback will be felt.

So not sure whether we can still keep all these debug/validation
checks, or whether this is a step too far towards clever tricks.

But definitely a neat idea ...
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
