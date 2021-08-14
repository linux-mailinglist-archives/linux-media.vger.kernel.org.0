Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385C83EBFD1
	for <lists+linux-media@lfdr.de>; Sat, 14 Aug 2021 04:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbhHNCqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 22:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236466AbhHNCqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 22:46:36 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49294C061756
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 19:46:09 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id b132so6486877ybg.4
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 19:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=doexGRRFRH9NbdTG0blGI0xcOYJky3DrV73X8D1906s=;
        b=Wne+WBIGEmscULU46di2hCVQ25Q1QSDoOgEXBIbaOJY12hyCsOnnb5kLxOGoqdvFg8
         gSEgIQMm4Rl+wruc8INnteNs2KS7V52hjZNn5cKFy0jkm4RW8zJhaHXKT9NP5xYCgvzK
         HHMXWZxPiy1y/ffk2A9Ly87G07YtLyZoS++bk6B5EW43tdqGfEqlTJ1FRqE9WS+nKdr/
         0Q7AThigu6GuZ+a8WWgOGtttxwMZTIdX0WIov4ypKAz7bHtx8Ft6pVV2WZI0kYEtVgXI
         TSTguhHY8eXakFzk8KktN934PACMgOv0zR+FnH3EeY1LjleOTwb2KTq+6S0mUkSo4qS1
         8r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=doexGRRFRH9NbdTG0blGI0xcOYJky3DrV73X8D1906s=;
        b=NW/lDxd6Zup8wDgOZn8qKyGi08gLwkvOWDJ8gLW/OOZGsMwM3ZKTjPjwlNfSf+J0Cv
         nRTu3xp01cNTXSjGGOjY5YsOQsfErKWJ+3XjdcqqATWfuGezkfgaxfdzNl/qx463ULAC
         hXd2zZ3vEx1kzHDQxbQFw7vm1OjboOoJvKd3RsdJ3/1ewedjp+7ZrfjLZa0MjnIlcZD8
         YVDVR0K2FdeQDV2bN605SQ3P9NNe1LGR7O9eh39i/PObYLRXlVEqjnb+QlD2v5a/Sq+g
         nckcolcwXBIAtb9YDELuoCs/OzgT1+sWpsApPqkBAe/3whIX8oEIlFo0vWCCZUSlSsUt
         lj7A==
X-Gm-Message-State: AOAM5329nzfuy+xa+FbgMAUtqPgRkLE8r5E1VzrfjMix+plgFaBdNOI5
        jap9rTy9/r34eWmAu2YFejrtSvdmf60tOmms1Oc=
X-Google-Smtp-Source: ABdhPJxhwi5/Li+Ln3JGQm9q+us2VD16GiY4mH5NyM66cox0fnYlEIpJ8k1pvRTQJsOui9Z0v8Z4uN+VOdHyHnN9Sqo=
X-Received: by 2002:a25:83ce:: with SMTP id v14mr7429993ybm.221.1628909168633;
 Fri, 13 Aug 2021 19:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-9-daniel.vetter@ffwll.ch> <YRV2ShnIbOyaHG8X@phenom.ffwll.local>
In-Reply-To: <YRV2ShnIbOyaHG8X@phenom.ffwll.local>
From:   Qiang Yu <yuq825@gmail.com>
Date:   Sat, 14 Aug 2021 10:45:57 +0800
Message-ID: <CAKGbVbvc=JiW87oOGZ84sg513o2-ibGfzd6m8CKTHD2igaw81w@mail.gmail.com>
Subject: Re: [PATCH v5 08/20] drm/lima: use scheduler dependency tracking
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        lima@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the remind, indeed miss a lock. Patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Fri, Aug 13, 2021 at 3:28 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Aug 05, 2021 at 12:46:53PM +0200, Daniel Vetter wrote:
> > Nothing special going on here.
> >
> > Aside reviewing the code, it seems like drm_sched_job_arm() should be
> > moved into lima_sched_context_queue_task and put under some mutex
> > together with drm_sched_push_job(). See the kerneldoc for
> > drm_sched_push_job().
> >
> > v2: Rebase over renamed functions to add dependencies.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Qiang Yu <yuq825@gmail.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: lima@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
>
> Ping for an ack here please. Testing would be even better ofc.
> -Daniel
>
> > ---
> >  drivers/gpu/drm/lima/lima_gem.c   |  6 ++++--
> >  drivers/gpu/drm/lima/lima_sched.c | 21 ---------------------
> >  drivers/gpu/drm/lima/lima_sched.h |  3 ---
> >  3 files changed, 4 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lim=
a_gem.c
> > index c528f40981bb..640acc060467 100644
> > --- a/drivers/gpu/drm/lima/lima_gem.c
> > +++ b/drivers/gpu/drm/lima/lima_gem.c
> > @@ -267,7 +267,9 @@ static int lima_gem_sync_bo(struct lima_sched_task =
*task, struct lima_bo *bo,
> >       if (explicit)
> >               return 0;
> >
> > -     return drm_gem_fence_array_add_implicit(&task->deps, &bo->base.ba=
se, write);
> > +     return drm_sched_job_add_implicit_dependencies(&task->base,
> > +                                                    &bo->base.base,
> > +                                                    write);
> >  }
> >
> >  static int lima_gem_add_deps(struct drm_file *file, struct lima_submit=
 *submit)
> > @@ -285,7 +287,7 @@ static int lima_gem_add_deps(struct drm_file *file,=
 struct lima_submit *submit)
> >               if (err)
> >                       return err;
> >
> > -             err =3D drm_gem_fence_array_add(&submit->task->deps, fenc=
e);
> > +             err =3D drm_sched_job_add_dependency(&submit->task->base,=
 fence);
> >               if (err) {
> >                       dma_fence_put(fence);
> >                       return err;
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> > index e968b5a8f0b0..99d5f6f1a882 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -134,24 +134,15 @@ int lima_sched_task_init(struct lima_sched_task *=
task,
> >       task->num_bos =3D num_bos;
> >       task->vm =3D lima_vm_get(vm);
> >
> > -     xa_init_flags(&task->deps, XA_FLAGS_ALLOC);
> > -
> >       return 0;
> >  }
> >
> >  void lima_sched_task_fini(struct lima_sched_task *task)
> >  {
> > -     struct dma_fence *fence;
> > -     unsigned long index;
> >       int i;
> >
> >       drm_sched_job_cleanup(&task->base);
> >
> > -     xa_for_each(&task->deps, index, fence) {
> > -             dma_fence_put(fence);
> > -     }
> > -     xa_destroy(&task->deps);
> > -
> >       if (task->bos) {
> >               for (i =3D 0; i < task->num_bos; i++)
> >                       drm_gem_object_put(&task->bos[i]->base.base);
> > @@ -186,17 +177,6 @@ struct dma_fence *lima_sched_context_queue_task(st=
ruct lima_sched_task *task)
> >       return fence;
> >  }
> >
> > -static struct dma_fence *lima_sched_dependency(struct drm_sched_job *j=
ob,
> > -                                            struct drm_sched_entity *e=
ntity)
> > -{
> > -     struct lima_sched_task *task =3D to_lima_task(job);
> > -
> > -     if (!xa_empty(&task->deps))
> > -             return xa_erase(&task->deps, task->last_dep++);
> > -
> > -     return NULL;
> > -}
> > -
> >  static int lima_pm_busy(struct lima_device *ldev)
> >  {
> >       int ret;
> > @@ -472,7 +452,6 @@ static void lima_sched_free_job(struct drm_sched_jo=
b *job)
> >  }
> >
> >  static const struct drm_sched_backend_ops lima_sched_ops =3D {
> > -     .dependency =3D lima_sched_dependency,
> >       .run_job =3D lima_sched_run_job,
> >       .timedout_job =3D lima_sched_timedout_job,
> >       .free_job =3D lima_sched_free_job,
> > diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/l=
ima_sched.h
> > index ac70006b0e26..6a11764d87b3 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.h
> > +++ b/drivers/gpu/drm/lima/lima_sched.h
> > @@ -23,9 +23,6 @@ struct lima_sched_task {
> >       struct lima_vm *vm;
> >       void *frame;
> >
> > -     struct xarray deps;
> > -     unsigned long last_dep;
> > -
> >       struct lima_bo **bos;
> >       int num_bos;
> >
> > --
> > 2.32.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
