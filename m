Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4937A4A9C2A
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 16:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240237AbiBDPoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 10:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiBDPoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 10:44:01 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38463C061714
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 07:44:01 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id q186so8919524oih.8
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t++Sl3/j9Xw1ZOybdNpwLGb8KZHNprMyq9fgMdYyV9Q=;
        b=ofKsXST+b78YnNo0vRwalFJF2rIg7y5RCr7b9iXGySPvbCIYvtI01v9ap6ua4x5oke
         NwBCnlQccFSJSnTXSEDJgSyWVW/KbJinpFXvYg0jxFNSl7DUXVA1Zd0lFmW5sMrwVizV
         ufn7WgEa19jmXJ0tUnxgsBfZt1hNuR79QsIgz7IV6IFlFCDLnoDPP2QNsKuJ2APkJ6zT
         XydlsfogysNCo6+3J0PD3+ksqUtglHHeZtxM6C29PTpe7GnYYY3M30ZFeYlOAsxMqNf5
         1JegMB7YgYlsDLDhR4Af1Ffgq6MhtefT/MtmdyBKr4pKv5bphOptoQiLrUn1MV2HiSaL
         H1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t++Sl3/j9Xw1ZOybdNpwLGb8KZHNprMyq9fgMdYyV9Q=;
        b=heE+HtZ6lWON4Nf6do5o2mJgtufWfYFD/2dyLYyjTksIYezoRiTJY4KaVmgvuhCHKK
         ujlBMjhwqe6CeAzDi0cbVBkWqWA8HWOhr2Gf+Br7tBpjrX/KXhIVC/0XGc1BM/wZlHLR
         DKhhgo4OGCoOIHYTo3xNbDgAtkxJ5rGDP8Pw25obtFZ1ohGxy1ZAVThmJOAqTP4b0yLp
         akodcGb2SwMWY/hwWuCXUTBG35+4XSHm/sYvP7k8bp8kl5XbQzC3JtRaxqfCct09/hOY
         xrD0l02+2JJ0/1w+Pa+9gajC+qrm5gCXMyHhVTdeFsz4yMfqTjRLDUfn6rkoWSzMTqhT
         qivg==
X-Gm-Message-State: AOAM533qWdhwau33gVT1Oe7nSAdHeWePd2ewicYC4NvIcucqkGkLhNjy
        mL1LyFdMsKOldVuSbYJS9SWm7MVrlUEJwHFqqYE=
X-Google-Smtp-Source: ABdhPJwE0RukyciYykgWOgQCk6YO79c6zVGxWgzIhrxIabmvpOMl2SShp7Q8g9oV5Xn5V8VohXG14WqBPssjZxCgz3c=
X-Received: by 2002:a05:6808:159e:: with SMTP id t30mr1555187oiw.132.1643989440616;
 Fri, 04 Feb 2022 07:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20220204100429.2049-1-christian.koenig@amd.com> <20220204100429.2049-7-christian.koenig@amd.com>
In-Reply-To: <20220204100429.2049-7-christian.koenig@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 4 Feb 2022 10:43:49 -0500
Message-ID: <CADnq5_Myswp9hJF3eFY3MEYhxrM-NMPRaF9=RUTBtMoRLhkEAg@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/amdgpu: use dma_fence_chain_contained
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= 
        <thomas.hellstrom@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 4, 2022 at 5:04 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Instead of manually extracting the fence.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sync.c
> index f7d8487799b2..40e06745fae9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -261,10 +261,9 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, str=
uct amdgpu_sync *sync,
>
>         dma_resv_for_each_fence(&cursor, resv, true, f) {
>                 dma_fence_chain_for_each(f, f) {
> -                       struct dma_fence_chain *chain =3D to_dma_fence_ch=
ain(f);
> +                       struct dma_fence *tmp =3D dma_fence_chain_contain=
ed(f);
>
> -                       if (amdgpu_sync_test_fence(adev, mode, owner, cha=
in ?
> -                                                  chain->fence : f)) {
> +                       if (amdgpu_sync_test_fence(adev, mode, owner, tmp=
)) {
>                                 r =3D amdgpu_sync_fence(sync, f);
>                                 dma_fence_put(f);
>                                 if (r)
> --
> 2.25.1
>
