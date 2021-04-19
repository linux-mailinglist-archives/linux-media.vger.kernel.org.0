Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57BA3640B5
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 13:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238754AbhDSLo7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 07:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35097 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238690AbhDSLo6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 07:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618832668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y644e2+cDS7jfFg2KG/GSDehn2zis7rBbTsBszQ7ZZc=;
        b=X4dUySfFg7+YADTeFr7pfxkCN0H0vviMDYuUSxPyrGMFWpK89rYK8d0cq6c37l0LluP9cX
        Q4kalnvwiRswpATNydtIuEsn0kzi+zCnA37wRuMXjanRpopn2NKq6/Xz44z/pTTjpUTNyW
        cd8QiCPvFP4acW+CUDhlp5Pa3KnLtP4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-QfR-_nLoOlSx8ND2M_4pAQ-1; Mon, 19 Apr 2021 07:44:27 -0400
X-MC-Unique: QfR-_nLoOlSx8ND2M_4pAQ-1
Received: by mail-wr1-f70.google.com with SMTP id j4-20020adfe5040000b0290102bb319b87so8922951wrm.23
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 04:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y644e2+cDS7jfFg2KG/GSDehn2zis7rBbTsBszQ7ZZc=;
        b=oxttb4vwJFvBfIT/3SQ5tTY7CaLnhIsfmbzIWuUR3+R8pnJRzhkH575FTT8n8GIywI
         HGI471BH384CmU4tGLdfSgMcs1xTxKzpPuSybcBa42FFzMu77MLHWEVrKkepK2cA2Z6D
         pnawT0uCHRDEqODByXX689I9UbraBzaAWw95pdOPxfTNz4ps0IGnVLlEeyxFOglBJGrp
         rpHYWrMwycSp0GVHedrqsBE55/mKPbWSxXgkFuj7mmW/CY04uxCtiYYYHrDDSHOGwE18
         6x1EPsLirKac2fD1Z+gex1esNJzL86Jz4tv4h2vlcrr1n/QRtD1Kl4vPB7kk9KqwVHT0
         J0Lw==
X-Gm-Message-State: AOAM530hYbWSfZ4AEfyrWXDjpIy3AGckSMaj0ZA9PtqpWQw1IefxUZVH
        RZJyIgqQRGKj9pDiK9BBOfYgnihiy9BBtPcch+pTWgAu+O/RP7DQwQA6kxcGwGlftdPjB0omFsh
        rVWq6+Atq2R4ypYHHBS09aJhU1GYjQBa/uOBRKRU=
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13544848wrd.177.1618832666331;
        Mon, 19 Apr 2021 04:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjlugWDWLZH+5rQly0tRCQFzwosoMjd14Y9bJuAnMN5V/27+yHQMkQQGZjse8w/vAsAyaiT8Vc7UJvMHq5TOE=
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13544835wrd.177.1618832666229;
 Mon, 19 Apr 2021 04:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org> <20210416143725.2769053-8-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-8-lee.jones@linaro.org>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Mon, 19 Apr 2021 13:44:15 +0200
Message-ID: <CACO55tvQ=dvDbwzWmwn7ZOwqyStEXn3=8zab6rQSiau3OkKktQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 07/40] drm/nouveau/nouveau_bo: Remove unused
 variables 'dev'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jeremy Kolb <jkolb@brandeis.edu>, David Airlie <airlied@linux.ie>,
        nouveau <nouveau@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linaro-mm-sig@lists.linaro.org, Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:37 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nouveau_bo.c: In function =E2=80=98nouveau_ttm_t=
t_populate=E2=80=99:
>  drivers/gpu/drm/nouveau/nouveau_bo.c:1228:17: warning: variable =E2=80=
=98dev=E2=80=99 set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/nouveau/nouveau_bo.c: In function =E2=80=98nouveau_ttm_t=
t_unpopulate=E2=80=99:
>  drivers/gpu/drm/nouveau/nouveau_bo.c:1252:17: warning: variable =E2=80=
=98dev=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Jeremy Kolb <jkolb@brandeis.edu>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 3e09df0472ce4..37b3d2c10f5c5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1255,7 +1255,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>  {
>         struct ttm_tt *ttm_dma =3D (void *)ttm;
>         struct nouveau_drm *drm;
> -       struct device *dev;
>         bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (ttm_tt_is_populated(ttm))
> @@ -1268,7 +1267,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>         }
>
>         drm =3D nouveau_bdev(bdev);
> -       dev =3D drm->dev->dev;
>
>         return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
>  }
> @@ -1278,14 +1276,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev=
,
>                           struct ttm_tt *ttm)
>  {
>         struct nouveau_drm *drm;
> -       struct device *dev;
>         bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (slave)
>                 return;
>
>         drm =3D nouveau_bdev(bdev);
> -       dev =3D drm->dev->dev;
>
>         return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
>  }
> --
> 2.27.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

