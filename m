Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2E73BE716
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 13:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhGGL3a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 07:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbhGGL3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 07:29:30 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC6BC061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 04:26:50 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id z18-20020a9d7a520000b02904b28bda1885so413114otm.7
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 04:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jcSjBfaiu3twifvMjOLwr3lER8+MJ4OJvgdqFOc7u3Q=;
        b=XY2nYSOxjEBjINEtvN0nUkC5iL8CR9/PEShuRalRalyz6qDEsOP2c7bP94D/CGuhI5
         g0b30C4B64wyYYJ8tIh32U+MRH0ZOSAQI9mWaYfVEETBFBlI9BjJIfJSzLsFtpfirRBA
         RbyR2DxBvyo4DTQw/PEvOCCUip4mzhbJg61Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jcSjBfaiu3twifvMjOLwr3lER8+MJ4OJvgdqFOc7u3Q=;
        b=Ald1/tbmDaq4wvTEz4NjN3HEyzVkcNKSRrTuGpxSza63IqYqKmrkOXOME9BDOI5qjP
         BzCOhf6V+GX/1L/zJJxfDbJoPo16S7Yc7TPnvf7tzNKfuxRLDqy226jtiPzllFXSS0fi
         o/b6bllLviLQFIW/Q9elb50RmOzJOsQpeT31Z6yQMmuR4aEp6Kx0wk1nZvA3SExXUH4H
         1tS+oU4qcGF1WV95oip2ViovBAnDVD8RFhbav/hIokHGXs1IvJAd+XUp6dIWYk5smQWH
         aMS9T6T+JEx0QGu9RGszh/WPYEkDrvVXPyknNeoKe9hJOjqSarzUDpWztMDW2darSs5H
         GHGw==
X-Gm-Message-State: AOAM530XyXtxABjB9kT2anoRJ05nyLkVd3G4Rt4CuOrs77zyc/dyQ16g
        vN3XveHA0WwPGrjEfg1Y6nzQ3Jplw+LGm8IO7VvCCQ==
X-Google-Smtp-Source: ABdhPJyNgJFNofGkXrmeybkWO+4qnzCZoW903Z1oPPX4NrBQMFiHBo/J0/j8g3g/k6zOnEtRQOUdHbviXyYTmlQmITY=
X-Received: by 2002:a05:6830:1f19:: with SMTP id u25mr15628162otg.303.1625657209545;
 Wed, 07 Jul 2021 04:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-9-daniel.vetter@ffwll.ch> <006dc4538e906b548eac0acfaf62211b83de4927.camel@pengutronix.de>
In-Reply-To: <006dc4538e906b548eac0acfaf62211b83de4927.camel@pengutronix.de>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Jul 2021 13:26:38 +0200
Message-ID: <CAKMK7uEwszSpcdk2BSasOD-9gpnm=UhKR8-K40zQCCLSyk=Q_Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] drm/etnaviv: Use scheduler dependency handling
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 7, 2021 at 11:08 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> Am Freitag, dem 02.07.2021 um 23:38 +0200 schrieb Daniel Vetter:
> > We need to pull the drm_sched_job_init much earlier, but that's very
> > minor surgery.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: etnaviv@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  5 +-
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 32 +++++-----
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 61 +-------------------
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
> >  4 files changed, 20 insertions(+), 81 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/et=
naviv/etnaviv_gem.h
> > index 98e60df882b6..63688e6e4580 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> > @@ -80,9 +80,6 @@ struct etnaviv_gem_submit_bo {
> >       u64 va;
> >       struct etnaviv_gem_object *obj;
> >       struct etnaviv_vram_mapping *mapping;
> > -     struct dma_fence *excl;
> > -     unsigned int nr_shared;
> > -     struct dma_fence **shared;
> >  };
> >
> >  /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
> > @@ -95,7 +92,7 @@ struct etnaviv_gem_submit {
> >       struct etnaviv_file_private *ctx;
> >       struct etnaviv_gpu *gpu;
> >       struct etnaviv_iommu_context *mmu_context, *prev_mmu_context;
> > -     struct dma_fence *out_fence, *in_fence;
> > +     struct dma_fence *out_fence;
> >       int out_fence_id;
> >       struct list_head node; /* GPU active submit list */
> >       struct etnaviv_cmdbuf cmdbuf;
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu=
/drm/etnaviv/etnaviv_gem_submit.c
> > index 4dd7d9d541c0..92478a50a580 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > @@ -188,16 +188,10 @@ static int submit_fence_sync(struct etnaviv_gem_s=
ubmit *submit)
> >               if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
> >                       continue;
> >
> > -             if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
> > -                     ret =3D dma_resv_get_fences(robj, &bo->excl,
> > -                                               &bo->nr_shared,
> > -                                               &bo->shared);
> > -                     if (ret)
> > -                             return ret;
> > -             } else {
> > -                     bo->excl =3D dma_resv_get_excl_unlocked(robj);
> > -             }
> > -
> > +             ret =3D drm_sched_job_await_implicit(&submit->sched_job, =
&bo->obj->base,
> > +                                                bo->flags & ETNA_SUBMI=
T_BO_WRITE);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> >       return ret;
> > @@ -403,8 +397,6 @@ static void submit_cleanup(struct kref *kref)
> >
> >       wake_up_all(&submit->gpu->fence_event);
> >
> > -     if (submit->in_fence)
> > -             dma_fence_put(submit->in_fence);
> >       if (submit->out_fence) {
> >               /* first remove from IDR, so fence can not be found anymo=
re */
> >               mutex_lock(&submit->gpu->fence_lock);
> > @@ -537,6 +529,12 @@ int etnaviv_ioctl_gem_submit(struct drm_device *de=
v, void *data,
> >       submit->exec_state =3D args->exec_state;
> >       submit->flags =3D args->flags;
> >
> > +     ret =3D drm_sched_job_init(&submit->sched_job,
> > +                              &ctx->sched_entity[args->pipe],
> > +                              submit->ctx);
> > +     if (ret)
> > +             goto err_submit_objects;
> > +
>
> With the init moved here you also need to move the
> drm_sched_job_cleanup call from etnaviv_sched_free_job into
> submit_cleanup to avoid the potential memory leak when we bail out
> before pushing the job to the scheduler.

Uh apologies for missing this again, the entire point of v2 was to fix
this across all drivers. But somehow the fixup for etnaviv got lost.
I'll do it now for v3.

Thanks, Daniel

>
> Regards,
> Lucas
>
> >       ret =3D submit_lookup_objects(submit, file, bos, args->nr_bos);
> >       if (ret)
> >               goto err_submit_objects;
> > @@ -549,11 +547,15 @@ int etnaviv_ioctl_gem_submit(struct drm_device *d=
ev, void *data,
> >       }
> >
> >       if (args->flags & ETNA_SUBMIT_FENCE_FD_IN) {
> > -             submit->in_fence =3D sync_file_get_fence(args->fence_fd);
> > -             if (!submit->in_fence) {
> > +             struct dma_fence *in_fence =3D sync_file_get_fence(args->=
fence_fd);
> > +             if (!in_fence) {
> >                       ret =3D -EINVAL;
> >                       goto err_submit_objects;
> >               }
> > +
> > +             ret =3D drm_sched_job_await_fence(&submit->sched_job, in_=
fence);
> > +             if (ret)
> > +                     goto err_submit_objects;
> >       }
> >
> >       ret =3D submit_pin_objects(submit);
> > @@ -579,7 +581,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev=
, void *data,
> >       if (ret)
> >               goto err_submit_objects;
> >
> > -     ret =3D etnaviv_sched_push_job(&ctx->sched_entity[args->pipe], su=
bmit);
> > +     ret =3D etnaviv_sched_push_job(submit);
> >       if (ret)
> >               goto err_submit_objects;
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/=
etnaviv/etnaviv_sched.c
> > index 180bb633d5c5..c98d67320be3 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -17,58 +17,6 @@ module_param_named(job_hang_limit, etnaviv_job_hang_=
limit, int , 0444);
> >  static int etnaviv_hw_jobs_limit =3D 4;
> >  module_param_named(hw_job_limit, etnaviv_hw_jobs_limit, int , 0444);
> >
> > -static struct dma_fence *
> > -etnaviv_sched_dependency(struct drm_sched_job *sched_job,
> > -                      struct drm_sched_entity *entity)
> > -{
> > -     struct etnaviv_gem_submit *submit =3D to_etnaviv_submit(sched_job=
);
> > -     struct dma_fence *fence;
> > -     int i;
> > -
> > -     if (unlikely(submit->in_fence)) {
> > -             fence =3D submit->in_fence;
> > -             submit->in_fence =3D NULL;
> > -
> > -             if (!dma_fence_is_signaled(fence))
> > -                     return fence;
> > -
> > -             dma_fence_put(fence);
> > -     }
> > -
> > -     for (i =3D 0; i < submit->nr_bos; i++) {
> > -             struct etnaviv_gem_submit_bo *bo =3D &submit->bos[i];
> > -             int j;
> > -
> > -             if (bo->excl) {
> > -                     fence =3D bo->excl;
> > -                     bo->excl =3D NULL;
> > -
> > -                     if (!dma_fence_is_signaled(fence))
> > -                             return fence;
> > -
> > -                     dma_fence_put(fence);
> > -             }
> > -
> > -             for (j =3D 0; j < bo->nr_shared; j++) {
> > -                     if (!bo->shared[j])
> > -                             continue;
> > -
> > -                     fence =3D bo->shared[j];
> > -                     bo->shared[j] =3D NULL;
> > -
> > -                     if (!dma_fence_is_signaled(fence))
> > -                             return fence;
> > -
> > -                     dma_fence_put(fence);
> > -             }
> > -             kfree(bo->shared);
> > -             bo->nr_shared =3D 0;
> > -             bo->shared =3D NULL;
> > -     }
> > -
> > -     return NULL;
> > -}
> > -
> >  static struct dma_fence *etnaviv_sched_run_job(struct drm_sched_job *s=
ched_job)
> >  {
> >       struct etnaviv_gem_submit *submit =3D to_etnaviv_submit(sched_job=
);
> > @@ -140,14 +88,12 @@ static void etnaviv_sched_free_job(struct drm_sche=
d_job *sched_job)
> >  }
> >
> >  static const struct drm_sched_backend_ops etnaviv_sched_ops =3D {
> > -     .dependency =3D etnaviv_sched_dependency,
> >       .run_job =3D etnaviv_sched_run_job,
> >       .timedout_job =3D etnaviv_sched_timedout_job,
> >       .free_job =3D etnaviv_sched_free_job,
> >  };
> >
> > -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> > -                        struct etnaviv_gem_submit *submit)
> > +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
> >  {
> >       int ret =3D 0;
> >
> > @@ -158,11 +104,6 @@ int etnaviv_sched_push_job(struct drm_sched_entity=
 *sched_entity,
> >        */
> >       mutex_lock(&submit->gpu->fence_lock);
> >
> > -     ret =3D drm_sched_job_init(&submit->sched_job, sched_entity,
> > -                              submit->ctx);
> > -     if (ret)
> > -             goto out_unlock;
> > -
> >       drm_sched_job_arm(&submit->sched_job);
> >
> >       submit->out_fence =3D dma_fence_get(&submit->sched_job.s_fence->f=
inished);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.h b/drivers/gpu/drm/=
etnaviv/etnaviv_sched.h
> > index c0a6796e22c9..baebfa069afc 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> > @@ -18,7 +18,6 @@ struct etnaviv_gem_submit *to_etnaviv_submit(struct d=
rm_sched_job *sched_job)
> >
> >  int etnaviv_sched_init(struct etnaviv_gpu *gpu);
> >  void etnaviv_sched_fini(struct etnaviv_gpu *gpu);
> > -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> > -                        struct etnaviv_gem_submit *submit);
> > +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit);
> >
> >  #endif /* __ETNAVIV_SCHED_H__ */
>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
