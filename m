Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9DF2AE21C
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 22:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731985AbgKJVsj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 16:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731722AbgKJVsi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 16:48:38 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8917DC0613D1;
        Tue, 10 Nov 2020 13:48:38 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id k2so10974634wrx.2;
        Tue, 10 Nov 2020 13:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Up1aG6ydtrr1/JYHxw8NlS2buR9mdLMPGDsROtKbZk8=;
        b=cYI9zgZDB3t1XzLKMSr8g7Z5wHFN4jdHxMIv9jFAeSZadz1dNiLKs8Nj4gx3O903O2
         LWtCIncvDlZ8nHTMRg2VFI8VLAa7isUGYPslLnF3CqAEFxBgElFv/nF1JIVn3gDWlpLm
         32oWoXTz4l/HSEHf1F7jQWd/JGV4zIWQU3Fk12+8Rb7bgdkpImPb/FuvSqH4cA/B5Mw5
         2grvW9CBXll/TJzcvLM+LwPJASQAKE2FBb+dMZ30SH8l9vo85MPJcfJcznBEvnlvjZdt
         hwLjihO75N9zeH8RHPSPM1Y+Zp4wp3crUvsuiBAQWEC2FSHyaRckztAABipNeRxcwfkN
         +O6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Up1aG6ydtrr1/JYHxw8NlS2buR9mdLMPGDsROtKbZk8=;
        b=Ylb+AygoYf6QN9iDIdlDU93QXUWXRW4PT2e3Ek9oA/QUCnWqNmAF/vjPI7n0SLKQeS
         K+8OOfsPho+VMQTD3h5DMnKdH3EeC6c1HQgirhKdypCD+EM83mQgFdJ0ZLGlD9+K3fdl
         P9ZTSWP01RmRjMBA24fKpyMgh0HvnioBdiMEnx9sOVOeUFwjo2l90GJe0KBSApuXmAO2
         NHsX8twjoXAft0V037By8lXXS+Pf2qLh8vDzj/17LjV9hPfYXnmKvWcAznEkKlF/7sA1
         gcK2MDklKgIxJe+q+cPSf3x0nW5h+Yh169s3bGibXhAE/d624v3FG1OrY1gnsddin1xZ
         vF1A==
X-Gm-Message-State: AOAM531zJkon8EAW4JrGuBo80jv+D7ZssP+tlIb5AbKWOnA0I13mLGf1
        6q3wJCONKeZx9/IrA8o/aLMFRKP+KypO4dPTRTI=
X-Google-Smtp-Source: ABdhPJy0RUmp6/kZ5soVHYMu10l5Y1AvwxF0c1Q4+XZ4V5PKLlnBkZmIH1vULyJL9AQs6Yc/XgVzbGFetswrD7SAgog=
X-Received: by 2002:adf:e350:: with SMTP id n16mr26964608wrj.419.1605044917283;
 Tue, 10 Nov 2020 13:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20201105144517.1826692-1-lee.jones@linaro.org> <20201105144517.1826692-19-lee.jones@linaro.org>
In-Reply-To: <20201105144517.1826692-19-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 16:48:26 -0500
Message-ID: <CADnq5_PUZbPh0gmrTcY-cuLeUjfXNt8bS5YBz8g3VgCskYeh4A@mail.gmail.com>
Subject: Re: [PATCH 18/19] gpu: drm: amd: amdgpu: amdgpu: Mark global
 variables as __maybe_unused
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

On Thu, Nov 5, 2020 at 9:52 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> These 3 variables are used in *some* sourcefiles which include
> amdgpu.h, but not *all*.  This leads to a flurry of build warnings.
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67,
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h:198:19: warning: =E2=80=98no_system_=
mem_limit=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h:197:19: warning: =E2=80=98debug_evic=
tions=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h:196:18: warning: =E2=80=98sched_poli=
cy=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>
>  NB: Repeats ~650 times - snipped for brevity.
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 183b09d71b64a..5939753080056 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -193,9 +193,9 @@ extern int sched_policy;
>  extern bool debug_evictions;
>  extern bool no_system_mem_limit;
>  #else
> -static const int sched_policy =3D KFD_SCHED_POLICY_HWS;
> -static const bool debug_evictions; /* =3D false */
> -static const bool no_system_mem_limit;
> +static const int __maybe_unused sched_policy =3D KFD_SCHED_POLICY_HWS;
> +static const bool __maybe_unused debug_evictions; /* =3D false */
> +static const bool __maybe_unused no_system_mem_limit;
>  #endif
>
>  extern int amdgpu_tmz;
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
