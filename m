Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5413B34E5
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 19:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhFXRkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 13:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXRk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 13:40:29 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0B7C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 10:38:09 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id a14so1316456oie.11
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 10:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FG5keu84Z76FTyi3w1lZM5yaYbDUx/YVDQcjS2EMHvI=;
        b=YMJfdK8bZ3L2cpUKqnUZWYrUTpUnbJOpJV+6y5Vh83f171RKQ2//rPqtXn6tAc+8Sn
         3NS4DzzYcKd04Uq3o4m5lizWSJjsfuiI4o6GU2Mohu/Oa7qa1IVsMHSFmogkamlAARRI
         RVd4zSLbg98d/65juTEdnaBKAS1fvTo+V1yZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FG5keu84Z76FTyi3w1lZM5yaYbDUx/YVDQcjS2EMHvI=;
        b=os+9r5X6Rrnlt79ateukH8wOwMQS9uwqMmSCWUgmKo3G9qtQtU2kQNj9hNFzYzcjWE
         /y4dp0iZc+MjTLDwC0dN1uW7W+mLaAlC3w1ncGy4rOTZ4cBtb5HfL3fPmagfvIiN2VU+
         lTxF4lzhu06bpFv1zwPp/Yz2uFs2p4VHc3qvm0fGxS1Xs4VeylVEWzJizqFqXs51oJH4
         CIiO2KHNuMI+qO0A+20pydQQcqt34pyVXwLWRd0auAFRavGMDMa3s3i/PlpYz1Xo9ZQa
         +kvuG8JZlNKDDl32bqBAmxHH2vgjZAD/WNkMOjaScQYg7DarEB6od66EqjmUEFcFBo1u
         8zFQ==
X-Gm-Message-State: AOAM531giAOzyR9ewGPMNfqdILR5VuFF9RH+rZfO7TNQuzb8W8lACJRm
        aBz2E8rZYOUFBlJNS31VSnLaczYGH1dkZXqLFcDu3Q==
X-Google-Smtp-Source: ABdhPJyJxoZqtgkYui0SxBhWd9RW+AScHePW3TmVurPpM21qm54ZgG07iQuJ7Z68g2IIdvhF9F43v5X+Jqn+WLFy/gw=
X-Received: by 2002:a54:4889:: with SMTP id r9mr8012156oic.101.1624556288935;
 Thu, 24 Jun 2021 10:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-2-daniel.vetter@ffwll.ch> <834f5d78-9052-8e7a-fd34-c5b4f37857cf@amd.com>
In-Reply-To: <834f5d78-9052-8e7a-fd34-c5b4f37857cf@amd.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 24 Jun 2021 19:37:57 +0200
Message-ID: <CAKMK7uEyiD7fD6DUD-4dJyXZEYaZiE3bdGyz6cLzsf7cjaRD4g@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/sched: Split drm_sched_job_init
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Qiang Yu <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
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
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 7:30 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 24.06.21 um 16:00 schrieb Daniel Vetter:
> > This is a very confusingly named function, because not just does it
> > init an object, it arms it and provides a point of no return for
> > pushing a job into the scheduler. It would be nice if that's a bit
> > clearer in the interface.
>
> We originally had that in the push_job interface, but moved that to init
> for some reason I don't remember.
>
> > But the real reason is that I want to push the dependency tracking
> > helpers into the scheduler code, and that means drm_sched_job_init
> > must be called a lot earlier, without arming the job.
>
> I'm really questioning myself if I like that naming.
>
> What about using drm_sched_job_add_dependency instead?

You're suggesting a
s/drm_sched_job_init/drm_sched_job_add_dependency/, or just replied to
the wrong patch?
-Daniel

>
> Christian.
>
> >
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
> > ---
> >   .gitignore                               |  1 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
> >   drivers/gpu/drm/lima/lima_sched.c        |  2 ++
> >   drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
> >   drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
> >   drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
> >   drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++++-
> >   include/drm/gpu_scheduler.h              |  6 +++++-
> >   10 files changed, 51 insertions(+), 10 deletions(-)
> >
> > diff --git a/.gitignore b/.gitignore
> > index 7afd412dadd2..52433a930299 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -66,6 +66,7 @@ modules.order
> >   /modules.builtin
> >   /modules.builtin.modinfo
> >   /modules.nsdeps
> > +*.builtin
> >
> >   #
> >   # RPM spec file (make rpm-pkg)
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
> > index 19826e504efc..af1671f01c7f 100644
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
> > index ecf3267334ff..bd1af1fd8c0f 100644
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
> > index beb62c8fc851..1e950534b9b0 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
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
> > index 69de2c76731f..0ba810c198bd 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
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
> > index 61420a9c1021..70eefed17e06 100644
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
> > @@ -594,7 +596,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >       job->sched =3D sched;
> >       job->entity =3D entity;
> >       job->s_priority =3D entity->rq - sched->sched_rq;
> > -     job->s_fence =3D drm_sched_fence_create(entity, owner);
> > +     job->s_fence =3D drm_sched_fence_alloc(entity, owner);
> >       if (!job->s_fence)
> >               return -ENOMEM;
> >       job->id =3D atomic64_inc_return(&sched->job_id_count);
> > @@ -605,6 +607,25 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >   }
> >   EXPORT_SYMBOL(drm_sched_job_init);
> >
> > +/**
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
> > + *
> > + * This can only be called if drm_sched_job_init() succeeded.
> > + */
> > +void drm_sched_job_arm(struct drm_sched_job *job)
> > +{
> > +     drm_sched_fence_init(job->s_fence, job->entity);
> > +}
> > +EXPORT_SYMBOL(drm_sched_job_arm);
> > +
> >   /**
> >    * drm_sched_job_cleanup - clean up scheduler job resources
> >    *
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index d18af49fd009..80438d126c9d 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -313,6 +313,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched=
);
> >   int drm_sched_job_init(struct drm_sched_job *job,
> >                      struct drm_sched_entity *entity,
> >                      void *owner);
> > +void drm_sched_job_arm(struct drm_sched_job *job);
> >   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >                                   struct drm_gpu_scheduler **sched_list=
,
> >                                      unsigned int num_sched_list);
> > @@ -352,8 +353,11 @@ void drm_sched_entity_set_priority(struct drm_sche=
d_entity *entity,
> >                                  enum drm_sched_priority priority);
> >   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(
> > +struct drm_sched_fence *drm_sched_fence_alloc(
> >       struct drm_sched_entity *s_entity, void *owner);
> > +void drm_sched_fence_init(struct drm_sched_fence *fence,
> > +                       struct drm_sched_entity *entity);
> > +
> >   void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
> >   void drm_sched_fence_finished(struct drm_sched_fence *fence);
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
