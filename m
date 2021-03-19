Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60EE3418F2
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 10:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhCSJ5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 05:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49967 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229847AbhCSJ5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 05:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616147822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3l3BfTP70gXS5Doqn0pw4lSC+ETHFzwyHhsUK4GEBKU=;
        b=RuU4kqz5fsi9ox2BUiAntEbtUfkysIdHxNrCd2KfzsEaSC3GysIwvcwlo50dlfXUVY6qvb
        TjVnY3mb+Zrp99vZLr0G+vBdqzvhm8LvlndBcYmlmchsc2kMR7DVUVBWmjJ4msyFGgY7Tx
        fDnxydbiDLTnkjnXk7YmYXcZ+rmj4+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-6SdKBYoIOhShQtyNfVyU4w-1; Fri, 19 Mar 2021 05:56:59 -0400
X-MC-Unique: 6SdKBYoIOhShQtyNfVyU4w-1
Received: by mail-wm1-f70.google.com with SMTP id f9so12703956wml.0
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 02:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3l3BfTP70gXS5Doqn0pw4lSC+ETHFzwyHhsUK4GEBKU=;
        b=F0lcfuXtamLpRhYNxYZuMa22K/kKlKJ6J1XSYDlcW6d4hwbjxMpGcdPSyWDqIwrPA+
         4envRHvC7LTWZOO1bBPCm+qmKLWxfPWCsshADL8YMMUBLBmVPHR9VsXh+f2WdH41fFDQ
         LuRQNnS6CaBAMIt5cEmHoBsvUajEb7wN/r2Gb7uC2aiBJkoMhSr7oPxvMWQ8wx7G/vMv
         SyqxVI7pKOWxPsNMLXYFrc8w91JQLAxlWH6ugZjWizk/kQ0M7LhZGckZ+nM1uWN9h0m3
         5J8LvExXuiLwbIJP0aOck5TJunXHwaLGa1myq/CKROnyS7UMssAbCnvZRXpkOc4lfUsS
         fzZw==
X-Gm-Message-State: AOAM532i4GSuhy0lNy6G2LRrbBH1pTJLn+6nRRcXCyTg5FtPh6GFLa+8
        9QC0WZr3pxOJYZETimXdoCpMWrAA/VWAwd/i/DxV7E7bu4QPCqV3Y697cSPcSHt0F3WePmM6bz3
        5OtzrPHIX0AM9Ehua55qioI+BzVNDReAT5qHNlBI=
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3638694wrv.10.1616147818278;
        Fri, 19 Mar 2021 02:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydXZ7PTUXXk61n8Vm+NGA5deM8sQ8DWxF3xA9WDgrGsCesLVfERpF5oUV4xlX2RUpBfsYQ1O9Hc0Hb/dn7k7o=
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3638680wrv.10.1616147818103;
 Fri, 19 Mar 2021 02:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org> <20210319082428.3294591-11-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-11-lee.jones@linaro.org>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Fri, 19 Mar 2021 10:56:47 +0100
Message-ID: <CACO55tvYCgxXuqwoyXbVL50zLqPGQck_EjMxK_yePgG6tHnxKw@mail.gmail.com>
Subject: Re: [PATCH 10/19] drm/nouveau/nouveau_bo: Remove unused variables 'dev'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jeremy Kolb <jkolb@brandeis.edu>, David Airlie <airlied@linux.ie>,
        nouveau <nouveau@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, Ben Skeggs <bskeggs@redhat.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 19, 2021 at 9:25 AM Lee Jones <lee.jones@linaro.org> wrote:
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
> index 281e9ed139895..913035ab85ec2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1250,7 +1250,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>  {
>         struct ttm_tt *ttm_dma =3D (void *)ttm;
>         struct nouveau_drm *drm;
> -       struct device *dev;
>         bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (ttm_tt_is_populated(ttm))
> @@ -1263,7 +1262,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>         }
>
>         drm =3D nouveau_bdev(bdev);
> -       dev =3D drm->dev->dev;
>
>         return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
>  }
> @@ -1273,14 +1271,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev=
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
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

Reviewed-by: Karol Herbst <kherbst@redhat.com>

