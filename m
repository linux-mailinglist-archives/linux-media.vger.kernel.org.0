Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474AE3F8B1C
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 17:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242947AbhHZPfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 11:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237807AbhHZPfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 11:35:19 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9832C061757;
        Thu, 26 Aug 2021 08:34:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x12so5704708wrr.11;
        Thu, 26 Aug 2021 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6ledkqU9D7FzcL/5ouJNmCXuXtKins7U1aoW3QxLbVU=;
        b=jiDI7yC/eT7HEe9sQm38w7hIxFvvo4EfE4Scx9xXHFUrWsbewLm3vkOb+B1QtiBPTc
         1pmwSmFQzxPGrrJh4AP8FppBdNDpQ2Aw65Bmro1bbZGcOxe8tesKl0HXb50Mgvz4xCdn
         zfJbhzNxfFIKD4BXgyUJYuYsUBicVPm6ngREnHXMFqiDAszRpcG/5dGTTmStoAmv8062
         QbQQeQPk33VzCUkcG6AfCSOKMbq4nNhib3wDooslcoiyQKIHCIZOCDiGwW6OQ7pAwkBA
         SJscnToOzErB9p3dp2gCvGHJRpL0oFfpEZ6qLihP0aot4co1SCXahgLNAzO1OjBuaRM8
         bGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6ledkqU9D7FzcL/5ouJNmCXuXtKins7U1aoW3QxLbVU=;
        b=bOOSE/TdSUBjJyCLtvUXLlijik92gPPIdDpohVvT5lo6ufqwVmDb3j32B+x4KzIoUw
         acbpg2/lQW5CM2MbjsTIuwxe+TO6uGqW/I0d5xx0LJbqjtil1HFEGBJpFxyVX8pEP9qe
         LmQlc+dsVB0OYLgNHo6uL0H8kYqN+3Tj6vBOOYDahC2A7Jys3UMhDw71jIQkG3pZARcx
         BPgGrmDcu4Hny6rnrewxKjipmogjOmaj/zUeCGYcUoZxp3uqdMgooiHikkDG/dy+NyOJ
         QRKpXGHzxdM3m+iSAcWw/3kXyhLWKh/XFJ6QOvXQWuq5AIOBg3p1ZCSOxt8G0EprkrGO
         L5og==
X-Gm-Message-State: AOAM533zrlccKky5tx1mDjNqqQVf4sPLe6g2d7IbkJclOEe0bZ8852XJ
        6gy9BEatBjKwGbR4oTbg2BI3IESR7AGp2kosTNPv+rsL
X-Google-Smtp-Source: ABdhPJxNi7BD0F9Nk2M8iBXkon89Q02BBjrW2NrVCNpKlZ5X5qHkwp/W2LBzZ7ppSDqjH2XlmT9Atndgc3cblhH236o=
X-Received: by 2002:adf:9021:: with SMTP id h30mr4549091wrh.327.1629992070122;
 Thu, 26 Aug 2021 08:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210817085308.3557257-1-daniel.vetter@ffwll.ch> <20210826093334.1117944-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210826093334.1117944-1-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 26 Aug 2021 08:38:50 -0700
Message-ID: <CAF6AEGvVjrii3-22ocsuej8Hw-2OLG8Zok-LsUceh4Aqu=45-g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Improve drm/sched point of no return rules
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

On Thu, Aug 26, 2021 at 2:33 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> Originally drm_sched_job_init was the point of no return, after which
> drivers really should submit a job. I've split that up, which allows
> us to fix this issue pretty easily.
>
> Only thing we have to take care of is to not skip to error paths after
> that. Other drivers do this the same for out-fence and similar things.
>
> v2: It's not really a bugfix, just an improvement, since all
> drm_sched_job_arm does is reserve the fence number. And gaps should be
> fine, as long as the drm_sched_job doesn't escape anywhere at all.
>
> For robustness it's still better to align with other drivers here and
> not bail out after job_arm().
>
> v3: I misplaced drm_sched_job_arm by _one_ line! Thanks to Rob for
> testing and debug help.
>
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

t-b && r-b

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 4d1c4d5f6a2a..71b8c8f752a3 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_=
device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       drm_sched_job_arm(&job->base);
> -
>         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
>
>         kref_init(&submit->ref);
> @@ -880,6 +878,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void=
 *data,
>
>         submit->nr_cmds =3D i;
>
> +       drm_sched_job_arm(&submit->base);
> +
>         submit->user_fence =3D dma_fence_get(&submit->base.s_fence->finis=
hed);
>
>         /*
> @@ -891,17 +891,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
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
>         }
>
>         submit_attach_object_fences(submit);
> --
> 2.32.0
>
