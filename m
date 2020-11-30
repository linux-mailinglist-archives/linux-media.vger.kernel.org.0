Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25282C90E1
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730576AbgK3WVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgK3WVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:21:01 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC76C0613CF;
        Mon, 30 Nov 2020 14:20:20 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id t143so15961605oif.10;
        Mon, 30 Nov 2020 14:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+xii/CM8RmygCIt+QaUy7AnG00s6vO35LXvnr7JAkeY=;
        b=qvpTFABbvh0b34A8Ymd1yjwaxyPcDf33m1dzMGftsIq2eYr1pvdCjlDzFxw0JopDKz
         SG1kWafR6RC99C/5FKhMlcKT1GKVh48P5jO//AEo2XZy4EQrGZ39fWXVa6lUwEJhOcL8
         Dt53Rcaf+l1m4d2BMxscfrC+Kgfb0JcVnBqQGk7Hum/4WVP8WZ/C2plQu2nXj5znALzs
         rh8JlB8B7yE1BarKZ28j57R0rn8XrjA/VwiepPAE4FPTMMHzrBgRUS3D7lhu5vv0lYdJ
         vmDfASSgml0zca3mlvJ2hnPCUkG+zWDe0N6Kn6Ny72RM9TtYzpd5sdpA026h1yZR/aeo
         TYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+xii/CM8RmygCIt+QaUy7AnG00s6vO35LXvnr7JAkeY=;
        b=kWusos7Arlt6N/p5xYlyWIjKenmSaxt/DUJ/4/RKWBKur850jIjSEYz/hIci2EVf9H
         /Uml/vGhyMas+ZUTRAogmRaYaSBrNoMAPr6YovGfP8HEUIy6qNUOAMeqNAtx/5za0mdi
         ythbaTj1XyF16wLYKvjYNBsPZuw8xPla2KtQAZzoBwjiPVYFqudhF535uUYv1Ko2UJym
         J4rWe/ngZWDNuUJaS/bDe0XoNyaQd9Q5GXWkMSn9ZdE+y/WvAsb4wFN8WJ0oSGvkafjZ
         vvYbnlgwJKMs9+pTtX8JLydXJR1KKs5N6zKAHTeHAoN0MpuNORoxoAaOL6TLl98rMrjG
         CiqA==
X-Gm-Message-State: AOAM531i3r4PvtVwdeVz1XiRYtIUZd1yups3N2mSqbn3guriGCZ0tpWi
        wW7s/Ic3j43gUDIYPXcumyEo8rKfy11lUPxCkPg=
X-Google-Smtp-Source: ABdhPJzk0kwsPGBe+AGMcf76Sr+IFHJX7wXHRT4IV1q+OfBehvzRPc30BvZc/0mGAdJM3ot/vldyWtcPgFVUilMtcWc=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr903002oib.120.1606774820130;
 Mon, 30 Nov 2020 14:20:20 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-17-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-17-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:20:09 -0500
Message-ID: <CADnq5_Nhc-deK-BY_ede4Rbzru0U1xNy2X0nQ+9ZJU5BOz-uEw@mail.gmail.com>
Subject: Re: [PATCH 16/40] drm/amd/amdgpu/gfx_v10_0: Remove a bunch of set but
 unused variables
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 24, 2020 at 2:44 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c: In function =E2=80=98gfx_v10_rlc=
g_wreg=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:1416:18: warning: variable =E2=80=
=98grbm_idx=E2=80=99 set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:1415:18: warning: variable =E2=80=
=98grbm_cntl=E2=80=99 set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:1413:15: warning: variable =E2=80=
=98scratch_reg3=E2=80=99 set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:1412:15: warning: variable =E2=80=
=98scratch_reg2=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index a6d03931f7fa4..d4760f4e269a1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -1409,23 +1409,14 @@ static void gfx_v10_rlcg_wreg(struct amdgpu_devic=
e *adev, u32 offset, u32 v)
>  {
>         static void *scratch_reg0;
>         static void *scratch_reg1;
> -       static void *scratch_reg2;
> -       static void *scratch_reg3;
>         static void *spare_int;
> -       static uint32_t grbm_cntl;
> -       static uint32_t grbm_idx;
>         uint32_t i =3D 0;
>         uint32_t retries =3D 50000;
>
>         scratch_reg0 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSC=
RATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
>         scratch_reg1 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSC=
RATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
> -       scratch_reg2 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSC=
RATCH_REG1_BASE_IDX] + mmSCRATCH_REG2)*4;
> -       scratch_reg3 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSC=
RATCH_REG1_BASE_IDX] + mmSCRATCH_REG3)*4;
>         spare_int =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmRLC_S=
PARE_INT_BASE_IDX] + mmRLC_SPARE_INT)*4;
>
> -       grbm_cntl =3D adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_CNTL_BASE_I=
DX] + mmGRBM_GFX_CNTL;
> -       grbm_idx =3D adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_I=
DX] + mmGRBM_GFX_INDEX;
> -
>         if (amdgpu_sriov_runtime(adev)) {
>                 pr_err("shouldn't call rlcg write register during runtime=
\n");
>                 return;
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
