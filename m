Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C7823E616
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 05:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgHGDAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 23:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgHGDAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 23:00:24 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4717FC061574
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 20:00:24 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g6so578299ljn.11
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2020 20:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wTsG01+FAeINX7tJPCyhTMiFIIvHpHWzQDxM2xhAlu0=;
        b=Gm31v+4cDz5MOdOXgxbVeFLOkDmj2PWmhCK9B44JcVcB9EGVqb2EHJ0glPrQdedeoE
         +dPxtK2Xc4SGtVJ0QTwcIjnwhBQLRJ6/jUNKjdOiYs3niZ53XsOdbdI5ttB999I6uP+H
         iWK3PQQX3DLEjizrqFQvsKsZmACpiG1RLlyK+tME069oyyEudHRoRjWP8AHYf4ryErIi
         35fufUI9RK1j7dKbgGkydHUIbns0c81ybZVZ9dmrf+hcULwDmTTdzQCxgNcwlUDuMqrn
         BFJUbsGedZMnaLb7fdruesQNZV88xD2p2V5MlqR6ObkfvHqhb7BvgMQ1rGKCa4veKuCZ
         W4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wTsG01+FAeINX7tJPCyhTMiFIIvHpHWzQDxM2xhAlu0=;
        b=fdOeFVHM/VO7VjhMIUtD44klYHFoWlm/sxQAxeKDJtkCEYus8+yrgdKqsNGbefQ8pg
         ymGQ7z9frA8hlRQHmFOP2nUnJ5rCZaNCYrkH+6JyFwwpYt+6BO8EbjUiObv92E1Dkk0M
         UWBBw6zOzkUe+S0ye7uc3OWqRLGJXUod/zxWPjqlaSqF/AsEFrY6bC+4XVXQZD2o1thV
         Z8dugQqkAx/DXN7/l8ldN+pESBnA3oa6p9mZ1oWKC0LHjYjYKSMdutORdjjgUc3UJ/uX
         vy3sJzF9s1pJgwdeZMSWfvuaPmOrQZZFzQfFYbuydQIwkU5IPwVAxRC9JA5toyR7WnqV
         g0IA==
X-Gm-Message-State: AOAM532C3vhiGYTJ/fJFg5nzepXNPjbWniOIHzdL0ILYzuicXVknVCoz
        /Rh8DzW5D3SIf0y8VuIdf+jrlqc8T62PKQNevVR74g==
X-Google-Smtp-Source: ABdhPJyksl15UPkEtHxTCd6XOj4wYFTTaeSdOFSPR45CICDOdBMwsjVD+2gtHPnL9heaHDSkTdbmmnz6Q2VSG4Gis7Q=
X-Received: by 2002:a2e:87c4:: with SMTP id v4mr5180563ljj.8.1596769222640;
 Thu, 06 Aug 2020 20:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200721101647.42653-1-hexin.op@bytedance.com>
In-Reply-To: <20200721101647.42653-1-hexin.op@bytedance.com>
From:   =?UTF-8?B?5L2V6ZGr?= <hexin.op@bytedance.com>
Date:   Fri, 7 Aug 2020 11:00:11 +0800
Message-ID: <CACKzwj=obkJPmMb1cGKDwBdgkxa92kpPTP9c2SzFWbbzcD6Luw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()
To:     Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
        kraxel@redhat.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, Qi Liu <liuqi.16@bytedance.com>,
        Muchun Song <songmuchun@bytedance.com>,
        gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Xin He <hexin.op@bytedance.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8821=E6=97=A5=
=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=886:17=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Qi Liu <liuqi.16@bytedance.com>
>
> We should put the reference count of the fence after calling
> virtio_gpu_cmd_submit(). So add the missing dma_fence_put().
>
> Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit s=
ynchronization")
> Co-developed-by: Xin He <hexin.op@bytedance.com>
> Signed-off-by: Xin He <hexin.op@bytedance.com>
> Signed-off-by: Qi Liu <liuqi.16@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>
> changelog in v3:
> 1) Change the subject from "drm/virtio: fixed memory leak in virtio_gpu_e=
xecbuffer_ioctl()" to
>    "drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioct=
l()"
> 2) Rework the commit log
>
> changelog in v2:
> 1) Add a change description
>
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/vir=
tio/virtgpu_ioctl.c
> index 5df722072ba0..19c5bc01eb79 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -179,6 +179,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_dev=
ice *dev, void *data,
>
>         virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
>                               vfpriv->ctx_id, buflist, out_fence);
> +       dma_fence_put(&out_fence->f);
>         virtio_gpu_notify(vgdev);
>         return 0;
>
> --
> 2.21.1 (Apple Git-122.3)
>

cc Greg

--
Xin He
