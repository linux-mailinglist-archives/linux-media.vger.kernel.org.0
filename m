Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF743BE6F4
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 13:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhGGLQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 07:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhGGLQ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 07:16:57 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EE1C061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 04:14:15 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id h9so2965333oih.4
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 04:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T9kOnA9c2C8VqjAIDiK4A3Y9HANAy47Y+kdxErCBGJ0=;
        b=R2dEOX+66b/aoLE+Sqa1VyyexYg5esvb//K5RMc8ogAN+MKpRNqwjzH8ejLXSZBvw4
         9pTKUJ9Qhq0QAfIZrOTWZzoCSXweEfLByqgVcTen9da01azAlBEOoWuVbBbR0iJmZAdE
         RZKiwZTxbLpC2xuR6+OflP4QkhnXAeBrND4ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T9kOnA9c2C8VqjAIDiK4A3Y9HANAy47Y+kdxErCBGJ0=;
        b=BHvZCaT07967miZIC5/6bjpOmIao1hZRoodqTxawt/RSfJ1MIhkTK0itQaslSL8QKE
         Rj/q9TF4CPUrqbAiyxXy4Byd9Nppxc7FA6XYzWRXrVoP/gpZPQ3Heay1Fsaw8mMPJRj+
         qWhxoGTJGYLshQpc86ryvT3PHepuJK3NkzhADsIFn0O4RcCZvSdESQTIQV56B2p6pT8B
         doW5tyJsx+b5DHpEaAgJqrGTGVHTYJ6GmwKAIPgc31zpLfl2gi7TAIjlC1FtvIRxTCcc
         gawsjtJUY4BBrREzsj8KEPLDos/n6WQmgMWxAEU941iByRnWDjgWS+ez5xdB/s86dZ1G
         JBmA==
X-Gm-Message-State: AOAM531jNXQ9GLDY68r8lIE9d6H/kZx36M2gDo448+7XRnWM//JoZ2F9
        HlwLgps1Fpn7rX2hwtQfabmV9a0hr0Yfm/G5p7MajQ==
X-Google-Smtp-Source: ABdhPJwviLy+XMv4o+oifNrr74w4pi4EHdWOmOCd6uJdydrkg86AC/B7S3zWSY7q8NiEgRtj6S94T7mCVLAVz1MLRkc=
X-Received: by 2002:aca:5793:: with SMTP id l141mr4409912oib.14.1625656455125;
 Wed, 07 Jul 2021 04:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-2-daniel.vetter@ffwll.ch> <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
In-Reply-To: <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Jul 2021 13:14:03 +0200
Message-ID: <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Qiang Yu <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Adam Borowski <kilobyte@angband.pl>,
        Nick Terrell <terrelln@fb.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Sami Tolvanen <samitolvanen@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Kevin Wang <kevin1.wang@amd.com>,
        Chen Li <chenli@uniontech.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
        Dennis Li <Dennis.Li@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Sonny Jiang <sonny.jiang@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        lima@lists.freedesktop.org,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Emma Anholt <emma@anholt.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 7, 2021 at 11:30 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 02.07.21 um 23:38 schrieb Daniel Vetter:
> > This is a very confusingly named function, because not just does it
> > init an object, it arms it and provides a point of no return for
> > pushing a job into the scheduler. It would be nice if that's a bit
> > clearer in the interface.
> >
> > But the real reason is that I want to push the dependency tracking
> > helpers into the scheduler code, and that means drm_sched_job_init
> > must be called a lot earlier, without arming the job.
> >
> > v2:
> > - don't change .gitignore (Steven)
> > - don't forget v3d (Emma)
> >
> > v3: Emma noticed that I leak the memory allocated in
> > drm_sched_job_init if we bail out before the point of no return in
> > subsequent driver patches. To be able to fix this change
> > drm_sched_job_cleanup() so it can handle being called both before and
> > after drm_sched_job_arm().
>
> Thinking more about this, I'm not sure if this really works.
>
> See drm_sched_job_init() was also calling drm_sched_entity_select_rq()
> to update the entity->rq association.
>
> And that can only be done later on when we arm the fence as well.

Hm yeah, but that's a bug in the existing code I think: We already
fail to clean up if we fail to allocate the fences. So I think the
right thing to do here is to split the checks into job_init, and do
the actual arming/rq selection in job_arm? I'm not entirely sure
what's all going on there, the first check looks a bit like trying to
schedule before the entity is set up, which is a driver bug and should
have a WARN_ON?

The 2nd check around last_scheduled I have honeslty no idea what it's
even trying to do.
-Daniel

>
> Christian.
>
> >
> > Also improve the kerneldoc for this.
> >
> > Acked-by: Steven Price <steven.price@arm.com> (v2)
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: Qiang Yu <yuq825@gmail.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Adam Borowski <kilobyte@angband.pl>
> > Cc: Nick Terrell <terrelln@fb.com>
> > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> > Cc: Sami Tolvanen <samitolvanen@google.com>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Nirmoy Das <nirmoy.das@amd.com>
> > Cc: Deepak R Varma <mh12gx2825@gmail.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Kevin Wang <kevin1.wang@amd.com>
> > Cc: Chen Li <chenli@uniontech.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: "Marek Ol=C5=A1=C3=A1k" <marek.olsak@amd.com>
> > Cc: Dennis Li <Dennis.Li@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Sonny Jiang <sonny.jiang@amd.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Tian Tao <tiantao6@hisilicon.com>
> > Cc: Jack Zhang <Jack.Zhang1@amd.com>
> > Cc: etnaviv@lists.freedesktop.org
> > Cc: lima@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: Emma Anholt <emma@anholt.net>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
> >   drivers/gpu/drm/lima/lima_sched.c        |  2 ++
> >   drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
> >   drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
> >   drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
> >   drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++++++++++++++++--=
-
> >   drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
> >   include/drm/gpu_scheduler.h              |  7 +++-
> >   10 files changed, 74 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index c5386d13eb4a..a4ec092af9a7 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_pars=
er *p,
> >       if (r)
> >               goto error_unlock;
> >
> > +     drm_sched_job_arm(&job->base);
> > +
> >       /* No memory allocation is allowed while holding the notifier loc=
k.
> >        * The lock is held until amdgpu_cs_submit is finished and fence =
is
> >        * added to BOs.
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.c
> > index d33e6d97cc89..5ddb955d2315 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struc=
t drm_sched_entity *entity,
> >       if (r)
> >               return r;
> >
> > +     drm_sched_job_arm(&job->base);
> > +
> >       *f =3D dma_fence_get(&job->base.s_fence->finished);
> >       amdgpu_job_free_resources(job);
> >       drm_sched_entity_push_job(&job->base, entity);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/=
etnaviv/etnaviv_sched.c
> > index feb6da1b6ceb..05f412204118 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity =
*sched_entity,
> >       if (ret)
> >               goto out_unlock;
> >
> > +     drm_sched_job_arm(&submit->sched_job);
> > +
> >       submit->out_fence =3D dma_fence_get(&submit->sched_job.s_fence->f=
inished);
> >       submit->out_fence_id =3D idr_alloc_cyclic(&submit->gpu->fence_idr=
,
> >                                               submit->out_fence, 0,
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> > index dba8329937a3..38f755580507 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *ta=
sk,
> >               return err;
> >       }
> >
> > +     drm_sched_job_arm(&task->base);
> > +
> >       task->num_bos =3D num_bos;
> >       task->vm =3D lima_vm_get(vm);
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/=
panfrost/panfrost_job.c
> > index 71a72fb50e6b..2992dc85325f 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
> >               goto unlock;
> >       }
> >
> > +     drm_sched_job_arm(&job->base);
> > +
> >       job->render_done_fence =3D dma_fence_get(&job->base.s_fence->fini=
shed);
> >
> >       ret =3D panfrost_acquire_object_fences(job->bos, job->bo_count,
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 79554aa4dbb1..f7347c284886 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_en=
tity *entity)
> >    * @sched_job: job to submit
> >    * @entity: scheduler entity
> >    *
> > - * Note: To guarantee that the order of insertion to queue matches
> > - * the job's fence sequence number this function should be
> > - * called with drm_sched_job_init under common lock.
> > + * Note: To guarantee that the order of insertion to queue matches the=
 job's
> > + * fence sequence number this function should be called with drm_sched=
_job_arm()
> > + * under common lock.
> >    *
> >    * Returns 0 for success, negative error code otherwise.
> >    */
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index 69de2c76731f..c451ee9a30d7 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(=
struct dma_fence *f)
> >    *
> >    * Free up the fence memory after the RCU grace period.
> >    */
> > -static void drm_sched_fence_free(struct rcu_head *rcu)
> > +void drm_sched_fence_free(struct rcu_head *rcu)
> >   {
> >       struct dma_fence *f =3D container_of(rcu, struct dma_fence, rcu);
> >       struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
> > @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct=
 dma_fence *f)
> >   }
> >   EXPORT_SYMBOL(to_drm_sched_fence);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity=
 *entity,
> > -                                            void *owner)
> > +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity =
*entity,
> > +                                           void *owner)
> >   {
> >       struct drm_sched_fence *fence =3D NULL;
> > -     unsigned seq;
> >
> >       fence =3D kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
> >       if (fence =3D=3D NULL)
> > @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(st=
ruct drm_sched_entity *entity,
> >       fence->sched =3D entity->rq->sched;
> >       spin_lock_init(&fence->lock);
> >
> > +     return fence;
> > +}
> > +
> > +void drm_sched_fence_init(struct drm_sched_fence *fence,
> > +                       struct drm_sched_entity *entity)
> > +{
> > +     unsigned seq;
> > +
> >       seq =3D atomic_inc_return(&entity->fence_seq);
> >       dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >                      &fence->lock, entity->fence_context, seq);
> >       dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
> >                      &fence->lock, entity->fence_context + 1, seq);
> > -
> > -     return fence;
> >   }
> >
> >   module_init(drm_sched_fence_slab_init);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 33c414d55fab..5e84e1500c32 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -48,9 +48,11 @@
> >   #include <linux/wait.h>
> >   #include <linux/sched.h>
> >   #include <linux/completion.h>
> > +#include <linux/dma-resv.h>
> >   #include <uapi/linux/sched/types.h>
> >
> >   #include <drm/drm_print.h>
> > +#include <drm/drm_gem.h>
> >   #include <drm/gpu_scheduler.h>
> >   #include <drm/spsc_queue.h>
> >
> > @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> >
> >   /**
> >    * drm_sched_job_init - init a scheduler job
> > - *
> >    * @job: scheduler job to init
> >    * @entity: scheduler entity to use
> >    * @owner: job owner for debugging
> > @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> >    * Refer to drm_sched_entity_push_job() documentation
> >    * for locking considerations.
> >    *
> > + * Drivers must make sure drm_sched_job_cleanup() if this function ret=
urns
> > + * successfully, even when @job is aborted before drm_sched_job_arm() =
is called.
> > + *
> >    * Returns 0 for success, negative error code otherwise.
> >    */
> >   int drm_sched_job_init(struct drm_sched_job *job,
> > @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >       job->sched =3D sched;
> >       job->entity =3D entity;
> >       job->s_priority =3D entity->rq - sched->sched_rq;
> > -     job->s_fence =3D drm_sched_fence_create(entity, owner);
> > +     job->s_fence =3D drm_sched_fence_alloc(entity, owner);
> >       if (!job->s_fence)
> >               return -ENOMEM;
> >       job->id =3D atomic64_inc_return(&sched->job_id_count);
> > @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >   EXPORT_SYMBOL(drm_sched_job_init);
> >
> >   /**
> > - * drm_sched_job_cleanup - clean up scheduler job resources
> > + * drm_sched_job_arm - arm a scheduler job for execution
> > + * @job: scheduler job to arm
> > + *
> > + * This arms a scheduler job for execution. Specifically it initialize=
s the
> > + * &drm_sched_job.s_fence of @job, so that it can be attached to struc=
t dma_resv
> > + * or other places that need to track the completion of this job.
> > + *
> > + * Refer to drm_sched_entity_push_job() documentation for locking
> > + * considerations.
> >    *
> > + * This can only be called if drm_sched_job_init() succeeded.
> > + */
> > +void drm_sched_job_arm(struct drm_sched_job *job)
> > +{
> > +     drm_sched_fence_init(job->s_fence, job->entity);
> > +}
> > +EXPORT_SYMBOL(drm_sched_job_arm);
> > +
> > +/**
> > + * drm_sched_job_cleanup - clean up scheduler job resources
> >    * @job: scheduler job to clean up
> > + *
> > + * Cleans up the resources allocated with drm_sched_job_init().
> > + *
> > + * Drivers should call this from their error unwind code if @job is ab=
orted
> > + * before drm_sched_job_arm() is called.
> > + *
> > + * After that point of no return @job is committed to be executed by t=
he
> > + * scheduler, and this function should be called from the
> > + * &drm_sched_backend_ops.free_job callback.
> >    */
> >   void drm_sched_job_cleanup(struct drm_sched_job *job)
> >   {
> > -     dma_fence_put(&job->s_fence->finished);
> > +     if (!kref_read(&job->s_fence->finished.refcount)) {
> > +             /* drm_sched_job_arm() has been called */
> > +             dma_fence_put(&job->s_fence->finished);
> > +     } else {
> > +             /* aborted job before committing to run it */
> > +             drm_sched_fence_free(&job->s_fence->finished.rcu);
> > +     }
> > +
> >       job->s_fence =3D NULL;
> >   }
> >   EXPORT_SYMBOL(drm_sched_job_cleanup);
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_ge=
m.c
> > index 4eb354226972..5c3a99027ecd 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
> >       if (ret)
> >               return ret;
> >
> > +     drm_sched_job_arm(&job->base);
> > +
> >       job->done_fence =3D dma_fence_get(&job->base.s_fence->finished);
> >
> >       /* put by scheduler job completion */
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 88ae7f331bb1..83afc3aa8e2f 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched=
);
> >   int drm_sched_job_init(struct drm_sched_job *job,
> >                      struct drm_sched_entity *entity,
> >                      void *owner);
> > +void drm_sched_job_arm(struct drm_sched_job *job);
> >   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >                                   struct drm_gpu_scheduler **sched_list=
,
> >                                      unsigned int num_sched_list);
> > @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sche=
d_entity *entity,
> >                                  enum drm_sched_priority priority);
> >   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(
> > +struct drm_sched_fence *drm_sched_fence_alloc(
> >       struct drm_sched_entity *s_entity, void *owner);
> > +void drm_sched_fence_init(struct drm_sched_fence *fence,
> > +                       struct drm_sched_entity *entity);
> > +void drm_sched_fence_free(struct rcu_head *rcu);
> > +
> >   void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
> >   void drm_sched_fence_finished(struct drm_sched_fence *fence);
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
