Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3653B38B1
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 23:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbhFXVcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 17:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232582AbhFXVcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 17:32:53 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC96C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 14:30:33 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso7134688otu.10
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IZJo9RCSR2BN5ZV8cd0oYhrij9jdxz75Aaz9p+81dF0=;
        b=c03Uih7Ybh23Iz4nuoW+/n6xpHKHVcHR7e+hU+mvoDBudpMASvy/Z0Mz2Giq8Nyrxd
         nSTBhMUDUFm6KyJHPyp9Cv4Mezpjm/Dj1XfprO9BfYoyeZuWICo5057YJG7Mu2EiCJQj
         Fv2T9aSFgEFwm+336lyKjtRWVSgTv6vjE+Qjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IZJo9RCSR2BN5ZV8cd0oYhrij9jdxz75Aaz9p+81dF0=;
        b=pQYE85WCfljrEkYf9vuiGoGpyj0VVVF0CPNAQNknDNTzJxXCSZBzDUjRRWd4FedZYs
         UU39OLufXqUrHFECmS/6+xJ5IFvzjketMbgQThSFhJ26sHvnsyM34+rwzwlJSfDEe32G
         pcFGzK3MZ7Fxc/uGSxf78IZ8jGFU9e4Kn5lPkNK6DcW7ojYHdCwKLREhkvGV++fyOQ6W
         z8iwnrWtb22U86UrSPc8GEaAXiQWSNSqQOUElXH2cevUzXoOf6sbepaFTtqsOnXf6DTE
         T2X81DT6E498azQORDStE1eYxgZXJUmXu2OZYK9HNgfG3dXf8oonrEI5yacOryx0LpPv
         NXzA==
X-Gm-Message-State: AOAM530kjRLSdnJgr1dy4Cj31AYrIqUHQDibCN2EKH5oPbruN4xN17hU
        e0U+wrIXl7pWpSaLJENslghmw9JameGixllYz2zN9A==
X-Google-Smtp-Source: ABdhPJyXBdRffqjJkzHkCj4U0WNFAfuywh4ATQg0b8MC/PUKxuVlwfA1MuX4bfA0DL7RUQYdVaNNdbtywaXC862fmh8=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr6568727otb.281.1624570233021;
 Thu, 24 Jun 2021 14:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
 <20210624204535.614168-1-daniel.vetter@ffwll.ch> <CADaigPWe17ddknbNWOVcGLZGkX3u1JfpzkAxySTduwgPUa5okQ@mail.gmail.com>
In-Reply-To: <CADaigPWe17ddknbNWOVcGLZGkX3u1JfpzkAxySTduwgPUa5okQ@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 24 Jun 2021 23:30:21 +0200
Message-ID: <CAKMK7uGLcvty86d4uGGAUcGdrbSKf4jDj7uMKdQC_ZuGesDXjg@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Split drm_sched_job_init
To:     Emma Anholt <emma@anholt.net>
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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

On Thu, Jun 24, 2021 at 11:00 PM Emma Anholt <emma@anholt.net> wrote:
>
> On Thu, Jun 24, 2021 at 1:45 PM Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
> >
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
> > Acked-by: Steven Price <steven.price@arm.com>
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
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
> >  drivers/gpu/drm/lima/lima_sched.c        |  2 ++
> >  drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
> >  drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
> >  drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
> >  drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++++-
> >  drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
> >  include/drm/gpu_scheduler.h              |  6 +++++-
> >  10 files changed, 52 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index c5386d13eb4a..a4ec092af9a7 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_pars=
er *p,
> >         if (r)
> >                 goto error_unlock;
> >
> > +       drm_sched_job_arm(&job->base);
> > +
> >         /* No memory allocation is allowed while holding the notifier l=
ock.
> >          * The lock is held until amdgpu_cs_submit is finished and fenc=
e is
> >          * added to BOs.
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.c
> > index d33e6d97cc89..5ddb955d2315 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struc=
t drm_sched_entity *entity,
> >         if (r)
> >                 return r;
> >
> > +       drm_sched_job_arm(&job->base);
> > +
> >         *f =3D dma_fence_get(&job->base.s_fence->finished);
> >         amdgpu_job_free_resources(job);
> >         drm_sched_entity_push_job(&job->base, entity);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/=
etnaviv/etnaviv_sched.c
> > index 19826e504efc..af1671f01c7f 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity =
*sched_entity,
> >         if (ret)
> >                 goto out_unlock;
> >
> > +       drm_sched_job_arm(&submit->sched_job);
> > +
> >         submit->out_fence =3D dma_fence_get(&submit->sched_job.s_fence-=
>finished);
> >         submit->out_fence_id =3D idr_alloc_cyclic(&submit->gpu->fence_i=
dr,
> >                                                 submit->out_fence, 0,
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> > index ecf3267334ff..bd1af1fd8c0f 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *ta=
sk,
> >                 return err;
> >         }
> >
> > +       drm_sched_job_arm(&task->base);
> > +
> >         task->num_bos =3D num_bos;
> >         task->vm =3D lima_vm_get(vm);
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/=
panfrost/panfrost_job.c
> > index beb62c8fc851..1e950534b9b0 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
> >                 goto unlock;
> >         }
> >
> > +       drm_sched_job_arm(&job->base);
> > +
> >         job->render_done_fence =3D dma_fence_get(&job->base.s_fence->fi=
nished);
> >
> >         ret =3D panfrost_acquire_object_fences(job->bos, job->bo_count,
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 79554aa4dbb1..f7347c284886 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_en=
tity *entity)
> >   * @sched_job: job to submit
> >   * @entity: scheduler entity
> >   *
> > - * Note: To guarantee that the order of insertion to queue matches
> > - * the job's fence sequence number this function should be
> > - * called with drm_sched_job_init under common lock.
> > + * Note: To guarantee that the order of insertion to queue matches the=
 job's
> > + * fence sequence number this function should be called with drm_sched=
_job_arm()
> > + * under common lock.
> >   *
> >   * Returns 0 for success, negative error code otherwise.
> >   */
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index 69de2c76731f..0ba810c198bd 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct=
 dma_fence *f)
> >  }
> >  EXPORT_SYMBOL(to_drm_sched_fence);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity=
 *entity,
> > -                                              void *owner)
> > +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity =
*entity,
> > +                                             void *owner)
> >  {
> >         struct drm_sched_fence *fence =3D NULL;
> > -       unsigned seq;
> >
> >         fence =3D kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
> >         if (fence =3D=3D NULL)
> > @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(st=
ruct drm_sched_entity *entity,
> >         fence->sched =3D entity->rq->sched;
> >         spin_lock_init(&fence->lock);
> >
> > +       return fence;
> > +}
>
> If there's an error path between fence_alloc (job_init()) and
> fence_create() (job_arm()) time, how does the s_fence get freed?
> Before, I was committed to calling drm_sched_entity_push_job() which
> lead to the job being processed and freed, but now I think we need
> some other non-pushed-job free path.

Yeah I need to fix that in each driver when I move the
drm_sched_job_init around. From a quick look I just need to move the
drm_sched_job_cleanup() call around slightly in each case, but it's a
bit too late to do that without screwing it up for sure. I'll look
into that tomorrow.
-Daniel

>
> > +EXPORT_SYMBOL(drm_sched_job_arm);
> > +
> >  /**
> >   * drm_sched_job_cleanup - clean up scheduler job resources
> >   *
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_ge=
m.c
> > index 4eb354226972..5c3a99027ecd 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
> >         if (ret)
> >                 return ret;
> >
> > +       drm_sched_job_arm(&job->base);
> > +
> >         job->done_fence =3D dma_fence_get(&job->base.s_fence->finished)=
;
> >
> >         /* put by scheduler job completion */
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index d18af49fd009..80438d126c9d 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -313,6 +313,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched=
);
> >  int drm_sched_job_init(struct drm_sched_job *job,
> >                        struct drm_sched_entity *entity,
> >                        void *owner);
> > +void drm_sched_job_arm(struct drm_sched_job *job);
> >  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >                                     struct drm_gpu_scheduler **sched_li=
st,
> >                                     unsigned int num_sched_list);
> > @@ -352,8 +353,11 @@ void drm_sched_entity_set_priority(struct drm_sche=
d_entity *entity,
> >                                    enum drm_sched_priority priority);
> >  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >
> > -struct drm_sched_fence *drm_sched_fence_create(
> > +struct drm_sched_fence *drm_sched_fence_alloc(
> >         struct drm_sched_entity *s_entity, void *owner);
> > +void drm_sched_fence_init(struct drm_sched_fence *fence,
> > +                         struct drm_sched_entity *entity);
> > +
> >  void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
> >  void drm_sched_fence_finished(struct drm_sched_fence *fence);
> >
> > --
> > 2.32.0.rc2
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
