Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3C03F8B88
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 18:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242968AbhHZQIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 12:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhHZQIv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 12:08:51 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96990C0613CF;
        Thu, 26 Aug 2021 09:08:03 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n5so5848504wro.12;
        Thu, 26 Aug 2021 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4P77TwOPdHVoIP43EVGu36WwTX3449lDutu56CYSjjI=;
        b=IIMsONKwMj2Q0i/dKhcqnhE1+axnJPRhRgJSsjaFOo8Fi301W7IyIU/vvC0kIZ8bgu
         Je8GdZqD8Q+N5ptSmRVGI3epIzsZDcDnm/k++bXrc9tMepWA8tbXMxHqk3RQHTK/HDQM
         avf10fHLSNVM9n97yiDhZ8mQdjq02j6mqSNwWVdIBjaMFbU2sJSgr4fzt+qpGFIq8dpl
         SFShP3yZA9ShUK1nVbF6Ea+PmQApjEJW3IG30Nk5QCLV2eL6THX4rLDjXuzBoV/rs6Uk
         ZNRM13LILVQwTEdkszgBpPzHc+HSb57pJNc7f25Xv0tkpu5YML8YaKsR8f2Um7NOAGrO
         0Oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4P77TwOPdHVoIP43EVGu36WwTX3449lDutu56CYSjjI=;
        b=ZuBd6aD3R0aa1n8c/JwMLEuH4PS1Mh7rwoiGpTyZTjPQazbKQtCNinFcO/rVSrn3vY
         KD3m5N2uz6IswKOMRXAi340l5AJK31TOyAqjJbC7yk1dOPNXdDbc2WJkQSJ8ZDFV4N+S
         slTm9sEiXLYyohi4roxYZyVBuGK4cyOf9yTa2+YhOpkD7SNHEfUqtap55Wa4HgnXjEeS
         oQVsbnix9Stpq2wFB2FyTV/WWLvl82gqV9QC0t8ZCT/JduIY9KuoylvqIP9cFxJ4iSry
         Ov/uHIfHcm6pe72Q71Mhuq9UmZ0adiNil0eFyJvm3rOsdVweHEdWM7pULEhf77tg0nIb
         W8gA==
X-Gm-Message-State: AOAM533UaH79UN6r3jtdsT9Ih359wGLSmuGJ00xodSR6opBSJt9kNSJL
        /v+Xb/UxueM3FXdCCQli/JpC5/TrwNy83smkBG8=
X-Google-Smtp-Source: ABdhPJwLEP2d6R9vXs1Mn5jrbDqd3fYAXN3EKb1gwE4cg5t3k5Lj8O18agn2DnUySbO35LQra3OhJpgNFQKmONRXbZA=
X-Received: by 2002:adf:f90e:: with SMTP id b14mr5170152wrr.28.1629994082123;
 Thu, 26 Aug 2021 09:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch> <20210805104705.862416-13-daniel.vetter@ffwll.ch>
In-Reply-To: <20210805104705.862416-13-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 26 Aug 2021 09:12:21 -0700
Message-ID: <CAF6AEGs2yxBe2oW_wPkodL80jkFNPhrrAtmuc60=pzV_dp=igg@mail.gmail.com>
Subject: Re: [PATCH v5 12/20] drm/msm: Use scheduler dependency handling
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
>
> drm_sched_job_init is already at the right place, so this boils down
> to deleting code.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

r-b

> ---
>  drivers/gpu/drm/msm/msm_gem.h        |  5 -----
>  drivers/gpu/drm/msm/msm_gem_submit.c | 19 +++++--------------
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 12 ------------
>  3 files changed, 5 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.=
h
> index f9e3ffb2309a..8bf0ac707fd7 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -312,11 +312,6 @@ struct msm_gem_submit {
>         struct ww_acquire_ctx ticket;
>         uint32_t seqno;         /* Sequence number of the submit on the r=
ing */
>
> -       /* Array of struct dma_fence * to block on before submitting this=
 job.
> -        */
> -       struct xarray deps;
> -       unsigned long last_dep;
> -
>         /* Hw fence, which is created when the scheduler executes the job=
, and
>          * is signaled when the hw finishes (via seqno write from cmdstre=
am)
>          */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 96cea0ba4cfd..fb5a2eab27a2 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_=
device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> -
>         kref_init(&submit->ref);
>         submit->dev =3D dev;
>         submit->aspace =3D queue->ctx->aspace;
> @@ -72,8 +70,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
>  {
>         struct msm_gem_submit *submit =3D
>                         container_of(kref, struct msm_gem_submit, ref);
> -       unsigned long index;
> -       struct dma_fence *fence;
>         unsigned i;
>
>         if (submit->fence_id) {
> @@ -82,12 +78,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
>                 mutex_unlock(&submit->queue->lock);
>         }
>
> -       xa_for_each (&submit->deps, index, fence) {
> -               dma_fence_put(fence);
> -       }
> -
> -       xa_destroy(&submit->deps);
> -
>         dma_fence_put(submit->user_fence);
>         dma_fence_put(submit->hw_fence);
>
> @@ -343,8 +333,9 @@ static int submit_fence_sync(struct msm_gem_submit *s=
ubmit, bool no_implicit)
>                 if (no_implicit)
>                         continue;
>
> -               ret =3D drm_gem_fence_array_add_implicit(&submit->deps, o=
bj,
> -                       write);
> +               ret =3D drm_sched_job_add_implicit_dependencies(&submit->=
base,
> +                                                             obj,
> +                                                             write);
>                 if (ret)
>                         break;
>         }
> @@ -588,7 +579,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm=
_gem_submit *submit,
>                 if (ret)
>                         break;
>
> -               ret =3D drm_gem_fence_array_add(&submit->deps, fence);
> +               ret =3D drm_sched_job_add_dependency(&submit->base, fence=
);
>                 if (ret)
>                         break;
>
> @@ -798,7 +789,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void=
 *data,
>                         goto out_unlock;
>                 }
>
> -               ret =3D drm_gem_fence_array_add(&submit->deps, in_fence);
> +               ret =3D drm_sched_job_add_dependency(&submit->base, in_fe=
nce);
>                 if (ret)
>                         goto out_unlock;
>         }
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/m=
sm_ringbuffer.c
> index bd54c1412649..652b1dedd7c1 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -11,17 +11,6 @@ static uint num_hw_submissions =3D 8;
>  MODULE_PARM_DESC(num_hw_submissions, "The max # of jobs to write into ri=
ngbuffer (default 8)");
>  module_param(num_hw_submissions, uint, 0600);
>
> -static struct dma_fence *msm_job_dependency(struct drm_sched_job *job,
> -               struct drm_sched_entity *s_entity)
> -{
> -       struct msm_gem_submit *submit =3D to_msm_submit(job);
> -
> -       if (!xa_empty(&submit->deps))
> -               return xa_erase(&submit->deps, submit->last_dep++);
> -
> -       return NULL;
> -}
> -
>  static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>  {
>         struct msm_gem_submit *submit =3D to_msm_submit(job);
> @@ -52,7 +41,6 @@ static void msm_job_free(struct drm_sched_job *job)
>  }
>
>  const struct drm_sched_backend_ops msm_sched_ops =3D {
> -       .dependency =3D msm_job_dependency,
>         .run_job =3D msm_job_run,
>         .free_job =3D msm_job_free
>  };
> --
> 2.32.0
>
