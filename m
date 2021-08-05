Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EF83E1F0F
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 00:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhHEW66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 18:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhHEW65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 18:58:57 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC259C0613D5;
        Thu,  5 Aug 2021 15:58:42 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c16so8559629wrp.13;
        Thu, 05 Aug 2021 15:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q6beibzNrILHq2SGf9/COm2CxcmfWx9qSxPEsXfxPtw=;
        b=uNPbQwXzK6ouX5+p8QgoDFyf/NIPsbdwWueKLuI4V9JnYMwxCFtlxOAatI83UljIzU
         2EqTDXeUqwJHIWDUgztaATkmLbK5KEMY3vA/RR9DF3nyQmpfL6mYYw9raKkpiX910SGY
         +bzOlnew+FAC5v4QGPN8V4suXFMEv2wja3fav3Vr6NaFnDdi2wRQsnTxvZpAbb8XHhJb
         v27feG5SYEZc2xwnJAq/BCKKW5DG0YUn/fhyTg75Gdj9K79SHoSmGg9NSY1QArSnhep+
         P1ikQyb0GNisUnnUCAWuYxLTFGDkQdyDSyS5v9k/bxh9W/AN5iBS8LXQY1CY5J5gFwI8
         a8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q6beibzNrILHq2SGf9/COm2CxcmfWx9qSxPEsXfxPtw=;
        b=ZDxdvkf50J6b4o2kDUcf03pcPyDD1JbZ8UjXMBTuBkYGNf5oK2X4PDsVEWmqI2zdhQ
         UJfq2zcC1jt+aaKlXDyDTsCrxbLP13bnZ2GaazeHUR1jZ4z5y88qJQaAps74EOCDzobp
         pIu+B8xMRl3X2NNxIcInmrbDk6lE1uUvnTsBHPRcuGjM5gn8F1qaPTxp15qogfJa/TCW
         TJISBZYkFgR1h+kKJvm1PY46JeNfvoFxkxqobtxaET7c+6eY7ywBLF5HseMPhs5w0ega
         yJ2JlwgwVUAdTEWt9Fy3F4UI7IkHEu8AS+RNz97vcST8A4KVRTY+puCSIj2Ysj5cLyns
         uBgQ==
X-Gm-Message-State: AOAM531Jq7hHAvmcTdiPD4V2V/apzDPUxmXyNl9oVPxmkWV04uon021J
        PLOfeOX7UatR2p5wT+jO88hN39jH4KXPtjrH0wY=
X-Google-Smtp-Source: ABdhPJwkqoi7Te+8IVA6FyKKRv4mbRhIKOatAn/IO6gqCZx4Kj1mou4VEJhavjSimHsrRoYATzTuNhXPQ7l4hmxuN5E=
X-Received: by 2002:a05:6000:1ce:: with SMTP id t14mr7751825wrx.83.1628204321241;
 Thu, 05 Aug 2021 15:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch> <20210805104705.862416-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20210805104705.862416-3-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 5 Aug 2021 16:02:56 -0700
Message-ID: <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
Subject: Re: [PATCH v5 02/20] drm/msm: Fix drm/sched point of no return rules
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
>
> Originally drm_sched_job_init was the point of no return, after which
> drivers must submit a job. I've split that up, which allows us to fix
> this issue pretty easily.
>
> Only thing we have to take care of is to not skip to error paths after
> that. Other drivers do this the same for out-fence and similar things.
>
> Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 6d6c44f0e1f3..d0ed4ddc509e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_=
device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       /* FIXME: this is way too early */
> -       drm_sched_job_arm(&job->base);
> -
>         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
>
>         kref_init(&submit->ref);
> @@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void=
 *data,
>
>         submit->user_fence =3D dma_fence_get(&submit->base.s_fence->finis=
hed);
>
> +       /* point of no return, we _have_ to submit no matter what */
> +       drm_sched_job_arm(&submit->base);
> +
>         /*
>          * Allocate an id which can be used by WAIT_FENCE ioctl to map ba=
ck
>          * to the underlying fence.
> @@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
>         if (submit->fence_id < 0) {
>                 ret =3D submit->fence_id =3D 0;
>                 submit->fence_id =3D 0;
> -               goto out;
>         }
>
> -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
>                 struct sync_file *sync_file =3D sync_file_create(submit->=
user_fence);
>                 if (!sync_file) {
>                         ret =3D -ENOMEM;
> -                       goto out;
> +               } else {
> +                       fd_install(out_fence_fd, sync_file->file);
> +                       args->fence_fd =3D out_fence_fd;
>                 }
> -               fd_install(out_fence_fd, sync_file->file);
> -               args->fence_fd =3D out_fence_fd;

I wonder if instead we should (approximately) undo "drm/msm/submit:
Simplify out-fence-fd handling" so that the point that it could fail
is moved up ahead of the drm_sched_job_arm()?

Also, does the dma_fence_get() work before drm_sched_job_arm()?  From
a quick look, it looks like it won't, but I'm still playing catchup
and haven't had a chance to look at your entire series.  If it doesn't
work before drm_sched_job_arm(), then there is really no way to
prevent a error path between the fence-init and job-submit.

But, prior to your series, wouldn't a failure after
drm_sched_job_init() but before the job is submitted just burn a
fence-id, and otherwise carry on it's merry way?

BR,
-R

>         }
>
>         submit_attach_object_fences(submit);
> --
> 2.32.0
>
