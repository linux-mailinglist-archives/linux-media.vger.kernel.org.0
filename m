Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39F92B5282
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 21:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732991AbgKPU1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 15:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732977AbgKPU1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 15:27:14 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D16C0613CF;
        Mon, 16 Nov 2020 12:27:13 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p22so560529wmg.3;
        Mon, 16 Nov 2020 12:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yPSHVRwDrtKOH5ZvQYGGfQXjoa9CykJhcor/FvEpDF0=;
        b=QP7bSXT4wEK83Tkdu1pw70KMDVFIZL3TNg2DEsJWF05JUFpbLSuhRLJWIshP0S/isB
         hLcj8acsSM9gRPm/At+RGGJpryxONwxfp1jTbn7wc6hL3PEQ3vS2bjCHZSeLtkpiB1AK
         8Ri/en6bDoKgayc6zhTf9ZcOw3cqFDn6Fx9RywRSHH9DIaXeGXDF9lEt5+K2r7Ke2DST
         u2Z9GktRH34/lLxR3JKoV1p/u7lPl1FNsU+lbGA8QTLPoinjJfgz29tpkKR7DPCGOX3F
         arsxPNC/TvMo6WexoDK/WYisSVqvdoMcufL6/qHJoNJDi2pN2bRSmLOiDFr9zgUPz9oB
         cg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yPSHVRwDrtKOH5ZvQYGGfQXjoa9CykJhcor/FvEpDF0=;
        b=FawJCAb9AcO3lCHuA6J9m9c8tMXPwn7eJKG61b6H29oh3b4Ctsaqr6OQ9psiYnyMk4
         VnnE8qR3RYlKMRGNAjIdlUMMYML3u8W049SKJ7/+7Sj2HPyzQZQy+/6as+Zx/qeR06ot
         SWzcFyAUBmT+eTD6ufXb9xFaUBe3GOagUmqJWQXJv/UQO/BkqOd5ZXTh4ZyXqgC1XPbO
         wcB5wz7HfzM9cW/V/YWyhXNPrTGZ0WFQEIr0OdZxrhA89tDq2hOyJhZ6Nl87C8egrh9P
         ZE1vpj3oFMzoLAteG3FPUcxVr8iQCwn+YdblFH0Dkq7EfMcp1dYwo5XWBRIvUtnMf7tj
         v6Sw==
X-Gm-Message-State: AOAM530YUZrbOOYVuhgiPIhcW7tfmWwUFpex6B43ViYb8OofffR+AzOU
        CNWBR2vE3ZMZml4YB2azdTgONfdy+nNlKdPbZ/I=
X-Google-Smtp-Source: ABdhPJwdydcBHg2wjcl0XsYoZ/4RLPKqFkbduOLt/w1cjPcwEnharCbPaEZj4l6GMHsJtygKeO4DzXTO9xXkh9F/csQ=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr669394wmi.70.1605558432593;
 Mon, 16 Nov 2020 12:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org> <20201116173700.1830487-32-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-32-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 15:27:01 -0500
Message-ID: <CADnq5_NaWcxV-J22w4fg7kNEx=s9XwLcBOdQ8uCQNv1H5jNBrw@mail.gmail.com>
Subject: Re: [PATCH 31/43] drm/radeon/cik: Move 'si_*()'s prototypes to shared header
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

On Mon, Nov 16, 2020 at 12:38 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/si.c:4186:6: warning: no previous prototype for =
=E2=80=98si_vram_gtt_location=E2=80=99 [-Wmissing-prototypes]
>  4186 | void si_vram_gtt_location(struct radeon_device *rdev,
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/gpu/drm/radeon/si.c:5186:6: warning: no previous prototype for =
=E2=80=98si_init_uvd_internal_cg=E2=80=99 [-Wmissing-prototypes]
>  5186 | void si_init_uvd_internal_cg(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~~~~~~~~~~~~
>  drivers/gpu/drm/radeon/si.c:5801:6: warning: no previous prototype for =
=E2=80=98si_rlc_reset=E2=80=99 [-Wmissing-prototypes]
>  5801 | void si_rlc_reset(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~
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
>  drivers/gpu/drm/radeon/cik.c | 4 +---
>  drivers/gpu/drm/radeon/si.h  | 4 ++++
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index ae020ad7b3185..cef0f3111cd3a 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -40,6 +40,7 @@
>  #include "radeon_asic.h"
>  #include "radeon_audio.h"
>  #include "radeon_ucode.h"
> +#include "si.h"
>
>  #define SH_MEM_CONFIG_GFX_DEFAULT \
>         ALIGNMENT_MODE(SH_MEM_ALIGNMENT_MODE_UNALIGNED)
> @@ -127,9 +128,6 @@ MODULE_FIRMWARE("radeon/mullins_mec.bin");
>  MODULE_FIRMWARE("radeon/mullins_rlc.bin");
>  MODULE_FIRMWARE("radeon/mullins_sdma.bin");
>
> -extern void si_vram_gtt_location(struct radeon_device *rdev, struct rade=
on_mc *mc);
> -extern void si_rlc_reset(struct radeon_device *rdev);
> -extern void si_init_uvd_internal_cg(struct radeon_device *rdev);
>  static u32 cik_get_cu_active_bitmap(struct radeon_device *rdev, u32 se, =
u32 sh);
>  extern int cik_sdma_resume(struct radeon_device *rdev);
>  extern void cik_sdma_enable(struct radeon_device *rdev, bool enable);
> diff --git a/drivers/gpu/drm/radeon/si.h b/drivers/gpu/drm/radeon/si.h
> index a1751ae560f02..f483a64d17050 100644
> --- a/drivers/gpu/drm/radeon/si.h
> +++ b/drivers/gpu/drm/radeon/si.h
> @@ -25,8 +25,12 @@
>  #define __SI_H__
>
>  struct radeon_device;
> +struct radeon_mc;
>
>  int si_mc_load_microcode(struct radeon_device *rdev);
>  u32 si_gpu_check_soft_reset(struct radeon_device *rdev);
> +void si_vram_gtt_location(struct radeon_device *rdev, struct radeon_mc *=
mc);
> +void si_rlc_reset(struct radeon_device *rdev);
> +void si_init_uvd_internal_cg(struct radeon_device *rdev);
>
>  #endif                         /* __SI_H__ */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
