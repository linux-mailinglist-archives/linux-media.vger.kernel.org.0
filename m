Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D2B3662A1
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 01:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234445AbhDTXyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 19:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbhDTXyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 19:54:39 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE30C06174A;
        Tue, 20 Apr 2021 16:54:07 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id u80so7148049oia.0;
        Tue, 20 Apr 2021 16:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6XeojVc4nyUM/MQvlUlo6lItw91qVr2k9CimuPL8jlQ=;
        b=Ct4dRSFyUsi54UAOvvZIvEg4fPzL45AZTUMb/sdsjtCErpl/mHQMGI5QiTZU/GyRrq
         abRyZtIlu9qx60U1Ft1bOqICI7TkI492gsrG30ZR4nVWcIUiNPIWc8gLfLvXSxh0+s+7
         CUZV1m+DyeJrjQn478NNPrfYKOIFY9K9/aDJzrMYYswwi2jErFXkq+NRnbJAOZq0tgiq
         s+iP5nxz/CvYSqrTYOsmj8mbuB4LBBYWAVWBM0T4dG21A/r0ljBAg8jbjQbBBJe7yX51
         D72F9W9HUdC21PN7s0uMs/Yuvy19IiCM31gTWKHOywbcM27eU5ZBXgPBbFvS0AWdOxRj
         CXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6XeojVc4nyUM/MQvlUlo6lItw91qVr2k9CimuPL8jlQ=;
        b=YQCp3utblKoholj2OuZCGJ6X9iDV+s4nq7NMKglKuv1N51eBbnaTK5d4y9/2aL7b+7
         pmT6JEbmMuv3XspsFIPpsSpFsVRIMqkj9pNDU3w8Fu310q2GlGzU/tZwR/Dx4yfxjYHK
         iT6b5OdlusaAWD3SIZtIFRC7SnSatUSEO85sZTKTn6/Dx7Pga5O4jgMJ9NbjnkLiDwHv
         v8HFeyv4GPBI8RRhzZySLmiCtuxsBJHaGOFsbsoRfJnd+fQdZDTxX18k02fRIsp+ZSQk
         7FWDj1wZlsGnye4D5j5oTCOLrMpAoNXJgFT6FxNco33uFjMpOILkMugt8IxtuUhJ2KqN
         1kxg==
X-Gm-Message-State: AOAM530sdDjiwkTBmv6oucW1N/dkxKX0ZLFVp/nimrMp00vRVTwWsT9j
        9a36uZog991BUdRl8lO/3oTaHlG7L1n13QOmXDE=
X-Google-Smtp-Source: ABdhPJxk1HdpfsnIkAez4V3KMV5UFoxztuT1Gwv0FNgu63EJQOuxbUXCCc2R2DYBsi9R8QOsf/YqzPKQuzS/Bn6QgOM=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr4689757oif.5.1618962846514;
 Tue, 20 Apr 2021 16:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org> <20210416143725.2769053-27-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-27-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 20 Apr 2021 19:53:55 -0400
Message-ID: <CADnq5_N71QW79-MnbeUGrMSrSM7UnESz_4vKteOr_3z1obPM3w@mail.gmail.com>
Subject: Re: [PATCH 26/40] drm/amd/amdgpu/amdgpu_device: Remove unused
 variable 'r'
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

Applied.  Thanks!

Alex

On Fri, Apr 16, 2021 at 10:38 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function =E2=80=98amdgpu_=
device_suspend=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3733:6: warning: variable =E2=
=80=98r=E2=80=99 set but not used [-Wunused-but-set-variable]
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
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index b4ad1c055c702..eef54b265ffdd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3730,7 +3730,6 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>  int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>  {
>         struct amdgpu_device *adev =3D drm_to_adev(dev);
> -       int r;
>
>         if (dev->switch_power_state =3D=3D DRM_SWITCH_POWER_OFF)
>                 return 0;
> @@ -3745,7 +3744,7 @@ int amdgpu_device_suspend(struct drm_device *dev, b=
ool fbcon)
>
>         amdgpu_ras_suspend(adev);
>
> -       r =3D amdgpu_device_ip_suspend_phase1(adev);
> +       amdgpu_device_ip_suspend_phase1(adev);
>
>         if (!adev->in_s0ix)
>                 amdgpu_amdkfd_suspend(adev, adev->in_runpm);
> @@ -3755,7 +3754,7 @@ int amdgpu_device_suspend(struct drm_device *dev, b=
ool fbcon)
>
>         amdgpu_fence_driver_suspend(adev);
>
> -       r =3D amdgpu_device_ip_suspend_phase2(adev);
> +       amdgpu_device_ip_suspend_phase2(adev);
>         /* evict remaining vram memory
>          * This second call to evict vram is to evict the gart page table
>          * using the CPU.
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
