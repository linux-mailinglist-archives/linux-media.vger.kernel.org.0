Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DA62B2291
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgKMRfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKMRfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:35:42 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A47C0613D1;
        Fri, 13 Nov 2020 09:35:41 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so8935703wmg.3;
        Fri, 13 Nov 2020 09:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=S6otP4T92FhYb0o9zH9HwhqeFp2M3AuU45BWAEnFIGI=;
        b=N2HEd60JGqG0qkBalskauOSXB+NULzJV8EKlKKQjMPMSjWNTEYWuJu95YCQPjQqz15
         FpF60LB8aVIaGCA6u/ZVcbRu2YE/dT6FVxs1U60lEPoCGGkcmtGPcdaOcggTGN/1QrFq
         R+8Wo5RGM+m0Qs7VESHcr2sff3SBMkreNO64XuADvgs9MIY5qvzqf0PMjNdN6JPxSmu1
         JOHsyxCokR3/5m2Gc9DkChVCbM113VsbAcZVz+piLLtoARMZMd2/q261SmvRzXQtnKB1
         FHczIET1PuqTa9uULwmGsKDrShAe21s61rvHYbyJphqBrbxMZOTJcq5jz/sSZOngkR2B
         qN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S6otP4T92FhYb0o9zH9HwhqeFp2M3AuU45BWAEnFIGI=;
        b=rgJNAXaX9tFeCSS+XGzuL3h0quMOejIv/iwnTMK64J52fslqsdC0ryTUiY4LzvBTZg
         LTsPIpDAFEMnJrmb4+1Y3+wodn8lj9lgNMmiuHrE+PFLvSxRrZwTn5zQ4DKBNkvzLSnv
         M+tpWxHUi2zl/uBya/kGt9OnVl5d3ZT+kBwfXbOIS85QgWmFhq+ekC/QkRZmPlz9Sn50
         GKaXVEYrvUnbp1w4JoY2SpOIj7lz8Hnd5l8nqFSTB5hnQ1MVdBjeykgz7cAz49JCSQ5j
         mdOYpav9EswQ+Jh3TWwBQPFIBCRDl4TDh76MzI0tGGhNZtcLL4/q4Ym/s6pc60uJ5cr5
         7Gug==
X-Gm-Message-State: AOAM5332sc0vKhlAMrSHs3isZFaINCRxQVbUhm+IWhdpHOe2PDT8F3qe
        eXIbLaZrltiGnsXypQXk8LvOIJYePCG0jNlfQiZ+8ZT5
X-Google-Smtp-Source: ABdhPJxF+0EsquFWFOhsdKMbhKyVEoU4mWq6nr1k3xX0fu+rqyDpbAXHH2R0sqIgLJqVkgN+428qDyu0fypinrEpH78=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr3557828wmb.39.1605288940212;
 Fri, 13 Nov 2020 09:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-41-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-41-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 12:35:28 -0500
Message-ID: <CADnq5_Mo5RepKQ_ZvG1VFHKtypSZXa4fvsKBD+6Z-HgSn+26gA@mail.gmail.com>
Subject: Re: [PATCH 40/40] drm/amd/amdgpu/gfx_v7_0: Remove unused struct definition
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

On Fri, Nov 13, 2020 at 8:50 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:5211:45: warning: =E2=80=98gfx_v7_=
0_ip_block=E2=80=99 defined but not used [-Wunused-const-variable=3D]
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 9 ---------
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h | 1 -
>  2 files changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v7_0.c
> index cb07bc21dcbe5..04e1e92f5f3cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -5208,15 +5208,6 @@ static void gfx_v7_0_get_cu_info(struct amdgpu_dev=
ice *adev)
>         cu_info->lds_size =3D 64;
>  }
>
> -static const struct amdgpu_ip_block_version gfx_v7_0_ip_block =3D
> -{
> -       .type =3D AMD_IP_BLOCK_TYPE_GFX,
> -       .major =3D 7,
> -       .minor =3D 0,
> -       .rev =3D 0,
> -       .funcs =3D &gfx_v7_0_ip_funcs,
> -};
> -
>  const struct amdgpu_ip_block_version gfx_v7_1_ip_block =3D
>  {
>         .type =3D AMD_IP_BLOCK_TYPE_GFX,
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h b/drivers/gpu/drm/amd/=
amdgpu/gfx_v7_0.h
> index 6fb9c1524691f..eedce7d007f1d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h
> @@ -24,7 +24,6 @@
>  #ifndef __GFX_V7_0_H__
>  #define __GFX_V7_0_H__
>
> -extern const struct amdgpu_ip_block_version gfx_v7_0_ip_block;
>  extern const struct amdgpu_ip_block_version gfx_v7_1_ip_block;
>  extern const struct amdgpu_ip_block_version gfx_v7_2_ip_block;
>  extern const struct amdgpu_ip_block_version gfx_v7_3_ip_block;
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
